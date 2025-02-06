# This is a little PowerShell script I put together in order to gather all of
# the installers (and one README) I will need into one thumb drive;


# Download Google Chrome installer and save it on thumb drive, D:\ ;
Invoke-WebRequest -Uri 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile 'D:\New laptop installers\ChromeSetup.exe'

# Download Firefox installer and save it on thumb drive, D:\ ;
Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US' -OutFile 'D:\New laptop installers\FirefoxSetup.exe'

# Download AnyDesk installer and save it on thumb drive, D:\ ;
Invoke-WebRequest -Uri 'https://download.anydesk.com/AnyDesk.exe' -OutFile 'D:\New laptop installers\AnyDesk.exe'

############### Download AntiVirus folder from Server

# Define the source and destinatin paths for the README
$sourceReadMe = '\\FS1\tech$\Applications and Utilities\AntiVirus\IMPORTANT - ReadMe.txt'

# Define the source path for the MSI file
$sourcePath = '\\FS1\tech$\Applications and Utilities\AntiVirus\AV.msi'

# Define the destination path for the README
$destinationReadMe = 'D:\New laptop installers\AV_README.txt'

# Define the destination path for the MSI
$destinationPath = 'D:\New laptop installers\AV.msi'

# Copy the README to the thumb drive
Copy-Item -Path $sourceReadMe -Destination $destinationReadMe -Force

# Copy the MSI file to the thumb drive
Copy-Item -Path $sourcePath -Destination $destinationPath -Force

############### /AV from Server

<# Commented out because we don't need this code right now

############### AntiVirus from SharePoint

# Connect to SharePoint using Connect-SPOService cmdlet
Connect-SPOService -Url "https://treadstone.sharepoint.com" -Credential (Get-Credential)

# Change the current working directory to the external drive
cd D:\

# Copy the folder to the external drive 
Copy-SPOListItem -SourceUrl "https://treadstone.sharepoint.com/AntiVirus" -DestinationPath "D:\New laptop installers\" -Verbose

# Change the current working directory back to C:\
cd C:\

################ /AV from SharePoint

#>