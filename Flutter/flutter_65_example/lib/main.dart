//65.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.teal,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   void _yesOnTap() {
//     debugPrint('yes');
//   }
//
//   void _noOnTap() {
//     debugPrint('no');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             "Do you want to\nbuy this item?",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 40,
//               fontWeight: FontWeight.w200,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(flex: 2),
//               SelectButton(text: "YES", onTap: _yesOnTap),
//               const Spacer(),
//               SelectButton(text: "NO", onTap: _noOnTap),
//               const Spacer(flex: 2),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class SelectButton extends StatefulWidget {
//   final String text;
//   final VoidCallback onTap;
//
//   const SelectButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//   });
//
//   @override
//   State<SelectButton> createState() => _SelectButtonState();
// }
//
// class _SelectButtonState extends State<SelectButton>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//   late Animation<Color?> _circleTween;
//   late Animation<Color?> _textTween;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           waitThenReset();
//         }
//       });
//
//     _circleTween = ColorTween(
//       begin: Colors.teal,
//       end: Colors.white,
//     ).animate(_controller);
//
//     _textTween = ColorTween(
//       begin: Colors.white,
//       end: Colors.teal,
//     ).animate(_controller);
//   }
//
//   Future<void> waitThenReset() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     _controller.reverse(from: 0.9);
//     widget.onTap();
//   }
//
//   void _onTap() {
//     _controller.forward(from: 0.0);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     double leftPos = widget.text.length == 3 ? 22 : 27;
//
//     return GestureDetector(
//       onTap: _onTap,
//       child: Material(
//         type: MaterialType.transparency,
//         child: Ink(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white, width: 1),
//             color: _circleTween.value ?? Colors.teal,
//             shape: BoxShape.circle,
//           ),
//           width: 100,
//           height: 100,
//           child: Padding(
//             padding: EdgeInsets.only(left: leftPos, top: 32),
//             child: Text(
//               widget.text,
//               style: TextStyle(
//                 color: _textTween.value ?? Colors.white,
//                 fontSize: 28,
//                 fontWeight: _controller.status == AnimationStatus.completed
//                     ? FontWeight.w500
//                     : FontWeight.w200,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//64.

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Earth',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: const MyHomePage(title: 'Earth'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.dismissed) {
//           _controller.forward();
//         } else if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         }
//       });
//
//     _controller.forward(from: 0.0);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Transform.scale(
//           scale: 1.6,
//           child: Transform.rotate(
//             angle: math.pi * _controller.value,
//             child: Image.network(
//               "https://ak7.picdn.net/shutterstock/videos/3010597/thumb/1.jpg",
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//63

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Styled Text Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class TextBlock {
//   final Color color;
//   final String text;
//
//   TextBlock(this.color, this.text);
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _index = 0;
//
//   final List<TextBlock> textBlocks = [
//     TextBlock(Colors.red, 'every'),
//     TextBlock(Colors.redAccent, ' schoolboy'),
//     TextBlock(Colors.green, '\nknows'),
//     TextBlock(Colors.greenAccent, ' who'),
//     TextBlock(Colors.blue, '\nimprisoned'),
//     TextBlock(Colors.blueAccent, '\nMontezuma')
//   ];
//
//   void _incrementCounter() {
//     setState(() {
//       if (_index < textBlocks.length) {
//         _index++;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<TextSpan> textSpans = [];
//
//     for (var i = 0; i < _index; i++) {
//       final textBlock = textBlocks[i];
//
//       textSpans.add(
//         TextSpan(
//           text: textBlock.text,
//           style: TextStyle(
//             color: textBlock.color,
//             fontSize: 32,
//           ),
//         ),
//       );
//     }
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text.rich(TextSpan(children: textSpans)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.note_add),
//       ),
//     );
//   }
// }

//62.

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class Tab1 extends StatelessWidget {
//   const Tab1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       "https://cdn2.thecatapi.com/images/MTY1NDA3OA.jpg",
//       fit: BoxFit.cover,
//     );
//   }
// }
//
// class Tab2 extends StatelessWidget {
//   const Tab2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       "https://cdn2.thecatapi.com/images/68j.jpg",
//       fit: BoxFit.cover,
//     );
//   }
// }
//
// class Tab3 extends StatelessWidget {
//   const Tab3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       "https://cdn2.thecatapi.com/images/ece.jpg",
//       fit: BoxFit.cover,
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Cat Tabs"),
//         ),
//
//         body: const TabBarView(
//           children: [
//             Tab1(),
//             Tab2(),
//             Tab3(),
//           ],
//         ),
//
//         bottomNavigationBar: Container(
//           color: Colors.white,
//           child: const TabBar(
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(text: 'Cat #1', icon: Icon(Icons.keyboard_arrow_left)),
//               Tab(text: 'Cat #2', icon: Icon(Icons.keyboard_arrow_up)),
//               Tab(text: 'Cat #3', icon: Icon(Icons.keyboard_arrow_right)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//61.

// import 'package:flutter/material.dart';
//
// void main() => runApp(const TableApp());
//
// class TableApp extends StatelessWidget {
//   const TableApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Table Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const TableRow tableRow = TableRow(
//       children: [
//         Text(
//           "aaaaaaaaaaaaaaaaaaaaa",
//           overflow: TextOverflow.fade,
//         ),
//         Text(
//           "bbbbbbbbbbbbbbbbbbbbb",
//           overflow: TextOverflow.fade,
//         ),
//         Text(
//           "ccccccccccccccccccccc",
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Table"),
//       ),
//       body: Table(
//         columnWidths: const {
//           0: FlexColumnWidth(0.1),
//           1: FlexColumnWidth(0.3),
//           2: FlexColumnWidth(0.6),
//         },
//         border: TableBorder.all(),
//         children: const [
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//           tableRow,
//         ],
//       ),
//     );
//   }
// }

//60.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     ModelBinding<ThemeModel>(
//       initialModel: ThemeModel(true),
//       child: const MyApp(),
//     ),
//   );
// }
//
// class ThemeModel {
//   ThemeModel(this._dark);
//
//   bool _dark = true;
//
//   bool get dark => _dark;
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     } else if (other.runtimeType != runtimeType) {
//       return false;
//     } else {
//       final ThemeModel otherModel = other as ThemeModel;
//       return dark == otherModel.dark;
//     }
//   }
//
//   @override
//   int get hashCode => dark.hashCode;
// }
//
// class _ModelBindingScope<T> extends InheritedWidget {
//   const _ModelBindingScope({
//     super.key,
//     required this.modelBindingState,
//     required super.child,
//   });
//
//   final _ModelBindingState<T> modelBindingState;
//
//   @override
//   bool updateShouldNotify(_ModelBindingScope<T> oldWidget) => true;
// }
//
// class ModelBinding<T> extends StatefulWidget {
//   const ModelBinding({
//     super.key,
//     required this.initialModel,
//     required this.child,
//   });
//
//   final T initialModel;
//   final Widget child;
//
//   @override
//   _ModelBindingState<T> createState() => _ModelBindingState<T>();
//
//   static T of<T>(BuildContext context) {
//     final scope =
//     context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
//     return scope!.modelBindingState.currentModel;
//   }
//
//   static void update<T>(BuildContext context, T newModel) {
//     final scope =
//     context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
//     scope!.modelBindingState.updateModel(newModel);
//   }
// }
//
// class _ModelBindingState<T> extends State<ModelBinding<T>> {
//   late T currentModel;
//
//   @override
//   void initState() {
//     super.initState();
//     currentModel = widget.initialModel;
//   }
//
//   void updateModel(T newModel) {
//     if (newModel != currentModel) {
//       setState(() {
//         currentModel = newModel;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _ModelBindingScope<T>(
//       modelBindingState: this,
//       child: widget.child,
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeModel model = ModelBinding.of(context);
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: model.dark ? Brightness.dark : Brightness.light,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeModel model = ModelBinding.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.rotate_right),
//             tooltip: 'Brightness',
//             onPressed: () {
//               ModelBinding.update(context, ThemeModel(!model.dark));
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

//59.

// import 'dart:ui';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp( AppWidget());
// }
//
// class AppWidget extends StatefulWidget {
//   AppWidget({super.key}) {
//     debugPrint("AppWidget - constructor");
//   }
//
//   @override
//   State<AppWidget> createState() {
//     debugPrint("AppWidget - createState");
//     return _AppWidgetState();
//   }
// }
//
// class _AppWidgetState extends State<AppWidget> {
//   bool _bright = false;
//
//   void _brightnessCallback() {
//     setState(() {
//       _bright = !_bright;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("_AppWidgetState - build");
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: _bright ? Brightness.light : Brightness.dark,
//       ),
//       home: FlowerWidget(
//         imageSrc: _bright
//             ? "https://www.viewbug.com/media/mediafiles/2015/07/05/56234977_large1300.jpg"
//             : "https://images.unsplash.com/photo-1531603071569-0dd65ad72d53?ixlib=rb-1.2.1&w=1000&q=80",
//         brightnessCallback: _brightnessCallback,
//       ),
//     );
//   }
// }
//
// class FlowerWidget extends StatefulWidget {
//   final String imageSrc;
//   final VoidCallback brightnessCallback;
//
//   FlowerWidget({
//     super.key,
//     required this.imageSrc,
//     required this.brightnessCallback,
//   }) {
//     debugPrint("FlowerWidget - constructor");
//   }
//
//   @override
//   State<FlowerWidget> createState() {
//     debugPrint("FlowerWidget - createState");
//     return _FlowerWidgetState();
//   }
// }
//
// class _FlowerWidgetState extends State<FlowerWidget> {
//   double _blur = 0;
//
//   _FlowerWidgetState() {
//     debugPrint("_FlowerWidgetState - constructor");
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("_FlowerWidgetState - initState");
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     debugPrint("_FlowerWidgetState - didChangeDependencies");
//   }
//
//   @override
//   void didUpdateWidget(covariant FlowerWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     debugPrint("_FlowerWidgetState - didUpdateWidget");
//
//     // reset blur when image changes
//     if (oldWidget.imageSrc != widget.imageSrc) {
//       _blur = 0;
//     }
//   }
//
//   void _blurMore() {
//     setState(() {
//       _blur += 5.0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("_FlowerWidgetState - build");
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flower"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: widget.brightnessCallback,
//           )
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.background,
//           image: DecorationImage(
//             image: NetworkImage(widget.imageSrc),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.0),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _blurMore,
//         tooltip: 'Blur More',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

//58.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class Car {
//   String make;
//   String model;
//   String imageSrc;
//
//   Car(this.make, this.model, this.imageSrc);
//
//   @override
//   bool operator ==(Object other) {
//     return other is Car && make == other.make && model == other.model;
//   }
//
//   @override
//   int get hashCode => make.hashCode ^ model.hashCode ^ imageSrc.hashCode;
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String _title = 'Cars';
//
//   late List<Car> _cars;
//
//   Car? _selectedCar;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _cars = [
//       Car(
//         'Bmw',
//         'M3',
//         'https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg',
//       ),
//       Car(
//         'Nissan',
//         'GTR',
//         'https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg',
//       ),
//       Car(
//         'Nissan',
//         'Sentra',
//         'https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg',
//       )
//     ];
//   }
//
//   void _selectionHandler(Car selectedCar) {
//     setState(() {
//       _title = 'Selected ${selectedCar.make} ${selectedCar.model}';
//       _selectedCar = selectedCar;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<CarWidget> carWidgets = _cars.map((Car car) {
//       return CarWidget(
//         car: car,
//         isSelected: car == _selectedCar,
//         parentSelectionHandler: _selectionHandler,
//       );
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_title),
//       ),
//       body: ListView(children: carWidgets),
//     );
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   final Car car;
//   final bool isSelected;
//   final ValueChanged<Car> parentSelectionHandler;
//
//   const CarWidget({
//     super.key,
//     required this.car,
//     required this.isSelected,
//     required this.parentSelectionHandler,
//   });
//
//   void _handleTap() {
//     parentSelectionHandler(car);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: GestureDetector(
//         onTap: _handleTap,
//         child: Container(
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.blue : Colors.white,
//             border: Border.all(),
//           ),
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   '${car.make} ${car.model}',
//                   style: const TextStyle(fontSize: 24),
//                 ),
//                 const SizedBox(height: 20),
//                 Image.network(car.imageSrc),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//57.

// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';
//
// void main() {
//   runApp(const CarAppWidget());
// }
//
// class Car {
//   String make;
//   String model;
//   String imageSrc;
//
//   Car(this.make, this.model, this.imageSrc);
//
//   @override
//   bool operator ==(Object other) {
//     return other is Car && make == other.make && model == other.model;
//   }
//
//   @override
//   int get hashCode => make.hashCode ^ model.hashCode ^ imageSrc.hashCode;
// }
//
// class CarListModel extends Model {
//   final List<Car> _carList = [
//     Car(
//       "Bmw",
//       "M3",
//       "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg",
//     ),
//     Car(
//       "Nissan",
//       "GTR",
//       "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg",
//     ),
//     Car(
//       "Nissan",
//       "Sentra",
//       "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
//     )
//   ];
//
//   List<Car> get carList => _carList;
//
//   void add(String make, String model, String imageSrc) {
//     _carList.add(Car(make, model, imageSrc));
//     notifyListeners();
//   }
// }
//
// class CarSelectionModel extends Model {
//   Car? _selectedCar;
//
//   Car? get selectedCar => _selectedCar;
//
//   set selectedCar(Car? selectedCar) {
//     _selectedCar = selectedCar;
//     notifyListeners();
//   }
//
//   bool isSelected(Car car) {
//     if (_selectedCar == null) return false;
//     return car == _selectedCar;
//   }
// }
//
// class CarAppWidget extends StatelessWidget {
//   const CarAppWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Car App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: ScopedModel<CarListModel>(
//         model: CarListModel(),
//         child: ScopedModel<CarSelectionModel>(
//           model: CarSelectionModel(),
//           child: const CarAppLayoutWidget(title: 'Cars'),
//         ),
//       ),
//     );
//   }
// }
//
// class CarAppLayoutWidget extends StatelessWidget {
//   final String title;
//
//   const CarAppLayoutWidget({super.key, required this.title});
//
//   void _addCar(BuildContext context) {
//     ScopedModel.of<CarListModel>(context).add(
//       "Subaru",
//       "WRX",
//       "https://media.ed.edmunds-media.com/subaru/wrx/2018/oem/2018_subaru_wrx_sedan_sti-limited_s_oem_1_150.jpg",
//     );
//   }
//
//   String _calculateSelectedCarName(BuildContext context) {
//     Car? selectedCar =
//         ScopedModel.of<CarSelectionModel>(context).selectedCar;
//
//     if (selectedCar == null) {
//       return "No car selected.";
//     } else {
//       return "Selected: ${selectedCar.make} ${selectedCar.model}";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: const Center(
//         child: CarListWidget(),
//       ),
//       persistentFooterButtons: [
//         Text(_calculateSelectedCarName(context)),
//         IconButton(
//           icon: const Icon(Icons.add),
//           onPressed: () => _addCar(context),
//         ),
//       ],
//     );
//   }
// }
//
// class CarListWidget extends StatelessWidget {
//   const CarListWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final carList = ScopedModel.of<CarListModel>(context).carList;
//
//     List<CarWidget> carWidgets =
//     carList.map((car) => CarWidget(car)).toList();
//
//     return ListView(children: carWidgets);
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   final Car car;
//
//   const CarWidget(this.car, {super.key});
//
//   Widget _buildCarWidget(
//       BuildContext context, Widget? child, CarSelectionModel selectionModel) {
//     return GestureDetector(
//       onTap: () => selectionModel.selectedCar = car,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(),
//             color: selectionModel.isSelected(car)
//                 ? Colors.blue
//                 : Colors.white,
//           ),
//           padding: const EdgeInsets.all(20),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   '${car.make} ${car.model}',
//                   style: const TextStyle(fontSize: 24),
//                 ),
//                 const SizedBox(height: 20),
//                 Image.network(car.imageSrc),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModelDescendant<CarSelectionModel>(
//       builder: (context, child, selectionModel) =>
//           _buildCarWidget(context, child, selectionModel),
//     );
//   }
// }

