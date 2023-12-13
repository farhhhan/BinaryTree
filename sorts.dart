void bubblesort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        swap(list, j, j + 1);
      }
    }
  }
  print(list);
}

void main(List<String> args) {
  List<int> lists = [98, 65, 34, 43, 12, 09, 87, 9];
  bubblesort(lists);
  insertionSort(lists);
  seletectionsort(lists);
  print(quck(lists));
}

void insertionSort(List<int> lists) {
  int n = lists.length;
  for (int i = 0; i < n; i++) {
    int temp = lists[i];
    int j;
    for (j = i - 1; j >= 0; j--) {
      if (lists[j] > temp) {
        lists[j + 1] = lists[j];
      } else {
        break;
      }
    }
    lists[j + 1] = temp;
  }
  print(lists);
}

void seletectionsort(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    int index = i;
    for (int j = i + 1; j < list.length - 1; j++) {
      if (list[i] > list[index]) {
        index = j;
      }
    }
    swap(list, index, i);
  }
  print(list);
}

List<int> quck(List<int> list) {
  qucksort(list, 0, list.length - 1);
  return list;
}

void qucksort(List list, int startIdx, int endIdx) {
  if (startIdx >= endIdx) {
    return;
  }
  int pivot = startIdx;
  int leftIdx = startIdx + 1;
  int rightIdx = endIdx;
  while (leftIdx <= rightIdx) {
    if (list[leftIdx] > list[pivot] && list[rightIdx] < list[pivot]) {
      swap(list, leftIdx, rightIdx);
      leftIdx++;
      rightIdx--;
    }
    if (list[leftIdx] <= list[pivot]) {
      leftIdx++;
    }
    if (list[rightIdx] >= list[pivot]) {
      rightIdx--;
    }
  }
  swap(list, rightIdx, pivot);
  qucksort(list, startIdx, rightIdx - 1);
  qucksort(list, rightIdx + 1, endIdx);
}

void swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
List mergesort(List list) {
  if (list.length <= 1) {
    return list;
  }
  int mid = list.length ~/ 2;
  List first = List.filled(0, mid);
  List second = List.filled(mid, list.length);

  return join(mergesort(first), mergesort(second));
}

List join(List first, List second) {
  int i = 0;
  int j = 0;
  List newlist = [];
  while (i < first.length && j < second.length) {
    if (first[i] < second[j]) {
      newlist.add(first[i]);
      i++;
    } else {
      newlist.add(second[j]);
      j++;
    }
  }
  while (i < first.length) {
    newlist.add(first[i]);
    i++;
  }
  while (j < second.length) {
    newlist.add(second[j]);
    j++;
  }
  return newlist;
}
