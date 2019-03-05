type Tree: void {
  .root: void | Node
}

type Node: string {
  .left: void | Node
  .right: void | Node
}

interface TreeInterface {
  RequestResponse: createTree(string)(Tree)
}
