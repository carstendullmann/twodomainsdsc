# Configuration Data for TFS in Domain A
@{
    AllNodes = @(
        @{
            Nodename = "localhost"
            Role = "TFS"
            DomainName = "doma.twodoms.com"
            OuPath = "dc=doma,dc=twodoms,dc=com"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}