$dir = $pwd
Set-Location puppeteer
npm install puppeteer
Set-Location $dir
New-Item -ItemType Directory -Path "$($pwd)/diagrams" -ErrorAction Ignore

node puppeteer/export-diagrams.js http://localhost:8080/workspace/diagrams png
