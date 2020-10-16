import 'package:flutter/material.dart';
import 'banner_widget_area.dart';
import 'belawl_list_view.dart';
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.menu),onPressed: (){},),
                    Text('Foodes' , style: TextStyle(fontSize: 54 , fontFamily: "Samantha"),),
                    IconButton(icon: Icon(Icons.person),onPressed: (){},)
                  ],
                ),
              ),
              BannerWidgetArea(),
              BelawListView(),


            ],
          ),
        )),

      ),

    );
  }
}
