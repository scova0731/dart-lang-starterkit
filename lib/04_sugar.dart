class Point {
  num x;
  num y;
  num _privateNum;

  Point(this.x, this.y);

  num get numPlus => _privateNum + 1;
  set numPlus(num x) => _privateNum = x - 1;

  void doSome(){} void doAnother(){}
}

main() {
  var p  = new Point(1, 2);
  var p2 = p..doSome()..doAnother();
  assert(p == p2);

  print(p._privateNum); // あれ参照できちゃう？


  int i1 = null;
  int i2 = i1 ?? 1;  // null
  assert(i2 == 1);


  var isDecaffe1 = (String tea) => tea == 'chamomile';       // 1行関数
  Function isDecaffe2 = (String tea) => tea == 'chamomile';  // 1行関数
  bool isDecaffe3(String tea) => tea == 'chamomile';         // 1行関数

  print('Done');
}


