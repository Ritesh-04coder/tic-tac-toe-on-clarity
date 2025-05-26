<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Blockchain Tic-Tac-Toe - Clarity Smart Contract</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
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
            <div class="border rounded p-3">
              <h4>💰 STX Betting</h4>
              <p>Secure escrow system with automated payouts.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="border rounded p-3">
              <h4>🧠 On-chain Logic</h4>
              <p>All game rules and state stored on the blockchain.</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4">
            <div class="border rounded p-3">
              <h4>📈 Auditable State</h4>
              <p>Viewable and verifiable game history for transparency.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- Quick Start -->
      <section class="mb-5">
        <h2 class="mb-4">🚀 Quick Start</h2>
        <pre class="bg-light p-3 border rounded">
<code># Clone repository
git clone https://github.com/yourusername/tic-tac-toe-stacks.git
cd tic-tac-toe-stacks
clarinet test</code>
        </pre>
      </section>

      <!-- Game Interface -->
      <section class="mb-5 text-center">
        <h2 class="mb-4">🎮 Game Preview</h2>
        <div class="d-grid mx-auto" style="grid-template-columns: repeat(3, 100px); gap: 4px; width: max-content;">
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">X</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">O</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">X</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">O</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">X</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">O</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">X</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">O</div>
          <div class="border d-flex align-items-center justify-content-center" style="height: 100px;">X</div>
        </div>
      </section>

      <!-- Contract Functions -->
      <section class="mb-5">
        <h2 class="mb-4">📜 Smart Contract Methods</h2>
        <div class="row g-4">
          <div class="col-md-6">
            <div class="bg-light p-3 border rounded">
              <h5>Create Game</h5>
              <code>(contract-call? .tic-tac-toe create-game u1000000)</code>
            </div>
          </div>
          <div class="col-md-6">
            <div class="bg-light p-3 border rounded">
              <h5>Join Game</h5>
              <code>(contract-call? .tic-tac-toe join-game u0)</code>
            </div>
          </div>
          <div class="col-md-6">
            <div class="bg-light p-3 border rounded">
              <h5>Make Move</h5>
              <code>(contract-call? .tic-tac-toe play u0 u4)</code>
            </div>
          </div>
        </div>
      </section>

      <!-- Security -->
      <section class="mb-5">
        <h2 class="mb-4">🔒 Security Features</h2>
        <div class="row g-4">
          <div class="col-md-4">
            <div class="border rounded p-3">
              <h5>🔐 Escrow System</h5>
              <p>Funds held securely until game resolution.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="border rounded p-3">
              <h5>🛡️ Immutable Logic</h5>
              <p>Smart contract logic can't be tampered once deployed.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="border rounded p-3">
              <h5>📊 Audits</h5>
              <p>Code fully tested and reviewed for exploits.</p>
            </div>
          </div>
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
