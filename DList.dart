import 'dart:io';

void main(List<String> args) {
  choices();
}

void choices() {
  print(
      '''enter the choice :1-add     2-display  3-addBigin 4-addEnd  5-reverse  6-delete Beginig 7-deleteEnd
       8-List to LL 9-delete a element''');
  int choice = int.parse(stdin.readLineSync()!);
  print('\n');
  switch (choice) {
    case 1:
      {
        print('enter the limit of add value');
        int numb = int.parse(stdin.readLineSync()!);
        print('enter the   add value');
        for (int i = 0; i < numb; i++) {
          int data = int.parse(stdin.readLineSync()!);
          addNode(data);
        }
        choices();
      }

      break;
    case 2:
      {
        display();
        choices();
      }

      break;
    case 3:
      {
        print('enter the limit of add value');
        int data = int.parse(stdin.readLineSync()!);
        addBigin(data);
        choices();
      }

      break;
    case 4:
      {
        print('enter  add value');
        int data = int.parse(stdin.readLineSync()!);
        addEnd(data);
        choices();
      }
      break;
    case 5:
      {
        listReverse();
        choices();
      }

      break;
    case 6:
      {
        deleteBegin();
        choices();
      }

      break;
    case 7:
      {
        deleteEnd();
        choices();
      }

      break;
    case 8:
      {
        convertListToLinkedList([10, 20, 30, 40]);
        choices();
      }

      break;
    case 9:
      {
        print('enter  deleted value');
        int data = int.parse(stdin.readLineSync()!);
        delete(data);
        choices();
      }
      break;
  }
}

class Node {
  int? data;
  Node? next;
  Node? prev;
  Node({required this.data});
}

Node? head = null;
Node? tail = null;
void addNode(int data) {
  Node newNode = Node(data: data);
  if (head == null) {
    head = newNode;
  } else {
    tail!.next = newNode;
    newNode.prev = tail;
  }
  tail = newNode;
}

void display() {
  if (head == null) {
    print('empty linkedlist');
  } else {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void addBigin(int data) {
  Node? newNode = Node(data: data);

  newNode.next = head;

  head = newNode;
}

void addEnd(data) {
  var newNode = Node(data: data);
  if (head == null) {
    head = newNode;
  } else {
    var temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = newNode;
  }
}

void listReverse() {
  if (head == null) {
    print('empty List');
  } else {
    Node? temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }
}

void deleteBegin() {
  if (head == null) {
    print('empty list');
  } else {
    head = head!.next;
  }
}

void deleteEnd() {
  if (head == null) {
    print('list is empty');
  } else {
    var temp = head;
    while (temp!.next!.next != null) {
      temp = temp.next;
    }
    temp.next = null;
  }
}

void convertListToLinkedList(List list) {
  for (int i = 0; i < list.length; i++) {
    addNode(list[i]);
  }
}

void delete(dynamic data) {
  if (head == null) {
    print('empty List'); // Nothing to delete if the list is empty
  }

  if (head!.data == data) {
    head = head!
        .next; // If the head contains the data to be deleted, update the head
    return;
  }

  Node?temp =head;
  Node? previous;

  // while (temp != null && current.data != data) {
  //   previous = current;
  //   current = current.next;
  // }

  if (temp == null) {
    return; // Data not found in the list
  }

  // Update the references to skip the node to be deleted
  previous?.next = temp.next;
}
