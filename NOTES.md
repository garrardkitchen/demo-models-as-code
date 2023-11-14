
# to export to other tools

```powershell
docker run -it --rm -v $PWD:/usr/local/structurizr structurizr/cli <parameters>


docker run -it --rm -v $PWD/workspace:/usr/local/structurizr structurizr/cli export --workspace workspace.dsl --format plantuml/structurizr --output diagrams

```


# to export pngs

```powershell
git clone https://github.com/structurizr/puppeteer.git
cd puppeteer
npm install puppeteer
node export-diagrams.js http://localhost:8080/workspace/diagrams png
```

output:

```
 - Opening http://localhost:8080/workspace
 - Starting export
 - Deployment-001.png
 - Deployment-001-key.png
 - Deployment-002.png
 - Deployment-002-key.png
 - landscape.png
 - landscape-key.png
 - Container-001.png
 - Container-001-key.png
 - SystemContext-001.png
 - SystemContext-001-key.png
 - Component-001.png
 - Component-001-key.png
 - Finished
```

```powershell
docker run -it --rm -p 8080:8080 -v PATH:/usr/local/structurizr structurizr/lite

docker run -it --rm -p 8080:8080 -v $PWD/workspace:/usr/local/structurizr structurizr/lite
```

```
workspace extends https://docs.structurizr.com/dsl/cookbook/workspace-extension/system-landscape.dsl { }
```