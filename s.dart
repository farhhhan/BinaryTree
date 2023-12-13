import 'dart:collection';

void main(List<String> args) {
  HashMap<String, int> hash = HashMap();
  hash.putIfAbsent("farhan", () => 1);
  hash.forEach((key, value) {
    print("${key} : ${value}");
  });
}
