import 'package:flutter/material.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';

void main() {
  runApp(MyApp());
}

const String appId = "PUSHER_APP_ID";
const String key = "037c47e0cbdc81fb7144";
const String cluster = "mt1";
const String hostEndPoint = "192.168.1.105";
const String hostAuthEndPoint = "http://$hostEndPoint/broadcasting/auth";
const String token = "34|yzWaxwGZz75Xqk4tXviP4uhAc0sVB14OLVXEmoxg";
const int port = 6001;
const String channelName = 'private-messages';
const String eventName = 'MessageCreatedEvent';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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
      PusherOptions(
        host: hostEndPoint,
        encrypted: true,
        cluster: cluster,
        wsPort: port,
        auth: PusherAuth(
          hostAuthEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      autoConnect: false,
      enableLogging: true,
    );

    channel = pusherClient.subscribe(channelName);

    channel.bind(eventName, (event) {
      print(event?.data);
    });

    pusherClient.connect();

    pusherClient.onConnectionStateChange((state) {
      print(
        "previousState: ${state?.previousState}, currentState: ${state?.currentState}",
      );
    });

    pusherClient.onConnectionError((error) {
      print("error: ${error?.message}");
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
