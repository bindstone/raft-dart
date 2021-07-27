import 'dart:isolate';
import 'dart:async';
import 'dart:math';
import 'package:dart_raft/environment_config.dart';

class FrameClock {
  static void generateFrame(SendPort sendPort) {
    var rng = Random();
    int counter = 0;
    int time = waitFix + rng.nextInt(waitVariable);
    print('Server Frame generation defined on [$time]');

    Timer.periodic(Duration(milliseconds: time), (_) {
      counter++;
      String sendMsg = 'Counter: $counter';
      print('${DateTime.now()} Notify : $counter');
      sendPort.send(sendMsg);
    });
  }
}