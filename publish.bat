set pd=C:\MyFancyApp
dotnet publish .\MyFancyApp\MyFancyApp.csproj -c Release -o %pd%
copy nssm.exe %pd%
copy run.bat %pd%
copy service.bat %pd%