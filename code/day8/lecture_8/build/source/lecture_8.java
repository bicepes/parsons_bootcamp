import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class lecture_8 extends PApplet {

Dog ham;
Dog sparky;

public void setup() {
  //color c = color(255, 0, 0);
  ham = new Dog("Bark!");
  sparky = new Dog("Hi");

  println(ham.legs);
  println(ham.ears);
  println(ham.fur);

  ham.bark();
  sparky.bark();

}

public void draw() {

}
// Create a class called Dog
class Dog {
  // properties
  int legs;
  int ears;
  int eyes;
  int nose;
  String saying;
  // processing color doc
  //https://processing.org/reference/color_datatype.html
  int fur;

  PVector position;

  Dog(int c) {
    legs = 4;
    ears = 2;
    fur = c;
  }

  Dog(String say) {
    legs = 4;
    ears = 2;
    saying = say;
  }

  public void bark() {
    println(saying);
  }

  public void walk() {
    //
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_8" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
