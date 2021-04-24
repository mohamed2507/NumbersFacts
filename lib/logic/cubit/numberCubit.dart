import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../data/repo/repository.dart';
import '../../data/models/Number.dart';
class NumberState
{
  int num;
  String info;
  NumberState({@required this.num,this.info});
}
class NumberCubit extends Cubit<NumberState>
{
  
  
  
  NumberCubit():super(NumberState(num: 0 ));
  void changeNum(int num) async
  {
    NumberRepository rep=NumberRepository();
    Number n=await rep.getNumber(num);
    emit(NumberState(num: n.num,info:n.info));
  }
  

}


