//
// Copyright 2015 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// FirebaseDemo_ESP8266 is a sample that demo the different functions
// of the FirebaseArduino API.

#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>
//#define  <SoftwareSerial.h>
// Set these to run example.
#define FIREBASE_HOST "iot-app-ui-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "zYmuX3an8jxTTjCK8KUJ0PyhCdNutOJMXmSMQtCF"
#define WIFI_SSID "Dialog 4G F89"
#define WIFI_PASSWORD "6b375hH7"

double myString;
int vr = A0;
int sdata = 0;
void setup() {
  Serial.begin(9600);
  pinMode(vr,INPUT);
  pinMode(D0,OUTPUT);
  pinMode(D1,OUTPUT);
  pinMode(D2,OUTPUT);
  pinMode(D3,OUTPUT);
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
}

int n = 0;
bool light1;
bool light2;
bool light3;
bool light4;
void loop() {
  sdata = analogRead(vr);
  myString = float(sdata);
  Firebase.setFloat("VariableResistor/Value",myString);
  delay(1000);
  Serial.println(sdata);
  light1 = Firebase.getBool("Light1/Status");
  Serial.println(light1);
  if(light1 == true){
    digitalWrite(D0,HIGH);
  }
  if(light1 == false){
    digitalWrite(D0,LOW);
  }
  //light2
  light2 = Firebase.getBool("Light2/Status");
  Serial.println(light2);
  if(light2 == true){
    digitalWrite(D1,HIGH);
  }
  if(light2 == false){
    digitalWrite(D1,LOW);
  }
  //light3
  light3 = Firebase.getBool("Light3/Status");
  Serial.println(light3);
  if(light3 == true){
    digitalWrite(D2,HIGH);
  }
  if(light3 == false){
    digitalWrite(D2,LOW);
  }
  //light4
  light4 = Firebase.getBool("Light4/Status");
  Serial.println(light4);
  if(light4 == true){
    digitalWrite(D3,HIGH);
  }
  if(light4 == false){
    digitalWrite(D3,LOW);
  }
}
