# Configuration Data for Domain B
@{
    AllNodes = @(
        @{
            Nodename = "dcb"
            Role = "DC"
            DomainName = "domb.twodoms.com"
            DomainNetbiosName = "domb"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}