//56.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Car {
//   String make;
//   String model;
//   String imageSrc;
//
//   Car(this.make, this.model, this.imageSrc);
//
//   @override
//   bool operator ==(Object other) {
//     return other is Car && make == other.make && model == other.model;
//   }
//
//   @override
//   int get hashCode => make.hashCode ^ model.hashCode ^ imageSrc.hashCode;
// }
//
// class CarsInheritedWidget extends InheritedWidget {
//   final List<Car> _cars = [
//     Car(
//       'Bmw',
//       'M3',
//       'https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg',
//     ),
//     Car(
//       'Nissan',
//       'GTR',
//       'https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg',
//     ),
//     Car(
//       'Nissan',
//       'Sentra',
//       'https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg',
//     )
//   ];
//
//   CarsInheritedWidget({super.key, required Widget child}) : super(child: child);
//
//   List<Car> get cars => _cars;
//
//   void addNissanSentra() {
//     _cars.add(Car(
//       'Nissan',
//       'Sentra',
//       'https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg',
//     ));
//   }
//
//   @override
//   bool updateShouldNotify(covariant CarsInheritedWidget oldWidget) {
//     return true;
//   }
//
//   static CarsInheritedWidget of(BuildContext context) {
//     final CarsInheritedWidget? result =
//     context.dependOnInheritedWidgetOfExactType<CarsInheritedWidget>();
//     assert(result != null, 'No CarsInheritedWidget found in context');
//     return result!;
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: CarsInheritedWidget(
//         child: MyHomePage(title: 'Cars'),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     List<CarWidget> carWidgets =
//     CarsInheritedWidget.of(context).cars.map((car) {
//       return CarWidget(car);
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cars'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               CarsInheritedWidget.of(context).addNissanSentra();
//             },
//           )
//         ],
//       ),
//       body: ListView(children: carWidgets),
//     );
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   final Car car;
//
//   const CarWidget(this.car, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         decoration: BoxDecoration(border: Border.all()),
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 '${car.make} ${car.model}',
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               Image.network(car.imageSrc),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//55.

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
//
// class Customer {
//   String firstName;
//   String lastName;
//   bool upButton = false;
//   bool downButton = false;
//
//   Customer(this.firstName, this.lastName);
//
//   String get name => "$firstName $lastName";
//
//   @override
//   bool operator ==(Object other) =>
//       other is Customer &&
//           firstName == other.firstName &&
//           lastName == other.lastName;
//
//   @override
//   int get hashCode => firstName.hashCode ^ lastName.hashCode;
// }
//
// class Bloc {
//   List<Customer> _customerList = [];
//
//   Bloc() {
//     _upActionStreamController.stream.listen(_handleUp);
//     _downActionStreamController.stream.listen(_handleDown);
//   }
//
//   List<Customer> initCustomerList() {
//     _customerList = [
//       Customer("Fred", "Smith"),
//       Customer("Brian", "Johnson"),
//       Customer("James", "McGirt"),
//       Customer("John", "Brown"),
//     ];
//
//     updateUpDownButtons();
//     return _customerList;
//   }
//
//   void dispose() {
//     _upActionStreamController.close();
//     _downActionStreamController.close();
//     _customerListSubject.close();
//     _messageSubject.close();
//   }
//
//   void _handleUp(Customer customer) {
//     swap(customer, true);
//     updateUpDownButtons();
//
//     _customerListSubject.add(_customerList);
//     _messageSubject.add("${customer.name} moved up");
//   }
//
//   void _handleDown(Customer customer) {
//     swap(customer, false);
//     updateUpDownButtons();
//
//     _customerListSubject.add(_customerList);
//     _messageSubject.add("${customer.name} moved down");
//   }
//
//   void swap(Customer customer, bool up) {
//     int idx = _customerList.indexOf(customer);
//     _customerList.remove(customer);
//     _customerList.insert(up ? idx - 1 : idx + 1, customer);
//   }
//
//   void updateUpDownButtons() {
//     for (int i = 0; i < _customerList.length; i++) {
//       Customer customer = _customerList[i];
//       customer.upButton = i > 0;
//       customer.downButton = i < _customerList.length - 1;
//     }
//   }
//
//   final _customerListSubject = BehaviorSubject<List<Customer>>();
//   Stream<List<Customer>> get customerListStream => _customerListSubject.stream;
//
//   final _messageSubject = BehaviorSubject<String>();
//   Stream<String> get messageStream => _messageSubject.stream;
//
//   final _upActionStreamController = StreamController<Customer>();
//   Sink<Customer> get upAction => _upActionStreamController.sink;
//
//   final _downActionStreamController = StreamController<Customer>();
//   Sink<Customer> get downAction => _downActionStreamController.sink;
// }
//
// class BlocProvider extends InheritedWidget {
//   final Bloc bloc;
//
//   const BlocProvider({
//     super.key,
//     required this.bloc,
//     required Widget child,
//   }) : super(child: child);
//
//   static Bloc of(BuildContext context) {
//     final BlocProvider? provider =
//     context.dependOnInheritedWidgetOfExactType<BlocProvider>();
//     return provider!.bloc;
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
// }
//
// class CustomerWidget extends StatelessWidget {
//   final Customer customer;
//
//   const CustomerWidget(this.customer, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of(context);
//
//     List<Widget> children = [
//       Expanded(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Text(
//             customer.name,
//             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     ];
//
//     if (customer.upButton) {
//       children.add(
//         IconButton(
//           icon: const Icon(Icons.arrow_drop_up, color: Colors.blue),
//           onPressed: () => bloc.upAction.add(customer),
//         ),
//       );
//     }
//
//     if (customer.downButton) {
//       children.add(
//         IconButton(
//           icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
//           onPressed: () => bloc.downAction.add(customer),
//         ),
//       );
//     }
//
//     return Padding(
//       padding: const EdgeInsets.all(6),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Container(
//           decoration: BoxDecoration(color: Colors.cyan[100]),
//           child: Row(children: children),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const CustomerAppWidget());
// }
//
// class CustomerAppWidget extends StatelessWidget {
//   const CustomerAppWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Bloc();
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: BlocProvider(
//         bloc: bloc,
//         child: CustomerListWidget(
//           title: 'Customer List',
//           messageStream: bloc.messageStream,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomerListWidget extends StatefulWidget {
//   final String title;
//   final Stream<String> messageStream;
//
//   const CustomerListWidget({
//     super.key,
//     required this.title,
//     required this.messageStream,
//   });
//
//   @override
//   State<CustomerListWidget> createState() => _CustomerListWidgetState();
// }
//
// class _CustomerListWidgetState extends State<CustomerListWidget> {
//   @override
//   void initState() {
//     super.initState();
//
//     widget.messageStream.listen((message) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of(context);
//
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: StreamBuilder<List<Customer>>(
//         stream: bloc.customerListStream,
//         initialData: bloc.initCustomerList(),
//         builder: (context, snapshot) {
//           final customers = snapshot.data ?? [];
//
//           return ListView(
//             padding: const EdgeInsets.all(10),
//             children:
//             customers.map((customer) => CustomerWidget(customer)).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

//54.

// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Car {
//   final String make;
//   final String model;
//   final String imageSrc;
//
//   const Car(this.make, this.model, this.imageSrc);
//
//   @override
//   bool operator ==(Object other) {
//     return other is Car && make == other.make && model == other.model;
//   }
//
//   @override
//   int get hashCode => make.hashCode ^ model.hashCode ^ imageSrc.hashCode;
// }
//
// class CarModel {
//   const CarModel(this.carList);
//
//   final List<Car> carList;
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     } else if (other.runtimeType != runtimeType) {
//       return false;
//     } else {
//       final CarModel otherModel = other as CarModel;
//       return const IterableEquality().equals(otherModel.carList, carList);
//     }
//   }
//
//   @override
//   int get hashCode => carList.hashCode;
// }
//
// class _ModelBindingScope<T> extends InheritedWidget {
//   const _ModelBindingScope({
//     super.key,
//     required this.modelBindingState,
//     required super.child,
//   });
//
//   final _ModelBindingState<T> modelBindingState;
//
//   @override
//   bool updateShouldNotify(_ModelBindingScope<T> oldWidget) => true;
// }
//
// class ModelBinding<T> extends StatefulWidget {
//   const ModelBinding({
//     super.key,
//     required this.initialModel,
//     required this.child,
//   });
//
//   final T initialModel;
//   final Widget child;
//
//   @override
//   _ModelBindingState<T> createState() => _ModelBindingState<T>();
//
//   static T of<T>(BuildContext context) {
//     final scope =
//     context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
//     return scope!.modelBindingState.currentModel;
//   }
//
//   static void update<T>(BuildContext context, T newModel) {
//     final scope =
//     context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
//     scope!.modelBindingState.updateModel(newModel);
//   }
// }
//
// class _ModelBindingState<T> extends State<ModelBinding<T>> {
//   late T currentModel;
//
//   @override
//   void initState() {
//     super.initState();
//     currentModel = widget.initialModel;
//   }
//
//   void updateModel(T newModel) {
//     if (newModel != currentModel) {
//       setState(() {
//         currentModel = newModel;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _ModelBindingScope<T>(
//       modelBindingState: this,
//       child: widget.child,
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const ModelBinding<CarModel>(
//         initialModel: CarModel([
//           Car(
//             "Bmw",
//             "M3",
//             "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg",
//           ),
//           Car(
//             "Nissan",
//             "GTR",
//             "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg",
//           ),
//           Car(
//             "Nissan",
//             "Sentra",
//             "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
//           ),
//         ]),
//         child: MyHomePage(title: 'Cars'),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     CarModel model = ModelBinding.of<CarModel>(context);
//
//     List<CarWidget> carWidgets =
//     model.carList.map((car) => CarWidget(car)).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cars"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               List<Car> carList = List.from(model.carList);
//               carList.add(const Car(
//                 "Nissan",
//                 "Sentra",
//                 "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
//               ));
//
//               ModelBinding.update(context, CarModel(carList));
//             },
//           )
//         ],
//       ),
//       body: ListView(children: carWidgets),
//     );
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   final Car car;
//
//   const CarWidget(this.car, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Container(
//         decoration: BoxDecoration(border: Border.all()),
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 '${car.make} ${car.model}',
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               Image.network(car.imageSrc),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//53.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const StackPleaseWaitAppWidget());
// }
//
// class StackPleaseWaitAppWidget extends StatelessWidget {
//   const StackPleaseWaitAppWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomeWidget(title: 'Card Layout Demo'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   final String title;
//
//   const HomeWidget({super.key, required this.title});
//
//   final PleaseWaitWidget pleaseWaitWidget =
//   const PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));
//
//   final AppWidget appWidget = const AppWidget(key: ObjectKey("appWidget"));
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   bool _pleaseWait = false;
//
//   void _togglePleaseWait() {
//     setState(() {
//       _pleaseWait = !_pleaseWait;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> childWidgets = _pleaseWait
//         ? [widget.pleaseWaitWidget, widget.appWidget]
//         : [widget.appWidget];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Stack(
//           key: const ObjectKey("stack"),
//           children: childWidgets,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _togglePleaseWait,
//         label: const Text('Please Wait On/Off'),
//         icon: const Icon(Icons.cached),
//       ),
//     );
//   }
// }
//
// class PleaseWaitWidget extends StatelessWidget {
//   const PleaseWaitWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey.withOpacity(0.3),
//       child: const Center(
//         child: CircularProgressIndicator(strokeWidth: 8.0),
//       ),
//     );
//   }
// }
//
// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: const [
//           Text('Your', style: TextStyle(fontSize: 20)),
//           Text('App', style: TextStyle(fontSize: 20)),
//           Text('Goes', style: TextStyle(fontSize: 20)),
//           Text('Here', style: TextStyle(fontSize: 20)),
//         ],
//       ),
//     );
//   }
// }

//52.

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqflite/sqflite.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// enum Language { english, spanish }
//
// class Word {
//   final int? id;
//   final String english;
//   final String spanish;
//
//   Word(this.id, this.english, this.spanish);
//
//   Map<String, dynamic> toMap() {
//     return {'id': id, 'english': english, 'spanish': spanish};
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       other is Word && other.id == id;
//
//   @override
//   int get hashCode => id.hashCode;
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DbWidget(
//       child: MaterialApp(
//         title: "Vocabulary",
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: const HomeWidget(),
//       ),
//     );
//   }
// }
//
// class DbWidget extends InheritedWidget {
//   DbWidget({super.key, required Widget child}) : super(child: child);
//
//   final Random _random = Random();
//   Database? _database;
//   String? _databasesPath;
//
//   static DbWidget of(BuildContext context) {
//     final DbWidget? result =
//     context.dependOnInheritedWidgetOfExactType<DbWidget>();
//     assert(result != null, 'No DbWidget found in context');
//     return result!;
//   }
//
//   Future<void> loadDatabasesPath() async {
//     _databasesPath = await getDatabasesPath();
//   }
//
//   Future<void> openAndInitDatabase() async {
//     _database = await openDatabase(
//       p.join(_databasesPath!, 'vocabulary.db'),
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//             "CREATE TABLE word(id INTEGER PRIMARY KEY AUTOINCREMENT, english TEXT, spanish TEXT)");
//
//         await db.insert("word", {"english": "uncle", "spanish": "tio"});
//         await db.insert("word", {"english": "reader", "spanish": "lector"});
//         await db.insert(
//             "word", {"english": "to keep vigil over", "spanish": "velar"});
//         await db.insert("word", {"english": "to remove", "spanish": "quitar"});
//         await db.insert(
//             "word", {"english": "to continue", "spanish": "reanudar"});
//         await db.insert("word", {"english": "until", "spanish": "hasta"});
//       },
//     );
//   }
//
//   Future<Word> loadNextWord(Word? priorWord) async {
//     final words = await _database!.query('word');
//
//     final list = words
//         .map((e) => Word(e['id'] as int, e['english'] as String,
//         e['spanish'] as String))
//         .toList();
//
//     Word nextWord;
//
//     do {
//       nextWord = list[_random.nextInt(list.length)];
//     } while (nextWord == priorWord);
//
//     return nextWord;
//   }
//
//   Future<int> addWord(Word word) async {
//     return _database!.insert(
//       'word',
//       word.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<void> deleteWord(Word word) async {
//     await _database!.delete(
//       'word',
//       where: "id = ?",
//       whereArgs: [word.id],
//     );
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   bool _loadedDatabasePath = false;
//   bool _openedDatabase = false;
//
//   Language _language = Language.spanish;
//
//   Word? _priorWord;
//   Word? _word;
//
//   void _showSnackBar(String content) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(content)),
//     );
//   }
//
//   Future<void> _initDb() async {
//     final db = DbWidget.of(context);
//
//     if (!_loadedDatabasePath) {
//       await db.loadDatabasesPath();
//       setState(() => _loadedDatabasePath = true);
//       return;
//     }
//
//     if (!_openedDatabase) {
//       await db.openAndInitDatabase();
//       setState(() => _openedDatabase = true);
//       return;
//     }
//
//     if (_word == null) {
//       _word = await db.loadNextWord(_priorWord);
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _initDb();
//
//     final englishWidget =
//     WordWidget(Language.english, _language, _word);
//     final spanishWidget =
//     WordWidget(Language.spanish, _language, _word);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Vocabulary"),
//         actions: [
//           IconButton(
//               icon: const Icon(Icons.shuffle),
//               onPressed: () {
//                 setState(() {
//                   _language = _language == Language.spanish
//                       ? Language.english
//                       : Language.spanish;
//                 });
//               }),
//           IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () async {
//                 final word = await showDialog<Word>(
//                   context: context,
//                   builder: (_) => const AddDialogWidget(),
//                 );
//
//                 if (word != null) {
//                   await DbWidget.of(context).addWord(word);
//                   _showSnackBar("Word added");
//                   _loadNextWord();
//                 }
//               }),
//           IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () async {
//                 if (_word != null) {
//                   await DbWidget.of(context).deleteWord(_word!);
//                   _showSnackBar("Word deleted");
//                   _loadNextWord();
//                 }
//               }),
//         ],
//       ),
//       body: Column(
//         children: _language == Language.spanish
//             ? [englishWidget, spanishWidget]
//             : [spanishWidget, englishWidget],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadNextWord,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
//
//   void _loadNextWord() {
//     setState(() {
//       _priorWord = _word;
//       _word = null;
//     });
//   }
// }
//
// class WordWidget extends StatefulWidget {
//   final Language widgetLanguage;
//   final Language language;
//   final Word? word;
//
//   const WordWidget(this.widgetLanguage, this.language, this.word, {super.key});
//
//   @override
//   State<WordWidget> createState() => _WordWidgetState();
// }
//
// class _WordWidgetState extends State<WordWidget> {
//   bool revealed = false;
//
//   @override
//   void didUpdateWidget(covariant WordWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     revealed = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isReveal = widget.widgetLanguage == widget.language;
//
//     final title = isReveal
//         ? "What's the word?"
//         : "Word is:";
//
//     final word = widget.word == null
//         ? ""
//         : widget.widgetLanguage == Language.english
//         ? widget.word!.english
//         : widget.word!.spanish;
//
//     return Expanded(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(title, style: const TextStyle(fontSize: 24)),
//             const SizedBox(height: 20),
//             if (isReveal && !revealed)
//               FloatingActionButton(
//                 onPressed: () => setState(() => revealed = true),
//                 child: const Icon(Icons.remove_red_eye),
//               )
//             else
//               Text(
//                 word,
//                 style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AddDialogWidget extends StatefulWidget {
//   const AddDialogWidget({super.key});
//
//   @override
//   State<AddDialogWidget> createState() => _AddDialogWidgetState();
// }
//
// class _AddDialogWidgetState extends State<AddDialogWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final englishController = TextEditingController();
//   final spanishController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Add Word"),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: englishController,
//               decoration: const InputDecoration(labelText: "English"),
//               validator: (v) =>
//               v == null || v.isEmpty ? "Enter English word" : null,
//             ),
//             TextFormField(
//               controller: spanishController,
//               decoration: const InputDecoration(labelText: "Spanish"),
//               validator: (v) =>
//               v == null || v.isEmpty ? "Enter Spanish word" : null,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           child: const Text("Add"),
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               Navigator.pop(
//                 context,
//                 Word(null, englishController.text, spanishController.text),
//               );
//             }
//           },
//         )
//       ],
//     );
//   }
// }

//51.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePageWidget(),
//     );
//   }
// }
//
// class HomePageWidget extends StatelessWidget {
//   const HomePageWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           const Spacer(),
//           const Center(
//             child: Text(
//               "Spacer",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           const Spacer(flex: 5),
//           IconButton(
//             icon: const Icon(Icons.settings_overscan),
//             onPressed: () {},
//           ),
//           const Spacer(),
//           IconButton(
//             icon: const Icon(Icons.settings_overscan),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Dummy'),
//           ],
//         ),
//       ),
//     );
//   }
// }

//50.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePageWidget(),
//     );
//   }
// }
//
// class HomePageWidget extends StatelessWidget {
//   const HomePageWidget({super.key});
//
//   void _showSnackBar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('An unexpected error occurred: Error!'),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Snackbar"),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Content goes here.'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         icon: const Icon(Icons.error),
//         label: const Text("Throw Error"),
//         onPressed: () => _showSnackBar(context),
//         tooltip: 'Throw Error',
//       ),
//     );
//   }
// }

//49.

// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class CirclePainter extends CustomPainter {
//   final Random _random = Random();
//   final List<Color> _colors = [];
//
//   CirclePainter() {
//     for (int i = 0; i < 100; i++) {
//       _colors.add(
//         Colors.green
//             .withRed(_next(0, 255))
//             .withGreen(_next(0, 255))
//             .withBlue(_next(0, 255)),
//       );
//     }
//   }
//
//   int _next(int min, int max) => min + _random.nextInt(max - min);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     for (int i = 0; i < 100; i++) {
//       final radius = (i * 10).toDouble();
//
//       canvas.drawCircle(
//         const Offset(1000.0, 1000.0),
//         radius,
//         Paint()
//           ..color = _colors[i]
//           ..strokeCap = StrokeCap.round
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 15,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final circlePainter = CirclePainter();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Scroll"),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: CustomPaint(
//           size: const Size(2000, 2000),
//           foregroundPainter: circlePainter,
//         ),
//       ),
//     );
//   }
// }

//48.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple Dialog',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(title: 'Simple Dialog'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   BoxFit _boxFit = BoxFit.cover;
//
//   Future<void> _showBoxFitDialog() async {
//     final BoxFit? boxFit = await showDialog<BoxFit>(
//       context: context,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           title: const Text('Select Box Fit'),
//           children: [
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.cover),
//               child: const Text('Cover'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.contain),
//               child: const Text('Contain'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.fill),
//               child: const Text('Fill'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.fitHeight),
//               child: const Text('Fit Height'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.fitWidth),
//               child: const Text('Fit Width'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.scaleDown),
//               child: const Text('Scale Down'),
//             ),
//             SimpleDialogOption(
//               onPressed: () => Navigator.pop(context, BoxFit.none),
//               child: const Text('None'),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (boxFit != null) {
//       setState(() {
//         _boxFit = boxFit;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> kittenTiles = [];
//
//     for (int i = 200; i < 1000; i += 100) {
//       String imageUrl = "https://placekitten.com/200/$i";
//       kittenTiles.add(
//         GridTile(
//           child: Image.network(
//             imageUrl,
//             fit: _boxFit,
//           ),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.title}: $_boxFit"),
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return GridView.count(
//             crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
//             childAspectRatio: 1,
//             mainAxisSpacing: 1,
//             crossAxisSpacing: 1,
//             children: kittenTiles,
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showBoxFitDialog,
//         child: const Icon(Icons.select_all),
//       ),
//     );
//   }
// }

//47.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Name {
//   String firstName;
//   String lastName;
//
//   Name({required this.firstName, required this.lastName});
// }
//
// class NameWidget extends StatefulWidget {
//   final Name name;
//
//   const NameWidget(this.name, {super.key});
//
//   @override
//   State<NameWidget> createState() => _NameWidgetState();
// }
//
// class _NameWidgetState extends State<NameWidget> {
//   late TextEditingController _firstNameController;
//   late TextEditingController _lastNameController;
//
//   @override
//   void initState() {
//     super.initState();
//     _firstNameController =
//         TextEditingController(text: widget.name.firstName);
//     _lastNameController =
//         TextEditingController(text: widget.name.lastName);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//         20,
//         20,
//         20,
//         MediaQuery.of(context).viewInsets.bottom + 20,
//       ),
//       child: ListView(
//         shrinkWrap: true,
//         children: [
//           TextField(
//             controller: _firstNameController,
//             decoration: const InputDecoration(labelText: "First Name"),
//           ),
//           TextField(
//             controller: _lastNameController,
//             decoration: const InputDecoration(labelText: "Last Name"),
//           ),
//           TextButton(
//             child: const Text("Apply"),
//             onPressed: () {
//               if (_firstNameController.text.isNotEmpty &&
//                   _lastNameController.text.isNotEmpty) {
//                 Navigator.pop(
//                   context,
//                   Name(
//                     firstName: _firstNameController.text,
//                     lastName: _lastNameController.text,
//                   ),
//                 );
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modal Bottom Sheet',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Name _name = Name(firstName: "", lastName: "");
//
//   void _showModalBottomSheet() {
//     showModalBottomSheet<Name>(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return GestureDetector(
//           onTap: () {},
//           behavior: HitTestBehavior.opaque,
//           child: NameWidget(_name),
//         );
//       },
//     ).then((Name? name) {
//       if (name != null) {
//         setState(() {
//           _name.firstName = name.firstName;
//           _name.lastName = name.lastName;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Show Modal Bottom Sheet"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Your First Name: ${_name.firstName}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             Text(
//               'Your Last Name: ${_name.lastName}',
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _showModalBottomSheet,
//         label: const Text("Specify Name"),
//       ),
//     );
//   }
// }

//46.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const ListViewListTileApp());
// }
//
// class ListViewListTileApp extends StatelessWidget {
//   const ListViewListTileApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView & ListTile',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(title: 'ListView & ListTile'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   int _selectedIndex = 0;
//
//   static const TEXT_STYLE_NORMAL = TextStyle(
//       color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal);
//
//   static const TEXT_STYLE_SELECTED = TextStyle(
//       color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
//
//   final TextFormField _fontSizeTextField = TextFormField(
//     decoration: InputDecoration(
//       icon: Icon(Icons.format_size),
//       hintText: 'Font Size',
//       labelText: 'Enter the font size',
//     ),
//   );
//
//   final TextFormField _historyTextFormField =  TextFormField(
//     decoration: InputDecoration(
//       icon: Icon(Icons.history),
//       hintText: 'Days',
//       labelText: 'Enter days',
//     ),
//   );
//
//   final TextFormField _languageTextFormField =  TextFormField(
//     decoration: InputDecoration(
//       icon: Icon(Icons.language),
//       hintText: 'Language',
//       labelText: 'Enter your language',
//     ),
//   );
//
//   void select(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ListTile accessibilityListTile = ListTile(
//       leading: const Icon(Icons.accessibility),
//       title: Text(
//         "Accessibility",
//         style:
//         _selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
//       ),
//       subtitle: const Text("Accessibility Settings"),
//       trailing: const Icon(Icons.settings),
//       onTap: () => select(0),
//     );
//
//     final ListTile historyListTile = ListTile(
//       leading: const Icon(Icons.history),
//       title: Text(
//         "History",
//         style:
//         _selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
//       ),
//       subtitle: const Text("History Settings"),
//       trailing: const Icon(Icons.settings),
//       onTap: () => select(1),
//     );
//
//     final ListTile languageListTile = ListTile(
//       leading: const Icon(Icons.language),
//       title: Text(
//         "Language",
//         style:
//         _selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL,
//       ),
//       subtitle: const Text("Language Settings"),
//       trailing: const Icon(Icons.settings),
//       onTap: () => select(2),
//     );
//
//     final String selectionTitle = (_selectedIndex == 0
//         ? "Accessibility"
//         : _selectedIndex == 1
//         ? "History"
//         : "Language") +
//         " Settings";
//
//     final TextFormField selectionTextFormField = _selectedIndex == 0
//         ? _fontSizeTextField
//         : _selectedIndex == 1
//         ? _historyTextFormField
//         : _languageTextFormField;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: [
//           accessibilityListTile,
//           historyListTile,
//           languageListTile,
//         ],
//       ),
//       bottomSheet: Container(
//         color: const Color(0xFFB3E5FC),
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           constraints: const BoxConstraints(maxHeight: 200),
//           child: Column(
//             children: [
//               const Icon(Icons.settings),
//               Text(selectionTitle),
//               Expanded(child: selectionTextFormField),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//45.


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'main.g.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// @JsonSerializable()
// class Person {
//   final String name;
//
//   @JsonKey(name: "addr1")
//   final String addressLine1;
//
//   @JsonKey(name: "city")
//   final String addressCity;
//
//   @JsonKey(name: "state")
//   final String addressState;
//
//   const Person(
//       this.name, this.addressLine1, this.addressCity, this.addressState);
//
//   factory Person.fromJson(Map<String, dynamic> json) =>
//       _$PersonFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PersonToJson(this);
//
//   @override
//   String toString() {
//     return 'Person{name: $name, addressLine1: $addressLine1, addressCity: $addressCity, addressState: $addressState}';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Serialization Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   static const Person person =
//   Person("John Brown", "9621 Roberts Avenue", "Birmingham", "AL");
//
//   @override
//   Widget build(BuildContext context) {
//     final String jsonText = jsonEncode(person.toJson());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Serialization"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: ListView(
//             children: [
//               Text("Grandfather:\n$person"),
//               const SizedBox(height: 10),
//               Text(
//                 "Json Encoded:\n$jsonText",
//                 style: const TextStyle(color: Colors.red),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 child: const Text("Copy"),
//                 onPressed: () {
//                   Clipboard.setData(ClipboardData(text: jsonText));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("JSON copied")),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//44.

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Person {
//   final String name;
//   final String addressLine1;
//   final String addressCity;
//   final String addressState;
//   final List<Person> children;
//
//   const Person(
//       this.name, this.addressLine1, this.addressCity, this.addressState, this.children);
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'addr': addressLine1,
//       'city': addressCity,
//       'state': addressState,
//       'children': children.map((e) => e.toJson()).toList()
//     };
//   }
//
//   @override
//   String toString() {
//     return 'Person{name: $name, addressLine1: $addressLine1, addressCity: $addressCity, addressState: $addressState, children: $children}';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Recursive Serialization',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   static const Person grandchild =
//   Person("Tracy Brown", "9625 Roberts Avenue", "Birmingham", "AL", []);
//
//   static const Person adultFather =
//   Person("John Brown", "9625 Roberts Avenue", "Birmingham", "AL", [grandchild]);
//
//   static const Person adultNoChildren =
//   Person("Jill Jones", "100 East Road", "Ocala", "FL", []);
//
//   static const Person grandfather =
//   Person("John Brown", "9621 Roberts Avenue", "Birmingham", "AL", [adultFather, adultNoChildren]);
//
//   Widget buildBlock(BuildContext context, String title, Person person) {
//     final jsonText = jsonEncode(person);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("$title:\n$person"),
//         const SizedBox(height: 10),
//         Text(
//           "Json Encoded:\n$jsonText",
//           style: const TextStyle(color: Colors.red),
//         ),
//         TextButton(
//           child: const Text("Copy"),
//           onPressed: () {
//             Clipboard.setData(ClipboardData(text: jsonText));
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Copied to clipboard")),
//             );
//           },
//         ),
//         const SizedBox(height: 30),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Recursive Serialization"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: [
//             buildBlock(context, "Grandfather", grandfather),
//             buildBlock(context, "Adult Father", adultFather),
//             buildBlock(context, "Adult No Children", adultNoChildren),
//             buildBlock(context, "Grandchild", grandchild),
//           ],
//         ),
//       ),
//     );
//   }
// }

//43.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text("AppBar"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               debugPrint("Add IconButton Pressed...");
//             },
//           )
//         ],
//       ),
//       backgroundColor: Colors.lightBlueAccent,
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Body'),
//           ],
//         ),
//       ),
//
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) =>
//             debugPrint("Bottom Navigation Bar onTap: $index"),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Bottom Nav Bar Item 1',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.mail),
//             label: 'Bottom Nav Bar Item 2',
//           ),
//         ],
//       ),
//
//       // Bottom Sheet
//       bottomSheet: Container(
//         color: Colors.amberAccent,
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.update),
//               onPressed: () {
//                 debugPrint("Bottom Sheet Icon Pressed");
//               },
//             ),
//             const Text('Bottom Sheet Text'),
//           ],
//         ),
//       ),
//
//       // Drawer
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     debugPrint("Drawer Item 1 Pressed");
//                   },
//                 ),
//                 const Text('Drawer Item 1'),
//               ],
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     debugPrint("Drawer Item 2 Pressed");
//                   },
//                 ),
//                 const Text('Drawer Item 2'),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       // Floating Button
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           debugPrint("FloatingActionButton Pressed");
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//
//       // Footer Buttons
//       persistentFooterButtons: [
//         IconButton(
//           icon: const Icon(Icons.update),
//           onPressed: () {
//             debugPrint("Persistent Footer Icon Pressed");
//           },
//         ),
//         const Text('Persistent Footer Text'),
//       ],
//     );
//   }
// }

//42.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const RowMainAxisAlignmentApp());
// }
//
// class RowMainAxisAlignmentApp extends StatelessWidget {
//   const RowMainAxisAlignmentApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Row MainAxisAlignment',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Rows"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: const [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("center")
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("end")
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("spaceAround")
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("spaceEvenly")
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("spaceBetween")
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("MainAxisAlignment"),
//               Text("is"),
//               Text("start")
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//41.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Order {
//   final DateTime dt;
//   final String description;
//   final double total;
//
//   const Order(this.dt, this.description, this.total);
// }
//
// class Customer {
//   final String name;
//   final String location;
//   final List<Order> orders;
//
//   const Customer(this.name, this.location, this.orders);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Customer Orders',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home:  HomePageWidget(),
//     );
//   }
// }
//
// class HomePageWidget extends StatelessWidget {
//    HomePageWidget({super.key});
//
//   final List<Customer> customerList =  [
//     Customer("Bike Corp", "Atlanta", [
//       Order(DateTime(2018, 11, 17), "Bicycle parts", 197.02),
//       Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45),
//     ]),
//     Customer("Trust Corp", "Atlanta", [
//       Order(DateTime(2017, 1, 3), "Shredder parts", 97.02),
//       Order(DateTime(2018, 3, 13), "Shredder blade", 7.45),
//       Order(DateTime(2018, 5, 2), "Shredder blade", 7.45),
//     ]),
//     Customer("Jilly Boutique", "Birmingham", [
//       Order(DateTime(2018, 1, 3), "Display unit", 97.01),
//       Order(DateTime(2018, 3, 3), "Desk unit", 12.25),
//       Order(DateTime(2018, 3, 21), "Clothes rack", 97.15),
//     ]),
//   ];
//
//   void navigateToCustomer(BuildContext context, Customer customer) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => CustomerWidget(customer)),
//     );
//   }
//
//   ListTile createCustomerTile(BuildContext context, Customer customer) {
//     return ListTile(
//       title: Text(customer.name),
//       subtitle: Text(customer.location),
//       trailing: const Icon(Icons.arrow_right),
//       onTap: () => navigateToCustomer(context, customer),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final widgets =
//     customerList.map((c) => createCustomerTile(context, c)).toList();
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Customers")),
//       body: ListView(children: widgets),
//     );
//   }
// }
//
// class CustomerWidget extends StatelessWidget {
//   final Customer customer;
//
//   const CustomerWidget(this.customer, {super.key});
//
//   void navigateToOrder(BuildContext context, Order order) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => OrderWidget(customer, order)),
//     );
//   }
//
//   ListTile createOrderTile(BuildContext context, Order order) {
//     return ListTile(
//       title: Text(order.description),
//       subtitle:
//       Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: \$${order.total}"),
//       trailing: const Icon(Icons.arrow_right),
//       onTap: () => navigateToOrder(context, order),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> widgetList =
//     customer.orders.map((o) => createOrderTile(context, o)).toList();
//
//     widgetList.insert(
//       0,
//       Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text(customer.name,
//                 style:
//                 const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             Text(customer.location,
//                 style:
//                 const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             Text("${customer.orders.length} Orders",
//                 style:
//                 const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
//           ],
//         ),
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Customer Info")),
//       body: ListView(children: widgetList),
//     );
//   }
// }
//
// class OrderWidget extends StatelessWidget {
//   final Customer customer;
//   final Order order;
//
//   const OrderWidget(this.customer, this.order, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Order Info")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text(customer.name,
//                 style:
//                 const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             Text(customer.location,
//                 style:
//                 const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             const SizedBox(height: 20),
//             Text(order.description,
//                 style:
//                 const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             Text(
//               "${order.dt.month}/${order.dt.day}/${order.dt.year}: \$${order.total}",
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//40. (routes named with param

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class Order {
//   final int id;
//   final DateTime dt;
//   final String description;
//   final double total;
//
//   const Order(this.id, this.dt, this.description, this.total);
//
//   Order.empty() : this(0, DateTime.now(), "", 0.0);
// }
//
// class Customer {
//   final int id;
//   final String name;
//   final String location;
//   final List<Order> orders;
//
//   const Customer(this.id, this.name, this.location, this.orders);
//
//   Customer.empty() : this(0, "", "", []);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Customers",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: DataContainerWidget(child: HomeWidget()),
//       onGenerateRoute: handleRoute,
//     );
//   }
//
//   Route<dynamic> handleRoute(RouteSettings routeSettings) {
//     final nameParm = routeSettings.name!.split(":");
//     final name = nameParm[0];
//     final id = int.parse(nameParm[1]);
//
//     Widget childWidget;
//
//     if (name == "/customer/") {
//       childWidget = CustomerWidget(id);
//     } else {
//       childWidget = OrderWidget(id);
//     }
//
//     return MaterialPageRoute(
//       builder: (context) => DataContainerWidget(child: childWidget),
//     );
//   }
// }
//
// class DataContainerWidget extends InheritedWidget {
//   DataContainerWidget({super.key, required Widget child})
//       : super(child: child);
//
//   final List<Customer> customerList = [
//     Customer(1, "Bike Corp", "Atlanta", [
//       Order(11, DateTime(2018, 11, 17), "Bicycle parts", 197.02),
//       Order(12, DateTime(2018, 12, 1), "Bicycle parts", 107.45),
//     ]),
//     Customer(2, "Trust Corp", "Atlanta", [
//       Order(13, DateTime(2017, 1, 3), "Shredder parts", 97.02),
//       Order(14, DateTime(2018, 3, 13), "Shredder blade", 7.45),
//       Order(15, DateTime(2018, 5, 2), "Shredder blade", 7.45),
//     ]),
//     Customer(3, "Jilly Boutique", "Birmingham", [
//       Order(16, DateTime(2018, 1, 3), "Display unit", 97.01),
//       Order(17, DateTime(2018, 3, 3), "Desk unit", 12.25),
//       Order(18, DateTime(2018, 3, 21), "Clothes rack", 97.15),
//     ]),
//   ];
//
//   Customer getCustomer(int id) {
//     return customerList.firstWhere(
//           (customer) => customer.id == id,
//       orElse: () => Customer.empty(),
//     );
//   }
//
//   Customer getCustomerForOrderId(int id) {
//     return customerList.firstWhere(
//           (customer) =>
//           customer.orders.any((order) => order.id == id),
//       orElse: () => Customer.empty(),
//     );
//   }
//
//   Order getOrder(int id) {
//     final customer = getCustomerForOrderId(id);
//     return customer.orders.firstWhere(
//           (order) => order.id == id,
//       orElse: () => Order.empty(),
//     );
//   }
//
//   static DataContainerWidget of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<DataContainerWidget>()!;
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   void navigateToCustomer(BuildContext context, Customer customer) {
//     Navigator.pushNamed(context, "/customer/:${customer.id}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = DataContainerWidget.of(context);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Customers")),
//       body: ListView(
//         children: data.customerList
//             .map(
//               (customer) => ListTile(
//             title: Text(customer.name),
//             subtitle: Text(customer.location),
//             trailing: const Icon(Icons.arrow_right),
//             onTap: () => navigateToCustomer(context, customer),
//           ),
//         )
//             .toList(),
//       ),
//     );
//   }
// }
//
// class CustomerWidget extends StatelessWidget {
//   final int id;
//
//   const CustomerWidget(this.id, {super.key});
//
//   void navigateToOrder(BuildContext context, Order order) {
//     Navigator.pushNamed(context, "/order/:${order.id}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = DataContainerWidget.of(context);
//     final customer = data.getCustomer(id);
//
//     final orderWidgets = <Widget>[
//       Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text(customer.name,
//                 style: const TextStyle(
//                     fontSize: 30, fontWeight: FontWeight.bold)),
//             Text(customer.location,
//                 style: const TextStyle(
//                     fontSize: 24, fontWeight: FontWeight.bold)),
//             Text("${customer.orders.length} Orders",
//                 style: const TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold))
//           ],
//         ),
//       ),
//       ...customer.orders.map(
//             (order) => ListTile(
//           title: Text(order.description),
//           subtitle:
//           Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: \$${order.total}"),
//           trailing: const Icon(Icons.arrow_right),
//           onTap: () => navigateToOrder(context, order),
//         ),
//       )
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Customer Info")),
//       body: ListView(children: orderWidgets),
//     );
//   }
// }
//
// class OrderWidget extends StatelessWidget {
//   final int id;
//
//   const OrderWidget(this.id, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final data = DataContainerWidget.of(context);
//     final customer = data.getCustomerForOrderId(id);
//     final order = data.getOrder(id);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Order Info")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text(customer.name,
//                 style: const TextStyle(
//                     fontSize: 30, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             Text(customer.location,
//                 style: const TextStyle(
//                     fontSize: 24, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             const SizedBox(height: 20),
//             Text(order.description,
//                 style: const TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center),
//             Text(
//               "${order.dt.month}/${order.dt.day}/${order.dt.year} \$${order.total}",
//               style: const TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// EX30: global key shared state
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// final GlobalKey<_Widget1State> key = GlobalKey<_Widget1State>();
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               color: Colors.greenAccent,
//               child: Widget1(key: key),
//             ),
//             Container(
//               color: Colors.blueAccent,
//               child: const Widget2(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Widget1 extends StatefulWidget {
//   const Widget1({super.key});
//
//   @override
//   State<Widget1> createState() => _Widget1State();
// }
//
// class _Widget1State extends State<Widget1> {
//   String _state = 'some state';
//
//   String get state => _state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'Widget1',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           Text(
//             'State: $_state',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Widget2 extends StatefulWidget {
//   const Widget2({super.key});
//
//   @override
//   State<Widget2> createState() => Widget2State();
// }
//
// class Widget2State extends State<Widget2> {
//   String _text = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'Widget2',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _text = key.currentState?.state ?? 'Widget1 state is null';
//                 });
//               },
//               child: const Text('Get state from Widget1'),
//             ),
//           ),
//           Text(
//             'State: $_text',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//         ],
//       ),
//     );
//   }
// }

// EX31: global key shared widget
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // Sử dụng GlobalKey để giữ lại State của CounterWidget khi chuyển trang
//   final GlobalKey<_CounterWidgetState> _counterWidgetGlobalKey = GlobalKey<_CounterWidgetState>();
//   bool _isWidget1 = true;
//
//   void _selectPage() {
//     setState(() => _isWidget1 = !_isWidget1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // primarySwatch được thay thế bằng colorScheme trong các bản mới
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: _isWidget1
//           ? Widget1(counterKey: _counterWidgetGlobalKey, onToggle: _selectPage)
//           : Widget2(counterKey: _counterWidgetGlobalKey, onToggle: _selectPage),
//     );
//   }
// }
//
// class Widget1 extends StatelessWidget {
//   final GlobalKey counterKey;
//   final VoidCallback onToggle;
//
//   const Widget1({super.key, required this.counterKey, required this.onToggle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Widget 1"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         actions: <Widget>[
//           IconButton(icon: const Icon(Icons.refresh), onPressed: onToggle)
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text("Widget 1",
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headlineMedium
//           ),
//           CounterWidget(key: counterKey)
//         ],
//       ),
//     );
//   }
// }
//
// class Widget2 extends StatelessWidget {
//   final GlobalKey counterKey;
//   final VoidCallback onToggle;
//
//   const Widget2({super.key, required this.counterKey, required this.onToggle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Widget 2"),
//         backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
//         actions: [
//           IconButton(icon: const Icon(Icons.refresh), onPressed: onToggle)
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text("Widget 2",
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headlineMedium
//           ),
//           CounterWidget(key: counterKey)
//         ],
//       ),
//     );
//   }
// }
//
// class CounterWidget extends StatefulWidget {
//   // Constructor chuẩn cho Flutter mới
//   const CounterWidget({super.key});
//
//   @override
//   State<CounterWidget> createState() => _CounterWidgetState();
// }
//
// class _CounterWidgetState extends State<CounterWidget> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           'CounterWidget',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//         Text('You have:', style: Theme.of(context).textTheme.bodyLarge),
//         Text(
//           '$_counter',
//           style: Theme.of(context).textTheme.displayMedium,
//         ),
//         const SizedBox(height: 10),
//         FilledButton.icon(
//           onPressed: _incrementCounter,
//           icon: const Icon(Icons.add),
//           label: const Text("Increment"),
//         ),
//       ],
//     );
//   }
// }

//EX32: gridview app
// import 'package:flutter/material.dart';
//
// void main() => runApp(const GridViewApp());
//
// class GridOptions {
//   // Thêm 'final' và bỏ dấu gạch dưới nếu muốn truy cập trực tiếp,
//   // hoặc giữ nguyên nhưng phải sửa cách khởi tạo.
//   final int crossAxisCountPortrait;
//   final int crossAxisCountLandscape;
//   final double childAspectRatio;
//   final double padding;
//   final double spacing;
//
//   GridOptions(this.crossAxisCountPortrait, this.crossAxisCountLandscape,
//       this.childAspectRatio, this.padding, this.spacing);
//
//   @override
//   String toString() {
//     return 'Grid: Port=$crossAxisCountPortrait, Land=$crossAxisCountLandscape, Aspect=$childAspectRatio';
//   }
// }
//
// class GridViewApp extends StatelessWidget {
//   const GridViewApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(title: 'Flutter GridView Demo'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   final List<Widget> _kittenTiles = [];
//   int _gridOptionsIndex = 0;
//
//   final List<GridOptions> _gridOptions = [
//     GridOptions(2, 3, 1.0, 10.0, 10.0),
//     GridOptions(3, 4, 1.0, 10.0, 10.0),
//     GridOptions(4, 5, 1.0, 10.0, 10.0),
//     GridOptions(2, 3, 1.5, 10.0, 10.0),
//     GridOptions(2, 3, 2.0, 10.0, 10.0),
//     GridOptions(2, 3, 1.0, 30.0, 10.0),
//     GridOptions(2, 3, 1.0, 10.0, 30.0),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo danh sách ảnh trong initState thay vì constructor
//     for (int i = 200; i < 1000; i += 100) {
//       // Sử dụng picsum.photos vì placekitten hay bị lỗi kết nối
//       String imageUrl = "https://picsum.photos/id/${i ~/ 10}/200/300";
//       _kittenTiles.add(
//         GridTile(
//           header: const GridTileBar(
//             title: Text("Image", style: TextStyle(fontWeight: FontWeight.bold)),
//             backgroundColor: Colors.black45,
//           ),
//           footer: const GridTileBar(
//             title: Text("Subtitle",
//                 textAlign: TextAlign.right,
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//           ),
//           child: Image.network(imageUrl, fit: BoxFit.cover),
//         ),
//       );
//     }
//   }
//
//   void _tryMoreGridOptions() {
//     setState(() {
//       _gridOptionsIndex = (_gridOptionsIndex + 1) % _gridOptions.length;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     GridOptions options = _gridOptions[_gridOptionsIndex];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return GridView.count(
//             crossAxisCount: (orientation == Orientation.portrait)
//                 ? options.crossAxisCountPortrait
//                 : options.crossAxisCountLandscape,
//             childAspectRatio: options.childAspectRatio,
//             padding: EdgeInsets.all(options.padding),
//             mainAxisSpacing: options.spacing,
//             crossAxisSpacing: options.spacing,
//             children: _kittenTiles,
//           );
//         },
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           color: Theme.of(context).colorScheme.surfaceVariant,
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             options.toString(),
//             style: const TextStyle(fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _tryMoreGridOptions,
//         tooltip: 'Change Grid Layout',
//         child: const Icon(Icons.grid_view),
//       ),
//     );
//   }
// }

// EX33: horizontal list
// import 'package:flutter/material.dart';
//
// void main() => runApp(const HorizontalListApp());
//
// class HorizontalListApp extends StatelessWidget {
//   // Thêm constructor với tham số key chuẩn
//   const HorizontalListApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const title = 'Horizontal List'; // Sử dụng const cho biến không đổi
//
//     return MaterialApp(
//       title: title,
//       // Bật Material 3 để giao diện hiện đại hơn
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//           centerTitle: true,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         body: Container(
//           margin: const EdgeInsets.symmetric(vertical: 20.0),
//           // Giới hạn chiều cao cho ListView ngang để tránh chiếm toàn bộ màn hình
//           height: 200.0,
//           child: ListView(
//             // scrollDirection là yếu tố then chốt để danh sách chạy ngang
//             scrollDirection: Axis.horizontal,
//             children: <Widget>[
//               const ColoredBox(width: 160.0, color: Colors.red),
//               const ColoredBox(width: 160.0, color: Colors.blue),
//               const ColoredBox(width: 160.0, color: Colors.green),
//               const ColoredBox(width: 160.0, color: Colors.yellow),
//               const ColoredBox(width: 160.0, color: Colors.orange),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// Một widget phụ trợ để code gọn hơn (thay cho Container chỉ có màu và kích thước)
// class ColoredBox extends StatelessWidget {
//   final double width;
//   final Color color;
//
//   const ColoredBox({super.key, required this.width, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       margin: const EdgeInsets.all(8.0), // Thêm khoảng cách giữa các thẻ
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12.0), // Bo góc cho hiện đại
//       ),
//     );
//   }
// }

// EX34: http_employees
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(const MyApp());
//
// class Employee {
//   String id;
//   String employeeName;
//   String employeeSalary;
//   String employeeAge;
//   String profileImage;
//
//   Employee({
//     required this.id,
//     required this.employeeName,
//     required this.employeeSalary,
//     required this.employeeAge,
//     required this.profileImage,
//   });
//
//   // Constructor thay thế cho Employee.empty() để phù hợp Null Safety
//   factory Employee.empty() {
//     return Employee(
//       id: "",
//       employeeName: "",
//       employeeSalary: "",
//       employeeAge: "",
//       profileImage: "",
//     );
//   }
//
//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id: json['id']?.toString() ?? "",
//       employeeName: json['employee_name']?.toString() ?? "",
//       employeeSalary: json['employee_salary']?.toString() ?? "",
//       employeeAge: json['employee_age']?.toString() ?? "",
//       profileImage: json['profile_image']?.toString() ?? "",
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {
//       'name': employeeName,
//       'salary': employeeSalary,
//       'age': employeeAge,
//     };
//     if (id.isNotEmpty) data['id'] = id;
//     if (profileImage.isNotEmpty) data['profile_image'] = profileImage;
//     return data;
//   }
// }
//
// class PleaseWaitWidget extends StatelessWidget {
//   const PleaseWaitWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white.withOpacity(0.8),
//         child: const Center(child: CircularProgressIndicator()));
//   }
// }
//
// class ApiWidget extends InheritedWidget {
//   static const String _baseUrl = "https://dummy.restapiexample.com/api/v1";
//   static const _timeout = Duration(seconds: 10);
//
//   const ApiWidget({super.key, required super.child});
//
//   static ApiWidget? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ApiWidget>();
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
//
//   Future<List<Employee>> loadAndParseEmployees() async {
//     final response = await http.get(Uri.parse('$_baseUrl/employees')).timeout(_timeout);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decoded = json.decode(response.body);
//       final List<dynamic> data = decoded['data']; // API này thường bọc trong field 'data'
//       return data.map((json) => Employee.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load employees: ${response.statusCode}');
//     }
//   }
//
//   Future<Employee> loadEmployee(String id) async {
//     final response = await http.get(Uri.parse('$_baseUrl/employee/$id')).timeout(_timeout);
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decoded = json.decode(response.body);
//       return Employee.fromJson(decoded['data']);
//     } else {
//       throw Exception('Failed to load employee');
//     }
//   }
//
//   Future<void> saveEmployee(Employee employee) async {
//     bool isUpdate = employee.id.isNotEmpty;
//     final url = isUpdate ? '$_baseUrl/update/${employee.id}' : '$_baseUrl/create';
//     final response = isUpdate
//         ? await http.put(Uri.parse(url), body: json.encode(employee.toJson())).timeout(_timeout)
//         : await http.post(Uri.parse(url), body: json.encode(employee.toJson())).timeout(_timeout);
//
//     if (response.statusCode != 200) throw Exception('Failed to save');
//   }
//
//   Future<void> deleteEmployee(String id) async {
//     final response = await http.delete(Uri.parse('$_baseUrl/delete/$id')).timeout(_timeout);
//     if (response.statusCode != 200) throw Exception('Failed to delete');
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ApiWidget(
//       child: MaterialApp(
//         title: 'Employee CRUD',
//         theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
//         home: const EmployeeListWidget(),
//       ),
//     );
//   }
// }
//
// class EmployeeListWidget extends StatefulWidget {
//   const EmployeeListWidget({super.key});
//
//   @override
//   State<EmployeeListWidget> createState() => _EmployeeListWidgetState();
// }
//
// class _EmployeeListWidgetState extends State<EmployeeListWidget> {
//   List<Employee>? _employees;
//   bool _pleaseWait = false;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => _refreshEmployees());
//   }
//
//   void _showSnackBar(String content) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
//   }
//
//   void _refreshEmployees() async {
//     setState(() => _pleaseWait = true);
//     try {
//       final employees = await ApiWidget.of(context)!.loadAndParseEmployees();
//       setState(() {
//         _employees = employees..sort((a, b) => a.employeeName.toLowerCase().compareTo(b.employeeName.toLowerCase()));
//       });
//     } catch (e) {
//       _showSnackBar(e.toString());
//     } finally {
//       setState(() => _pleaseWait = false);
//     }
//   }
//
//   void _deleteEmployee(Employee employee) async {
//     final confirm = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Employee'),
//         content: Text('Delete ${employee.employeeName}?'),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
//           TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
//         ],
//       ),
//     );
//
//     if (confirm == true) {
//       setState(() => _pleaseWait = true);
//       try {
//         await ApiWidget.of(context)!.deleteEmployee(employee.id);
//         _showSnackBar('Deleted');
//         _refreshEmployees();
//       } catch (e) {
//         _showSnackBar(e.toString());
//         setState(() => _pleaseWait = false);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Employees"),
//         actions: [
//           IconButton(icon: const Icon(Icons.add), onPressed: () => _navigateToDetail(null)),
//           IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshEmployees),
//         ],
//       ),
//       body: Stack(
//         children: [
//           ListView.builder(
//             itemCount: _employees?.length ?? 0,
//             itemBuilder: (context, index) {
//               final e = _employees![index];
//               return ListTile(
//                 title: Text(e.employeeName),
//                 subtitle: Text('Age: ${e.employeeAge}'),
//                 onTap: () => _navigateToDetail(e.id),
//                 onLongPress: () => _deleteEmployee(e),
//               );
//             },
//           ),
//           if (_pleaseWait) const PleaseWaitWidget(),
//         ],
//       ),
//     );
//   }
//
//   void _navigateToDetail(String? id) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EmployeeDetailWidget(employeeId: id)),
//     );
//     if (result == true) _refreshEmployees();
//   }
// }
//
// class EmployeeDetailWidget extends StatefulWidget {
//   final String? employeeId;
//   const EmployeeDetailWidget({super.key, this.employeeId});
//
//   @override
//   State<EmployeeDetailWidget> createState() => _EmployeeDetailState();
// }
//
// class _EmployeeDetailState extends State<EmployeeDetailWidget> {
//   final _formKey = GlobalKey<FormState>();
//   late Employee _employee;
//   bool _pleaseWait = false;
//   bool _initialized = false;
//
//   final _nameController = TextEditingController();
//   final _salaryController = TextEditingController();
//   final _ageController = TextEditingController();
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_initialized) {
//       if (widget.employeeId == null) {
//         _employee = Employee.empty();
//         _initialized = true;
//       } else {
//         _loadEmployee();
//       }
//     }
//   }
//
//   void _loadEmployee() async {
//     setState(() => _pleaseWait = true);
//     try {
//       _employee = await ApiWidget.of(context)!.loadEmployee(widget.employeeId!);
//       _nameController.text = _employee.employeeName;
//       _salaryController.text = _employee.employeeSalary;
//       _ageController.text = _employee.employeeAge;
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//     } finally {
//       setState(() {
//         _pleaseWait = false;
//         _initialized = true;
//       });
//     }
//   }
//
//   void _save() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       setState(() => _pleaseWait = true);
//       try {
//         await ApiWidget.of(context)!.saveEmployee(_employee);
//         if (mounted) Navigator.pop(context, true);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//         setState(() => _pleaseWait = false);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.employeeId == null ? "Create" : "Edit")),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: ListView(
//                 children: [
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(labelText: 'Name', icon: Icon(Icons.person)),
//                     validator: (v) => v!.isEmpty ? 'Required' : null,
//                     onSaved: (v) => _employee.employeeName = v!,
//                   ),
//                   TextFormField(
//                     controller: _salaryController,
//                     decoration: const InputDecoration(labelText: 'Salary', icon: Icon(Icons.money)),
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     onSaved: (v) => _employee.employeeSalary = v!,
//                   ),
//                   TextFormField(
//                     controller: _ageController,
//                     decoration: const InputDecoration(labelText: 'Age', icon: Icon(Icons.calendar_today)),
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     onSaved: (v) => _employee.employeeAge = v!,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(onPressed: _save, child: const Text('Save')),
//                 ],
//               ),
//             ),
//           ),
//           if (_pleaseWait) const PleaseWaitWidget(),
//         ],
//       ),
//     );
//   }
// }

// EX35: icon
// import 'package:flutter/material.dart';
//
// void main() => runApp(const IconApp());
//
// class IconApp extends StatelessWidget {
//   const IconApp({super.key}); // Thêm constructor chuẩn
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // Cập nhật ThemeData theo phong cách hiện đại
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Sử dụng Widget trực tiếp thay vì khai báo biến rời để tối ưu cây Widget
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Icons"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
//         children: <Widget>[
//           // Row 1
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add),
//               SizedBox(width: 8), // Thêm khoảng cách nhỏ giữa icon và text
//               Text("Default size 24, default color black")
//             ],
//           ),
//           const SizedBox(height: 20), // Khoảng cách giữa các hàng
//
//           // Row 2
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, size: 48.0),
//               SizedBox(width: 8),
//               Text("Specified size 48, default color black")
//             ],
//           ),
//           const SizedBox(height: 20),
//
//           // Row 3
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, size: 96.0, color: Colors.red),
//               SizedBox(width: 8),
//               Text("Specified size 96, specified color red")
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// EX36: inkwell
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // Sử dụng colorScheme thay cho primarySwatch để hỗ trợ Material 3
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Cú pháp constructor ngắn gọn cho phiên bản mới
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Màu sắc AppBar tự động theo theme Material 3
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               // display1 được thay bằng displayLarge hoặc headlineMedium
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       // Cải thiện phần bottomNavigationBar để trông hiện đại hơn
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           color: Theme.of(context).colorScheme.primaryContainer,
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           child: FilledButton(
//             onPressed: _incrementCounter,
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.add),
//                 SizedBox(width: 8),
//                 Text("Increment Counter"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// EX37: input decoration themes
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.blue,
//         // Cấu trúc InputDecorationTheme vẫn giữ nguyên logic nhưng cập nhật cú pháp const
//         inputDecorationTheme: const InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blueGrey),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.green),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.deepPurple),
//           ),
//           labelStyle: TextStyle(
//             color: Colors.blueGrey,
//           ),
//         ),
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Khai báo danh sách controller và widget
//   final List<TextEditingController> _controllers = [];
//   final List<String> _fieldNames = [
//     "First Name", "Last Name", "Address 1", "Address 2", "City", "State", "Zip"
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo các controller dựa trên số lượng field
//     for (var _ in _fieldNames) {
//       _controllers.add(TextEditingController());
//     }
//   }
//
//   @override
//   void dispose() {
//     // Quan trọng: Phải giải phóng controller khi không sử dụng nữa
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   TextFormField _createTextFormField(String fieldName, bool enabled, TextEditingController controller) {
//     return TextFormField(
//       enabled: enabled,
//       validator: (value) {
//         // Kiểm tra null safety cho value
//         if (value == null || value.isEmpty) {
//           return 'Please enter $fieldName.';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         icon: const Icon(Icons.person),
//         hintText: fieldName,
//         labelText: 'Enter $fieldName',
//       ),
//       controller: controller,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Input Decoration Themes"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: ListView.builder(
//             itemCount: _fieldNames.length + 1, // +1 cho nút Save
//             itemBuilder: (context, index) {
//               if (index < _fieldNames.length) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   child: _createTextFormField(
//                     _fieldNames[index],
//                     index > 1, // Disable First Name và Last Name như logic cũ của bạn
//                     _controllers[index],
//                   ),
//                 );
//               } else {
//                 // Nút bấm thay cho RaisedButton đã bị loại bỏ
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Xử lý dữ liệu khi form hợp lệ
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Processing Data...')),
//                         );
//                       }
//                     },
//                     child: const Text('Save'),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// EX38: intl dates numbers
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home:  MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   // Trong phiên bản mới, các biến trong StatelessWidget nên là final
//   final DateTime _dt = DateTime.now();
//   final double _db = 12500.456; // Tăng số lên để thấy rõ định dạng tiền tệ
//
//    MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Internationalization"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Spacer(flex: 1),
//             Text(
//               'Date cơ bản: ${_dt.month}/${_dt.day}/${_dt.year}',
//             ),
//             Text(
//               'DateFormat.yMd(): ${DateFormat.yMd().format(_dt)}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const Spacer(flex: 2),
//             Text('Giá trị gốc: $_db'),
//             const Divider(),
//             Text(
//               'Decimal Pattern: ${NumberFormat.decimalPattern().format(_db)}',
//             ),
//             Text(
//               'Compact: ${NumberFormat.compact().format(_db)}',
//             ),
//             Text(
//               'Currency (USD): ${NumberFormat.currency(symbol: r'$').format(_db)}',
//             ),
//             // Ví dụ định dạng tiền Việt Nam (VND)
//             Text(
//               'Simple Currency (VND): ${NumberFormat.simpleCurrency(locale: 'vi_VN').format(_db)}',
//               style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Simple Currency (JPY): ${NumberFormat.simpleCurrency(name: "JPY").format(_db)}',
//             ),
//             const Spacer(flex: 1),
//           ],
//         ),
//       ),
//     );
//   }
// }

// EX39: isolate threading
// import 'dart:async';
// import 'dart:convert';
// import 'dart:isolate';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// typedef OnProgressListener = void Function(double percentage);
// typedef OnLocationWeatherLoadedListener = void Function(LocationWeather weatherResult);
// typedef OnErrorListener = void Function(dynamic error);
//
// void main() => runApp(const WeatherApp());
//
// class WeatherApp extends StatelessWidget {
//   const WeatherApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Weather Isolate',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const WeatherHomeWidget(title: 'Weather Isolate Demo'),
//     );
//   }
// }
//
// class WeatherHomeWidget extends StatefulWidget {
//   const WeatherHomeWidget({super.key, required this.title});
//   final String title;
//
//   @override
//   State<WeatherHomeWidget> createState() => _WeatherHomeWidgetState();
// }
//
// class _WeatherHomeWidgetState extends State<WeatherHomeWidget> {
//   late LocationWeatherLoaderManager _weatherLoaderManager;
//   String? _error;
//   double? _percentageComplete;
//
//   // Lưu trữ kết quả thời tiết
//   final Map<String, dynamic> _locationWeatherMap = {
//     'atlanta': null,
//     'new york': null,
//     'chicago': null,
//     'tokyo': null,
//     'london': null,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _weatherLoaderManager = LocationWeatherLoaderManager(
//         onProgressListener: handleProgress,
//         onLocationWeatherLoadedListener: handleCompleted,
//         onErrorListener: handleError);
//   }
//
//   void _loadWeather() {
//     setState(() {
//       _error = null;
//       _percentageComplete = 0.0;
//       // Reset data cũ
//       _locationWeatherMap.updateAll((key, value) => null);
//     });
//     List<String> weatherLocationList = _locationWeatherMap.keys.toList();
//     _weatherLoaderManager.start(weatherLocationList);
//   }
//
//   void handleProgress(double percentage) {
//     setState(() => _percentageComplete = percentage);
//   }
//
//   void handleCompleted(LocationWeather locationWeather) {
//     setState(() {
//       _locationWeatherMap[locationWeather.location] = locationWeather.weather;
//     });
//   }
//
//   void handleError(dynamic err) {
//     setState(() {
//       _error = err.toString();
//       _percentageComplete = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget mainContent;
//     if (_error != null) {
//       mainContent = WeatherErrorWidget(_error!);
//     } else if (_percentageComplete == null) {
//       mainContent = const WeatherNotLoadedWidget();
//     } else if (_percentageComplete! < 1.0 && _locationWeatherMap.values.every((v) => v == null)) {
//       mainContent = WeatherLoadingWidget(_percentageComplete!);
//     } else {
//       mainContent = WeatherLoadedWidget(_locationWeatherMap);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: mainContent,
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadWeather,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
//
// // --- Các Widget hiển thị ---
//
// class WeatherErrorWidget extends StatelessWidget {
//   final String error;
//   const WeatherErrorWidget(this.error, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text("Error: $error", style: const TextStyle(color: Colors.red)),
//       ),
//     );
//   }
// }
//
// class WeatherNotLoadedWidget extends StatelessWidget {
//   const WeatherNotLoadedWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Hit refresh to load the weather"));
//   }
// }
//
// class WeatherLoadedWidget extends StatelessWidget {
//   final Map<String, dynamic> locationWeatherMap;
//   const WeatherLoadedWidget(this.locationWeatherMap, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> locations = locationWeatherMap.keys.toList();
//     return GridView.builder(
//       padding: const EdgeInsets.all(10),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//       ),
//       itemCount: locations.length,
//       itemBuilder: (context, index) {
//         String city = locations[index];
//         var data = locationWeatherMap[city];
//         return Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(city.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
//               if (data == null)
//                 const CircularProgressIndicator()
//               else ...[
//                 Text("${data['temp']}°C", style: const TextStyle(fontSize: 20)),
//                 Text(data['desc']),
//               ]
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class WeatherLoadingWidget extends StatelessWidget {
//   final double percentageComplete;
//   const WeatherLoadingWidget(this.percentageComplete, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Loading... ${(percentageComplete * 100).toInt()}%"),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: 200,
//             child: LinearProgressIndicator(value: percentageComplete),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // --- Logic Isolate & Data ---
//
// class LocationWeather {
//   final String location;
//   final dynamic weather;
//   LocationWeather(this.location, this.weather);
// }
//
// class LocationWeatherLoaderIsolate {
//   final OnProgressListener onProgressListener;
//   final OnLocationWeatherLoadedListener onLocationWeatherLoadedListener;
//   final List<String> locationNames;
//
//   LocationWeatherLoaderIsolate({
//     required this.onProgressListener,
//     required this.onLocationWeatherLoadedListener,
//     required this.locationNames,
//   });
//
//   void run() async {
//     int totalSteps = locationNames.length;
//     for (int i = 0; i < locationNames.length; i++) {
//       String city = locationNames[i];
//
//       // Giả lập gọi API (Vì MetaWeather đã die, ta dùng dữ liệu giả lập có delay)
//       await Future.delayed(const Duration(milliseconds: 800));
//
//       var mockData = {
//         'temp': (15 + i * 2).toDouble(),
//         'desc': 'Sunny',
//         'humidity': 50 + i
//       };
//
//       onLocationWeatherLoadedListener(LocationWeather(city, mockData));
//       onProgressListener((i + 1) / totalSteps);
//     }
//   }
// }
//
// class IsolateEntryPointArgument {
//   final List<String> cityNames;
//   final SendPort dataPort;
//   IsolateEntryPointArgument(this.cityNames, this.dataPort);
// }
//
// class LocationWeatherLoaderManager {
//   final OnProgressListener onProgressListener;
//   final OnLocationWeatherLoadedListener onLocationWeatherLoadedListener;
//   final OnErrorListener onErrorListener;
//
//   final ReceivePort _dataPort = ReceivePort();
//   final ReceivePort _errorPort = ReceivePort();
//
//   LocationWeatherLoaderManager({
//     required this.onProgressListener,
//     required this.onLocationWeatherLoadedListener,
//     required this.onErrorListener,
//   }) {
//     _dataPort.listen(_handleDataMessage);
//     _errorPort.listen(_handleError);
//   }
//
//   void start(List<String> cityNames) {
//     Isolate.spawn<IsolateEntryPointArgument>(
//       entryPoint,
//       IsolateEntryPointArgument(cityNames, _dataPort.sendPort),
//       onError: _errorPort.sendPort,
//     );
//   }
//
//   static void entryPoint(IsolateEntryPointArgument args) {
//     final loader = LocationWeatherLoaderIsolate(
//       locationNames: args.cityNames,
//       onProgressListener: (p) => args.dataPort.send(p),
//       onLocationWeatherLoadedListener: (w) => args.dataPort.send(w),
//     );
//     loader.run();
//   }
//
//   void _handleDataMessage(dynamic message) {
//     if (message is double) {
//       onProgressListener(message);
//     } else if (message is LocationWeather) {
//       onLocationWeatherLoadedListener(message);
//     }
//   }
//
//   void _handleError(dynamic error) => onErrorListener(error);
// }

// EX40: listview builder
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Thêm const và super.key cho phiên bản mới
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nasa Offices Demo',
//       theme: ThemeData(
//         // Cập nhật lên Material 3 cho giao diện hiện đại
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: MyHomeWidget(),
//     );
//   }
// }
//
// class MyHomeWidget extends StatelessWidget {
//   // Chuyển danh sách thành final để đảm bảo tính bất biến trong StatelessWidget
//   final List<Map<String, String>> _nasaOffices = [
//     {
//       "Name": "Mach 6, High Reynolds Number Facility",
//       "Address": "1864 4th St",
//       "City": "Wright-Patterson AFB",
//       "State": "OH",
//       "ZIP": "45433-7541",
//       "Country": "US"
//     },
//     // ... (Giữ nguyên các phần tử NASA offices của bạn ở đây)
//     {
//       "Name": "Meteorological Facilities and ASRF",
//       "Address": "Code 802",
//       "City": "Wallops Island",
//       "State": "VA",
//       "ZIP": "23337-5099",
//       "Country": "US"
//     }
//   ];
//
//   MyHomeWidget({super.key}) {
//     // Sắp xếp danh sách ngay khi khởi tạo
//     _nasaOffices.sort((a, b) => a['Name']!.compareTo(b['Name']!));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Tách riêng builder để code sạch sẽ hơn
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("NASA Offices"),
//         // Màu sắc AppBar theo Material 3
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: _nasaOffices.length,
//         itemBuilder: (context, index) {
//           // Debug log chỉ xuất hiện khi chạy chế độ debug
//           debugPrint('invoking itemBuilder for row $index');
//
//           final nasaOffice = _nasaOffices[index];
//
//           return Card( // Thêm Card để các item trông tách biệt và đẹp hơn
//             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             child: ListTile(
//               leading: const Icon(Icons.business, color: Colors.blue),
//               title: Text(
//                 nasaOffice['Name'] ?? 'Unknown Office',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 '${nasaOffice['Address']}, ${nasaOffice['City']}, '
//                     '${nasaOffice['State']} ${nasaOffice['ZIP']}, ${nasaOffice['Country']}',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () {
//                 // Thêm sự kiện khi nhấn vào văn phòng
//                 debugPrint('Tapped on ${nasaOffice['Name']}');
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//21.
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class ExpansionPanelData {
//   String title;
//   String body;
//   bool expanded;
//
//   ExpansionPanelData(this.title, this.body, this.expanded);
//
//   @override
//   String toString() {
//     return 'ExpansionPanelData{title: $title, body: $body, expanded: $expanded}';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const HomeWidget(),
//       showPerformanceOverlay: true,
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//
//   final List<ExpansionPanelData> _expansionPanelData = [
//     ExpansionPanelData(
//         "Can I backup my data?",
//         "dsfuysdiu fudsy fiusdyf usdyf iudsyf udsyfiuysd ufyuisdyfi sduiyfiusdyf dsyui u",
//         false),
//     ExpansionPanelData(
//         "How can I increase my space?",
//         "sydufy dsuiyfuidysu fusyufsdyuif ysudiy fuydsufy suyf udsy fu",
//         false),
//     ExpansionPanelData(
//         "How do I cancel?",
//         "ddsufysd yfds fsduyf sdyf sudyuy fsudyf sydyf dsy fdsuyf udsufy udsyfdsfyuysdf uyud",
//         false),
//     ExpansionPanelData(
//         "How do I change language?",
//         "udsuf sdifuu fdsuif uf dsufdisu fius wewqw qeqweqwyiquuiqweqwewqe weewe wewe",
//         false),
//     ExpansionPanelData(
//         "How do I search?",
//         "ooioio ioi oio i odsfudsifsdf dfdsfdsui idufu dsiuf isduf iduf idsu fisduf iusidf",
//         false),
//     ExpansionPanelData(
//         "How do I view on other devices?",
//         "idusdf isu idsu idsu fisduf usyfuedy ewuyduyed uyeu dyeudy uweyu",
//         false),
//     ExpansionPanelData(
//         "How do I view my history",
//         "iirewy syfudy fu yfsduyfds yfdsuyf udsfydsufy sduyf dsuyf udsyf udsyuee",
//         false),
//     ExpansionPanelData(
//         "Is my subscription cost going to go up?",
//         "wieureiy dys udsyyf dsufy dusyfudsy fuysdu udsyuyfudsyfuewyrwreooioou uiy",
//         false),
//   ];
//
//   void _onExpansion(int panelIndex, bool isExpanded) {
//     setState(() {
//       _expansionPanelData[panelIndex].expanded =
//       !_expansionPanelData[panelIndex].expanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     List<ExpansionPanel> expansionPanels = [];
//
//     for (int i = 0; i < _expansionPanelData.length; i++) {
//       var data = _expansionPanelData[i];
//
//       expansionPanels.add(
//         ExpansionPanel(
//           headerBuilder: (context, isExpanded) {
//             return Padding(
//               padding: const EdgeInsets.all(20),
//               child: Text(
//                 data.title,
//                 style:
//                 const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             );
//           },
//           body: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Text(
//               data.body,
//               style: const TextStyle(
//                   fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//           ),
//           isExpanded: data.expanded,
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("FAQs"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.all(24),
//           child: ExpansionPanelList(
//             children: expansionPanels,
//             expansionCallback: _onExpansion,
//           ),
//         ),
//       ),
//     );
//   }
// }




// 22.
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image"),
//       ),
//       body:  Center(
//         child: FadeInImage.assetNetwork(
//           placeholder: 'assets/loading.gif',
//           image: 'https://picsum.photos/250?image=9',
//         ),
//       ),
//     );
//   }
// }



// 23.

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class Car {
//   String make;
//   String model;
//   String imageSrc;
//
//   Car(this.make, this.model, this.imageSrc);
//
//   @override
//   bool operator ==(Object other) {
//     return other is Car && make == other.make && model == other.model;
//   }
//
//   @override
//   int get hashCode => make.hashCode ^ model.hashCode;
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   String _title = "Cars";
//   Car? _selectedCar;
//
//   final List<Car> _cars = [
//     Car(
//       "Bmw",
//       "M3",
//       "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg",
//     ),
//     Car(
//       "Nissan",
//       "GTR",
//       "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg",
//     ),
//     Car(
//       "Nissan",
//       "Sentra",
//       "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
//     ),
//   ];
//
//   void _selectionHandler(Car selectedCar) {
//     setState(() {
//       _title = 'Selected ${selectedCar.make} ${selectedCar.model}';
//       _selectedCar = selectedCar;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<CarWidget> carWidgets = _cars.map((car) {
//       return CarWidget(car, car == _selectedCar, _selectionHandler);
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_title),
//       ),
//       body: ListView(children: carWidgets),
//     );
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   const CarWidget(this.car, this.isSelected, this.parentSelectionHandler,
//       {super.key});
//
//   final Car car;
//   final bool isSelected;
//   final ValueChanged<Car> parentSelectionHandler;
//
//   void _handleTap() {
//     parentSelectionHandler(car);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: GestureDetector(
//         onTap: _handleTap,
//         child: Container(
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.lightBlueAccent : Colors.white,
//             border: Border.all(),
//           ),
//           padding: const EdgeInsets.all(20),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   '${car.make} ${car.model}',
//                   style: const TextStyle(fontSize: 24),
//                 ),
//                 const SizedBox(height: 20),
//                 Image.network(car.imageSrc),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// 24.

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Cars'),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: ListView(
//         children: const [
//           CarWidget(
//             "Bmw",
//             "M3",
//             "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg",
//           ),
//           CarWidget(
//             "Nissan",
//             "GTR",
//             "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg",
//           ),
//           CarWidget(
//             "Nissan",
//             "Sentra",
//             "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg",
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CarWidget extends StatelessWidget {
//   const CarWidget(this.make, this.model, this.imageSrc, {super.key});
//
//   final String make;
//   final String model;
//   final String imageSrc;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Container(
//         decoration: BoxDecoration(border: Border.all()),
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 '$make $model',
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               Image.network(imageSrc),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// 25.
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(title: 'Flex'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<HomeWidget> {
//   final List<MainAxisAlignment> _alignments = [
//     MainAxisAlignment.start,
//     MainAxisAlignment.end,
//     MainAxisAlignment.center,
//     MainAxisAlignment.spaceBetween,
//     MainAxisAlignment.spaceEvenly,
//     MainAxisAlignment.spaceAround
//   ];
//
//   final List<String> _alignmentsText = [
//     "Start",
//     "End",
//     "Center",
//     "Space Between",
//     "Space Evenly",
//     "Space Around"
//   ];
//
//   bool _vertical = true;
//   int _alignmentIndex = 0;
//
//   final RawMaterialButton redButton = RawMaterialButton(
//     onPressed: null,
//     elevation: 2.0,
//     fillColor: Colors.red,
//   );
//
//   final RawMaterialButton greenButton = RawMaterialButton(
//     onPressed: null,
//     elevation: 2.0,
//     fillColor: Colors.green,
//   );
//
//   final RawMaterialButton blueButton = RawMaterialButton(
//     onPressed: null,
//     elevation: 2.0,
//     fillColor: Colors.blue,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.rotate_right),
//             tooltip: 'Direction',
//             onPressed: () {
//               setState(() {
//                 _vertical = !_vertical;
//               });
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Text(_vertical ? "Vertical" : "Horizontal"),
//           ),
//           IconButton(
//             icon: const Icon(Icons.aspect_ratio),
//             tooltip: 'Main axis',
//             onPressed: () {
//               setState(() {
//                 _alignmentIndex++;
//                 if (_alignmentIndex >= _alignments.length) {
//                   _alignmentIndex = 0;
//                 }
//               });
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Text(_alignmentsText[_alignmentIndex]),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(10),
//           )
//         ],
//       ),
//       body: Flex(
//         direction: _vertical ? Axis.vertical : Axis.horizontal,
//         mainAxisAlignment: _alignments[_alignmentIndex],
//         children: [redButton, greenButton, blueButton],
//       ),
//     );
//   }
// }

// 26.
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   bool _topTightFit = false;
//   bool _bottomExpanded = false;
//
//   void toggleTop() {
//     setState(() {
//       _topTightFit = !_topTightFit;
//     });
//   }
//
//   void toggleBottom() {
//     setState(() {
//       _bottomExpanded = !_bottomExpanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Container topContainer = Container(
//       constraints: const BoxConstraints(
//         minHeight: 100,
//         minWidth: 100,
//         maxHeight: 200,
//         maxWidth: 200,
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1),
//         color: Colors.blue,
//       ),
//       padding: const EdgeInsets.all(10),
//       child: const Text('Top Container'),
//     );
//
//     Container bottomContainer = Container(
//       constraints: const BoxConstraints(
//         minHeight: 100,
//         minWidth: 100,
//         maxHeight: 200,
//         maxWidth: 200,
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1),
//         color: Colors.yellow,
//       ),
//       padding: const EdgeInsets.all(10),
//       child: const Text('Bottom Container'),
//     );
//
//     Widget topWidget = Flexible(
//       fit: _topTightFit ? FlexFit.tight : FlexFit.loose,
//       child: topContainer,
//     );
//
//     Widget bottomWidget =
//     _bottomExpanded ? Expanded(child: bottomContainer) : bottomContainer;
//
//     String toolbarTextTop = "Top (${_topTightFit ? "tight" : "loose"})";
//     String toolbarTextBottom =
//         "Bottom (${_bottomExpanded ? "expanded" : "not expanded"})";
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expanded"),
//         actions: [
//           TextButton.icon(
//             icon: const Icon(Icons.keyboard_arrow_up),
//             label: Text(toolbarTextTop),
//             onPressed: toggleTop,
//           ),
//           TextButton.icon(
//             icon: const Icon(Icons.keyboard_arrow_down),
//             label: Text(toolbarTextBottom),
//             onPressed: toggleBottom,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [topWidget, bottomWidget],
//         ),
//       ),
//     );
//   }
// }


// 27.
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class PersonInfo {
//   String fname;
//   String lname;
//   String sex;
//   String addr1;
//   String addr2;
//   String city;
//   String state;
//   String zip;
//   bool fiveYears;
//   DateTime? dob;
//
//   PersonInfo(
//       this.fname,
//       this.lname,
//       this.sex,
//       this.addr1,
//       this.addr2,
//       this.city,
//       this.state,
//       this.zip,
//       this.fiveYears,
//       this.dob);
//
//   PersonInfo.empty()
//       : fname = "",
//         lname = "",
//         sex = "m",
//         addr1 = "",
//         addr2 = "",
//         city = "",
//         state = "AL",
//         zip = "",
//         fiveYears = false,
//         dob = null;
//
//   @override
//   String toString() {
//     return '''
// First Name: $fname
// Last Name: $lname
// Sex: $sex
// Address1: $addr1
// Address2: $addr2
// City: $city
// State: $state
// Zip: $zip
// 5 Years: $fiveYears
// DOB: $dob
// ''';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Form Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   PersonInfo address = PersonInfo.empty();
//
//   void onSaved(PersonInfo address) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Address"),
//         content: Text(address.toString()),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"))
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Enter your details")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: AddressWidget(address: address, onSaved: onSaved),
//       ),
//     );
//   }
// }
//
// class AddressWidget extends StatefulWidget {
//   final PersonInfo address;
//   final ValueChanged<PersonInfo> onSaved;
//
//   const AddressWidget(
//       {super.key, required this.address, required this.onSaved});
//
//   @override
//   State<AddressWidget> createState() => _AddressWidgetState();
// }
//
// class _AddressWidgetState extends State<AddressWidget> {
//   final _formKey = GlobalKey<FormState>();
//
//   final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
//
//   late TextEditingController fnameController;
//   late TextEditingController lnameController;
//   late TextEditingController cityController;
//   late TextEditingController zipController;
//
//   String sex = "m";
//   String state = "AL";
//   bool fiveYears = false;
//   DateTime? dob;
//
//   @override
//   void initState() {
//     super.initState();
//     fnameController = TextEditingController();
//     lnameController = TextEditingController();
//     cityController = TextEditingController();
//     zipController = TextEditingController();
//   }
//
//   Future<void> pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2000),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null) {
//       setState(() {
//         dob = picked;
//       });
//     }
//   }
//
//   PersonInfo createPerson() {
//     return PersonInfo(
//       fnameController.text,
//       lnameController.text,
//       sex,
//       "",
//       "",
//       cityController.text,
//       state,
//       zipController.text,
//       fiveYears,
//       dob,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           TextFormField(
//             controller: fnameController,
//             decoration: const InputDecoration(labelText: "First Name"),
//             validator: (v) =>
//             v == null || v.isEmpty ? "Enter first name" : null,
//           ),
//
//           TextFormField(
//             controller: lnameController,
//             decoration: const InputDecoration(labelText: "Last Name"),
//             validator: (v) =>
//             v == null || v.isEmpty ? "Enter last name" : null,
//           ),
//
//           const SizedBox(height: 10),
//
//           Row(
//             children: [
//               const Text("Male"),
//               Radio(
//                   value: "m",
//                   groupValue: sex,
//                   onChanged: (v) => setState(() => sex = v!)),
//               const Text("Female"),
//               Radio(
//                   value: "f",
//                   groupValue: sex,
//                   onChanged: (v) => setState(() => sex = v!)),
//             ],
//           ),
//
//           TextFormField(
//             controller: cityController,
//             decoration: const InputDecoration(labelText: "City"),
//           ),
//
//           DropdownButtonFormField(
//             value: state,
//             items: const [
//               DropdownMenuItem(value: "AL", child: Text("Alabama")),
//               DropdownMenuItem(value: "CA", child: Text("California")),
//               DropdownMenuItem(value: "NY", child: Text("New York")),
//               DropdownMenuItem(value: "TX", child: Text("Texas")),
//             ],
//             onChanged: (v) => setState(() => state = v!),
//             decoration: const InputDecoration(labelText: "State"),
//           ),
//
//           TextFormField(
//             controller: zipController,
//             keyboardType: TextInputType.number,
//             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//             decoration: const InputDecoration(labelText: "Zip"),
//           ),
//
//           CheckboxListTile(
//             title: const Text("Been at address 5 years"),
//             value: fiveYears,
//             onChanged: (v) => setState(() => fiveYears = v!),
//           ),
//
//           const SizedBox(height: 10),
//
//           Row(
//             children: [
//               Text(dob == null
//                   ? "Select Date of Birth"
//                   : dateFormat.format(dob!)),
//               const SizedBox(width: 20),
//               ElevatedButton(
//                   onPressed: pickDate, child: const Text("Pick Date"))
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           ElevatedButton(
//             child: const Text("Save"),
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 widget.onSaved(createPerson());
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }


// 28.

//
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Future Builder App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   String computeListOfTimestamps(int count) {
//     StringBuffer sb = StringBuffer();
//
//     for (int i = 0; i < count; i++) {
//       sb.writeln("${i + 1} : ${DateTime.now()}");
//     }
//
//     return sb.toString();
//   }
//
//   Future<String> createFutureCalculation(int count) {
//     return Future(() {
//       return computeListOfTimestamps(count);
//     });
//   }
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   bool _showCalculation = false;
//
//   void _onInvokeFuturePressed() {
//     setState(() {
//       _showCalculation = !_showCalculation;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = _showCalculation
//         ? FutureBuilder<String>(
//       future: widget.createFutureCalculation(10000),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }
//
//         if (snapshot.hasError) {
//           return Text("Error: ${snapshot.error}");
//         }
//
//         return Expanded(
//           child: SingleChildScrollView(
//             child: Text(
//               snapshot.data ?? "",
//               style: const TextStyle(fontSize: 20),
//             ),
//           ),
//         );
//       },
//     )
//         : const Text('Hit the button to show calculation');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Future"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [child],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _onInvokeFuturePressed,
//         tooltip: 'Invoke Future',
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }

// 29.

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const GestureApp());
// }
//
// class GestureApp extends StatelessWidget {
//   const GestureApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeWidget(title: 'Gestures'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   final String title;
//
//   const HomeWidget({super.key, required this.title});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   String _log = '';
//
//   void _clear() {
//     setState(() {
//       _log = '';
//     });
//   }
//
//   void _logGesture(String logText) {
//     setState(() {
//       _log += "\n$logText";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               child: const Text(
//                 'Gesture Me',
//                 style: TextStyle(fontSize: 24),
//               ),
//               onTap: () => _logGesture('tap'),
//               onTapDown: (details) => _logGesture('onTapDown: $details'),
//               onTapUp: (details) => _logGesture('onTapUp: $details'),
//               onTapCancel: () => _logGesture('onTapCancel'),
//               onDoubleTap: () => _logGesture('onDoubleTap'),
//               onLongPress: () => _logGesture('onLongPress'),
//               onVerticalDragDown: (details) =>
//                   _logGesture('onVerticalDragDown: $details'),
//               onVerticalDragStart: (details) =>
//                   _logGesture('onVerticalDragStart: $details'),
//               onVerticalDragUpdate: (details) =>
//                   _logGesture('onVerticalDragUpdate'),
//               onVerticalDragEnd: (details) =>
//                   _logGesture('onVerticalDragEnd: $details'),
//               onVerticalDragCancel: () =>
//                   _logGesture('onVerticalDragCancel'),
//               onHorizontalDragDown: (details) =>
//                   _logGesture('onHorizontalDragDown: $details'),
//               onHorizontalDragStart: (details) =>
//                   _logGesture('onHorizontalDragStart: $details'),
//               onHorizontalDragUpdate: (details) =>
//                   _logGesture('onHorizontalDragUpdate: $details'),
//               onHorizontalDragEnd: (details) =>
//                   _logGesture('onHorizontalDragEnd: $details'),
//               onHorizontalDragCancel: () =>
//                   _logGesture('onHorizontalDragCancel'),
//             ),
//
//             Container(
//               constraints: const BoxConstraints(maxHeight: 200),
//               margin: const EdgeInsets.all(10),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey, width: 1),
//               ),
//               child: SingleChildScrollView(
//                 child: Text(_log),
//               ),
//             ),
//
//             ElevatedButton(
//               onPressed: _clear,
//               child: const Text('Clear'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// 1. alert_dialog
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Sử dụng super parameters (Dart 2.17+)
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // primarySwatch đã cũ, hiện tại dùng colorScheme sẽ linh hoạt hơn
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true, // Kích hoạt giao diện Material 3 mới nhất
//       ),
//       home: const HomeWidget(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   // Thêm 'required' cho tham số bắt buộc và dùng 'super.key'
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   int _counter = 0;
//
//   // Trả về bool? vì người dùng có thể đóng dialog mà không chọn gì (null)
//   Future<void> _incrementCounter() async {
//     final bool? shouldIncrement = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm'),
//           content: const Text('Are you sure you want to increment the counter?'),
//           actions: <Widget>[
//             // FlatButton đã được thay thế bằng TextButton
//             TextButton(
//               onPressed: () => Navigator.pop(context, false),
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, true),
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//
//     // Kiểm tra Null Safety trước khi cập nhật state
//     if (shouldIncrement == true) {
//       setState(() {
//         _counter++;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               // display1 đã đổi thành headlineMedium trong Material 3
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// 2. animated_container
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Chuyển sang ColorScheme từ Seed Color (chuẩn Material 3)
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Animation Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Sử dụng super.key và required cho các tham số truyền vào
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // Đổi tên biến 'b' thành 'isExpanded' để code dễ đọc hơn
//   bool _isExpanded = false;
//
//   void _toggleLayout() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Sử dụng màu sắc từ Theme mới
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             // Widget AnimatedContainer tự động xử lý animation khi thuộc tính thay đổi
//             AnimatedContainer(
//               color: _isExpanded ? Colors.tealAccent : Colors.blueAccent,
//               height: _isExpanded ? 400.0 : 200.0,
//               duration: const Duration(seconds: 1),
//               curve: Curves.easeInOut, // Thêm curve để chuyển động mượt hơn
//               child: const Center(
//                 child: Text(
//                   'Top',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w200),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             AnimatedContainer(
//               color: _isExpanded ? Colors.redAccent : Colors.orangeAccent,
//               height: _isExpanded ? 200.0 : 400.0,
//               duration: const Duration(seconds: 1),
//               curve: Curves.easeInOut,
//               child: const Center(
//                 child: Text(
//                   'Bottom',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w200),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggleLayout,
//         tooltip: 'Chuyển đổi chế độ',
//         child: const Icon(Icons.swap_vert),
//       ),
//     );
//   }
// }

// 3. animated_list
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Cập nhật super constructor
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Sử dụng colorScheme và Material 3 (chuẩn mới nhất)
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Animation Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Sử dụng 'required' cho Null Safety và 'super.key'
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // Đặt tên biến rõ ràng hơn (ví dụ: isExpanded)
//   bool _isExpanded = false;
//
//   void _changeMode() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             // Widget tự động xử lý animation khi giá trị thuộc tính thay đổi
//             AnimatedContainer(
//               color: _isExpanded ? Colors.tealAccent : Colors.blueAccent,
//               height: _isExpanded ? 400.0 : 200.0,
//               duration: const Duration(seconds: 1),
//               curve: Curves.fastOutSlowIn, // Thêm curve để chuyển động mượt hơn
//               child: const Center(
//                 child: Text(
//                   'Top',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w200),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             AnimatedContainer(
//               color: _isExpanded ? Colors.redAccent : Colors.orangeAccent,
//               height: _isExpanded ? 200.0 : 400.0,
//               duration: const Duration(seconds: 1),
//               curve: Curves.fastOutSlowIn,
//               child: const Center(
//                 child: Text(
//                   'Bottom',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w200),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _changeMode,
//         tooltip: 'Toggle Animation',
//         child: const Icon(Icons.swap_vert), // Icon phù hợp hơn cho việc hoán đổi
//       ),
//     );
//   }
// }



// 4. animated_progress_circle
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget>
//     with SingleTickerProviderStateMixin {
//   // Sử dụng 'late' để khởi tạo AnimationController sau trong initState
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5), // Chỉnh lại 5 giây cho nhanh hơn chút
//       vsync: this,
//     );
//     // Lưu ý: Chúng ta không cần addListener + setState nữa
//     // nếu sử dụng AnimatedBuilder ở phần build (giúp tối ưu hiệu suất).
//   }
//
//   @override
//   void dispose() {
//     // Luôn luôn dispose controller để tránh rò rỉ bộ nhớ
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _performAnimation() {
//     if (_controller.status != AnimationStatus.forward) {
//       _controller.forward(from: 0.0);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // AnimatedBuilder giúp chỉ vẽ lại phần cần thiết khi animation chạy
//         title: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) => Text(
//             "Progress: ${(_controller.value * 100).toStringAsFixed(1)}%",
//           ),
//         ),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Container(
//         constraints: const BoxConstraints.expand(),
//         margin: const EdgeInsets.all(8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return CustomPaint(
//                 painter: ProgressCirclePainter(
//                   lineColor: Colors.amber.shade200,
//                   completeColor: Colors.blueAccent,
//                   completePercent: _controller.value * 100,
//                   width: 18.0,
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _performAnimation,
//         child: const Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }
//
// class ProgressCirclePainter extends CustomPainter {
//   final Color lineColor;
//   final Color completeColor;
//   final double completePercent;
//   final double width;
//
//   ProgressCirclePainter({
//     required this.lineColor,
//     required this.completeColor,
//     required this.completePercent,
//     required this.width,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Vẽ vòng tròn nền (background circle)
//     Paint line = Paint()
//       ..color = lineColor
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = width;
//
//     // Vẽ vòng tròn tiến trình (progress arc)
//     Paint complete = Paint()
//       ..color = completeColor
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = width;
//
//     Offset center = Offset(size.width / 2, size.height / 2);
//     double radius = min(size.width / 2, size.height / 2);
//
//     // Vẽ vòng tròn xám bên dưới
//     canvas.drawCircle(center, radius, line);
//
//     // Tính toán góc quay (2 * pi là 360 độ)
//     double arcAngle = 2 * pi * (completePercent / 100);
//
//     // Vẽ cung tròn dựa trên % hoàn thành
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -pi / 2, // Bắt đầu từ đỉnh trên cùng (12 giờ)
//       arcAngle,
//       false,
//       complete,
//     );
//   }
//
//   @override
//   bool shouldRepaint(ProgressCirclePainter oldDelegate) {
//     // Chỉ vẽ lại khi phần trăm thay đổi
//     return oldDelegate.completePercent != completePercent;
//   }
// }


// 5. animated_text
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Sử dụng ColorScheme và Material 3 (chuẩn mới nhất)
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Animated Text Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // Chuyển TextStyle thành hằng số để tối ưu bộ nhớ
//   static const TextStyle _textStyle1 = TextStyle(
//     color: Colors.blue,
//     fontSize: 30.0,
//     fontWeight: FontWeight.w200,
//   );
//
//   static const TextStyle _textStyle2 = TextStyle(
//     color: Colors.green,
//     fontSize: 40.0,
//     fontWeight: FontWeight.w900,
//   );
//
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Quyết định style dựa trên giá trị counter
//     final TextStyle currentStyle = _counter % 2 == 0 ? _textStyle1 : _textStyle2;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // AnimatedDefaultTextStyle tự động tạo hiệu ứng transition khi 'style' thay đổi
//             AnimatedDefaultTextStyle(
//               style: currentStyle,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//               child: const Text('You have pushed', textAlign: TextAlign.center),
//             ),
//             AnimatedDefaultTextStyle(
//               style: currentStyle,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//               child: const Text('the button this', textAlign: TextAlign.center),
//             ),
//             AnimatedDefaultTextStyle(
//               style: currentStyle,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//               child: const Text('many times:', textAlign: TextAlign.center),
//             ),
//             AnimatedDefaultTextStyle(
//               style: currentStyle,
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//               child: Text('$_counter', textAlign: TextAlign.center),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// 6. box_decoration
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Sử dụng super parameters (Dart 2.17+)
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false, // Tắt banner debug cho đẹp
//       theme: ThemeData(
//         // Material 3 là tiêu chuẩn mới nhất của Google
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Box Decoration Modernized'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Null safety: Thêm required và dùng super.key
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Màu sắc tự động lấy từ colorScheme
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               // display1 đã cũ, giờ dùng headlineMedium
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// 7. button_enablement
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Sử dụng super parameters
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Kích hoạt Material 3 và ColorScheme hiện đại
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(title: 'Button Enablement'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   // Null safety: yêu cầu title không được null và dùng super.key
//   const HomeWidget({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   bool _checked = false;
//
//   // Trong Flutter mới, giá trị của Checkbox có thể là null (bool?)
//   void _onCheck(bool? val) {
//     setState(() {
//       _checked = val ?? false;
//     });
//   }
//
//   void _onSubmit() {
//     debugPrint("_onSubmit");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             const Text(
//               'Please check below to agree to the terms.',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Checkbox(
//                   value: _checked,
//                   onChanged: _onCheck, // Callback gọn gàng hơn
//                 ),
//                 const Text("I agree")
//               ],
//             ),
//             // OutlineButton đã được thay thế bằng OutlinedButton
//             OutlinedButton(
//               onPressed: _checked ? _onSubmit : null,
//               child: const Text('Register'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// 8. buttons
// import 'package:flutter/material.dart';
//
// void main() => runApp(const ButtonApp());
//
// class ButtonApp extends StatelessWidget {
//   const ButtonApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Modern Buttons',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Sử dụng ColorScheme và Material 3 là tiêu chuẩn hiện nay
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   String? _dropdownValue = 'Mens';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Modern Buttons"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: SingleChildScrollView( // Thêm để tránh tràn màn hình trên máy nhỏ
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               _buildRow(
//                 child: TextButton(
//                   onPressed: () => debugPrint('TextButton pressed'),
//                   child: const Text('TextButton'),
//                 ),
//                 label: "Replaced FlatButton",
//               ),
//               _buildRow(
//                 child: ElevatedButton(
//                   onPressed: () => debugPrint('ElevatedButton pressed'),
//                   child: const Text('ElevatedButton'),
//                 ),
//                 label: "Replaced RaisedButton",
//               ),
//               _buildRow(
//                 child: IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () => debugPrint('IconButton pressed'),
//                 ),
//                 label: "IconButton",
//               ),
//               _buildRow(
//                 child: OutlinedButton(
//                   onPressed: () => debugPrint('OutlinedButton pressed'),
//                   child: const Text("OutlinedButton"),
//                 ),
//                 label: "Replaced OutlineButton",
//               ),
//               _buildRow(
//                 child: DropdownButton<String>(
//                   value: _dropdownValue,
//                   items: <String>['Mens', 'Womans'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) {
//                     setState(() {
//                       _dropdownValue = newValue;
//                     });
//                     debugPrint('Changed: $newValue');
//                   },
//                 ),
//                 label: "DropdownButton",
//               ),
//               const _buildRow(child: BackButton(), label: "BackButton"),
//               const _buildRow(child: CloseButton(), label: "CloseButton"),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => debugPrint('FAB pressed'),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   // Hàm helper để xây dựng hàng cho gọn code
//   static Widget _buildRow({required Widget child, required String label}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(child: Center(child: child)),
//           Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
//         ],
//       ),
//     );
//   }
// }


//9. cards
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter News',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true, // Kích hoạt giao diện Material 3 mới nhất
//       ),
//       home: const NewsfeedWidget(title: 'News Feed'),
//     );
//   }
// }
//
// // Model dữ liệu sử dụng final để đảm bảo tính bất biến (immutability)
// class News {
//   final DateTime dt;
//   final String title;
//   final String text;
//
//   News(this.dt, this.title, this.text);
// }
//
// class NewsCard extends StatelessWidget {
//   final News news;
//
//   // Sử dụng super.key và required cho Null Safety
//   const NewsCard({super.key, required this.news});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Card(
//         clipBehavior: Clip.antiAlias, // Giúp bo góc ảnh mượt hơn
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Placeholder image (BBC logo cũ có thể bị lỗi link, dùng placeholder cho an toàn)
//               Image.network(
//                 "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/BBC.svg/1200px-BBC.svg.png",
//                 height: 50,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
//                 child: Text(
//                   "${news.dt.day}/${news.dt.month}/${news.dt.year}",
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10.0),
//                 child: Text(
//                   news.title,
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Text(
//                 news.text,
//                 maxLines: 2,
//                 style: const TextStyle(fontSize: 14.0),
//                 overflow: TextOverflow.ellipsis, // Dùng ellipsis thay cho fade để dễ đọc hơn
//               ),
//               const SizedBox(height: 10),
//               // Thay thế FlatButton bằng TextButton
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(onPressed: () {}, child: const Text("Share")),
//                   TextButton(onPressed: () {}, child: const Text("Bookmark")),
//                   TextButton(onPressed: () {}, child: const Text("Link")),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NewsfeedWidget extends StatelessWidget {
//   const NewsfeedWidget({super.key, required this.title});
//
//   final String title;
//
//   // Danh sách dữ liệu mẫu
//   static final List<News> _newsList = [
//     News(DateTime(2024, 12, 1), "AI Revolution in 2026", "Exploring how Gemini 3 and other models have reshaped the development landscape."),
//     News(DateTime(2025, 1, 12), "Flutter's New Canvas", "The Impeller engine is now the default, providing buttery smooth 120Hz animations."),
//     News(DateTime(2026, 3, 7), "Dart 3.x Features", "Why pattern matching and sealed classes are game changers for Flutter developers."),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       // Sử dụng ListView.builder để tối ưu hiệu suất cho danh sách dài
//       body: ListView.builder(
//         padding: const EdgeInsets.all(20.0),
//         itemCount: _newsList.length,
//         itemBuilder: (context, index) {
//           return NewsCard(news: _newsList[index]);
//         },
//       ),
//     );
//   }
// }

//10. column_expanded
// import 'package:flutter/material.dart';
//
// void main() => runApp(const ColumnSpacedEvenly());
//
// class ColumnSpacedEvenly extends StatelessWidget {
//   const ColumnSpacedEvenly({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Material 3 là tiêu chuẩn hiện tại
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Tách logic tạo button ra một hàm nhỏ để code sạch hơn
//     Widget buildModernButton(Color color, String label) {
//       return RawMaterialButton(
//         onPressed: () => debugPrint('$label pressed'),
//         elevation: 2.0,
//         fillColor: color,
//         // Thêm một chút padding và shape cho chuẩn UI hiện đại
//         padding: const EdgeInsets.all(15.0),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         child: Text(
//           label,
//           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Column & Expanded"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           // Vì dùng Expanded nên các con sẽ tự chia đều không gian
//           children: <Widget>[
//             Expanded(child: buildModernButton(Colors.red, "Red Button")),
//             Expanded(child: buildModernButton(Colors.green, "Green Button")),
//             Expanded(child: buildModernButton(Colors.blue, "Blue Button")),
//           ],
//         ),
//       ),
//     );
//   }
// }


//11. column_spaced_evenly
// import 'package:flutter/material.dart';
//
// void main() => runApp(const ColumnSpacedEvenly());
//
// class ColumnSpacedEvenly extends StatelessWidget {
//   const ColumnSpacedEvenly({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Modern UI',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Chuyển sang ColorScheme và Material 3 (tiêu chuẩn 2026)
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Column Space Evenly"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           // spaceEvenly chia đều khoảng cách giữa, trên và dưới các widget
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _buildCircleButton(Colors.red),
//             _buildCircleButton(Colors.green),
//             _buildCircleButton(Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Hàm helper để tái sử dụng code tạo Button tròn
//   Widget _buildCircleButton(Color color) {
//     return RawMaterialButton(
//       onPressed: () {},
//       constraints: const BoxConstraints(minWidth: 188.0, minHeight: 136.0),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: color,
//       padding: const EdgeInsets.all(15.0),
//     );
//   }
// }



//12. constrained_box
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Modern Layout',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Sử dụng hệ màu ColorScheme và Material 3 mới nhất
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Constrained ListView'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Null safety: bắt buộc truyền title và sử dụng super.key
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           // Thiết lập các ràng buộc kích thước cố định
//           constraints: const BoxConstraints(
//             maxHeight: 350,
//             minHeight: 300,
//             minWidth: 200,
//             maxWidth: 250,
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Theme.of(context).colorScheme.outline),
//               borderRadius: BorderRadius.circular(8.0), // Thêm bo góc cho hiện đại
//             ),
//             padding: const EdgeInsets.all(8.0),
//             // ListView.builder hiệu quả hơn ListView(children) khi danh sách dài
//             child: ListView.builder(
//               itemCount: _counter,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: Text(
//                     "Row $index",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Add Row',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



//13. container
// import 'package:flutter/material.dart';
//
// void main() => runApp(const ContainerApp());
//
// class ContainerApp extends StatelessWidget {
//   const ContainerApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Chuyển sang ColorScheme và Material 3
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(title: 'Rotation Animation'),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key, required this.title});
//   final String title;
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget>
//     with SingleTickerProviderStateMixin {
//
//   // Sử dụng late cho Null Safety
//   late final AnimationController _controller;
//   late final Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     // Tween định nghĩa dải giá trị từ 0.0 (0 độ) đến 1.0 (360 độ)
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );
//
//     // Không cần addListener(() => setState((){})) nữa!
//   }
//
//   @override
//   void dispose() {
//     // Luôn dispose controller để tránh rò rỉ bộ nhớ
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _spin() {
//     _controller.forward(from: 0.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           decoration: BoxDecoration(
//             color: Colors.redAccent,
//             border: Border.all(width: 2.0, color: Colors.black),
//             borderRadius: const BorderRadius.all(Radius.circular(20.0)), // Bo tròn hơn
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withAlpha(50),
//                 blurRadius: 10,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           // RotationTransition tự động lắng nghe animation để vẽ lại
//           child: RotationTransition(
//             turns: _animation,
//             child: const Icon(
//               Icons.airplanemode_active,
//               size: 150.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _spin,
//         tooltip: 'Xoay máy bay',
//         child: const Icon(Icons.rotate_right),
//       ),
//     );
//   }
// }


//14. custom_dialog_gridview_settings
// import 'package:flutter/material.dart';
//
// void main() => runApp(const GridViewApp());
//
// // Lớp lưu trữ cấu hình Grid - Cập nhật Null Safety
// class GridOptions {
//   int crossAxisCountPortrait;
//   int crossAxisCountLandscape;
//   double childAspectRatio;
//   double padding;
//   double spacing;
//
//   GridOptions({
//     required this.crossAxisCountPortrait,
//     required this.crossAxisCountLandscape,
//     required this.childAspectRatio,
//     required this.padding,
//     required this.spacing,
//   });
//
//   // Tạo bản sao để chỉnh sửa trong Dialog mà không ảnh hưởng ngay đến UI chính
//   factory GridOptions.copy(GridOptions other) {
//     return GridOptions(
//       crossAxisCountPortrait: other.crossAxisCountPortrait,
//       crossAxisCountLandscape: other.crossAxisCountLandscape,
//       childAspectRatio: other.childAspectRatio,
//       padding: other.padding,
//       spacing: other.spacing,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'Portrait: $crossAxisCountPortrait, Landscape: $crossAxisCountLandscape, Ratio: $childAspectRatio';
//   }
// }
//
// class GridViewApp extends StatelessWidget {
//   const GridViewApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Modern Grid',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class CustomDialogWidget extends StatefulWidget {
//   final GridOptions initialOptions;
//   const CustomDialogWidget({super.key, required this.initialOptions});
//
//   @override
//   State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
// }
//
// class _CustomDialogWidgetState extends State<CustomDialogWidget> {
//   late GridOptions _tempOptions;
//
//   @override
//   void initState() {
//     super.initState();
//     // Tạo bản sao tạm thời để chỉnh sửa
//     _tempOptions = GridOptions.copy(widget.initialOptions);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text("Grid Options",
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 20),
//           _buildDropdownRow<int>(
//             label: "Portrait Count",
//             value: _tempOptions.crossAxisCountPortrait,
//             items: [2, 3, 4, 5, 6],
//             onChanged: (val) => setState(() => _tempOptions.crossAxisCountPortrait = val!),
//           ),
//           _buildDropdownRow<int>(
//             label: "Landscape Count",
//             value: _tempOptions.crossAxisCountLandscape,
//             items: [2, 3, 4, 5, 6],
//             onChanged: (val) => setState(() => _tempOptions.crossAxisCountLandscape = val!),
//           ),
//           _buildDropdownRow<double>(
//             label: "Aspect Ratio",
//             value: _tempOptions.childAspectRatio,
//             items: [1.0, 1.5, 2.0, 2.5],
//             onChanged: (val) => setState(() => _tempOptions.childAspectRatio = val!),
//           ),
//           const SizedBox(height: 20),
//           TextButton(
//             onPressed: () => Navigator.pop(context, _tempOptions),
//             child: const Text("Apply Changes"),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDropdownRow<T>({
//     required String label,
//     required T value,
//     required List<T> items,
//     required ValueChanged<T?> onChanged,
//   }) {
//     return Row(
//       children: [
//         Text(label),
//         const Spacer(),
//         DropdownButton<T>(
//           value: value,
//           items: items.map((T val) {
//             return DropdownMenuItem<T>(value: val, child: Text(val.toString()));
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ],
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   final List<Widget> _kittenTiles = [];
//   GridOptions _gridOptions = GridOptions(
//     crossAxisCountPortrait: 2,
//     crossAxisCountLandscape: 3,
//     childAspectRatio: 1.0,
//     padding: 8.0,
//     spacing: 8.0,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     // Sử dụng picsum thay cho placekitten vì tính ổn định
//     for (int i = 0; i < 8; i++) {
//       _kittenTiles.add(
//         GridTile(
//           header: const GridTileBar(
//             title: Text("Kitten", style: TextStyle(fontWeight: FontWeight.bold)),
//             backgroundColor: Colors.black45,
//           ),
//           footer: const GridTileBar(
//             title: Text("Cute!", textAlign: TextAlign.right),
//           ),
//           child: Image.network(
//             "https://picsum.photos/id/${i + 10}/400/400",
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//     }
//   }
//
//   Future<void> _showOptions() async {
//     final result = await showDialog<GridOptions>(
//       context: context,
//       builder: (context) => Dialog(
//         child: CustomDialogWidget(initialOptions: _gridOptions),
//       ),
//     );
//     if (result != null) {
//       setState(() => _gridOptions = result);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Modern GridView")),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return GridView.count(
//             crossAxisCount: (orientation == Orientation.portrait)
//                 ? _gridOptions.crossAxisCountPortrait
//                 : _gridOptions.crossAxisCountLandscape,
//             childAspectRatio: _gridOptions.childAspectRatio,
//             padding: EdgeInsets.all(_gridOptions.padding),
//             mainAxisSpacing: _gridOptions.spacing,
//             crossAxisSpacing: _gridOptions.spacing,
//             children: _kittenTiles,
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16.0),
//         color: Theme.of(context).colorScheme.surfaceVariant,
//         child: Text("Active Config: $_gridOptions"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showOptions,
//         child: const Icon(Icons.settings),
//       ),
//     );
//   }
// }



//15. debugging
// import 'package:flutter/material.dart';
// import 'dart:developer'; // Giữ lại để dùng hàm debugger()
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Sử dụng super parameters (Dart 2.17+)
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Chuyển sang ColorScheme và kích hoạt Material 3
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter 3 Modern Counter'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Null safety: yêu cầu title và sử dụng super.key
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     // debugger() sẽ dừng chương trình tại đây nếu mở debug mode trong IDE
//     debugger(when: _counter > 5);
//
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Màu sắc tự động lấy từ colorScheme của theme
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               // display1 đã đổi thành headlineMedium trong hệ thống text mới
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


//16. default_project
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key}); // Sử dụng super parameters (Dart 2.17+)
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Modern Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // Material 3 là tiêu chuẩn hiện tại, mang lại giao diện hiện đại và sạch sẽ
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Modern Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   // Thêm 'required' và 'super.key' để tuân thủ Null Safety
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // Cơ chế setState thông báo cho Framework vẽ lại UI khi dữ liệu thay đổi
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Màu sắc tự động lấy từ colorScheme của Theme
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               // 'display1' đã được thay thế bằng 'headlineMedium' trong Material 3
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


//17. deserialize_manually
// import 'package:flutter/material.dart';
// import 'dart:convert';
//
// void main() => runApp(MyApp());
//
// class Person {
//   final String name;
//   final String addressLine1;
//   final String addressCity;
//   final String addressState;
//   final List<Person> children;
//
//   const Person(this.name, this.addressLine1, this.addressCity,
//       this.addressState, this.children);
//
//   // You write this deserialization code.
//   factory Person.fromJson(Map<String, dynamic> json) {
//     if (json == null) {
//       throw FormatException("Null JSON.");
//     }
//
//     // Recursion. Convert children into list of Person objects.
//     List<dynamic> decodedChildren = json['children'];
//     List<Person> children = [];
//     decodedChildren.forEach((decodedChild) {
//       children.add(Person.fromJson(decodedChild));
//     });
//
//     return Person(
//         json['name'], json['addr1'], json['city'], json['state'], children);
//   }
//   // You write this deserialization code.
//
//   @override
//   String toString() {
//     return 'Person{name: $name, addressLine1: $addressLine1, addressCity: $addressCity, addressState: $addressState, children: $children}';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   HomeWidget({Key key}) : super(key: key);
//
//   @override
//   _HomeWidgetState createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   final _jsonTextController = TextEditingController();
//   Person _person;
//   String _error;
//
//   _HomeWidgetState() {
//     final String grandchild =
//         "{\"name\":\"Tracy Brown\", \"addr1\":\"9625 Roberts Avenue\"," +
//             "\"city\":\"Birmingham\", \"state\":\"AL\", \"children\":[" +
//             "]}";
//     final String adultFather =
//         "{\"name\":\"John Brown\", \"addr1\":\"9625 Roberts Avenue\"," +
//             "\"city\":\"Birmingham\", \"state\":\"AL\", \"children\":[" +
//             grandchild +
//             "]}";
//     final String adultNoChildren =
//         "{\"name\":\"Jill Jones\", \"addr1\":\"100 East Road\"," +
//             "\"city\":\"Ocala\", \"state\":\"FL\", \"children\":[" +
//             "]}";
//     final String grandfather =
//         "{\"name\":\"John Brown\", \"addr1\":\"9621 Roberts Avenue\"," +
//             "\"city\":\"Birmingham\", \"state\":\"AL\", \"children\":[" +
//             adultFather +
//             "," +
//             adultNoChildren +
//             "]}";
//
//     _jsonTextController.text = grandfather;
//   }
//
//   TextFormField _createJsonTextFormField() {
//     return new TextFormField(
//         validator: (value) {
//           if (value.isEmpty) {
//             return 'Please enter the json.';
//           }
//         },
//         decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Json',
//             labelText: 'Enter the json for a person.'),
//         controller: _jsonTextController,
//         autofocus: true,
//         maxLines: 8,
//         keyboardType: TextInputType.multiline);
//   }
//
//   _convertJsonToPerson() {
//     _error = null;
//     _person = null;
//     setState(() {
//       try {
//         final String jsonText = _jsonTextController.text;
//         debugPrint("JSON TEXT: ${jsonText}");
//         var decoded = json.decode(jsonText); // text to map
//         debugPrint("DECODED:  type: ${decoded.runtimeType} value: ${decoded}");
//         _person = Person.fromJson(decoded); // map to object
//         debugPrint("PERSON OBJECT: type: ${_person.runtimeType} value: "
//             "${_person}");
//       } catch (e) {
//         debugPrint("ERROR: ${e}");
//         _error = e.toString();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Recursive Deserialization"),
//       ),
//       body: Center(
//         child: Padding(
//           child: ListView(
//             children: <Widget>[
//               _createJsonTextFormField(),
//               Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Text(
//                       _error == null ? '' : 'An error occurred:\n\n${_error}',
//                       style: TextStyle(color: Colors.red))),
//               Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Text(_person == null
//                       ? 'Person is null'
//                       : 'Converted to Person object:\n\n${_person}'))
//             ],
//           ),
//           padding: EdgeInsets.all(10.0),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _convertJsonToPerson,
//         tooltip: 'Increment',
//         child: Icon(Icons.refresh),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }



// 18. deserialize_with_generated_code
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:json_annotation/json_annotation.dart';
//
// // Đảm bảo tên file này trùng với tên file dart của bạn
// part 'main.g.dart';
//
// void main() => runApp(const MyApp());
//
// @JsonSerializable()
// class Person {
//   final String name;
//
//   @JsonKey(name: "addr1")
//   final String addressLine1;
//
//   @JsonKey(name: "city")
//   final String addressCity;
//
//   @JsonKey(name: "state")
//   final String addressState;
//
//   // Sử dụng required cho Null Safety
//   Person({
//     required this.name,
//     required this.addressLine1,
//     required this.addressCity,
//     required this.addressState,
//   });
//
//   // Đây là cách hiện đại để khởi tạo từ JSON
//   factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
//
//   // Đây là cách chuyển ngược về Map
//   Map<String, dynamic> toJson() => _$PersonToJson(this);
//
//   @override
//   String toString() {
//     return 'Person{name: $name, address: $addressLine1, $addressCity, $addressState}';
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter JSON Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const HomeWidget(),
//     );
//   }
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   // Sử dụng late để khởi tạo trong initState
//   late final TextEditingController _jsonTextController;
//   Person? _person;
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     const String initialPersonJson =
//         '{"name":"Tracy Brown", "addr1":"9625 Roberts Avenue", "city":"Birmingham", "state":"AL"}';
//     _jsonTextController = TextEditingController(text: initialPersonJson);
//   }
//
//   @override
//   void dispose() {
//     _jsonTextController.dispose();
//     super.dispose();
//   }
//
//   void _convertJsonToPerson() {
//     setState(() {
//       _error = null;
//       _person = null;
//       try {
//         final String jsonText = _jsonTextController.text;
//         // Chuyển từ String sang Map<String, dynamic>
//         final Map<String, dynamic> decoded = json.decode(jsonText);
//         // Chuyển từ Map sang Object
//         _person = Person.fromJson(decoded);
//       } catch (e) {
//         _error = e.toString();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("JSON Deserialization"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: <Widget>[
//             TextFormField(
//               controller: _jsonTextController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter Person JSON',
//                 hintText: '{"name": "...", ...}',
//                 alignLabelWithHint: true,
//               ),
//               maxLines: 6,
//               keyboardType: TextInputType.multiline,
//             ),
//             if (_error != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Text(
//                   'Error: $_error',
//                   style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             const Divider(height: 40),
//             Text(
//               _person == null
//                   ? 'No Person object created yet.'
//                   : 'Successfully converted:\n\n$_person',
//               style: Theme.of(context).textTheme.bodyLarge,
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _convertJsonToPerson,
//         label: const Text("Convert JSON"),
//         icon: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }


//19: dismissable
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class Cat {
//   final String imageSrc;
//   final String name;
//   final int age;
//   final int votes;
//
//   Cat(this.imageSrc, this.name, this.age, this.votes);
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is Cat &&
//               runtimeType == other.runtimeType &&
//               imageSrc == other.imageSrc;
//
//   @override
//   int get hashCode => imageSrc.hashCode;
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cat List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true, // Bật Material 3 để giao diện hiện đại hơn
//       ),
//       home: const MyHomePage(title: 'The Cat List'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final List<String> catNames = [
//     "Tom",
//     "Oliver",
//     "Ginger",
//     "Pontouf",
//     "Madison",
//     "Bubblita",
//     "Bubbles"
//   ];
//
//   final Random _random = Random();
//   final List<Cat> _cats = [];
//
//   int next(int min, int max) => min + _random.nextInt(max - min);
//
//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo dữ liệu bên trong initState
//     for (int i = 200; i < 250; i += 10) {
//       _cats.add(Cat(
//           "https://loremflickr.com/200/$i/cat",
//           catNames[next(0, 6)],
//           next(1, 32),
//           0));
//     }
//   }
//
//   void _onDismissed(int index) {
//     // Bây giờ setState đã hoạt động hoàn hảo
//     setState(() {
//       _cats.removeAt(index);
//     });
//   }
//
//   Future<bool?> _confirmDismiss(DismissDirection direction) async {
//     return await showDialog<bool>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Confirm'),
//             content: const Text(
//                 'Are you sure you want to delete this cat?\n\nHe is cute you know...'),
//             actions: <Widget>[
//               TextButton( // Thay thế FlatButton
//                 onPressed: () => Navigator.pop(context, true),
//                 child: const Text('Yes'),
//               ),
//               TextButton( // Thay thế FlatButton
//                 onPressed: () => Navigator.pop(context, false),
//                 child: const Text('No'),
//               )
//             ],
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemCount: _cats.length, // Không cần kiểm tra null nữa vì đã có Null Safety
//         itemBuilder: (context, index) {
//           final cat = _cats[index];
//           return Dismissible(
//             confirmDismiss: _confirmDismiss,
//             direction: DismissDirection.endToStart,
//             // Sửa lỗi ở đây: Truyền vào callback thay vì gọi hàm trực tiếp
//             onDismissed: (direction) => _onDismissed(index),
//             key: ValueKey(cat.hashCode.toString()),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(cat.imageSrc),
//                 radius: 32.0,
//               ),
//               title: Text(cat.name, style: const TextStyle(fontSize: 25.0)),
//               subtitle: Text(
//                 "This little thug is ${cat.age} year(s) old.",
//                 style: const TextStyle(fontSize: 15.0),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


//20: expanded
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _topExpanded = false;
  bool _bottomExpanded = false;

  void toggleTop() {
    setState(() => _topExpanded = !_topExpanded);
  }

  void toggleBottom() {
    setState(() => _bottomExpanded = !_bottomExpanded);
  }

  @override
  Widget build(BuildContext context) {
    Widget topContainer = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.all(10.0),
      child: const Text('Top Container'),
    );

    Widget bottomContainer = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.yellow,
      ),
      padding: const EdgeInsets.all(10.0),
      child: const Text('Bottom Container'),
    );

    Widget topWidget =
    _topExpanded ? Expanded(child: topContainer) : topContainer;
    Widget bottomWidget =
    _bottomExpanded ? Expanded(child: bottomContainer) : bottomContainer;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanded"),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(_topExpanded ? Icons.expand_more : Icons.expand_less),
            label: const Text("Top"),
            // Cài đặt màu chữ để hiển thị rõ trên nền AppBar
            style: TextButton.styleFrom(foregroundColor: Colors.black87),
            onPressed: toggleTop,
          ),
          TextButton.icon(
            icon: Icon(_bottomExpanded ? Icons.expand_less : Icons.expand_more),
            label: const Text("Bottom"),
            style: TextButton.styleFrom(foregroundColor: Colors.black87),
            onPressed: toggleBottom,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[topWidget, bottomWidget],
        ),
      ),
    );
  }
}