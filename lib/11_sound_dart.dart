void fn(List<int> a) {
  print(a);
}

main() {
  var list = [];
  list.add(1);
  list.add("2");
  fn(list);
}


void fn2(List<int> a) {
  print(a);
}

void main2() {
  var list = <int>[];
  list.add(1);
  list.add(2);
  fn(list);
}