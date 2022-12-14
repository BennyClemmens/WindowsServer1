<PS C:\Users\Administrator> netsh advfirewall firewall add rule name="ping4" protocol=icmpv4:8,any dir=in action=allow
Ok.

PS C:\Users\Administrator> netsh advfirewall firewall add rule name="ping6" protocol=icmpv6:8,any dir=in action=allow
Ok.

PS C:\Users\Administrator>