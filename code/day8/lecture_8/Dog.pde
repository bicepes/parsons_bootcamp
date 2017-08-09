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
  color fur;

  PVector position;

  Dog(color c) {
    legs = 4;
    ears = 2;
    fur = c;
  }

  Dog(String say) {
    legs = 4;
    ears = 2;
    saying = say;
  }

  void bark() {
    println(saying);
  }

  void walk() {
    //
  }
}
