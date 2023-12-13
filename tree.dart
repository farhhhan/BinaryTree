class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class Binarytree {
  Node? root;
  void insert(int data) {
    var newNode = Node(data: data);
    var temp = root;
    if (root == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data > temp!.data!) {
        if (temp.right == null) {
          temp.right = newNode;
          break;
        } else {
          temp = temp.right;
        }
      } else {
        if (data < temp.data!) {
          if (temp.left == null) {
            temp.left = newNode;
            break;
          } else {
            temp = temp.left;
          }
        }
      }
    }
  }

  bool contain(int data) {
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

  void remove(int data) {
    removeHelper(data, root, null);
  }

  void removeHelper(int data, Node? current, Node? parent) {
    while (current != null) {
      if (data < current.data!) {
        parent = current;
        current = current.left;
      } else if (data > current.data!) {
        parent = current;
        current = current.right;
      } else {
        if (current.left != null && current.right != null) {
          current.data = getMinimum(current.right);
          removeHelper(current.data!, current.right, current);
        } else {
          if (parent == null) {
            if (parent!.right == null) {
              root = current.left;
            } else {
              root = current.right;
            }
          } else {
            if (parent.left == current) {
              if (current.right == null) {
                parent.left = current.left;
              } else {
                parent.left = current.right;
              }
            } else {
              if (current.left == null) {
                parent.right = current.left;
              } else {
                parent.right = current.right;
              }
            }
          }
        }
        break;
      }
    }
  }

  int getMinimum(Node? curent) {
    if (curent!.left == null) {
      return curent.data!;
    } else {
      return getMinimum(curent.left);
    }
  }

  int getmaximum(Node? curent) {
    if (curent!.right == null) {
      return curent.data!;
    } else {
      return getMinimum(curent.right);
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

  void preeOrder() {
    preeOrderHelper(root);
  }

  void preeOrderHelper(Node? current) {
    if (current != null) {
      preeOrderHelper(current.left);
      print(current.data);
      preeOrderHelper(current.right);
    }
  }
}

void main(List<String> args) {
  Binarytree trees = Binarytree();
  trees.insert(50);
  trees.insert(30);
  trees.insert(20);
  trees.insert(40);
  trees.insert(70);
  trees.insert(80);
  trees.insert(60);
  print(trees.contain(10));
  print("minimum is : ${trees.getMinimum(trees.root)}");
  print("maximum is : ${trees.getmaximum(trees.root)}");
  trees.remove(50);
  trees.inOrder();
}
