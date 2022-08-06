import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/example/bloc/example_cubit.dart';
import 'package:flutter_boilerplate/example/bloc/example_state.dart';

class Pages extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<ExampleCubit, ExampleState>(
            builder: (context, state) {
              if(state is ExampleFetchState) {
                return Text(state.model.message);
              } else if(state is ExampleInitialState) {
                return buildhihi();
              } else {
                return Container();
              }
        }),
      )
    );
  }

  Widget buildhihi() {
    return Center(
      child: TextInputField(),
    );
  }
}

class TextInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        onSubmitted: (value) => submit(context),
      ),
    );
  }
  
  void submit(BuildContext context) {
    final repo = context.read<ExampleCubit>();
    repo.getPlayer();
  }
  
}