import 'package:bloc/bloc.dart';


class StoredCubit extends Cubit<List<String>>{
  StoredCubit() : super(List<String>());
 void addlist(value) => state.add(value);
 void printlist() {
   for( int i = 0 ; i < state.length ; i++){
          print(state[i]);
   }
 }
}
