#!/bin/bash

#go to the project directory
cd /var/www/html/casino-new/casino-admin

#remove the servercode changes 
git restore .

# Pull the latest changes from the git repository
git pull

# intall node dependencies
npm install

# Stop and delete the PM2 process
pm2 delete casino-admin

# Navigate to the .angular directory
cd .angular/

# Remove the cache directory and its contents
rm -r cache/

# Return to the parent directory
cd ..

# Remove the dist directory and its contents
rm -r dist/

# Run the NPM build script
npm run build

# Start a new PM2 process with the name "casino-admin"
pm2 start "npm run start" --name casino-admin

# Optionally, display a message when the script is done
echo "Deployment script completed."
