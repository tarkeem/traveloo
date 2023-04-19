import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel/constants.dart';

class airCompany extends StatefulWidget {
  String company, price;
  List<String>takeOff;
  airCompany(this.company, this.price,this.takeOff);

  @override
  State<airCompany> createState() => _airCompanyState();
}

class _airCompanyState extends State<airCompany> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Company : ${widget.company}',style: constants().bigFontStyle,),
          Text('Price:${widget.price}',style: constants().bigFontStyle),
          Expanded(
            child: CarouselSlider.builder(itemCount: widget.takeOff.length, options: CarouselOptions(viewportFraction: 1),itemBuilder: (context, index, realIndex) {
              return Text('Take Off : ${widget.takeOff[index]}',style: constants().bigFontStyle,);
            },),
          ),
         
          
        ],
      ),
    );
  }
}
