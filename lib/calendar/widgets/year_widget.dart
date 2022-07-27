import 'package:flutter/material.dart';

class YearWidget extends StatelessWidget {
const YearWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Expanded(  
        child: Center(  
          child: Column(  
             children: [
               Text(
                 'Center',
                 style: Theme.of(context).textTheme.headline3,
               ),
             ],

          ),
        ),
      ),
    );
  }
}