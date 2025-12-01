void main(){

  // Strings
  String firstName = "Phong";
  print("String: $firstName");

  // Integers
  int intNum = 11;
  print("Integer: $intNum");

  // Doubles
  double dbNum = 11.3412;
  print("Doubles: $dbNum");

  // Booleans
  bool dtBool = false;
  print("Booleans: $dtBool");

  // Dynamic
  dynamic varDy = "TranPhong";
  print("Dynamic varDy: $varDy");
  varDy = 11;
  print("Dynamic varDy: $varDy");
  
  // Lists
  print("______________________________________");
  print("Learn List");
  var testList = [1,"string",3];
  print("All list: $testList");
  print("List's Element: ${testList[0]}");
  bool testType = (testList[1] is int)? true : false;
  print("sencond element is int: $testType");

  var emptyList = []; //create empty list
  // List<int> emptyList= [];
  print("Created emptyList: $emptyList");
  emptyList.add(4); //add one element into list 
  print("Add 4: $emptyList");
  emptyList.addAll([1,2,3,4]); // add many elements
  print("Add 1,2,3,4: $emptyList");
  emptyList.insert(4, 5); //add elements to specific location
  print("Insert 5 into index 4: $emptyList");
  emptyList.insertAll(0, [0,1,2]); // add many elements ...
  print("Insert 0,1,2 into index 0: $emptyList");
  emptyList.remove(4); //remove first element have value=... from list
  print("Remove first 4: $emptyList");
  emptyList.removeAt(0); //remove elements at ? index
  print("Remove at index 0: $emptyList");
  emptyList.add("String"); // add different dataype element.
  print(emptyList);

  // Maps
  print("______________________________________");
  print("Learn Maps");
  var toppings = {"John":"Pepperoni", "Mary":"Cheese"}; // in this time the Maps like <String, String>

  print(toppings);
  print(toppings["John"]);

  print("show all value: ${toppings.values}"); //show list values
  print("show all keys: ${toppings.keys}"); // show list keys
  print("show length of map: ${toppings.length}"); // show length

  toppings["Tim"] = "Sausage"; //add something
  print(toppings);
  toppings["Tim"] = "Noodles"; //add with already keys
  print(toppings);
  toppings.addAll({"Tina":"Bacon", "Steve":"Supreme"}); //add anythings 
  print(toppings);

  toppings.remove("John"); //remove by keys
  print(toppings);
  toppings.clear(); //remove all
  print(toppings);
  
}