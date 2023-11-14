$dir = $pwd
Set-Location puppeteer
npm install puppeteer
Set-Location $dir
New-Item -ItemType Directory -Path "$($pwd)/documentation" -ErrorAction Ignore
node puppeteer/export-documentation.js http://localhost:8080/workspace/documentation/EShop
node puppeteer/export-documentation.js http://localhost:8080/workspace/documentation/Shopping%20Basket


