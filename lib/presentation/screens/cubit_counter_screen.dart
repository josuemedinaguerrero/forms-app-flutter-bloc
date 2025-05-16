import 'package:flutter/material.dart';

import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterCubit(), child: _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  void increateCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [IconButton(onPressed: () => context.read<CounterCubit>().reset(), icon: Icon(Icons.refresh_outlined))],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(builder: (context, state) => Text('Counter value: ${state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: '1', child: Text('+3'), onPressed: () => increateCounterBy(context, 3)),
          SizedBox(height: 15),
          FloatingActionButton(heroTag: '2', child: Text('+2'), onPressed: () => increateCounterBy(context, 2)),
          SizedBox(height: 15),
          FloatingActionButton(heroTag: '3', child: Text('+1'), onPressed: () => increateCounterBy(context, 1)),
        ],
      ),
    );
  }
}
