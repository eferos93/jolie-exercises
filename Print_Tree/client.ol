include "TreeInterface.iol"
include "console.iol"
outputPort TreeService {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: TreeInterface
}

main {
  createTree@TreeService("ciao")(output);
  println@Console(output)()
}
