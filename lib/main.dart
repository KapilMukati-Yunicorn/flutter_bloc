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
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
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


// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:statemanagement_bloc/my_counter_app/bloc/counter_bloc.dart';
// import 'package:statemanagement_bloc/login/login_page.dart';
// import 'package:statemanagement_bloc/my_counter_app/counter_page.dart';
// import 'bloc/counter_bloc.dart';
// import 'bloc/counter_event.dart';
// import 'bloc/counter_state.dart';
import 'my_counter_app/bloc/counter_event.dart';
import 'my_counter_app/bloc/counter_state.dart';
import 'my_counter_app/bloc/counter_bloc.dart';
import 'my_counter_app/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        // child: const CounterScreen(),
        // child: LoginPage(),
        child: MyCounterPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final counterBloc = context.read<CounterBloc>();
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('BLoC Counter with Sealed Class')),
//       body: Center(
//         child: BlocBuilder<CounterBloc, CounterState>(
//           builder: (context, state) {
//             return Text(
//               'Count: ${state.counterValue}',
//               style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: 'add',
//             onPressed: () => counterBloc.add(Increment()),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 10),
//           FloatingActionButton(
//             heroTag: 'remove',
//             onPressed: () => counterBloc.add(Decrement()),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

