import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Cubit Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Current Value:',
              style: TextStyle(fontSize: 20),
            ),
            // BlocBuilder<CounterCubit, CounterState>(
            //   builder: (context, state) {
            //     return Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //
            //         Text(
            //           '${state.counterValue}',
            //           style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.counterValue}',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
              listener: (context,state){
                if(state.counterValue == 3){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('counter reached 3'),
                        backgroundColor: Colors.red,

                      )
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
