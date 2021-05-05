int voltage_reader = A0; int voltage_reader1 = A1;
int voltage; int voltage1;
void setup()
{
  Serial.begin(9600);
}
void loop()
{
  voltage = analogRead(voltage_reader)/4; //*5/1024;
  voltage1 = analogRead(voltage_reader1)/4; //*5/1024;
  if(voltage>=voltage1){Serial.println(voltage);}  
  else{Serial.println(-voltage1);}
  //delay(50);
}
