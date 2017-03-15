
# Configuration Data for Domain A
@{
    AllNodes = @(
        @{
            Nodename = "dca"
            Role = "DC"
            DomainName = "dca.twodoms.com"
            DomainNetbiosName = "dca"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}