# Configuration Data for Domain B
@{
    AllNodes = @(
        @{
            Nodename = "localhost"
            Role = "TFS"
            DomainName = "domb.twodoms.com"
            OuPath = "dc=domb,dc=twodoms,dc=com"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}