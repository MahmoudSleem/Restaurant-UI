import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.menu),onPressed: (){},),
                  Text('Foodes' , style: TextStyle(fontSize: 25 , fontFamily: "Samantha"),),
                  IconButton(icon: Icon(Icons.person),onPressed: (){},)
                ],
              )

            ],
          ),
        )),

      ),

    );
  }
}
