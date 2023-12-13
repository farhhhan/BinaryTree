bool isPalindrome(int x) {
  String char = x.toString();
  String rev = char.split('').reversed.join('');
  if (char == rev) {
    return true;
  } else {
    return false;
  }
}

void main(List<String> args) {
  print(isPalindrome(516));
  print(plusOne([10, 20, 30, 40]));
  print(thirdMax([10, 20, 30, 40, 59, 99, 776]));
}

List<int> plusOne(List<int> digits) {
  BigInt nums = BigInt.parse(digits.join('')) + BigInt.one;
  return nums.toString().split('').map(int.parse).toList();
}

thirdMax(List<int> nums) {
  nums.sort();
  var data = nums.toSet();
  int n = data.length;
  for (int i = 0; i < n; i++) {
    if (n < 3) {
      return data.last;
    } else {
      return data.elementAt(n - 3);
    }
  }
}

// void main(List<String> args) {
//   String str = 'hellow  world';
//   // String s;

//   str = str.replaceAll(' ', '');
//   List lis = str.split('');

//   print(lis);
// }
