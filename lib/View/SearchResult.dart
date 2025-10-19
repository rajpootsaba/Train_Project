import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trainticketapp/Controller/HomeController.dart';
import 'package:trainticketapp/View/CustomContainer.dart';
import 'package:trainticketapp/View/SearchCustom.dart';
import 'package:trainticketapp/View/SeatSelection.dart';

class SearchResult extends StatefulWidget {
   final String fromCity;
  final String toCity;
  final String date;
  final String classes;
    final String type;
    // final String trainName;
    // final String trainNo;
    // final String departure;
    // final String arrival;
    // final String duration;
  const SearchResult({super.key, 
  required this.fromCity,
    required this.toCity,
    required this.date,
    required this.classes,
    required this.type,
    // required this.trainName, 
    // required this.trainNo,
    // required this.arrival,
    // required this.departure,
    // required this.duration
    });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final HomeController homeController = Get.find<HomeController>();
 

  @override void initState() {
    // TODO: implement initState
    super.initState();
    homeController.DateDayeList();
    homeController.trainsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:[ Column(
          children: [
            Stack(
              children:[ Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xFF015768),
              
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Search Result", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                      ],
                    ),
                  ),
                )
              ),
              Positioned(   top: 40,
                    left: 25,child: Container(height: 40, width: 40    ,decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle), child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white,)),))
           ] ),
            Expanded(
              child: Container(
                color: Colors.white,
                
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(children: [  SizedBox(height: 60), 
                  SizedBox(
                   height: 100,
                   child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.dateList.length,
                      itemBuilder: (context, index) {
                      
                        final now = DateTime.now().add(Duration(days: index));
                        final dateNumber = DateFormat("d").format(now); 
                        final dayName = homeController.dayList[index];
                    
                        return InkWell(
                          onTap: () {
                            homeController.setDateDayByIndex(index); 
                          },
                          child: Container(
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: homeController.selectedDate.value == homeController.dateList[index]
                                  ? Color(0xFF015768)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  dateNumber, 
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: homeController.selectedDate.value == homeController.dateList[index]
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  dayName, 
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: homeController.selectedDate.value == homeController.dateList[index]
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Search Result", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)],),
                 ),
                 Expanded(
                   child: ListView.builder(
                                   shrinkWrap: true,  
                                   itemCount: homeController.trainsList.length,
                                   itemBuilder: (context, index) {
                    var train = homeController.trainsList[index];
                    return InkWell(
                      onTap: () {
                        homeController.selectedTrain.value = train;
                        Get.to(() => SeatSelection(
                          fromCity: widget.fromCity,
                          toCity: widget.toCity,
                          date: widget.date,
                          classes: widget.classes,
                          type: widget.type,
                        ));
                      },
                      child: SearchCustomContainer(
                        train: train,   // 👈 bas ye ek line
                      ),
                    );
                                   },
                                ),
                 )
                              
                ],),
              )
               
                       ),
            ) ],
        ),
        Positioned(
          top: 110,
          left: 15,
          right: 15,
          child: Center(
            child: Container(
              height: 165,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.fromCity}", style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFF015768).withOpacity(0.1)),child: Icon(Icons.train, color: Color(0xFF015768)),
                        ),
                        Text("${widget.toCity}", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                 DottedLine(
  dashColor: Colors.grey,
  lineThickness: 2,
  dashLength: 6,
  dashGapLength: 4,
),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [Text("Type", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.type}")],),
                         Column(children: [Text("Class", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.classes}")],),
                          Column(children: [Text("Date", style: TextStyle(fontWeight: FontWeight.bold)), Text("${widget.date}")],),
                      ],
                    ),
                  ), ],
              ),
            ),
            
          ),
        )
      ]),
    );
  }
}