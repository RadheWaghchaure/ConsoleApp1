# PowerShell script to build using MSBuild
$solutionPath = "C:\Users\radheshamw\source\repos\ConsoleApp1\src"
$msbuildPath = "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe"

& "$msbuildPath" "$solutionPath" /p:Configuration=Release /t:Rebuild /nologo /v:m
