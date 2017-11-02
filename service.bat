nssm install MyFancyApp %cd%\run.bat 
nssm set MyFancyApp Description "Runs a dotnet core app on http://localhost:5000"
nssm start MyFancyApp


