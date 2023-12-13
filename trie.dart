import 'dart:collection';

class TrieNode {
  Map<String, TrieNode> children = HashMap();
}

class Trie {
  TrieNode? root = TrieNode();
  String end = "*";

  Trie(String str) {
    populatesuffixtrie(str);
  } 

  void populatesuffixtrie(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubstringStartingAt(i, str);
    }
  }

  void insertSubstringStartingAt(int index, String str) {
    TrieNode? node = root;
    for (int i = index; i < str.length; i++) {
      if (!node!.children.containsKey(str[i])) {
        TrieNode newNode = TrieNode();
        node.children[str[i]] = newNode;
      }
      node = node.children[str[i]];
    }
    node!.children[end] = TrieNode();
  }

  bool conatins(String str) {
    TrieNode? node = root;
    for (int i = 0; i < str.length; i++) {
      if (!node!.children.containsKey(str[i])) {
        return false;
      }
      node = node.children[str[i]];
    }
    return node!.children.containsKey(end);
  }
}

void main(List<String> args) {
  Trie trie = Trie("mannan");
  print(trie.conatins("annan"));
}
