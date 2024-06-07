/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:travel/model/country.dart';

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

  buildText(String title, String info) {
    return RichText(
        maxLines: 1,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextSpan(
              text: info,
              style: TextStyle(fontSize: 10, overflow: TextOverflow.ellipsis)),
        ]));
  }

  buildDivider(double val) {
    return Divider(
      height: 30,
      endIndent: val,
      color: Colors.black,
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
                    child: Icon(
                      Icons.airplanemode_active,color: Colors.white,
                      size: 64,
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
                        Color.fromARGB(255, 185, 236, 252), 'VIP Ticket'),
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
                          deviceSize, Color.fromARGB(255,255, 215, 0), 'Business Ticket'),
                    ))),
            Positioned(
                top: 3 * deviceQuarter + 2 * deviceSize.height * 0.25,
                left: 0,
                child: Opacity(
                  opacity: econmicAnimation.value,
                  child: Transform.translate(
                     offset:Offset(0,150*(1-econmicAnimation.value as double)),
                    child: ticketWidget(deviceSize,
                        Color.fromARGB(255,192, 192, 192), 'Econimic Ticket'),
                  ),
                )),
            //....................................................
          ],
        ),
      ),
    );
  }

  TicketWidget ticketWidget(Size deviceSize, Color col, String txt) {
    return TicketWidget(
      height: deviceSize.height * 0.25,
      width: (deviceSize.width / 2 - 5) * 0.8,
      color: col,
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
    );
  }
}*/
