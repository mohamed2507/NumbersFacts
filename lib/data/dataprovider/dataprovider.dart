import '../models/Number.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NumberDataProvider
{
  Future getNumber(int num) async
  {

    String n=num.toString();
    Uri uri=Uri.parse('https://numbersapi.p.rapidapi.com/$n/trivia');   
    var trivia=await http.get(uri,
    headers:{
      "Accept":"application/json",
      "X-RapidAPI-Key":"c326099addmsh7e4cb27b3f4f480p1093dbjsnd9d2b0c9624b",
      "x-rapidapi-host": "numbersapi.p.rapidapi.com",
      }
     );

    
    return trivia.body;
  }
}