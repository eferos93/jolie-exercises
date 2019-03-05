include "console.iol"
include "TwiceInterface.iol"

outputPort TwiceService {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: TwiceInterface
}

main {
  twice@TwiceService(int(args[0]))(response);
  println@Console(response)();
  println@Console("a">"b")()
}
