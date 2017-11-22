// Import modules
const express = require('express');			// Import the express web server.
const path    = require('path');			// Import the path to format the out directory`.

// Constant definition
const angularIndexFile = path.join(__dirname, './dist/index.html');
const directory = (__dirname + '/dist');

// Server configuration
const app = express();					// Create a new instance of express.

app.use(express.static(directory));	// Define the directory where the static file reside.

// The default route. Whatever URL we git it, it should always return the Angular app.
app.get('*', function(req, res) {							
    res.sendFile(angularIndexFile);		
});

// Start the server.
app.listen(process.env.PORT || 80);			// Start the app by listening on the default Heroku port