int fact(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * fact(n - 1);
  }
}

void main(List<String> args) {
  print(fibnocci(10));
  print(fact(5));
  print(sum(5));
}

int fibnocci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibnocci(n - 1) + fibnocci(n - 2);
  }
}

int sum(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n + sum(n - 1);
  }
}
