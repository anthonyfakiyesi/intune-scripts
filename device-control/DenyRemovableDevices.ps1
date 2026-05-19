# Enable device installation restrictions
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Force

# Block all removable storage devices
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" `
    -Name "DenyRemovableDevices" -Value 1

# Create AllowDeviceIDs key if it doesn't exist
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\AllowDeviceIDs" -Force

# Add your allowed device's instance ID
$allowedDeviceID = "USBSTOR\DISK&VEN_LEXAR&PROD_JUMPDRIVE&REV_1.00\229989296&0"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\AllowDeviceIDs" `
    -Name "1" -Value $allowedDeviceID -PropertyType String -Force