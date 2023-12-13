import 'dart:io';

class Node {
  Node? next;
  int? data;
  Node({required this.data});
}

class Stack {
  Node? top;
  void push(int data) {
    var newNode = Node(data: data);
    if (top == null) {
      top = newNode;
      return;
    }
    newNode.next = top;
    top = newNode;
  }

  void display() {
    var temp = top;
    if (temp == null) {
      print("stack empty");
    }
    while (temp != null) {
      stdout.write("${temp.data}-->");
      temp = temp.next;
    }
  }

  void pop() {
    if (top == null) {
      print("Empty stack");
    }
    top = top!.next;
  }

  void Largest(Stack stack) {
    Node? temp = top;
    if (top == null) {
      return;
    }
    int largest = temp!.data!;
    while (temp != null) {
      if (largest < temp.data!) {
        largest = temp.data!;
      }
      temp = temp.next;
    }
    print("\n${largest}");
  }
}

void main(List<String> args) {
  Stack stack = Stack();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);
  stack.push(50);
  stack.pop();
  stack.pop();
  stack.pop();

  stack.display();
  stack.Largest(stack);
}
