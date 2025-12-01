void main(){
  var num = 5;
  //Normal For Loop
  for (var i=num; i>=1; i--){
    print(i);
  }
  
  print("_________________________");
  // For_in loop <=> foreach in Java ? 
  var names = ["Tran","Hoai","Phong"];
  for (var name in names){
    print(name);
  }

  print("__________________________");
  while(num >= 1){
    print(num);
    num--;
  }
}