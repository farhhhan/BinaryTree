class MinHeap {
  List<int> heap = [];
  MinHeap(List<int> list) {
    buildHeap(list);
  }
  void buildHeap(List<int> list) {
    heap = list;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int current) {
    int left = leftchild(current);
    int end = heap.length - 1;
    while (left <= end) {
      int right = rightchild(current);
      int idxToShift = left;
      if (right <= end && heap[right] < heap[left]) {
        idxToShift = right;
      }
      if (heap[current] > heap[idxToShift]) {
        swap(heap, current, idxToShift);
        current = idxToShift;
        left = leftchild(current);
      } else {
        return;
      }
    }
  }

  void shiftUp(int current) {
    int parents = parent(current);
    while (current > 0 && heap[parents] > heap[current]) {
      swap(heap, current, parents);
      current = parents;
      parents = parent(current);
    }
  }

  void swap(List list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  int leftchild(int i) {
    return 2 * i + 1;
  }

  int rightchild(int i) {
    return 2 * i + 2;
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  void display() {
    for (int i = 0; i < heap.length; i++) {
      print(heap[i]);
    }
  }

  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }
}

void main(List<String> args) {
  List<int> list = [8, 7, 6, 5, 4, 3, 1];
  MinHeap m = MinHeap(list);

  m.display();
}
