

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel/constants.dart';

class seatsWidget extends StatefulWidget {
  int col,row;
  String ch;
  seatsWidget(this.col,this.row,this.ch);

  @override
  State<seatsWidget> createState() => _seatsWidgetState();
}


class _seatsWidgetState extends State<seatsWidget> {
  @override
  
  List<String>reserved=[];
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(itemCount: widget.row*widget.col,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.col), itemBuilder:(context, index) {
        
        return GestureDetector(
          onTap: () {
            setState(() {
              if(!reserved.contains(index.toString()))
              {
                 reserved.add(index.toString());
              }
              else
              {
                 reserved.remove(index.toString());
              }
             
            });
          },
          child: Container(
            child: Center(child: Text('${widget.ch} ${index+1}',style: constants().middleFontStyle,),),
          margin: EdgeInsets.all(1),
          height: 1,width: 1,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:reserved.contains(index.toString())?Colors.green:Colors.white),));
      },),
    );
  }
}