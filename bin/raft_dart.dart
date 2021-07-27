import 'package:dart_raft/environment_config.dart';
import 'package:dart_raft/frame_clock.dart' as dart_raft;
import 'dart:isolate';

void main(List<String> args) async {

  if (args.isEmpty) {
    throw Exception('No Server defined');
  }
  int port = serverPorts[int.parse(args.first)];
  print('Server run on PORT: [$port]');
  final receiver = ReceivePort();
  receiver.listen((message) {
    print(message);
  });
  //receiver.sendPort.send("message");
  Isolate isolate = await Isolate.spawn(dart_raft.FrameClock.generateFrame, receiver.sendPort);
}