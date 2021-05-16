import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_controller_state.dart';

class MusicControllerCubit extends Cubit<MusicControllerState> {
  MusicControllerCubit() : super(MusicControllerInitial());
}
