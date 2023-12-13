import 'dart:io';

class Node {
  Node? next;
  int? data;
  Node({required this.data});
}

class LinkedList {
  Node? head = null;
  Node? tail = null;
  void addnodes(int data) {
    var newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void diplay() {
    var temp = head;
    while (temp != null) {
      stdout.write("${temp.data}-->");
      temp = temp.next;
    }
  }

  void removeDuplicates() {
    Node? temp = head;
    while (temp != null) {
      Node? runner = temp;
      while (runner!.next != null) {
        if (temp.data == runner.next!.data) {
          runner.next = runner.next!.next;
        } else {
          runner = runner.next;
        }
      }
      temp = temp.next;
    }
  }

  void reverse() {
    Node? temp = head;
    Node? next = head;
    Node? pevs;
    while (temp != null) {
      next = next!.next;
      temp.next = pevs;
      pevs = temp;
      temp = next;
    }
    head = pevs;
  }

  void mergeLinkedList(LinkedList ll2, LinkedList ll3) {
    Node? temp1 = ll2.head;
    while (temp1 != null) {
      addnodes(temp1.data!);
      temp1 = temp1.next;
    }
    Node? temp2 = ll3.head;
    while (temp2 != null) {
      addnodes(temp2.data!);
      temp2 = temp2.next;
    }
  }
}

void main(List<String> args) {
  var ll = LinkedList();
  ll.addnodes(10);
  ll.addnodes(20);
  ll.addnodes(30);
  ll.addnodes(35);
  var l2 = LinkedList();
  l2.addnodes(1);
  l2.addnodes(2);
  l2.addnodes(3);
  l2.addnodes(4);
  var l3 = LinkedList();
  l3.mergeLinkedList(ll, l2);
  l3.diplay();
}
