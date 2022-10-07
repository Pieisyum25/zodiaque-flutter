import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final MQTTClientManager mqttClientManager = MQTTClientManager();

/// True if the user wants their messages to be anonymous.
bool anonymous = false;

/// The username attached to each MQTT message if anonymous is false.
String username = "Anonymous";

/// MQTTClientManager encapsulates and handles all operations regarding the
/// MQTT server client.
class MQTTClientManager {
  /// Create a client that connects to my EMQX MQTT broker server.
  MqttServerClient client = MqttServerClient.withPort(
      'ed559150.ap-southeast-1.emqx.cloud', 'flutter_client', 15283);

  /// Attempt to connect the client to the server.
  Future<int> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMessage =
        MqttConnectMessage().startClean().withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect("user01", "user01");
    } on NoConnectionException catch (e) {
      //print('MQTTClient::Client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      //print('MQTTClient::Socket exception - $e');
      client.disconnect();
    }

    return 0;
  }

  /// Disconnect the client from the server.
  void disconnect() {
    client.disconnect();
  }

  /// Subscribe the client to the given topic.
  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  /// Callback called when connected.
  void onConnected() {
    //print('MQTTClient::Connected');
  }

  /// Callback called when disconnected.
  void onDisconnected() {
    //print('MQTTClient::Disconnected');
  }

  /// Callback called when subscribed to the given topic.
  void onSubscribed(String topic) {
    //print('MQTTClient::Subscribed to topic: $topic');
  }

  /// Callback called when a ping response was successfully received.
  void pong() {
    //print('MQTTClient::Ping response received');
  }

  /// Publishes a message from the client with the given topic.
  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  /// Returns a stream that receives all future messages from topics that
  /// the client is currently subscribed to.
  Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
    return client.updates;
  }
}
