﻿#使用管道进行一步化操作
dotnet sonarscanner begin /k:"home_vs_anbook" /d:sonar.host.url="http://192.168.148.136:9000" /d:sonar.login
="d9507f9ce36cbe24c5874901c8be512256d9854c" | dotnet build | dotnet sonarscanner end /d:sonar.login="d9507f9ce36cbe24c5874901c8be512256d9854c"