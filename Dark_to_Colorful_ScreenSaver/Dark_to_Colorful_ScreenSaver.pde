Circles [] roundOne = new Circles[300];

void setup(){
  size(1600,800);
   background (20);
for (int i = 0; i < roundOne.length; i++) {

  float d = 10;
  float x = random(0+(d/2),(width-(d/2)));
  float y = random(0+(d/2),(height-(d/2)));
  boolean tester = false;

  roundOne[i] = new Circles(x,y,d);
  colorMode(HSB,100);
  
}
}






void draw() {
  //roundOne[0].colorBack();
  //background (20);
  
 
  for (int i = 0; i < roundOne.length; i++) {
    
    boolean tester = false;
            for(int j = i; j < roundOne.length; j++) {
              if  ( (i != j) && (roundOne[i].touching(roundOne[j]))  ) {
                roundOne[i].changeRGB();
                roundOne[j].changeRGB();
                //roundOne[i].changeSize();
                //roundOne[j].changeSize();
              }
               else {
                 roundOne[i].normRGB();
               }
             
              
            }
  
 
  

roundOne[i].display();
roundOne[i].move();
roundOne[i].checkEdges();

}



}

class Circles {
  float x; 
  float y; 
  float d;
  float cirColor;
  float xspeed;
  float yspeed;
  float hueX;
  float hueY; 
  float ballX;
  float ballY;
  float brightAt;
  float hueAt;
  float switcherX;
  float switcherY;
  float coinFlipX;
  float coinFlipY;  
  
  Circles(float x ,float y,float d){  
  this.hueAt = random(30,50);
  this.x = x; 
  this.y = y; 
  this.d = d;
  coinFlipX = 1;
  coinFlipY = 1;
  this.switcherX = random (0,2);
  this.switcherY = random (0,2);
  if (this.switcherX <= 1){
    coinFlipX = -1;
  }
  if (this.switcherY <= 1){
    coinFlipY = -1;
  }
  this.xspeed = coinFlipX * random (.5,1.2);
  this.yspeed = coinFlipY * random (.5,1.2);
  } 
  
  boolean touching (Circles other) {
    float dtest = dist(this.x,this.y,other.x, other.y);
    if (dtest < (    (this.d/2) + (other.d/2)   )   ) {
       return true;}
    else {
     return false;}
  }
  
  void changeRGB() {
    //fill(random(0,100),100,100,75);
    this.brightAt = this.brightAt + .1;
    //if (this.brightAt >=99){
    //  this.brightAt = 30;
    //}
    fill(hueAt,100,this.brightAt,75);
  }
  
  void changeSize() {
    //fill(random(0,100),100,100,75);
    this.d= this.d+.2;
    if (this.d >= 150){
    this.d=10;
    }
  }
  
  void normRGB(float changeLook) {
    fill(changeLook,100,100,45);
  }
    void normRGB() {
    //fill(changeLook,100,100,45);
    fill(hueAt,100,this.brightAt,75);
  }

  void display() {
    stroke(255);
    strokeWeight(5);
    ellipse(x, y, d, d);
  }
  
  void move() {
    //this.x = this.x + random(-2,2);
    //this.y = this.y + random(-2,2);
    
    this.x= this.x + this.xspeed;
    this.y= this.y + this.yspeed;
  }
  
  void checkEdges () {
  //if (x < (d/2) || x >        ) {
  if (x + (d/2) > width || x-(d/2) < 0) {
    xspeed = xspeed * -1;
  }
  if (y + (d/2) > height || y-(d/2) < 0) {
    yspeed = yspeed * -1;
  }
}
void colorBack () {
  hueX = x * 100 / width ;
  hueY = y * 100 / height; 
  background (((hueX/2) + (hueY/2)), 100, 75);
}
void colorBall () {
  ballX = x * 100 / width ;
  ballY = y * 100 / height; 
  fill ((100-((ballX/2) + (ballY/2))), 100, 100);; 
}
}
