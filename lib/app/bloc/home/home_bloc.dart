import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskut/app/bloc/home/home_event.dart';
import 'package:taskut/app/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    
  }
}
