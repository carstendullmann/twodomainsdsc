# Configuration Data for Domain B
@{
    AllNodes = @(
        @{
            Nodename = "localhost"
            Role = "DC"
            DomainName = "domb.twodoms.com"
            DomainNetbiosName = "domb"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}