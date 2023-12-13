import 'dart:io';

class Node {
  Node? next;
  int? data;
  Node({required this.data});
}

class LinkedList {
  Node? head = null;
  Node? tail = null;
  void addNode(int data) {
    var newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void displayNodes() {
    Node? temp = head;
    while (temp != null) {
      stdout.write("${temp.data}-->");
      temp = temp.next;
    }
  }

  void addbegnig(int data) {
    var newNode = Node(data: data);
    newNode.next = head;
    head = newNode;
  }
}

void main(List<String> args) {
  var ll = LinkedList();
  ll.addNode(1);
  ll.addNode(2);
  ll.addNode(3);
  ll.addNode(4);
  ll.addNode(5);
  ll.addbegnig(10);
  ll.displayNodes();
}
