Flower myFlower1;  // the first instance of the Flower class


void setup() {
  size(1600, 1200);


  myFlower1 = new Flower(); 

}

void draw() {
  background(#43AF76);

  myFlower1.display();
  myFlower1.move();  
  myFlower1.bounce();
  //myFlower1.coloring();
  //myFlower1.switchcolor();
  myFlower1.ball();
  myFlower1.collision();

}

class Flower {

  // Variables
  float speed; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float ballX;
  float ballY;
   float x1 = width/2;
    float y1 = height/2;
float speed1;

  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals

  Flower() {
    r= 60;
    n_petals = 7;
    x= width/2;
    y= height/2;
    petalColor= #FFA000;
    speed = 4;
    speed1 = 8;
    
  }

  void display () {


    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  void move() {

    x = x + speed;
    
    x1 = x1 + speed1;
  }
  void bounce() {
    if (x > width-r || x < r || y > height || y < 0) {
      speed = speed * (-1);
    }
    
    if (x1 > width){
     speed1 = -8;
    }
      if (x1 < 0){
      speed1 = +8;
      }
  }
  void coloring() {
    if (x > width-r || x < r || y > height || y < 0) {
      fill(0,0,255);
      ellipse(x, y, r, r);
    }
  }
  
  
  void switchcolor() {
  
    if(dist(mouseX,mouseY,x,y) < r*1.2) {
      fill(0,0,255);
      ellipse(x, y, r*1.2, r*1.2);
    }
  }
  
  void ball() {
    
    fill(0);
    ellipse(x1,y1,60,60);
}

void collision() {
  
  if(dist(x,y,x1,y1) < r*1.2 + 30){
    fill(255);
    ellipse(x1,y1,60,60);
    ellipse(x, y, r*1.2, r*1.2);
  }
}
}
