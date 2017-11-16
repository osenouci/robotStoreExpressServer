@echo off
set ngProjectDir=C:\Users\OthmaneSENOUCI\projects\robotStore
set serverDir=C:\Users\OthmaneSENOUCI\projects\robotStoreServer

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