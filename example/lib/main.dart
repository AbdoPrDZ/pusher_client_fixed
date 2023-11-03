import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';

void main() {
  runApp(const MyApp());
}

const String appId = "1321495";
const String key = "037c47e0cbdc81fb7144";
const String cluster = "mt1";
const String hostEndPoint = "172.17.96.1";
const String hostAuthEndPoint = "http://$hostEndPoint/broadcasting/auth";
const String token = "2|2gAA0Z1w43jasatIFaw0MD3H8LSDeGIoK2sCtTDw6ac6eb51";
const String channelName = 'private-messages';
const String eventName = 'MessageCreatedEvent';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PusherClient pusherClient;
  late Channel channel;

  @override
  void initState() {
    super.initState();
    initPusher();
  }

  void initPusher() {
    pusherClient = PusherClient(
      key,
      const PusherOptions(
        // host: hostEndPoint,
        // encrypted: true,
        cluster: cluster,
        auth: PusherAuth(
          hostAuthEndPoint,
          headers: {'Authorization': 'Bearer $token'},
        ),
      ),
      autoConnect: false,
      enableLogging: true,
    );

    pusherClient.connect();

    pusherClient.onConnectionStateChange((state) {
      log(
        "previousState: ${state?.previousState}, currentState: ${state?.currentState}, socketId: ${pusherClient.getSocketId()}",
      );
      if (state?.currentState == 'CONNECTED') {
        channel = pusherClient.subscribe(channelName);

        channel.bind(eventName, (event) {
          log('${event?.data}');
        });
      }
    });

    pusherClient.onConnectionError((error) {
      log("error: ${error?.message}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Pusher Client Example'),
        ),
        body: const Center(
          child: Text('Listening to Pusher events...'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // channel.unbind(eventName); // Replace with your event name
    pusherClient.unsubscribe(channelName); // Replace with your channel name
    pusherClient.disconnect();
    super.dispose();
  }
}
