import 'dart:io';

void main() {
  // User Input Type Conversion
  print("Enter A Number: ");

  var nummy = stdin.readLineSync();
  var nummy2 = int.parse(nummy ?? '0') + 10; // convert to Int 
  print("\"$nummy\" + \"10\" nummy.toString() + 10.toString()"); //convert to String
  print("$nummy + 10 = $nummy2");
}