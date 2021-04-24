import 'package:flutter/material.dart';
import 'logic/cubit/numberCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider <NumberCubit>(
      create:(context)=>NumberCubit(),
      child:
       MaterialApp(
      title: 'Flutter Bloc Architecture',

      
      home: MyHomePage(title: 'Numbers Trivia'),
    )
    ); 
   
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color boxColor=Colors.blue[400];
  bool err=false;

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child:Text(widget.title)),
      ),
      body: Center(
        child: Wrap(
          alignment:WrapAlignment.center,
          children: [
            
            
              Text(
              err?"Please make sure you entered a number":"",
              style: TextStyle(
                color: Colors.red[400]
              ),
              ),
              
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 5),
              child:TextField(
                decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: boxColor,
                  )
                ),
                  hintText: "Enter a number"
                ),
                controller:numberController ,
              ),
            ),
            //error Text


  
            ElevatedButton(

              onPressed: ()
              {
                try {
                  BlocProvider.of<NumberCubit>(context).changeNum(int.parse(numberController.text));
                  setState(() {
                    boxColor=Colors.blue[400] ;
                    err=false;                  
                  });
                }on FormatException catch(e){
                  setState(() {
                    boxColor=Colors.red[400] ;
                    err=true;                  
                  });
                }
              },
               child:Text(
                 "Search"
               )
               ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[400])
                ),
                width: MediaQuery.of(context).size.width*0.8,
                height:MediaQuery.of(context).size.height*0.4 ,

                child:Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 12),
                      child:Text("Trivia",
                        style: TextStyle(
                        fontSize: 22,
                      )
                    ),
                    ),
                    BlocBuilder<NumberCubit,NumberState>
                  (
                    builder: (context,state)
                    {
                      return Container(
                        child:Text(
                          state.info!=null?state.info:"",
                          style: TextStyle(
                            fontSize: 17, 
                            fontFamily: "Times new roman"
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      );
          
                    }
                  ),
                  ],
                )
                )

          ],
        ),

      )
    );
  }
}
