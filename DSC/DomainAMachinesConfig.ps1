Configuration DomainConfig
{
   param
    (
        [Parameter(Mandatory)]
        [pscredential]$universalCred
    )

    Import-DscResource -ModuleName xActiveDirectory
    Import-DscResource -ModuleName xComputerManagement
     
    Node $AllNodes.Where{$_.Role -eq "DC"}.Nodename
    {
        WindowsFeature ADDSInstall
        {
            Ensure = "Present"
            Name = "AD-Domain-Services"
        }
        WindowsFeature ADDSManagementInstall
        {
            Ensure = "Present"
            Name = "RSAT-ADDS-Tools"
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
        xADOrganizationalUnit devopsOU
        {
           Name = "devops"
           Path = $Node.DomainPath
           Ensure = 'Present'
           DependsOn = "[xWaitForADDomain]DscForestWait"
        }
    }

    Node $AllNodes.Where{$_.Role -eq "TFS"}.Nodename
    {
        xWaitForADDomain DscForestWait
        {
            DomainName = $Node.DomainName
            DomainUserCredential = $universalCred
            RetryCount = $Node.RetryCount
            RetryIntervalSec = $Node.RetryIntervalSec
        }
        xComputer JoinDomain
        {
            Name = "localhost"
            JoinOU = $Node.OuPath
            DomainName = $Node.DomainName
            Credential = $universalCred 
            DependsOn = "[xWaitForADDomain]DscForestWait"
        }
    }
}
