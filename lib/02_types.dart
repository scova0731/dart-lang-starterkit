// $ dart -c lib/02_types.dart

main() {

  int_fn() {
    int lineCount;
    // 数値も含めて初期値はnull
    assert(lineCount == null);

    var v = 1;
    assert(v is num);
    assert(v is int);

    var w = 1.0;
    assert(w is num);
    assert(w is double);

    num x = 10;
    assert(x is num);
    assert(x is int);

    int y = 11;
    assert(y is num);
    assert(y is int);

    double z = 12.0;
    assert(z is num);
    assert(z is double);

    assert(int.parse('1') == 1);
    assert(double.parse('1.1') == 1.1);
    assert(1.toString() == '1');
    assert(3.14159.toStringAsFixed(2) == '3.14');
  }

  string_fn() {
    var s1 = 'single';
    var s2 = "double";
    assert('single is $s1' == 'single is single');
    assert('double is ${s2.toUpperCase()}' == 'double is DOUBLE');

    var s3 = '''line1
line2''';
    var s4 = """line1
line2""";
    assert(s3 == s4);
  }

  boolean_fn() {
    var name = 'Bob';
//    if (name) { // type 'String' is not a subtype of type 'bool' of 'boolean expression'
//      print('You cannot reach!');
//    }

    if (name != null) {
      print('You reach here!');
    }
  }

  list_fn() {
    var list = [1, 2, 3];
    assert(list.length == 3);
    assert(list[1] == 2);

    list[1] = 1;
    assert(list[1] == 1);

    //var constantList = const [1, 2, 3];
    //constantList[1] = 1; // Unsupported operation: Cannot modify an unmodifiable list

    var teas = <String>['green', 'black', 'chamomile', 'earl grey'];
    var loudTeaList = teas
        .map((tea) => tea.toUpperCase())
        .where((tea) => tea != 'chamomile')
        .toList();
    print(loudTeaList);

    List<String> loudTeaList2 = teas
        .map<String>((String tea) => tea.toUpperCase())
        .where((tea) => tea != 'chamomile')
        .toList();
    print(loudTeaList2);

    assert(teas.any((t) => t != 'chamomile'));
    assert(!teas.every((t) => t != 'chamomile'));
    assert(teas.first == 'green');

    // var emptyTeas = [1];
    // assert(emptyTeas.first == null); //Bad state: No element

    // var emptyTeas2 = [1];
    // assert(emptyTeas2.firstWhere((a) => false) == null); //Bad state: No element

    var isDecaffeinated1 = (String tea) => tea == 'chamomile';
    Function isDecaffeinated2 = (String tea) => tea == 'chamomile';
    bool isDecaffeinated3(String tea) => tea == 'chamomile';


    bool isDecaffeinated(String tea) => tea == 'chamomile';
    teas.where(isDecaffeinated);
    teas.every(isDecaffeinated);
    var nameJoiner = (pre, cur) => pre + " " + cur;
    var names = teas.fold("Tea names are", nameJoiner);
    print(names);
    assert(teas.reduce((left, right) => left.length >= right.length ? left : right) == 'chamomile');

  }

  map_fn() {
    var gifts1 = {
      'first' : 'partridge',
      'second': 'turtledoves'
    };
    print("gifts1 is $gifts1");

    var gifts2 = new Map();
    gifts2['first'] = 'partridge';
    gifts2['second'] = 'turtledoves';
    print("gifts2 is $gifts2");

    var gifts3 = new Map<String, String>()
      ..putIfAbsent('first', () => 'partridge')
      ..putIfAbsent('second', () => 'turtledoves');
    print("gifts3 is $gifts3");

    var gifts4 = new Map<String, String>()
      ..addAll({
        'first' : 'partridge',
        'second': 'turtledoves'
      });
    print("gifts4 is $gifts4");

  }

  int_fn();
  string_fn();
  boolean_fn();
  list_fn();
  map_fn();
}