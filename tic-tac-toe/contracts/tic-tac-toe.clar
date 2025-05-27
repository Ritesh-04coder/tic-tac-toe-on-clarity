;; Data Variables
(define-data-var latest-game-id uint u0)  ;; Tracks last game ID

;; Game Storage Map
(define-map games
  {game-id: uint}  ;; Key: Game ID
  {                ;; Value:
    player-one: principal,
    player-two: (optional principal),
    current-turn: bool,  ;; true = player-one's turn
    bet-amount: uint,
    board: (list 9 uint),  ;; 3x3 grid (0=empty, 1=X, 2=O)
    status: (optional principal)  ;; Winner or none if ongoing
  }
)

;; Constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_GAME_NOT_FOUND (err u100))
(define-constant ERR_GAME_FULL (err u101))
(define-constant ERR_NOT_YOUR_TURN (err u102))
(define-constant ERR_INVALID_MOVE (err u103))
(define-constant ERR_GAME_ENDED (err u104))

;; Helper: Validate move position and availability
(define-private (valid-move? (board (list 9 uint)) (position uint))
  (and
    (<= position u8)  ;; Position 0-8 valid
    (is-eq (unwrap! (element-at board position) u0) u0)  ;; Spot empty
  )
)

;; Helper: Check winning lines
(define-private (check-line (board (list 9 uint)) (a uint) (b uint) (c uint))
  (let (
    (cell-a (unwrap! (element-at board a) u0))
    (cell-b (unwrap! (element-at board b) u0))
    (cell-c (unwrap! (element-at board c) u0))
  )
    (if (and 
          (not (is-eq cell-a u0)) 
          (is-eq cell-a cell-b) 
          (is-eq cell-b cell-c))
      (some cell-a)
      none
    )
  )
)

;; Helper: Detect game winner
(define-private (get-winner (board (list 9 uint)))
  (let (
    ;; Check all possible winning lines
    (lines (list 
      ;; Rows
      (check-line board u0 u1 u2)
      (check-line board u3 u4 u5)
      (check-line board u6 u7 u8)
      ;; Columns
      (check-line board u0 u3 u6)
      (check-line board u1 u4 u7)
      (check-line board u2 u5 u8)
      ;; Diagonals
      (check-line board u0 u4 u8)
      (check-line board u2 u4 u6)
    ))
  )
    (fold check-winner-fold none lines)
  )
)

;; Helper function for fold in get-winner
(define-private (check-winner-fold (line (optional uint)) (result (optional uint)))
  (if (is-some line) line result)
)

;; Create new game with bet amount
(define-public (create-game (bet uint))
  (let ((new-id (+ (var-get latest-game-id) u1)))
    ;; Store bet from player
    (try! (stx-transfer? bet tx-sender (as-contract tx-sender)))
    
    ;; Initialize game state
    (map-set games {game-id: new-id} {
      player-one: tx-sender,
      player-two: none,
      current-turn: true,
      bet-amount: bet,
      board: (list u0 u0 u0 u0 u0 u0 u0 u0 u0),
      status: none
    })
    
    ;; Update game counter
    (var-set latest-game-id new-id)
    (ok new-id)
  )
)

;; Join existing game
(define-public (join-game (game-id uint))
  (let ((game (unwrap! (map-get? games {game-id: game-id}) ERR_GAME_NOT_FOUND)))
    (if (is-some (get player-two game))
      ERR_GAME_FULL
      (begin
        ;; Match player's bet
        (try! (stx-transfer? (get bet-amount game) tx-sender (as-contract tx-sender)))
        
        ;; Update game with second player
        (map-set games {game-id: game-id} (merge game {
          player-two: (some tx-sender)
        }))
        (ok true)
      )
    )
  )
)

;; Make a move in the game
(define-public (play (game-id uint) (position uint))
  (let ((game (unwrap! (map-get? games {game-id: game-id}) ERR_GAME_NOT_FOUND)))
    ;; Game state checks
    (asserts! (is-none (get status game)) ERR_GAME_ENDED)
    (asserts! (valid-move? (get board game) position) ERR_INVALID_MOVE)
    
    ;; Turn validation
    (let ((current-player (if (get current-turn game)
                            (get player-one game)
                            (unwrap! (get player-two game) ERR_GAME_NOT_FOUND))))
      (asserts! (is-eq tx-sender current-player) ERR_NOT_YOUR_TURN)
      
      ;; Update game state
      (let (
        (new-board (replace-at (get board game) position (if (get current-turn game) u1 u2)))
        (winner (get-winner new-board))
      )
        (map-set games {game-id: game-id} 
          (merge game {
            board: new-board,
            current-turn: (not (get current-turn game))
          })
        )
        
        ;; Handle game completion
        (if (is-some winner)
          (let ((winner-symbol (unwrap-panic winner)))
            (let ((winner-address (if (is-eq winner-symbol u1)
                                     (get player-one game)
                                     (unwrap-panic (get player-two game)))))
              ;; Update status and payout
              (map-set games {game-id: game-id} 
                (merge game {status: (some winner-address)})
              )
              (as-contract
                (try! (stx-transfer? 
                  (* (get bet-amount game) u2) 
                  tx-sender
                  winner-address
                ))
              )
              (ok winner-address)
            )
          )
          ;; Check for draw
          (if (is-board-full new-board)
            (begin
              ;; Refund both players
              (map-set games {game-id: game-id} 
                (merge game {status: (some CONTRACT_OWNER)})
              )
              (as-contract
                (begin
                  (try! (stx-transfer? (get bet-amount game) tx-sender (get player-one game)))
                  (try! (stx-transfer? (get bet-amount game) tx-sender (unwrap-panic (get player-two game))))
                )
              )
              (ok "Draw")
            )
            (ok "Move accepted")
          )
        )
      )
    )
  )
)

;; Helper function to check if board is full
(define-private (is-board-full (board (list 9 uint)))
  (fold check-cell-filled true board)
)

;; Helper function for board full check
(define-private (check-cell-filled (cell uint) (acc bool))
  (and acc (not (is-eq cell u0)))
)

;; Helper function to replace element at position
(define-private (replace-at (lst (list 9 uint)) (index uint) (new-val uint))
  (map replace-helper lst (list u0 u1 u2 u3 u4 u5 u6 u7 u8) (list new-val new-val new-val new-val new-val new-val new-val new-val new-val) (list index index index index index index index index index))
)

;; Helper for replace-at
(define-private (replace-helper (original uint) (current-index uint) (new-value uint) (target-index uint))
  (if (is-eq current-index target-index) new-value original)
)

;; Read-only functions

;; Get game details
(define-read-only (get-game (game-id uint))
  (map-get? games {game-id: game-id})
)

;; Get current game board
(define-read-only (get-board (game-id uint))
  (match (map-get? games {game-id: game-id})
    game (some (get board game))
    none
  )
)

;; Get game winner
(define-read-only (get-game-winner (game-id uint))
  (match (map-get? games {game-id: game-id})
    game (get status game)
    none
  )
)