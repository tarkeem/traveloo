/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:travel/constants.dart';
import 'package:travel/controller/pflightProvider.dart';
import 'package:travel/view/screens/paymentScreen.dart';
import 'package:travel/view/widget/mapSc.dart';
import 'package:flutter/material.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  bool swaped = false;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: mapWid()),
          AnimatedPositioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: swaped ? deviceSize.height * 0.7 : kToolbarHeight,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  if (details.primaryDelta! < 0) {
                    swaped = true;
                  } else {
                    swaped = false;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          !swaped ? nonSwapedWidget() : swapedWidget(context),
                        ],
                      ),
                    )),
              ),
            ),
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceOut,
          ),
          Positioned(
              right: 0,
              top: 0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: paymentScreen(),
                      );
                    },
                  ));
                },
                child: Icon(Icons.arrow_forward),
              )),
        ],
      ),
    );
  }
}

Widget swapedWidget(cxt) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ListTile(
        selectedTileColor: Colors.blue,
        leading: Text(
          'from',
          style: constants().middleFontStyle,
        ),
        trailing: Text(
          'cairo',
          style: constants().middleFontStyle,
        ),
      ),
      ListTile(
        tileColor: Colors.blue,
        leading: Text(
          'to',
          style: constants().middleFontStyle,
        ),
        trailing: Text(
          'paris',
          style: constants().middleFontStyle,
        ),
      ),
      ListTile(
        tileColor: Colors.blue,
        leading: Text(
          'plane number',
          style: constants().middleFontStyle,
        ),
        trailing: Text(
          '157EAWE',
          style: constants().middleFontStyle,
        ),
      ),
      ListTile(
        tileColor: Colors.blue,
        leading: Text(
          'Take Off',
          style: constants().middleFontStyle,
        ),
        trailing: Text(
          '5:10 AM',
          style: constants().middleFontStyle,
        ),
      ),
      ListTile(
        tileColor: Colors.blue,
        leading: Text(
          'Reserved Seats',
          style: constants().middleFontStyle,
        ),
        trailing: Text(
          Provider.of<flight>(cxt).seatsNum.toString(),
          style: constants().middleFontStyle,
        ),
      ),

    ],
  );
}

class nonSwapedWidget extends StatelessWidget {
  const nonSwapedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Start',
              style: constants().middleFontStyle,
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor: Color.fromARGB(255, 17, 51, 223),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'End',
              style: constants().middleFontStyle,
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Route',
              style: constants().middleFontStyle,
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor: Color.fromARGB(255, 0, 255, 81),
            )
          ],
        ),
      ],
    );
  }
}
*/
