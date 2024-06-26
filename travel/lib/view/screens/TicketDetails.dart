/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:travel/model/country.dart';

import '../widget/ticketWid.dart';

class CountryDetailsScreen extends StatelessWidget {
  country countr;

  CountryDetailsScreen({required this.countr, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [appBar(), content()],
      ),
    );
  }

  Widget content() {
    return SliverList(delegate: SliverChildListDelegate([airportScheduling()]));
  }

  appBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 600,
      //toolbarHeight:600 ,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(countr.name),
        background: Hero(
          tag: countr.name,
          child: Image.network(
            countr.backGround,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}

class airportScheduling extends StatefulWidget {
  const airportScheduling({super.key});

  @override
  State<airportScheduling> createState() => _airportSchedulingState();
}

class _airportSchedulingState extends State<airportScheduling>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation planeAnimation;
  late Animation vipAnimation;
  late Animation bussinesAnimation;
  late Animation econmicAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    planeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.3, curve: Curves.decelerate)));
    vipAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.5, curve: Curves.decelerate)));
    bussinesAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 0.7, curve: Curves.decelerate)));
    econmicAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve:Interval(0.8, 0.9, curve: Curves.decelerate)));
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    double deviceQuarter = deviceSize.height * 0.25 / 3;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Container(
        color: Color.fromARGB(255, 0, 0, 0),
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                left: deviceSize.width / 2 - 5,
                child: Container(
                  color: Color.fromARGB(255, 106, 47, 215),
                  width: 10,
                )),

            Positioned(
                bottom: deviceSize.height*planeAnimation.value,
                left: deviceSize.width / 2 - 32,
                child: GestureDetector(
                  onVerticalDragEnd: (details) {
                   _animationController.forward();
                  },
                  child: Opacity(
                    opacity: 1-planeAnimation.value as double,
                    child: Transform.scale(
                      scale: lerpDouble(1, 5, planeAnimation.value),
                      child: Icon(
                        Icons.airplanemode_active,color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                )),

            //........................................................

            Positioned(
                top: deviceQuarter,
                left: 0,
                child: Opacity(
                  opacity: vipAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0,150*(1-vipAnimation.value as double)),
                    child: ticketWidget(deviceSize,
                        Color.fromARGB(255, 185, 236, 252), 'VIP Ticket',context),
                  ),
                )),
            Positioned(
                top: 2 * deviceQuarter + deviceSize.height * 0.25,
                right: 0,
                child: Opacity(
                    opacity: bussinesAnimation.value,
                    child: Transform.translate(
                      offset:Offset(0,150*(1-bussinesAnimation.value as double)),
                      child: ticketWidget(
                          deviceSize, Color.fromARGB(255,255, 215, 0), 'Business Ticket',context),
                    ))),
            Positioned(
                top: 3 * deviceQuarter + 2 * deviceSize.height * 0.25,
                left: 0,
                child: Opacity(
                  opacity: econmicAnimation.value,
                  child: Transform.translate(
                     offset:Offset(0,150*(1-econmicAnimation.value as double)),
                    child: ticketWidget(deviceSize,
                        Color.fromARGB(255,192, 192, 192), 'Econimic Ticket',context),
                  ),
                )),
            //....................................................
          ],
        ),
      ),
    );
  }

 
}
*/