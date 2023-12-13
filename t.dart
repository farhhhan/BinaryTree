class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class Binary {
  Node? root;
  void insert(int data) {
    var newNode = Node(data: data);
    var temp = root;
    if (temp == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < temp!.data!) {
        if (temp.left == null) {
          temp.left = newNode;
          break;
        } else {
          temp = temp.left;
        }
      } else if (data > temp.data!) {
        if (temp.right == null) {
          temp.right = newNode;
          break;
        } else {
          temp = temp.right;
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
          Node? child = (current.left != null) ? current.left : current.right;
          if (parent == null) {
            root = child;
          } else {
            if (parent.left == current) {
              parent.left = child;
            } else {
              parent.right = child;
            }
          }
        }
        break;
      }
    }
  }

  bool contains(int data) {
    var temp = root;
    while (temp != null) {
      if (data < temp.data!) {
        temp = temp.left;
      } else if (data > temp.data!) {
        temp = temp.right;
      } else {
        return true;
      }
    }
    return false;
  }

  int closesNumber(int target) {
    var temp = root;
    int closest = temp!.data!;
    while (temp != null) {
      if ((target - closest).abs() > (target - temp.data!).abs()) {
        closest = temp.data!;
      }
      if (target < temp.data!) {
        temp = temp.left;
      } else if (target > temp.data!) {
        temp = temp.right;
      } else {
        break;
      }
    }
    return closest;
  }

  int getMinimum(Node? current) {
    if (current!.left == null) {
      return current.data!;
    } else {
      return getMinimum(current.left);
    }
  }
}

void main(List<String> args) {
  var t = Binary();
  t.insert(50);
  t.insert(80);
  t.insert(30);
  t.insert(20);
  t.insert(35);
  t.insert(85);
  t.insert(70);
  t.remove(85);

  t.inOrder();
  print(t.contains(70));
  print(t.closesNumber(38));
}
