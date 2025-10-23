import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'My_Todo_App/blocs/todo_bloc.dart';
import 'My_Todo_App/pages/home_page.dart';
import 'My_Todo_App/pages/list_page.dart';
import 'My_Todo_App/widgets/bottom_navbar.dart';
// import 'my_counter_app/bloc/counter_bloc.dart';
// import 'login/login_page.dart';
// import 'my_counter_app/counter_page.dart';
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
        // create: (_) => CounterBloc(),
        create: (_)=> TodoBloc(),
        // child: const CounterScreen(),
        // child: LoginPage(),
        // child: MyCounterPage(),
        child: MainScreen(),
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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ListPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: _pages[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}