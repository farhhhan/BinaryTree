import 'dart:io';

class Node {
  Node? next;
  int? data;
  Node({required this.data});
}

class Queue {
  Node? rear;
  Node? front;
  void enqueue(int data) {
    var newNode = Node(data: data);
    if (front == null) {
      rear = front = newNode;
      return;
    }
    rear!.next = newNode;
    rear = newNode;
  }

  void display() {
    Node? temp = front;
    if (front == null) {
      print("Queue is Empty");
      return;
    }
    while (temp != null) {
      stdout.write("${temp.data}<--");
      temp = temp.next;
    }
  }

  void dequeue() {
    if (front == null) {
      print("Queue is Empty");
    }
    front = front!.next;

    if (front == null) {
      print("is empty");
      rear = null;
    }
  }
}

void main(List<String> args) {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);
  queue.dequeue();
  queue.display();
}
