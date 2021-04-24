import "../dataprovider/dataprovider.dart";
import '../models/Number.dart';
class NumberRepository
{
  NumberDataProvider numberDataProvider=NumberDataProvider();
  Future <Number> getNumber(int num) async
  {

    final dynamic numberTrivia=await numberDataProvider.getNumber(num);

    print(numberTrivia);
    final Number number=Number(num: num,info: numberTrivia);
    return number;
  }
}