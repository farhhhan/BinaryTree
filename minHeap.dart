class MinHeap {
  List heap = [];
  MinHeap();
  MinHeap.two(List<int> list) {
    builHeap(list);
  }
  void builHeap(List list) {
    heap = list;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int current) {
    int end = heap.length - 1;
    int left = leftChild(current);
    while (left <= end) {
      int right = rightChild(current);
      int idxToshift = left;
      if (right <= end && heap.elementAt(right) < heap.elementAt(left)) {
        idxToshift = right;
      }
      if (heap.elementAt(current) > heap.elementAt(idxToshift)) {
        swap(heap, current, idxToshift);
        current = idxToshift;
        left = leftChild(current);
      } else {
        return;
      }
    }
  }

  void shiftUp(int current) {
    int parents = parent(current);
    while (current > 0 && heap.elementAt(parents) > heap.elementAt(current)) {
      swap(heap, current, parents);
      current = parents;
      parents = parent(current);
    }
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return 2 * i + 1;
  }

  int rightChild(int i) {
    return 2 * i + 2;
  }

  void swap(List list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  int peek() {
    return heap.elementAt(0);
  }

  void display() {
    for (int i = 0; i < heap.length; i++) {
      print(heap.elementAt(i));
    }
  }

  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }
}

void main(List<String> args) {
  List<int> list = [6, 2, 8];
  MinHeap minHeap = MinHeap.two(list);
  minHeap.display();
  print(" ");
  minHeap.insert(1);
  minHeap.insert(5);
  minHeap.insert(15);
  minHeap.display();
  print(" ");
  minHeap.remove();
  minHeap.display();
  print(" ");
  print("${minHeap.peek()}");
}
