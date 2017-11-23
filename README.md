# About the project
Express server that is used to serve the Angular (4) project to the web clients.

> It is powered by the Express Framework.

# Requirements
It requires that we compile the `Angular 4` project and place its compiled code in a directory named ***dir***.

The file structure should look like

```
+-- dist                 // Directory containing the **Angular 4 app**
|   +-- index.html            // Application entry point
|-- +--- *.*                  // Angular app resources resources
+-- package.json              // NPM config file
+-- server.js                 // Express server
```

# Serving the files to clients

A route that catches all requests of type GET is used to serve the application like so:

```javascript
// Code ...

const angularIndexFile = path.join(__dirname, './dist/index.html');
const directory = (__dirname + '/dist');

app.use(express.static(directory));	

app.get('*', function(req, res) {							
    res.sendFile(angularIndexFile);		
});

// Code ...
```
**Note: We uses Express.static to define the **dir** directory as public**

# Build script (On Windows)
I have written a simple script that can be used to:
- Compile the angular project
- Copy the ***dist*** to the Express server directory.
- Commits the modifications to git
- Pushs the changes to github
- Pushs the changes to heroku server

```bat
@echo off
set ngProjectDir=C:\Users\MY_USER\projects\robotStore
set serverDir=C:\Users\MY_USER\projects\robotStoreServer

rem Build the angular project
cd %ngProjectDir%
call call ng build --aot -prod --env=prod

rem Copy the dist directory to node server
call xcopy  %ngProjectDir%\dist %serverDir%\dist /e/i/h/Y

rem commit to git
cd %serverDir%
call git add .
call git commit -m "Angular project update @ %DATE% - %TIME%"
rem upload the server to the heroku cloud
echo "Uploading to heroku"

call git push heroku master
```
