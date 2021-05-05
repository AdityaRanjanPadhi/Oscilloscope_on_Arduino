import processing.serial.*;
Serial get;
float[] history; int[] timer;
float volt; int i = 1; String volts = "Volts";

void setup()
{
  size(1000,600);
  background(255);
  history = new float[width];
  timer = new int[width];
  for(int i = 0; i<width; i++){history[i] = 0; timer[i] = 0;}
  get = new Serial(this, "COM3", 9600);
  get.bufferUntil('\n');
}

void draw(){
  plot();
}

void serialEvent (Serial get){
  volt = float(get.readStringUntil('\n'));
}

void mousePressed(){
i*=-1;
}

void plot(){
  int a = millis();
  translate(0,height/2);
  background(255);
  
  fill(0);
  stroke(0); strokeWeight(1);
  line(50,-height/2,50,height/2);
  stroke(200); strokeWeight(1);   
    
  for(int j=-5;j<=5;j++){
  line(50,-255*j/5,width,-255*j/5);
  text(j+volts,10,-255*j/5+2);}
  
  text(timer[mouseX],width/2,height/2-20);
  
  if(i==1){
  fill(255,0,0);
  circle(width-4,-volt,8);
  for(int j = 1; j<width; j++){history[j-1]=history[j]; timer[j-1]=timer[j];}
  history[width-1]=-volt;
  timer[width-1]=a;}
  strokeWeight(2); stroke(255,0,0);
  for(int k = 1; k<width-50; k++){point(width-k,history[width-k]);}
  fill(137,137);
  strokeWeight(0.1);
  circle(mouseX,history[mouseX],8);
}
