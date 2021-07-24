import 'package:dart_raft/frame_clock.dart' as dart_raft;
import 'dart:isolate';

void main(List<String> arguments) async {

  final receiver = ReceivePort();
  receiver.listen((message) {
    print(message);
  });

  Isolate isolate = await Isolate.spawn(dart_raft.FrameClock.generateFrame, receiver.sendPort);
}
