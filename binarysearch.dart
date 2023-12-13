int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return high;
}

void main() {
  List<int> sortedList = [1, 2, 3, 5, 7, 9, 11, 13, 15];

  int largestIndex = binarySearch(sortedList, sortedList.last);

  if (largestIndex != -1) {
    int largestNumber = sortedList[largestIndex];
    print("The largest number is: $largestNumber");
  } else {
    print("List is empty");
  }
  List<int> numbers = [3, 8, 2, 10, 5, 7];

  int largestNumber = findLargest(numbers);

  if (largestNumber != null) {
    print("The largest number is: $largestNumber");
  } else {
    print("List is empty");
  }
}

int findLargest(List<int> arr) {
  if (arr.isEmpty) {
    return 0;
  }

  int largest = arr[0]; // Assume the first element is the largest

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      largest = arr[i];
    }
  }

  return largest;
}
