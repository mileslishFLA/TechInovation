$repositoriesPathHerlp = "C:\Users\MileSlishkovikj\source\repos\MyLocalBC\TechInovation"
$appName = "TechInovation.app"
$containerName = "MyLocalBC"
$securePassword = ConvertTo-SecureString -String "test" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -argumentList "test", $securePassword


Compile-AppInNavContainer -appProjectFolder $repositoriesPathHerlp -containerName $containerName -appName $appName -credential $credential

$repositoriesPathHerlp = $repositoriesPathHerlp + "\output\"+ $appName
Publish-NavContainerApp -containerName $containerName -appFile $repositoriesPathHerlp -skipVerification -sync -install