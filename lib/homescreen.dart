import 'package:cubitconnectivity/cubits/internetcubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Internet not connected"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return Text("Connected!");
              } else if (state == InternetState.Lost) {
                return Text("not connected!");
              } else {
                return Text("loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
