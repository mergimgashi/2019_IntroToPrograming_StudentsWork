//guidance from Learning Processing chapter 9 (arrays)
// an ellipse with a tail

Object myObject;

void setup() {
  size (500,500);

  myObject = new Object();

}

void draw() {
  background(0);
  noCursor();

  myObject.display();
}

//object made with a class
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
     fill(0,0,255,127); //adding the fourth number adds the alpha value, set it to 127 so its almost 50% transparent.
     noStroke();
     ellipse(x[i],y[i],i,i);
   }
  }
}
