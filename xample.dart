import 'dart:io';

class Node {
  Node? next;
  int? data;
  Node({required this.data});
}

class LinkedList {
  Node? head;
  Node? tail;
  void addnode(int data) {
    var newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    Node? temp = head;
    if (temp == null) {
      print('the list is empty');
    } else {
      while (temp != null) {
        stdout.write('${temp.data} -->');
        temp = temp.next;
      }
    }
  }

  void addBigning(int data) {
    var newNode = Node(data: data);
    newNode.next = head;
    head = newNode;
  }

  void addEnd(int data) {
    var newNode = Node(data: data);
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = newNode;
    tail = newNode;
  }

  void deleteBeging() {
    head = head!.next;
  }

  void deleteEnd() {
    Node? prev;
    Node? temp = head;
    while (temp!.next != null) {
      prev = temp;
      temp = temp.next;
    }
    prev!.next = null;
    tail = prev;
  }

  void deleteValue(int data) {
    Node? temp = head;
    Node? prev;
    while (temp != null) {
      if (temp.data == data) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = temp!.next;
  }

  void findLargest() {
    Node? temp = head;
    int Largest = head!.data!;
    while (temp != null) {
      if (Largest < temp.data!) {
        Largest = temp.data!;
      }
      temp = temp.next;
    }
    print('\nLargest is ${Largest}');
  }

  void convertToList() {
    List<int> lists = [];
    Node? temp = head;
    while (temp != null) {
      lists.add(temp.data!);
      temp = temp.next;
    }
    print("\n the List is :${lists}");
  }

  void listToNode(List lists) {
    for (int i = 0; i < lists.length; i++) {
      addnode(lists[i]);
    }
  }

  void insertAfter(int data, int position) {
    Node? temp = head;

    var newNode = Node(data: data);
    while (temp != null) {
      if (temp.data == position) {
        break;
      }
      temp = temp.next;
    }
    newNode.next = temp!.next;
    temp.next = newNode;
  }

  void insertBefore(int data, int position) {
    Node? temp = head;
    Node? prev;
    var newNode = Node(data: data);
    while (temp != null) {
      if (temp.data == position) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = newNode;
    newNode.next = temp;
  }

  void sortNode() {
    List<int> listss = [];
    Node? temp = head;
    while (temp != null) {
      listss.add(temp.data!);
      temp = temp.next;
    }
    listss.sort();
    head = null;
    for (int i = 0; i < listss.length; i++) {
      addnode(listss[i]);
    }
  }

  void mergeLinkedLists(LinkedList lis1, LinkedList lis2) {
    if (lis1.head == null) {
      // If the first list is empty, set its head to the head of the second list
      head = lis2.head;
    } else {
      Node? temp = lis1.head;
      while (temp != null) {
        addnode(temp.data!);
        temp = temp.next;
      }

      Node? temp2 = lis2.head;
      while (temp2 != null) {
        addnode(temp2.data!);
        temp2 = temp2.next;
      }
    }
  }
}

void main(List<String> args) {
  var list1 = LinkedList();
  list1.addnode(10);
  list1.addnode(20);
  list1.addnode(30);
  list1.addnode(40);
  list1.addnode(50);
  list1.addnode(60);
  list1.addnode(70);

  var list2 = LinkedList();
  list2.addnode(11);
  list2.addnode(22);
  list2.addnode(33);
  list2.addnode(44);
  list2.addnode(55);
  list2.addnode(66);
  list2.addnode(77);

  var ll = LinkedList();
  ll.mergeLinkedLists(list1, list2);
  ll.sortNode();
  ll.display();
}
