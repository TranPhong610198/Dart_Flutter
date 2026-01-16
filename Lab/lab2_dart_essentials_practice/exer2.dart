void main(){
  // Khởi tạo 1 List fill full giá trị giống nhau.
  List? allList = List.filled(5, 11, growable: true);
  print(allList);
  // Khởi tạo 1 list được gán sẵn giá trị.
  List? intList = [ 12, 'TheMoriarty', 12.6];
  print(intList.toString());
  // __________________________________________________
  print('------------------------------------------------');
  

  // Set cũng có 2 cách để khởi tạo 1 set
  var set1 = <String> {'Tran', 'Hoai', 'Phong'};
  print('first set: $set1');

  // Ví set chỉ lưu các giá trị unique nên kết quả sẽ là Tran, Phong
  Set<String> set2 = {'Tran', 'Phong', 'Tran'};
  print('second set: $set2');
  // Để thêm phần tử vào Set có thể dùng add, addAll
  set1.add('K18');
  print('first set add: $set1');
  var addSet = {'K18', 'FPTU'};
  set2.addAll(addSet);
  print('second set add: $set2');
  //____________________________________________________
  print('------------------------------------------------');


  // Map cũng có 2 cách để khởi tạo 
  var map1 = {'key1' : 'value1',
              'key2' : 'value2',
              'key3' : 'value3'};
  print('map1: $map1');

  var map2 = new Map(); // dùng constructor để khởi tạo
  map2['key1'] = 'value1';
  map2['key2'] = 'value2';
  print('map2: $map2');

  //add, remove, and map access
  map2['key0'] = 'value0'; //add
  print('map2 after add:\n$map2');
  
  map2['key1'] = 'value1Changed'; // indexing
  print('map2 after change at key1:\n$map2');

  map2.remove('key1'); // remove
  print('map2 after remove at key1:\n$map2');
  //____________________________________________________
  print('------------------------------------------------');


}