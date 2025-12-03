void main (){
  Person p1 = Person();
  p1.showInfo();
  // print(p1.name);
  p1.addData("TheMoriarty", "Male", 200);
  print("_____________");
  p1.showInfo();

}

class Person {
  String? name, sex;
  int? age;

  // Constructors - In dart do not have overloading like Java
  // Person(String name, sex, int age){
  //   this.name = name;
  //   this.sex = sex; 
  //   this.age = age;
  // }

  void addData(String name, sex, int age){
    this.name = name;
    this.sex = sex;
    this.age = age; 
  }

  // Method
  void showInfo(){
    print("Name = $name");
    print("Sex = $sex");
    print("Age = $age");
  }
}