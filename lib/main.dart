import 'package:ecommerce_app/global.dart';
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
    // TODO: implement build
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

    Widget appBar = Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Lamp",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.3),
              ),
              TextSpan(
                text: "ster",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 31,
                    letterSpacing: 1.3),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.borderAll,
              color: Colors.white,
            ),
            onPressed: () {}),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            background,
            Container(
                padding: EdgeInsets.only(left: 21, right: 21, top: 15),
                child: Column(children: <Widget>[
                  appBar,
                  SizedBox(
                    height: 15.0,
                  ),
                  Menu()
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

class _MenuState extends State<Menu> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

// Widget appBar = Row(
//   children: <Widget>[
//     RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: "Eco",
//             style: TextStyle(
//                 fontSize: 31,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.3),
//           ),
//           TextSpan(
//             text: "mmerce",
//             style: TextStyle(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 31,
//                 letterSpacing: 1.3),
//           ),
//         ],
//       ),
//     ),
//     Spacer(),
//     IconButton(
//         icon: Icon(
//           CupertinoIcons.search,
//           color: Colors.white,
//         ),
//         onPressed: () {}),
//     IconButton(
//         icon: Icon(
//           FontAwesomeIcons.borderAll,
//           color: Colors.white,
//         ),
//         onPressed: () {}),
//   ],
// );
