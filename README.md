# How to install the Bright Data SSL certificate

- The SSL certificate is needed in order to maintain a clean and to end encrypted connection between your host and the target website while using Bright Data’s [Residential Proxies](https://brightdata.com/proxy-types/residential-proxies), [Web Unlocker](https://brightdata.com/products/web-unlocker), or [SERP API](https://brightdata.com/products/serp-api).
- You can install the SSL certificate manually using the steps below, or by running a simple script (recommended)
- If you prefer not to install the SSL certificate at this point, you can simply ignore SSL errors in your code for now. See how. 


## Installation: automated method

### Linux:
1. Download the installation script.
2. Change the srcipt to be excuteable by chmod +x brightdata
3. Run the installation script

## Installation: Manual method:

### Windows:
1. Download the certificate.
2. Open the downloaded file and click 'Open' in the modal.
3. Click 'Install certificate...'.
4. Complete the form by clicking 'Next' and then 'Finish’.

### Linux:
1. Download the certificate.
2. Copy the downloaded certificate file to /usr/local/share/ca-certificates/ folder.
3. Run sudo update-ca-certificates. The output of the command should state that 1 certificate was added.

### MacOS:
1. Download the certificate.
1. Double click the downloaded certificate file. "Keychain Access" will appear.
1. Double click "Brightdata.com" certificate. A pop-up with certificate settings will appear.
1. Under "When using this certificate," select "Always Trust."
1. Close the popup.
1. Enter your credentials when asked
