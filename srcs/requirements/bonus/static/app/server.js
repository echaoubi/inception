
const express = require('express');
const path = require('path');
const app = express();
const port = 3030;

// Middleware to serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'static')));

// Route handling
app.get('/', (req, res) => {
    console.log(path.join(__dirname, 'static', 'index.html'));  
  res.sendFile(path.join(__dirname, 'static', 'index.html'));
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});