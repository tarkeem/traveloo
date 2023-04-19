 
 import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:travel/view/screens/traveldetailsSc.dart';
 
 TicketWidget ticketWidget(Size deviceSize, Color col, String txt,cxt) {
    return TicketWidget(
      height: deviceSize.height * 0.25,
      width: (deviceSize.width / 2 - 5) * 0.8,
      color: col,
      child: GestureDetector(
        onTap: () {
          Navigator.of(cxt).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(opacity: animation,child: traveldetailsScreen(),);
          },));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              txt,
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }