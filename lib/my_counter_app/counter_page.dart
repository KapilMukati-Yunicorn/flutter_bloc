import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../my_counter_app/bloc/counter_state.dart';
import '../my_counter_app/bloc/counter_event.dart';
import './bloc/counter_bloc.dart';

class MyCounterPage extends StatelessWidget {
  const MyCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (context, state) {
            //     return Text(
            //       state.count.toString(),
            //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //     );
            //   },
            // ),

            // const SizedBox(height: 20),
            // Bloc Listener -> side Effect
            // BlocListener<CounterBloc, CounterState>(
            //   listener: (context, state) {
            //     if (state.count % 5 == 0 && state.count != 0) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("count reached ${state.count}!")),
            //       );
            //     }
            //   },
            //   child: Container(),
            // ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.count == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("You reached ${state.count}")),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  "Consumer Counter : ${state.count}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),

            SizedBox(height: 20),
            BlocSelector<CounterBloc, CounterState, bool>(
              selector: (state) => state.count % 2 == 0,
              builder: (context, isEven) {
                return Text(
                  isEven ? 'Even' : 'Odd',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => counterBloc.add(IncrementCounter()),
                  child: Icon(Icons.add),
                ),

                FloatingActionButton(
                  onPressed: () => counterBloc.add(DecrementCounter()),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
