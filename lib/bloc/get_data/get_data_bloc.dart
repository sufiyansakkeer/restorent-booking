import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restorant_booking/model/user_model.dart';
import 'package:restorant_booking/repository/fake_data.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataInitial()) {
    Swagger swagger = Swagger();
    on<GetAllUsersData>((event, emit) async {
      emit(GetLoadState());
      UsersModel? usersModel = await swagger.getAllUsers();
      if (usersModel != null) {
        emit(GetLoadedState(usersModel: usersModel));
      } else {
        emit(GetNoData());
      }
    });
    on<PatchUserData>((event, emit) async {
      emit(GetLoadState());
      UsersModel? usersModel = await swagger.patchFunction(event.usersModel);
      if (usersModel != null) {
        emit(GetLoadedState(usersModel: usersModel));
      } else {}
    });
  }
}
