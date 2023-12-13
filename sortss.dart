

void buuble(List<int> list) {
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
  List<int> list = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  buuble(list);
  select(list);
  print(qucksort(list));
  // print(mergesort(list));
}

void insert(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n; i++) {
    int temp = list[i];
    int j;
    for (j = i - 1; j >= 0; j--) {
      if (list[j] > temp) {
        list[j + 1] = list[j];
      } else {
        break;
      }
    }
    list[j + 1] = temp;
  }
  print(list);
}

void select(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n; i++) {
    int index = i;
    for (int j = i + 1; j < n; j++) {
      if (list[j] < list[index]) {
        index = j;
      }
    }
    int temp = list[index];
    list[index] = list[i];
    list[i] = temp;
  }
  print(list);
}

List<int> qucksort(List<int> list) {
  quckhelper(list, 0, list.length - 1);
  return list;
}

void quckhelper(List<int> list, int start, int end) {
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
  quckhelper(list, start, right - 1);
  quckhelper(list, right + 1, end);
}

void swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

// List mergesort(List list) {
//   if (list.length <= 1) {
//     return list;
//   }
//   int mid = list.length ~/ 2;
//   List first = List.filled(0, mid);
//   List second = List.filled(mid, list.length);

//   return join(mergesort(first), mergesort(second));
// }

// List join(List first, List second) {
//   int i = 0;
//   int j = 0;
//   List newlist = [];
//   while (i < first.length && j < second.length) {
//     if (first[i] < second[j]) {
//       newlist.add(first[i]);
//       i++;
//     } else {
//       newlist.add(second[j]);
//       j++;
//     }
//   }
//   while (i < first.length) {
//     newlist.add(first[i]);
//     i++;
//   }
//   while (j < second.length) {
//     newlist.add(second[j]);
//     j++;
//   }
//   return newlist;
// }
