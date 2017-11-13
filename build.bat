@echo off
set ngProjectDir=C:\Users\OthmaneSENOUCI\projects\robotStore
set serverDir=C:\Users\OthmaneSENOUCI\projects\robotStoreServer

cd %ngProjectDir%
call call ng build --aot -prod
cd %serverDir%
call git push heroku master