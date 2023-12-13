class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class Binarytree {
  Node? root;
  void inert(int data) {
    var newNode = Node(data: data);
    if (root == null) {
      root = newNode;
      return;
    }
    var temp = root;
    while (true) {
      if (data > temp!.data!) {
        if (temp.right == null) {
          temp.right = newNode;
          break;
        } else {
          temp = temp.right;
        }
      } else {
        if (temp.left == null) {
          temp.left = newNode;
          break;
        } else {
          temp = temp.left;
        }
      }
    }
  }

  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? current) {
    if (current != null) {
      inOrderHelper(current.left);
      print(current.data);
      inOrderHelper(current.right);
    }
  }

  bool conatins(int data) {
    var temp = root;
    while (temp != null) {
      if (data > temp.data!) {
        temp = temp.right;
      } else if (data < temp.data!) {
        temp = temp.left;
      } else {
        return true;
      }
    }
    return false;
  }
}

void main(List<String> args) {
  Binarytree t = Binarytree();
  t.inert(10);
  t.inert(7);
  t.inert(13);
  t.inert(8);
  t.inert(6);
  t.inOrder();
  print("");
  print(t.conatins(7));
}
void remove(){

}
void removeHelper(){
  
}