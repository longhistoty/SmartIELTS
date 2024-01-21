import 'package:flutter/material.dart';
import 'package:ielts_smart/AuthScreen.dart';
import 'package:ielts_smart/TestScreen.dart';

import 'MenuScreen.dart';

class IeltsSmart extends StatefulWidget {
  IeltsSmart({Key? key}) : super(key: key);

  @override
  State<IeltsSmart> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IeltsSmart> {
  @override
  Widget build(BuildContext context) {

    Widget _random() {
      return Container(
        padding: EdgeInsets.only(top: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 350,
            height: 130,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  topLeft: Radius.circular(70)),
              color: Colors.greenAccent.shade100,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Generate random \n IELTS test",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }

    Widget _tests() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Choose test", style: TextStyle(fontSize: 30),),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Container(
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestScreen()),
                  );
                },
                child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text("Test 1. Bla bla bla"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ))
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Colors.purple.shade200,
          titleSpacing: 40,
          title: Text("SMART IELTS",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          leading: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Menu(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset(0.0, 0.0);
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        }));
              }),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10, left: 0),
              child: IconButton(
                icon:
                    Icon(Icons.exit_to_app, size: 38, color: Colors.deepPurple),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          _random(),
          SizedBox(
            height: 20,
          ),
              _tests(),
        ])),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 45,
              ),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}