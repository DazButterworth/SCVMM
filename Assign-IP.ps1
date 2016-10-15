$vmname = ""    # [VMName]
$ipaddress = "" # [IP Address]
$vlanname = ""  # [VLAN Name]
$vm = Get-ScvirtualMachine -Name $vmname
$staticIPPool = Get-SCStaticIPAddressPool -Name $vlanname
Grant-SCIPAddress -GrantToObjectType "VirtualNetworkAdapter" -GrantToObjectID $vm.VirtualNetworkAdapters[0].ID -StaticIPAddressPool $staticIPPool -Description $vmname -IPAddress $ipaddress
Set-SCVirtualNetworkAdapter -VirtualNetworkAdapter $vm.VirtualNetworkAdapters[0] -IPv4AddressType static

# $SCipaddress = Get-SCIPAddress | where {$_.Description -match $vmname}
# Revoke-SCIPAddress -AllocatedIPAddress $SCipaddress -ReturntoPool $True

Get-SCIPAddress | where{($_.address -match "10.100.3.") -or ($_.address -match "10.102.3.")} | select address, description, AllocatingAddressPool | sort address
