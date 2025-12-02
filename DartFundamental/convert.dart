void main(){
  // Convert Strings, Ints and Doubles
  
  var a, b, c, d, e, i;
  a = 10;
  b = "1";
  c = 0.1;
  d = a + int.parse(b); // String to Int
  print("$a + $c = $d");
  e = a + double.parse(b); // String to Doubles
  print("$a + $c = $e");
  i = a.toString() + b; // Int to string
  print("$a + $b = $i");
}