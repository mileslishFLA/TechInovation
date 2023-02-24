$repositoriesPathHerlp = "C:\Users\MileSlishkovikj\source\repos\MyLocalBC\TechInovation"
$appName = "GitActionsTechInovBCApp.app"
$appNameShort = "GitActionsTechInovBCApp"
$serverInstance = "BC"
$containerName = "MyLocalBC"
$securePassword = ConvertTo-SecureString -String "test" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -argumentList "test", $securePassword
  $appNameShort = "GitActionsTechInovBCApp"

  UnInstall-BcContainerApp -containerName $containerName -name $appNameShort -force 
  UnPublish-BcContainerApp -name $appNameShort -containerName $containerName -force

Compile-AppInNavContainer -appProjectFolder $repositoriesPathHerlp -containerName $containerName -appName $appName -credential $credential

$repositoriesPathHerlp = $repositoriesPathHerlp + "\output\"+ $appName
Publish-BcContainerApp -containerName $containerName -appFile $repositoriesPathHerlp -skipVerification -sync -install -ignoreIfAppExists
