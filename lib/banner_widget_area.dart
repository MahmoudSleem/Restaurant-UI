import 'package:flutter/material.dart';

class BannerWidgetArea extends StatefulWidget {
  @override
  _BannerWidgetAreaState createState() => _BannerWidgetAreaState();
}

var bannerItems = ['Burger', 'Cheese_Chilly', 'Noodles', 'Pizza'];
var bannerImages = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg"
];

class _BannerWidgetAreaState extends State<BannerWidgetArea> {
  @override
  Widget build(BuildContext context) {
    PageController _controlller =
        PageController(viewportFraction: 0.8, initialPage: 1);
    List<Widget> banners = new List<Widget>();
    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 1.6),
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  bannerImages[x],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bannerItems[x],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text('More than 50% off', style: TextStyle(fontSize: 12, color: Colors.white),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: PageView(
          controller: _controlller,
          scrollDirection: Axis.horizontal,
          children: banners),
    );
  }
}
