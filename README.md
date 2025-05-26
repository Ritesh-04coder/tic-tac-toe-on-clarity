<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic-Tac-Toe on Stacks Blockchain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .badge {
            margin: 2px;
            padding: 8px;
        }
        .code-block {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container py-4">
        <!-- Header -->
        <header class="text-center mb-5">
            <h1 class="display-4">🎮 Tic-Tac-Toe on Stacks Blockchain</h1>
            <div class="badges">
                <div class="badge bg-primary">Clarity 1.7.1</div>
                <div class="badge bg-warning text-dark">MIT License</div>
                <div class="badge bg-success">Tests Passing</div>
            </div>
        </header>

        <!-- Features -->
        <section class="mb-5">
            <h2>🌟 Features</h2>
            <div class="grid">
                <div class="card">
                    <div class="card-body">
                        <h5>🕹️ On-Chain Logic</h5>
                        <p>Fully decentralized game rules</p>
                    </div>
                </div>
                <!-- Repeat for other features -->
            </div>
        </section>

        <!-- Installation -->
        <section class="mb-5">
            <h2>📦 Installation</h2>
            <pre class="code-block"><code>git clone https://github.com/yourusername/tic-tac-toe-stacks.git
cd tic-tac-toe-stacks
npm install -g @hirosystems/clarinet</code></pre>
        </section>

        <!-- Usage -->
        <section class="mb-5">
            <h2>🚀 Usage</h2>
            <div class="row">
                <div class="col-md-4">
                    <h3>Start Devnet</h3>
                    <pre class="code-block"><code>clarinet integrate</code></pre>
                </div>
                <div class="col-md-4">
                    <h3>Run Tests</h3>
                    <pre class="code-block"><code>clarinet test --watch</code></pre>
                </div>
            </div>
        </section>

        <!-- Contract Functions -->
        <section class="mb-5">
            <h2>📜 Contract Functions</h2>
            <div class="row">
                <div class="col-md-4">
                    <h3>Create Game</h3>
                    <pre class="code-block"><code>(contract-call? .tic-tac-toe create-game u1000000)</code></pre>
                </div>
                <!-- Add other functions -->
            </div>
        </section>

        <!-- Game Mechanics -->
        <section class="mb-5">
            <h2>🕹️ Game Mechanics</h2>
            <pre class="code-block"><code>0 | 1 | 2
---------
3 | 4 | 5
---------
6 | 7 | 8</code></pre>
        </section>

        <!-- Security -->
        <section class="mb-5">
            <h2>🔒 Security Features</h2>
            <ul class="list-group">
                <li class="list-group-item">💰 STX Escrow System</li>
                <!-- Add other security features -->
            </ul>
        </section>

        <!-- Footer -->
        <footer class="text-center mt-5">
            <p>📄 MIT License - See <a href="LICENSE">LICENSE</a></p>
            <p>🙏 Acknowledgments to Hiro PBC and Stacks Community</p>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
