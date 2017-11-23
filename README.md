# About the project
Express server that is used to serve the Angular (4) project to the web clients.

> It is powered by the Express Framework.

# Requirements
It requires that we compile the `Angular 4` project and place its compiled code in a directory named ***dir***.

The file structure should look like

+-- dist                 // Directory containing the **Angular 4 app**
|   +-- index.html            // Application entry point
|-- +--- *.*                  // Angular app resources resources
+-- package.json              // NPM config file
+-- server.js                 // Express server
