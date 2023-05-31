import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel/constants.dart';
import 'package:travel/model/airCompany.dart';
import 'package:travel/view/screens/mapScreen.dart';
import 'package:travel/view/widget/airCompany.dart';
import 'package:glass/glass.dart';
import 'package:travel/view/widget/mapSc.dart';
import 'package:travel/view/widget/seatsWid.dart';

class traveldetailsScreen extends StatefulWidget {
  const traveldetailsScreen({super.key});

  @override
  State<traveldetailsScreen> createState() => _traveldetailsScreenState();
}

class _traveldetailsScreenState extends State<traveldetailsScreen> {
  int selectedCompany = 0;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: Container(
                      key: Key(selectedCompany.toString()),
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                      child: Image.network(
                        companies[selectedCompany].CountryFlag,
                        fit: BoxFit.fill,
                      )))),
          Positioned.fill(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
                children: [
                  Expanded(child: planeDetails(deviceSize)),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
               return FadeTransition(opacity: animation,child: mapScreen(),);
              },));
                          },
                          child: Container(
                            height: 50,
                            width:100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/icons/map.png'),
                          ),
                        ),
                      )
                      
                    ],
                  )
                ],
              ),
            
          ))
        ],
      ),
    );
  }

  Widget planeDetails(Size deviceSize) {
    return Container(
      margin: EdgeInsets.all(5),
      height: deviceSize.height,
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return airCompany(companies[index].name,
                      companies[index].Price, companies[index].TakeOff);
                },
                itemCount: companies.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectedCompany = index;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  
                  children: [
                    Text('Avilable Seats',style:constants().middleFontStyle),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: seatsWidget(3, 9, 'E')),
                          Spacer(),
                          Expanded(child: seatsWidget(3, 9, 'C')),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 5,
          ),

          /* GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.black],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft)),
                          height: kToolbarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Transform.rotate(
                                  angle: (22 / 7) * 0.25,
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              Text(
                                'Confirm',
                                style: constants().bigFontStyle,
                              ),
                              Transform.rotate(
                                  angle: (22 / 7) * 0.25,
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    color: Colors.white,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                      )*/
        ],
      ),
    ).asGlass(clipBorderRadius: BorderRadius.circular(25));
  }
}
