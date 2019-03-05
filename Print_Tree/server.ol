include "TreeInterface.iol"
include "string_utils.iol"
include "console.iol"
execution{ concurrent }
inputPort TreeService {
Location: "socket://localhost:8000"
Protocol: sodep
Interfaces: TreeInterface
}

main {
  createTree(input)(result) {
    Tree = void;
    undef( Tree.root ) |
    length@StringUtils(input)(inputLength);
    //println@Console(inputLength)();
    subStringRequest = input;
    with(subStringRequest) {
      .begin = 0;
      .end = 1
    };
    substring@StringUtils(subStringRequest)(char);
    println@Console(char)();
    Tree.root = char;
    //println@Console(Tree.root)();
    undef(Tree.root.left);
    undef(Tree.root.right);
    for(i=1, i<=inputLength, i++) {
      with (subStringRequest) {
        .begin = i;
        .end = i+1
      };
      substring@StringUtils(subStringRequest)(char);
      println@Console(char)();
      currentNode = Tree.root;
      temp = true;
      //count = 0;
      //TODO fix infintie loop
      while(temp) {
        //println@Console(count)();
        count++;
        if(char<=currentNode) {
          if(!is_defined( currentNode.left )) {
            node = char;
            undef(node.left);
            undef(node.right);
            currentNode.left = node;
            temp = false
          } else {
            currentNode = currentNode.left
          }
        } else {
          if(!is_defined( currentNode.right )) {
            node = char;
            undef(node.left);
            undef(node.right);
            currentNode.right = node;
            temp = false
          } else {
            currentNode = currentNode.right
          }
        }
      }
    };
    result = Tree
  }
}
