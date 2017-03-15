Configuration DomainConfig
{
   param
    (
        [Parameter(Mandatory)]
        [pscredential]$universalCred
    )

    Import-DscResource -ModuleName xActiveDirectory
    
    Node $AllNodes.Where{$_.Role -eq "DC"}.Nodename
    {
        WindowsFeature ADDSInstall
        {
            Ensure = "Present"
            Name = "AD-Domain-Services"
        }
        xADDomain TheDomain
        {
            DomainName = $Node.DomainName
            DomainAdministratorCredential = $universalCred
            SafemodeAdministratorPassword = $universalCred
            DomainNetbiosName = $Node.DomainNetbiosName
            DependsOn = "[WindowsFeature]ADDSInstall"
        }
        xWaitForADDomain DscForestWait
        {
            DomainName = $Node.DomainName
            DomainUserCredential = $universalCred
            RetryCount = $Node.RetryCount
            RetryIntervalSec = $Node.RetryIntervalSec
            DependsOn = "[xADDomain]TheDomain"
        }
    }
}
