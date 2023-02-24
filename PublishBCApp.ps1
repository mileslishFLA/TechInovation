$repositoriesPathHerlp = "C:\Users\MileSlishkovikj\source\repos\MyLocalBC\TechInovation"
$appName = "GitActionsTechInovBCApp.app"
$appNameShort = "GitActionsTechInovBCApp"
$serverInstance = "BC"
$containerName = "MyLocalBC"
$securePassword = ConvertTo-SecureString -String "test" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -argumentList "test", $securePassword


 Invoke-ScriptInNavContainer -containername $containerName -scriptblock {
        $appNameShort = "GitActionsTechInovBCApp"
        Set-NavServerConfiguration 'BC' -KeyName 'EnableUserConsistencyValidationOnTasks' -KeyValue 'false'
        Write-Host "Restarting Server Instance" -ForegroundColor DarkGreen
       
        Write-Host "BC Server Instance" -ForegroundColor DarkGreen  

 $ExtensionsToRemove = Get-NavAppInfo -ServerInstance "BC" | Where-Object {($_.Name -eq "$AppName")}
   Write-Host $ExtensionsToRemove.Name
    if ($ExtensionsToRemove.count -eq 0)
   {Write-Host "NothingFound"} 
   else  
   
   {
   Write-Host "SthFound"
   UnInstall-NavApp -ServerInstance $serverInstance -Name $appNameShort -Force
  UnPublish-NavApp -ServerInstance $serverInstance -Name $appNameShort 
   }
   
   }

Compile-AppInNavContainer -appProjectFolder $repositoriesPathHerlp -containerName $containerName -appName $appName -credential $credential

$repositoriesPathHerlp = $repositoriesPathHerlp + "\output\"+ $appName
Publish-NavContainerApp -containerName $containerName -appFile $repositoriesPathHerlp -skipVerification -sync -install
