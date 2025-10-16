import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trainticketapp/Model/TrainModel.dart';
import 'package:trainticketapp/Utils/ProfileData.dart';
import 'package:trainticketapp/Utils/TrainData.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();

 
  TextEditingController From = TextEditingController();
  TextEditingController To = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Class = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();


  RxList<TrainModel> trainsList = <TrainModel>[].obs;

  List<String> dateList = [];
  List<String> dayList = [];



  var selectedTrain = Rxn<TrainModel>();
  var selectedSeats = <String>[].obs;
  var bookedSeats = <String>[].obs;
  var selectedClass = "".obs;
  var selectedDate = "".obs;
  var selectedDay = "".obs;
  var selectedType = "".obs; 
  var passengerName = ''.obs;
  var passengerType = ''.obs;
  var identityType = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var identityNumber = "".obs;
  var ticketPrice = 470.0;
  var selectedPaymentMethod = ''.obs;
  var selectedPassengers = <String>[].obs;
  var passenger1Name = ''.obs;
  var passenger2Name = ''.obs;
  var selectedPassenger = "".obs;
  var profileList = ProfileData;
  RxDouble subtotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;

  

  @override
  void onInit() {
    super.onInit();
    loadTrainsData();
  
  }
   void setDateDayByIndex(int index) {
    selectedDate.value = dateList[index];
    selectedDay.value = dayList[index]; }

  void loadTrainsData() {
    trainsList.value = TrainData.map((e) => TrainModel.fromJson(e)).toList();}
 

 
  void setClass(String value) {
    selectedClass.value = value;
    Class.text = value;}

  void setDateDay(String date, String day) {
    selectedDate.value = date;
    selectedDay.value = day;}

    
  void setType(String type) {
    selectedType.value = type;}

     void setSelectedTrain(TrainModel train) {
    selectedTrain.value = train;
    selectedSeats.clear(); 
    updateSummary();}

     void toggleSeat(String seat) {
    if (selectedSeats.contains(seat)) {
      selectedSeats.remove(seat);
    } else {
      selectedSeats.add(seat);
    }
    updateSummary(); }

  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void DateDayeList() {
    final now = DateTime.now();
    final dateFormatter = DateFormat("dd MMM yyyy");
    final dayFormatter = DateFormat("EEE");
    dateList.clear();
    dayList.clear();
    for (int i = 0; i < 7; i++) {
      final date = now.add(Duration(days: i));
      dateList.add(dateFormatter.format(date));
      dayList.add(dayFormatter.format(date));}
    selectedDate.value = dateList[0];
    selectedDay.value = dayList[0];}

 
void updateSummary() {
    subtotal.value = selectedSeats.length * ticketPrice;
    tax.value = subtotal.value * 0.05; // 5% tax
    totalPrice.value = subtotal.value + tax.value;
  }

  List<String> identityTypes = ['CNIC', 'Passport', 'Other'];

 
var paymentMethods = [
  {'code': 'Card', 'name': 'Credit/Debit Card'},
  {'code': 'JCash', 'name': 'JazzCash'},
  {'code': 'EPaisa', 'name': 'Easypaisa'},
  
  {'code': 'Cash', 'name': 'Cash on Counter'},
];
 




}
