<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blockchain Tic-Tac-Toe - Clarity Smart Contract</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2f80ed;
            --secondary-color: #4f4f4f;
        }
        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
            line-height: 1.6;
            color: var(--secondary-color);
        }
        h1, h2 {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        .badge {
            font-size: 0.9em;
            padding: 0.6em 1em;
            border-radius: 20px;
        }
        .code-block {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1.2rem;
            font-family: 'Consolas', monospace;
            margin: 1rem 0;
        }
        .feature-card {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 1.5rem;
            margin: 1rem 0;
            transition: transform 0.2s;
        }
        .feature-card:hover {
            transform: translateY(-3px);
        }
        .game-board {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 4px;
            width: 300px;
            margin: 2rem auto;
        }
        .game-cell {
            border: 2px solid #2f80ed;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2em;
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <!-- Header Section -->
        <header class="text-center mb-5">
            <h1 class="display-4 fw-bold mb-3">⛓️ Blockchain Tic-Tac-Toe</h1>
            <div class="d-flex justify-content-center gap-2 mb-4">
                <span class="badge bg-primary">Clarity 1.7.1</span>
                <span class="badge bg-success">100% Tested</span>
                <span class="badge bg-warning text-dark">MIT Licensed</span>
            </div>
        </header>

        <!-- Main Content -->
        <main>
            <!-- Features -->
            <section class="mb-5">
                <h2 class="mb-4">✨ Key Features</h2>
                <div class="row g-4">
                    <div class="col-md-6 col-lg-4">
                        <div class="feature-card">
                            <h4>💰 STX Betting</h4>
                            <p>Secure escrow system with automated payouts</p>
                        </div>
                    </div>
                    <!-- Add other feature cards similarly -->
                </div>
            </section>

            <!-- Quick Start -->
            <section class="mb-5">
                <h2 class="mb-4">🚀 Quick Start</h2>
                <div class="code-block">
                    <code># Clone repository<br>
                    git clone https://github.com/yourusername/tic-tac-toe-stacks.git<br>
                    cd tic-tac-toe-stacks<br>
                    clarinet test</code>
                </div>
            </section>

            <!-- Game Interface -->
            <section class="mb-5">
                <h2 class="mb-4">🎮 Game Preview</h2>
                <div class="game-board">
                    <div class="game-cell">X</div>
                    <div class="game-cell">O</div>
                    <div class="game-cell">X</div>
                    <!-- Add all 9 cells -->
                </div>
            </section>

            <!-- Contract Functions -->
            <section class="mb-5">
                <h2 class="mb-4">📜 Smart Contract Methods</h2>
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="code-block">
                            <h5>Create Game</h5>
                            <code>(contract-call? .tic-tac-toe create-game u1000000)</code>
                        </div>
                    </div>
                    <!-- Add other methods -->
                </div>
            </section>

            <!-- Security -->
            <section class="mb-5">
                <h2 class="mb-4">🔒 Security Features</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="feature-card">
                            <h5>🔐 Escrow System</h5>
                            <p>Funds held securely until game resolution</p>
                        </div>
                    </div>
                    <!-- Add other security features -->
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="mt-5 pt-4 border-top">
            <div class="row">
                <div class="col-md-6">
                    <h5>License</h5>
                    <p>MIT Licensed - Free for open source use</p>
                </div>
                <div class="col-md-6">
                    <h5>Acknowledgments</h5>
                    <ul class="list-unstyled">
                        <li>Hiro PBC</li>
                        <li>Stacks Community</li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
