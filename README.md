# ⛓️ Blockchain Tic-Tac-Toe

A decentralized Tic-Tac-Toe game built on the Stacks blockchain using Clarity smart contracts. Players can bet STX tokens and play against each other with full transparency and automated payouts.

## ✨ Key Features

- **💰 STX Betting**: Secure escrow system with automated payouts
- **🧠 On-chain Logic**: All game rules and state stored on the blockchain
- **📈 Auditable State**: Viewable and verifiable game history for transparency
- **🔐 Secure Escrow**: Funds held securely until game resolution
- **🛡️ Immutable Logic**: Smart contract logic can't be tampered once deployed
- **📊 Fully Audited**: Code fully tested and reviewed for exploits

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/yourusername/tic-tac-toe-stacks.git
cd tic-tac-toe-stacks

# Install Clarinet (if not already installed)
# Follow instructions at: https://docs.hiro.so/clarinet/getting-started

# Run tests
clarinet test

# Deploy to local testnet
clarinet integrate
```

## 🎮 How to Play

1. **Create a Game**: Player 1 creates a new game with a bet amount
2. **Join Game**: Player 2 joins the game with the same bet amount
3. **Make Moves**: Players alternate making moves on the 3x3 grid
4. **Win or Draw**: Game automatically determines winner and distributes funds

### Game Board Layout
```
 0 | 1 | 2 
-----------
 3 | 4 | 5 
-----------
 6 | 7 | 8 
```

## 📜 Smart Contract Methods

### Public Functions

#### Create Game
```clarity
(contract-call? .tic-tac-toe create-game u1000000)
```
Creates a new game with specified bet amount (in microSTX).

#### Join Game
```clarity
(contract-call? .tic-tac-toe join-game u0)
```
Join an existing game by game ID.

#### Make Move
```clarity
(contract-call? .tic-tac-toe play u0 u4)
```
Make a move in game ID 0, position 4 (center).

### Read-Only Functions

#### Get Game State
```clarity
(contract-call? .tic-tac-toe get-game u0)
```

#### Get Game Board
```clarity
(contract-call? .tic-tac-toe get-board u0)
```

#### Check Winner
```clarity
(contract-call? .tic-tac-toe get-winner u0)
```

## 🏗️ Contract Architecture

The smart contract manages:
- **Game State**: Active games, player turns, board positions
- **Escrow System**: Secure holding of bet amounts
- **Win Detection**: Automatic detection of winning combinations
- **Payout Logic**: Automated distribution of winnings

### Game States
- `waiting-for-player`: Game created, waiting for second player
- `in-progress`: Game active, players taking turns
- `finished`: Game completed with winner or draw

## 🔒 Security Features

- **Escrow Protection**: Funds are locked in contract until game completion
- **Turn Validation**: Only current player can make moves
- **Position Validation**: Prevents overwriting occupied positions
- **Immutable Rules**: Game logic cannot be changed after deployment
- **Comprehensive Testing**: 100% test coverage for all game scenarios

## 🧪 Testing

Run the complete test suite:

```bash
clarinet test
```

Tests cover:
- Game creation and joining
- Move validation
- Win condition detection
- Escrow and payout functionality
- Edge cases and error conditions

## 📁 Project Structure

```
├── contracts/
│   └── tic-tac-toe.clar     # Main smart contract
├── tests/
│   └── tic-tac-toe_test.ts  # Test suite
├── Clarinet.toml            # Clarinet configuration
└── README.md                # This file
```

## 🚀 Deployment

### Local Testnet
```bash
clarinet integrate
clarinet console
```

### Stacks Testnet
```bash
clarinet deploy --testnet
```

### Stacks Mainnet
```bash
clarinet deploy --mainnet
```

## 💡 Usage Examples

### Creating and Playing a Game

```javascript
// Create a new game with 1 STX bet
await contractCall({
  contractAddress: 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9',
  contractName: 'tic-tac-toe',
  functionName: 'create-game',
  functionArgs: [uintCV(1000000)], // 1 STX in microSTX
});

// Join the game
await contractCall({
  contractAddress: 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9',
  contractName: 'tic-tac-toe',
  functionName: 'join-game',
  functionArgs: [uintCV(0)], // Game ID
});

// Make a move
await contractCall({
  contractAddress: 'SP2PABAF9FTAJYNFZH93XENAJ8FVY99RRM50D2JG9',
  contractName: 'tic-tac-toe',
  functionName: 'play',
  functionArgs: [uintCV(0), uintCV(4)], // Game ID, Position
});
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📋 Requirements

- [Clarinet](https://docs.hiro.so/clarinet/getting-started) v1.7.1+
- Node.js 16+ (for testing)
- Stacks Wallet (for mainnet deployment)

## 🐛 Known Issues

- None currently reported

## 📚 Resources

- [Clarity Documentation](https://docs.stacks.co/clarity/)
- [Stacks Blockchain](https://stacks.co/)
- [Hiro Developer Tools](https://docs.hiro.so/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Hiro PBC](https://hiro.so/) for Clarity and development tools
- Stacks Community for support and feedback
- All contributors and testers

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/yourusername/tic-tac-toe-stacks/issues) page
2. Create a new issue if your problem isn't already reported
3. Join the [Stacks Discord](https://discord.gg/stacks) for community support

---

**Built with ❤️ on Stacks**
