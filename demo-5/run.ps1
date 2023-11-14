#docker run -it --name mac-demo5 -p 8085:8080 -v $PWD/:/usr/local/structurizr structurizr/lite
$workspace = "workspace.dsl"
$result = $(docker run -it -v $PWD/:/usr/local/structurizr structurizr/cli validate -workspace $workspace)

if ($result -eq $null) {
    write-host "Valid model"
    docker run -it -v $PWD/:/usr/local/structurizr structurizr/cli list -workspace $workspace
} else {
    write-host "Invalid model"
    write-host "Output: $result"
}