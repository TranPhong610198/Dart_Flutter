void main(){
  // Function hasn't retrun value
  newFunc(){
    print("I'm a Function");
  }
  newFunc();

  print("___________________");
  // Function has return value
  testFunc(String name1, name2){
    return "Hello $name1 and $name2";
  }
  var thing = testFunc("Phong", "TheMoriaty");
  print(thing);

  // Function with optional parametter
  print("________________");
  testFunc2(String name1, [name2]){
    return "Hello $name1 and $name2";
  }
  print(testFunc2("Phong")); //name2 is optional, so input nam2 is not required
  print(testFunc2("Phong", "TheMoriarty")); //But can input name2 if u want

  // Another type of Function with Optional Parameter
  print("_____________________");
  testFunc3(String name1, {name2}){
    return "Helllo $name1 and $name2";  
  }
  print(testFunc3("Phong")); //like a func2, name2 is not required  
  print(testFunc3("Phong", name2: "TheMoriarty")); //have a little different when u want input name2
  testFunc4(String name1, {name2= "defaultValue"}){ // if declare a default value for name2
    return "Hello $name1 and $name2";
  }
  print(testFunc4("Phong")); //when not input. name2 take defaultValue
  print(testFunc4("Phong", name2: "TheMoriarty"));// when have input, name2 take input value
}