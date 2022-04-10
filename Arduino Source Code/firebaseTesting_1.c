#include <FirebaseArduino.h>
#include <ESP8266WiFi.h>
#define LED_PIN 4
// Config Firebase
#define FIREBASE_HOST "ledesp-86d37.firebaseio.com"
#define FIREBASE_AUTH "<YOUR KEY>"
// Config connect WiFi
#define WIFI_SSID "<YOUR WIFI NAME>"
#define WIFI_PASSWORD "<YOUR WIFI PASSWORD>"
void setup() {
pinMode(LED_PIN, OUTPUT);
Serial.begin(115200);
// connect to wifi.
WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
Serial.print("connecting");
while (WiFi.status() != WL_CONNECTED) {
Serial.print(".");
delay(500);
}
Serial.println();
Serial.print("connected: ");
Serial.println(WiFi.localIP());

Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
Firebase.stream("/Node1/LED");
}
 
void loop() {
if (Firebase.failed()) {
Serial.println("streaming error");
Serial.println(Firebase.error());
}
 
if (Firebase.available()) {
FirebaseObject event = Firebase.readEvent();
String eventType = event.getString("type");
eventType.toLowerCase();
 
if (eventType == "") return ;
Serial.print("event: ");
Serial.println(eventType);
if (eventType == "put") {
String path = event.getString("path");
int data = event.getInt("data");
Serial.println("[" + path + "] " + String(data));
if (path == "/") {
digitalWrite(LED_PIN, (data == 0 ? LOW : HIGH));
}
}
}
delay(10);
}
