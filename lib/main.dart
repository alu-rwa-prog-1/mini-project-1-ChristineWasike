import 'package:ecommerce_app/global.dart';
import 'package:ecommerce_app/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Ecommerce",
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: Home(),
      routes: {
        '/details': (context) => Details(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  // TODO: implement createState
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Mixed background

    // Drawer
    Widget drawerSection = Row(
     children: <Widget>[
       ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Text('Safari'),
             decoration: BoxDecoration(
               color: Colors.green[500],
             ),
           ),
           ListTile(
             title: Text('Game drives'),
             onTap: () {
               // Update the state of the app
               // Closing the drawer
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: Text('Bird watching'),
             onTap: () {
               // Update the state of the app
               // Closing the drawer
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: Text('Safari walks'),
             onTap: () {
               // Update the state of the app
               // Closing the drawer
               Navigator.pop(context);
             },
           ),
         ],
       ),
     ],
    );



    Widget background = Row(
      children: <Widget>[
        Flexible(
          child: Container(color: darkBg),
          flex: 3,
        ),
        Flexible(
          child: Container(color: lighterBg),
        )
      ],
    );

    // My appbar
    Widget appBar = Row(
      children: <Widget>[
        // drawerSection,
        // IconButton(
        //   // padding: EdgeInsets.only(left: 5),
        //     icon: Icon(
        //         CupertinoIcons.bars,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {},
        // ),
        // Spacer(),
        // App Title
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Eco",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.3),
              ),
              TextSpan(
                text: "mmerce",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 31,
                    letterSpacing: 1.3),
              ),
            ],
          ),
        ),

        Spacer(),

        // Search button
        IconButton(
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            onPressed: () {}),

        // Border Option Icon
        IconButton(
            icon: Icon(
              FontAwesomeIcons.borderAll,
              color: Colors.white,
            ),
            onPressed: () {}),
      ],
    );

    // Rendering Widgets
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Calling the background widget
            background,

            Container(
                padding: EdgeInsets.only(left: 21, right: 21, top: 15),
                child: Column(children: <Widget>[
                  // Calling the appBar widget
                  appBar,
                  SizedBox(
                    height: 15.0,
                  ),
                  Menu(),
                  Spacer(),
                  Flexible(
                    flex: 7,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (ctx, id) {
                        return MyProductContainer(id: id);
                      },
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: MyBottomNavBar(),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

// Menu Tabs
class _MenuState extends State<Menu> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      // A form of loop to display the three categories
      children: List<Widget>.generate(
        3,
        (i) {
          return InkWell(
            onTap: () {
              setState(() {
                active = i;
              });
            },
            child: Column(
              children: <Widget>[
                Text(
                  categories[i],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          active == i ? FontWeight.bold : FontWeight.w100,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                active == i
                    ? Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: accent,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(
                        height: 7,
                        width: 7,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyProductContainer extends StatelessWidget {
  final int id;

  const MyProductContainer({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(15.0),
                      child: Image.network(
                        products[id]["pictureLink"],
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        color: productColors[id],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accent,
                          boxShadow: [
                            BoxShadow(
                                color: accent,
                                offset: Offset(0, 3),
                                blurRadius: 5.0)
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              products[id]["productName"],
              style: TextStyle(fontSize: 19, color: Colors.grey),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              products[id]["price"],
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home, color: accent),
              SizedBox(
                width: 9.0,
              ),
              Text(
                "Home",
                style: TextStyle(color: accent),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
