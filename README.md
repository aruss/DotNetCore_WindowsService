# Run dotnet core app as a windows service, Non-Sucking way.
#### http://econduct.de/dotnet-core-as-windows-service 

Assuming you have a fancy [dotnet core](https://www.microsoft.com/net/learn/get-started/windows) application that runs on its own or as IIS website, but now you want to run it as a Windows service. 

You can do it pretty easy even without modifying the application it self, like adding a service host or some other junk. For that download the [Non-Sucking Service Manager](https://nssm.cc), this tool allows you to start almost any application as a Windows service.

Publish your app somewhere outside of any user home, like `C:\MyFancyApp`, in most cases following command is enough. 

```
dotnet publish MyFancyApp.csproj -c Release -o C:\MyFancyApp
```

Create a file `run.bat` that starts your application with all required parameters, config, environment variables or what ever it needs. Something like this.

```
dotnet MyFancyApp.dll
```

Then create a second bat file `service.bat` that runs `nssm` commands. This script will install a Windows service with a description and start it automatically.  

```
nssm install MyFancyApp %cd%\run.bat 
nssm set MyFancyApp Description "Runs a fancy dotnet core app on http://localhost:5000"
nssm start MyFancyApp
```

BUTZ! Now you have a Windows service running without any sucking!
![](http://econduct.de/content/images/2017/11/MyFancyApp_service.png)

![](http://econduct.de/content/images/2017/11/MyFancyApp_web.png)

PS: You can run almost anything as a Windows service using the nssm tool, not only a dotnet core projects like described in this blog post.
