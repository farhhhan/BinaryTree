void bubble(List list) {
  int n = list.length;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  print(list);
}

void main(List<String> args) {
  List list = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  print(qucksort(list));
}

List qucksort(List list) {
  quckHelper(list, 0, list.length - 1);
  return list;
}

void quckHelper(List list, int start, int end) {
  if (start >= end) {
    return;
  }
  int pivote = start;
  int left = start + 1;
  int right = end;
  while (left <= right) {
    if (list[left] > list[pivote] && list[right] < list[pivote]) {
      swap(list, left, right);
      left++;
      right--;
    }
    if (list[left] <= list[pivote]) {
      left++;
    }
    if (list[right] >= list[pivote]) {
      right--;
    }
  }
  swap(list, right, pivote);
  quckHelper(list, start, right - 1);
  quckHelper(list, right + 1, end);
}

void swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
