import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restorant_booking/controller/staff_bottom_navigation/staff_bottom_navigation_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StaffBottomNavigationBloc>(context)
        .add(GetAllStaffRestorant());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: BlocBuilder<StaffBottomNavigationBloc, StaffBottomNavigationState>(
        builder: (context, state) {
          if (state is StaffBottomNavigationInitial) {
            context
                .read<StaffBottomNavigationBloc>()
                .add(GetAllStaffRestorant());
          }
          if (state is ResortListState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      child: Image.network(state.imageOne[index].toString())),
                  title: Text(state.resortsName[index]),
                  subtitle: Text(state.price[index].toString()),
                );
              },
              itemCount: state.resortsName.length,
            );
          }
          return Center(
              child: FilledButton(
                  onPressed: () {
                    BlocProvider.of<StaffBottomNavigationBloc>(context)
                        .add(GetAllStaffRestorant());
                  },
                  child: const Text("get Data")));
        },
      ),
    );
  }
}
