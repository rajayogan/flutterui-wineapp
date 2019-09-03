import 'package:flutter/material.dart';
import 'package:wineapp/wineDetail.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wineBrands = wines;
  final recommendList = recommendWines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(children: [
        Container(
          height: 400.0,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 12.0,
                    spreadRadius: 7.0)
              ]),
        ),
        Positioned(
            top: 15.0,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                  ]),
            )),
        Positioned(
            top: 15.0,
            right: 15.0,
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                  child: Text('1',
                      style: TextStyle(fontSize: 7.0, color: Colors.white))),
            )),
        Positioned(
          top: 45.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Boutique',
                        style: TextStyle(
                            fontFamily: 'AbrilFatFace', fontSize: 25.0)),
                    Text('More',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0))
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                    height: 275.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: wineBrands.map((wine) {
                          return _buildCard(wine);
                        }).toList()))
              ],
            ),
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Recommend',
                style: TextStyle(fontFamily: 'AbrilFatFace', fontSize: 25.0)),
            Text('More', style: TextStyle(color: Colors.grey, fontSize: 12.0))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 275.0,
          width: MediaQuery.of(context).size.width,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: recommendList.map((wine) {
                return _buildCard(wine);
              }).toList()),
        ),
      )
    ]));
  }

  Widget _buildCard(wine) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WineDetail(wineDetail: wine)));
            },
            child: Container(
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 5.0,
                          color: Colors.grey.withOpacity(0.1))
                    ]),
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 250.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white)),
                    Container(
                      height: 160.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          color: wine.bgColor),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Hero(
                            tag: wine.imgPath,
                            child: Container(
                                height: 125.0,
                                width: 200.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(wine.imgPath),
                                        fit: BoxFit.contain),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)))))),
                    Positioned(
                      top: 7.0,
                      left: 7.0,
                      child: Text(wine.price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                        top: 7.0,
                        right: 10.0,
                        child: Icon(Icons.shopping_cart,
                            color: Colors.white, size: 15.0)),
                    Positioned(
                        top: 175.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(wine.title,
                                style: TextStyle(
                                  fontFamily: 'AbrilFatFace',
                                  fontSize: 14.0,
                                )),
                            SizedBox(height: 5.0),
                            Text(wine.subTitle,
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.grey)),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[
                                getRatingStar(wine.rating, 1),
                                getRatingStar(wine.rating, 2),
                                getRatingStar(wine.rating, 3),
                                getRatingStar(wine.rating, 4),
                                getRatingStar(wine.rating, 5),
                                SizedBox(width: 3.0),
                                Text(wine.rating.roundToDouble().toString(),
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF199693))),
                              ],
                            )
                          ],
                        ))
                  ],
                ))));
  }

  getRatingStar(rating, index) {
    if (index <= rating) {
      return Icon(
        Icons.star,
        color: Color(0xFF199693),
        size: 20.0,
      );
    } else {
      return Icon(
        Icons.star,
        color: Color(0xFFADDDDD),
        size: 20.0,
      );
    }
  }
}
