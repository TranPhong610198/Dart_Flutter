
import 'dart:io';

void main() {
  int score = 8;
  // if/esle block
  if (score < 5)
    print('This is a bad score');
  else if (score >= 5 && score < 8)
    print('This is a normal score');
  else
    print('this is a good score');

  // switch/case 
  print("Input day of week: ");
  String? day = stdin.readLineSync();
  switch (day?.toLowerCase()) {
    case 'monday':
      print("Mao phắc lại thứ 2 rồi, DCMMMMM~~~");
      break;
    case 'tuesday':
      print("Mao phắc lại thứ 3 rồi, DCMMMMM~~~");
      break;
    case 'wednesday':
      print("Mao phắc lại thứ 4 rồi, DCMMMMM~~~");
      break;
    case 'thurday':
      print("Mao phắc lại thứ 5 rồi, DCMMMMM~~~");
      break;
    case 'friday':
      print("Mao phắc lại thứ 6 rồi, DCMMMMM~~~");
      break;
    case 'saturday':
      print("Mao phắc lại thứ 7 rồi, DCMMMMM~~~");
      break;
    case 'sunday':
      print("Mao phắc lại Chủ Nhật rồi, DCMMMMM~~~");
      break;
    default:
      print("Dell mịa có cái thứ cũng nhập sai, làm đc việc ko ??!!!");
  }


}
