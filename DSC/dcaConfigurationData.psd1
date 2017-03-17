# Configuration Data for Domain A
@{
    AllNodes = @(
        @{
            Nodename = "localhost"
            Role = "DC"
            DomainName = "doma.twodoms.com"
            DomainNetbiosName = "doma"
            DomainPath = "dc=doma,dc=twodoms,dc=com"
            RetryCount = 20
            RetryIntervalSec = 30
            PSDscAllowPlainTextPassword = $true
        }
    )
}