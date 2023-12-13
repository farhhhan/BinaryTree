import 'dart:collection';

void main(List<String> args) {
  HashMap<String, String> hash = HashMap();
  hash.putIfAbsent("a", () => "farhan");
  hash.putIfAbsent("b", () => "farhan");
  hash.putIfAbsent("c", () => "farhan");

  hash.forEach((key, value) {
    print("$key" + ":" + "$value");
  });
}
