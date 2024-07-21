#!/bin/bash

# Function to check for administrative privileges
check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo
        echo "This script requires administrative privileges."
        echo
        echo "Please run it as an administrator using sudo."
        echo
        exit 1
    fi
}

# Function to download the SSL certificate
download_certificate() {
    echo
    echo "Hi! This is the Bright Data SSL installation script. It does the following:"
    echo "1. It downloads the SSL certificate from Github"
    echo "2. It installs the CA package to validate SSL connections"
    echo "3. It adds the Bright Data SSL certificate to the trusted list."
    echo

    echo "Step #1: Download the Bright Data SSL certificate..."
    local url="https://raw.githubusercontent.com/luminati-io/luminati-proxy/master/bin/ca.crt"
    local output="ca.crt"
    
    curl -o "$output" "$url"
    if [[ $? -eq 0 ]]; then
        echo
        echo "Download completed successfully."
    else
        echo
        echo "Download failed."
        exit 1
    fi
}

# Function to install the certificate
install_certificate() {
    read -p "Step #2: Install the Bright Data SSL certificate in the Trusted Root Certification Authorities store, needed to validate SSL/TLS connections. Continue? [Y/n] " response
    response=${response:-Y}
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo
        echo "Copying the Bright Data SSL certificate to the correct folder..."
        cp ca.crt /usr/local/share/ca-certificates/brightdata.crt
        
        echo
        echo "Step #3: Updating certificate in the trust store"
        update-ca-certificates
        
        if [[ $? -eq 0 ]]; then
            echo
            echo "*** Bright Data SSL certificate installed successfully. ***"
        else
            echo
            echo "Failed to update the certificate in the trust store."
        fi
    else
        echo
        echo "Installation of the Bright Data SSL certificate was skipped."
    fi
}

# Main script execution
check_root
download_certificate
install_certificate
