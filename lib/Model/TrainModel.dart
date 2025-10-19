import 'package:intl/intl.dart';

class TrainModel{
  final String trainName;
  final String fromCity;
  final String toCity;
  final String date;
  final String time;
  final String fare;
  final List<String> classes; 
  final String image;
  final String departure;
  final String arrival;
  final String trainNo;
  final List<String> seats;  


  TrainModel({
    required this.trainName,
    required this.toCity,
    required this.fromCity,
    required this.date,
    required this.fare,
    required this.time,
    required this.classes,
    required this.image,
    required this.departure,
    required this.arrival,
    required this.trainNo,
    required this.seats,
  });

  factory TrainModel.fromJson(Map<String, dynamic> Json){
    return TrainModel(
      trainName: Json['trainName'],
      toCity: Json['toCity'],
      fromCity: Json['fromCity'],
      date: Json['date'],
      fare: Json['fare'],
      time: Json['time'],
      image: Json['image'],
      departure: Json['departure'],
      arrival: Json['arrival'],
      trainNo: Json['trainNo'],
      seats: List<String>.from(Json['seats']), 
      classes: List<String>.from(Json['classes']),);}
  
  
  Map<String, dynamic> toJson() {
    return{
      'trainName': trainName,
      'fromCity': fromCity,
      'toCity': toCity,
      'date': date,
      'fare': fare,
      'time': time,
      'classes': classes,
      'image': image,
      'departure': departure,
      'arrival': arrival,
      'trainNo': trainNo,
      'seats': seats
       };}



   
  String getDuratin(){
    try{
      final format = DateFormat("hh:mm a");
      DateTime dep = format.parse(departure);
      DateTime arr = format.parse(arrival);
      if(arr.isBefore(dep)){
        arr = arr.add(Duration(days: 1));
      }
      Duration diff = arr.difference(dep);
      int hours = diff.inHours;
      int minutes = diff.inMinutes % 60;
      return "Duration ${hours}h ${minutes}m";
    }catch (e){
      return "invalid Time";
    }
  }
}