
# Configuration Data for Domain A
@{
    AllNodes = @(
        @{
            Nodename = "localhost"
            Role = "DC"
            DomainName = "dca.twodoms.com"
            DomainNetbiosName = "dca"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}