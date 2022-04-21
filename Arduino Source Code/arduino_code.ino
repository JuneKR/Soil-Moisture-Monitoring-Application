#include <FirebaseESP8266.h>
#include <ESP8266WiFi.h>

#define WIFI_SSID "WifiSSID" 
#define WIFI_PASSWORD "Wifipassword"

#define FIREBASE_HOST "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com"
#define FIREBASE_KEY "AXx4FZMhqZuZGsh7uLQdaZbHpZCYS8QG41lXfJE5"

FirebaseData firebaseData;
int sensor1 = A0;
int sensorVel=0;
int MotorL = D1;
int MotorR = D2;
int MotorPWM = D3;

void setup() {
   connectWifi();
   Firebase.begin(FIREBASE_HOST, FIREBASE_KEY);
   pinMode(LED_BUILTIN, OUTPUT);
   pinMode(MotorL, OUTPUT);
   pinMode(MotorR, OUTPUT);
   pinMode(MotorPWM, OUTPUT);
   Serial.begin(9600);
   MortorOff();
//   pinMode(sensor1, INPUT);
}

void loop() {
    sensorVel = analogRead(sensor1);
    int x = sensor_percentageCla(sensorVel);
    //int x = sensorVel;
    UplodeData(x);
    //MotorControl();
    int z = GetData();
    //LED_AlaimError();
    if (z == 1){MortorOn();}
    else if (z == 0){MortorOff();}
    else {MortorOff(); Serial.println("Database Error !!");}
}

void connectWifi() {
    Serial.begin(9600);
    Serial.println(WiFi.localIP());
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("connecting");
    while (WiFi.status() != WL_CONNECTED) {
        Serial.print(".");
        delay(500);
    }
    Serial.println();
    Serial.print("connected: ");
    Serial.println(WiFi.localIP());
}

void UplodeData(int SensorValue){
    delay(100);
    int _SensorValue = convert_mois(SensorValue);
    String convert = String(_SensorValue);
    if(Firebase.setString(firebaseData, "/data/-N05Fojqfmw5eicFHwQ8/moisture", convert)) {
        Serial.println("Added");
        //Serial.print(SensorValue);
    } else {
        Serial.println("Error : " + firebaseData.errorReason());
        //LED_AlaimError();
    }
}
int GetData(){
    delay(100);
    int Value = 0;
    if(Firebase.getInt(firebaseData, "/data/-N05Fojqfmw5eicFHwQ8/pump")) {
      int Value = firebaseData.intData();
        Serial.println(Value);
        return Value;
    } else {
        Serial.println("Error : " + firebaseData.errorReason());
        return 0;
    }
}

void MortorOn(){
      digitalWrite(MotorL, 1);
      digitalWrite(MotorR, 0);
      analogWrite(MotorPWM, 1000);
      Serial.println("speed 1000");
      delay(3000);
}

void MortorOff(){
      digitalWrite(MotorL, 1);
      digitalWrite(MotorR, 0);
      analogWrite(MotorPWM, 0);
      Serial.println("stop");
      delay(3000);
}

int sensor_percentageCla(int SensorInt){
  float i = float(SensorInt)/1024;
  float Answer = i*100;
  return int(Answer); 
}

int convert_mois(int mois){
  mois = 100 - mois;
  return mois;
}
/*
void LED_AlaimError(){
  digitalWrite(LED_BUILTIN, HIGH);
  delay(300);
  digitalWrite(LED_BUILTIN, LOW);
  delay(300);
  digitalWrite(LED_BUILTIN, HIGH);
  delay(300);
  digitalWrite(LED_BUILTIN, LOW);
  delay(300);
  digitalWrite(LED_BUILTIN, LOW);
}*/
/*
void LED_Runing(){
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1500);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1500);
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1500);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1500);
  digitalWrite(LED_BUILTIN, LOW);
}*/
