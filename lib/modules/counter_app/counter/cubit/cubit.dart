import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/modules/counter_app/counter/cubit/states.dart';

class countercubit extends Cubit<counterstates>
{
countercubit():super(counterinitialstate());

static countercubit get(context) => BlocProvider.of(context);

int counter = 1;

void minus(){
counter--;
emit(counterminusstate(counter));
}
void plus(){
  counter++;
  emit(counterplusstate(counter));
}
}