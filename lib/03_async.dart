import 'dart:async';

main () {

  String lookUpVersionSync() => '1.0.0';
  Future<String> lookUpVersion() async => '1.0.0';

  List<Future<String>> lookUpVersionList = [() async => '1.0.0'];

  Future<String> findEntrypoint() async => 'the gate';
  Future<String> runExecutable(String ep, String option) async => 'done';
  Future<String> flushThenExit(String exitCode) async => 'flushed';


  Future<String> runUsingFuture() {
    return findEntrypoint().then((entryPoint) {
      return runExecutable(entryPoint, 'x');
    }).then(flushThenExit);
  }

  Future<String> runUsingAsyncAwait() async {
    var entryPoint = await findEntrypoint();
    var exitCode = await runExecutable(entryPoint, 'x');
    await flushThenExit(exitCode);
  }


  Future f1() async => '1';
  Future f2() async => '2';
  Future f3() async => '3';

  Future.wait([f1(), f2(), f3()]);

//  doLoop() async {
//    // ...
//    await for (var request in lookUpVersionList) {
//      handleRequest(request);
//    }
//    // ...
//  }

  runUsingFuture().then((s) => print('completed runUsingFuture'));
  runUsingAsyncAwait().then((s) => print('completed runUsingAsyncAwait'));

}