import 'package:flutter/material.dart';
import 'package:travel/model/country.dart';

class flight extends ChangeNotifier
{
  int seatsNum=0;
  List bookedSeats=[];
  country? seletedCountry;

  addBookedSeat(String val)
  {
    bookedSeats.add(val);
  notifyListeners();
  }
  setCountry(country val)
  {
    seletedCountry=val;
    notifyListeners();
  }
setSeatNum()
{

  seatsNum++;
  notifyListeners();
}
}