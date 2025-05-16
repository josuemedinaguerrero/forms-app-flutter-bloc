import 'package:flutter/material.dart';

import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(), child: _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  void _increateCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc value) => Text('BLoC Counter: ${value.state.transactionCount}')),
        actions: [
          IconButton(onPressed: () => context.read<CounterBloc>().add(CounterReset()), icon: Icon(Icons.refresh_outlined)),
        ],
      ),
      body: Center(child: context.select((CounterBloc value) => Text('Counter value: ${value.state.counter}'))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: '1', child: Text('+3'), onPressed: () => _increateCounterBy(context, 3)),
          SizedBox(height: 15),
          FloatingActionButton(heroTag: '2', child: Text('+2'), onPressed: () => _increateCounterBy(context, 2)),
          SizedBox(height: 15),
          FloatingActionButton(heroTag: '3', child: Text('+1'), onPressed: () => _increateCounterBy(context, 1)),
        ],
      ),
    );
  }
}
