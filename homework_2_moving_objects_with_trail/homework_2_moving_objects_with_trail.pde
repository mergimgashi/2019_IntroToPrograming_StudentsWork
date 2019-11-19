//guidance from Learning Processing chapter 9 (arrays) and array guide from https://processing.org/tutorials/arrays/


Snake mySnake;
Object myObject;

void setup() {
  size(600,600);
  noStroke();
  
  mySnake = new Snake();
  myObject = new Object();
  
}
  
void draw() {
  background(0);
  noCursor();
  
  mySnake.display();
  mySnake.movement();
  myObject.display();
}

class Object {
  // variables x and y positions
  int[] x = new int[60];
  int[] y = new int[60];
  

void display() {
    
// array values
  for (int i = 0; i < x.length - 1; i++) {
      x[i] = x[i + 1];
      y[i] = y[i + 1];
    }
    
    //updating last array with mouse location
   x[x.length - 1] = mouseX;
   y[y.length - 1] = mouseY;
   
   //drawing the object in each array where its tied to the loop counter i
   for (int i = 0; i < x.length; i++) {
     fill(0,0,255,127);
     noStroke();
     ellipse(x[i],y[i],i,i);
   }
  }
}



class Snake {
  
  int xpos = 300;
int ypos = 300;

int speed = 10;
int speed1 = -7;

int num = 50;
int[] x = new int[num];
int[] y = new int[num];
  
void display() {
  
  //array guide from https://processing.org/tutorials/arrays/ under record data
    for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
    }  
    
    for (int i = 0; i < num; i++) {
      fill(0,255,0,127);
      ellipse(x[i], y[i], 50,50);
}
}
void movement(){ 
  
x[0] = xpos;
y[0] = ypos;

xpos = xpos + speed;
ypos = ypos + speed1;


// movement of the ellipse inspiration from https://forum.processing.org/two/discussion/22764/the-movement-of-several-shapes-in-an-array
 if (xpos > width) { 
    xpos = width; 
    speed = -speed;
  } 
  if (ypos > height) { 
    ypos = height; 
    speed1 = -speed1;
  } 
  if (xpos < 0) { 
    xpos = 0; 
    speed = -speed;
  } 
  if (ypos < 0) { 
    ypos = 0; 
    speed1 = -speed1;
  }
}
}
