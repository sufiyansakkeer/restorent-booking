import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restorant_booking/view/edit_resorts.dart';

import 'package:restorant_booking/view/resort_view.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/staff_bottom_navigation/staff_bottom_navigation_bloc.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(LogOutEvent(context: context));
              },
              icon: const Icon(
                Icons.exit_to_app,
              ))
        ],
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
                    backgroundImage: NetworkImage(
                        state.resortList[index].imageOne.toString()),
                  ),
                  title: Text(state.resortList[index].resortName),
                  subtitle: Text(state.resortList[index].price.toString()),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ResortView(resortsListModal: state.resortList[index]),
                    ));
                  },
                );
              },
              itemCount: state.resortList.length,
            );
          } else if (state is StaffLoading) {
            return const Center(
              child: CircularProgressIndicator(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RandomScreen(),
          ));
        },
      ),
    );
  }
}
