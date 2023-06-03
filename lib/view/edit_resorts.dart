import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restorant_booking/bloc/get_data/get_data_bloc.dart';
import 'package:restorant_booking/model/user_model.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Random Screen"),
        ),
        body: BlocBuilder<GetDataBloc, GetDataState>(
          builder: (context, state) {
            if (state is GetLoadState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetLoadedState) {
              final data = state.usersModel.data;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(data.avatar),
                  ),
                  Text("id:  ${data.id}"),
                  Text(
                    "name: ${data.firstName} ${data.lastName}",
                  ),
                  Text("email: ${data.email}"),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<GetDataBloc>(context).add(GetAllUsersData());
              },
              child: const Text("GET "),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                // BlocProvider.of<GetDataBloc>(context).add(GetAllUsersData());
                showModalBottomSheet<void>(
                  // context and builder are
                  // required properties in this widget
                  context: context,
                  builder: (BuildContext context) {
                    // we set up a container inside which
                    // we create center column and display text

                    // Returning SizedBox instead of a Container
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BlocBuilder<GetDataBloc, GetDataState>(
                                builder: (context, state) {
                                  if (state is GetLoadedState) {
                                    return TextField(
                                      controller: textEditingController,
                                      decoration: InputDecoration(
                                        hintText: "first name",
                                        border: OutlineInputBorder(),
                                      ),
                                      onSubmitted: (value) {
                                        Data data1 = state.usersModel.data;
                                        Data data2 = Data(
                                            id: data1.id,
                                            email: data1.email,
                                            firstName: value,
                                            lastName: data1.lastName,
                                            avatar: data1.avatar);
                                        UsersModel usersModel = UsersModel(
                                            data: data2,
                                            support: state.usersModel.support);
                                        BlocProvider.of<GetDataBloc>(context)
                                            .add(PatchUserData(
                                                usersModel: usersModel));
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: Text("Nothing to patch"),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Patch"),
            ),
          ],
        ),
      ),
    );
  }
}
