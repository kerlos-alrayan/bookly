// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CodeBuilderGame(),
//   ));
// }
//
// class CodeBuilderGame extends StatelessWidget {
//   const CodeBuilderGame({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CodeGameScreen(),
//     );
//   }
// }

// class CodeGameScreen extends StatefulWidget {
//   @override
//   _CodeGameScreenState createState() => _CodeGameScreenState();
// }
//
// class _CodeGameScreenState extends State<CodeGameScreen> {
//   List<String> correctOrder = [
//     'int number = 10;',
//     'if (number > 5) {',
//     '  print("The number is greater than 5");',
//     '}'
//   ];
//
//   List<String> scrambledCode = [];
//
//   @override
//   void initState() {
//     super.initState();
//     scrambledCode = List.from(correctOrder)..shuffle();
//   }
//
//   void checkOrder() {
//     if (scrambledCode.join() == correctOrder.join()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Great Job! The code is correct! 🎉")),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Oops! Try again!")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Code Builder"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Arrange the code correctly!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Expanded(
//             child: DragAndDropLists(
//               children: [
//                 DragAndDropList(
//                   children: scrambledCode.map((line) => DragAndDropItem(
//                     child: Card(
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Text(line, style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                   )).toList(),
//                 ),
//               ],
//               onItemReorder: (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
//                 setState(() {
//                   final item = scrambledCode.removeAt(oldItemIndex);
//                   scrambledCode.insert(newItemIndex, item);
//                 });
//               }, onListReorder: (int oldListIndex, int newListIndex) {  },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: checkOrder,
//             child: Text("Run Code"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CodeGameScreen extends StatefulWidget {
//   const CodeGameScreen({super.key});
//
//   @override
//   CodeGameScreenState createState() => CodeGameScreenState();
// }
//
// class CodeGameScreenState extends State<CodeGameScreen> {
//   final List<String> correctOrder = [
//     'Start coding!',
//     'var message = "Hello, World!";',
//     'print(message);',
//     'You did it! 🎉'
//   ];
//
//   List<String> scrambledCode = [];
//
//   @override
//   void initState() {
//     super.initState();
//     scrambledCode = List.from(correctOrder)..shuffle();
//   }
//
//   void checkOrder() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         bool isCorrect = scrambledCode.join() == correctOrder.join();
//
//         return AlertDialog(
//           title: Text(
//             isCorrect ? "Great Job! 🎉" : "Oops! Try Again! ❌",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: isCorrect ? Colors.green : Colors.red,
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 isCorrect
//                     ? "You wrote your first code correctly! 🚀"
//                     : "Something is not right, try again!",
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               Icon(
//                 isCorrect ? Icons.check_circle : Icons.error,
//                 size: 50,
//                 color: isCorrect ? Colors.green : Colors.red,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 "OK",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/kids/kids.jpg',
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Help your friends put the code in the correct order!",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                       textAlign: TextAlign.center,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Lottie.asset(
//                             'assets/animations/Animation - 1740417927878.json',
//                             height: 150),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Lottie.asset(
//                             'assets/animations/Animation - 1740418003805.json',
//                             height: 150),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 height: MediaQuery.of(context).size.height * .35,
//                 decoration: BoxDecoration(
//                     color: Colors.black38,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: DragAndDropLists(
//                   children: [
//                     DragAndDropList(
//                       children: scrambledCode
//                           .map((line) => DragAndDropItem(
//                                 child: Card(
//                                   color: Colors.lightBlueAccent,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Text(
//                                       line,
//                                       style: TextStyle(
//                                           fontSize: 20, color: Colors.white),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                     ),
//                   ],
//                   onItemReorder:
//                       (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
//                     setState(() {
//                       final item = scrambledCode.removeAt(oldItemIndex);
//                       scrambledCode.insert(newItemIndex, item);
//                     });
//                   },
//                   onListReorder: (int oldListIndex, int newListIndex) {},
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purpleAccent,
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   ),
//                   onPressed: checkOrder,
//                   child: Text(
//                     "Run Code! 🚀",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
