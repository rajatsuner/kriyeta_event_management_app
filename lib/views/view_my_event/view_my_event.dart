import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/models/feed_model.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';

class MyEventDetails extends StatelessWidget {
  final Map<String, dynamic> eventData;

  static const String path = "lib/src/pages/bike/bike_details.dart";

  final TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);

  MyEventDetails({super.key, required this.eventData});
  @override
  Widget build(BuildContext context) {
    String title = eventData['event_name'];

    List<Map<String, String>> timeList = [
      {"time": "4.00 pm", "program": "Event 1"},
      {"time": "4.30 pm", "program": "Event 2"},
      {"time": "5.00 pm", "program": "Event 3"}
    ];

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Event Details",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
      )),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                        height: 250.h,
                        width: double.infinity,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1614850715649-1d0106293bd1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      right: 10.0,
                      bottom: 0,
                      child: Chip(
                        elevation: 0,
                        labelStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        backgroundColor: Pallete.blue,
                        label: Text(
                            "${int.parse(eventData['price']) == 0 ? "FREE" : "PAID"}"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text(
                          "${title}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: const <Widget>[
                      //       SpecsBlock(
                      //         label: "Engine",
                      //         value: "220 cc",
                      //         icon: Icon(
                      //           Icons.apps,
                      //         ),
                      //       ),
                      //       SpecsBlock(
                      //         label: "Mileage",
                      //         value: "150 kmpl",
                      //         icon: Icon(
                      //           Icons.apps,
                      //         ),
                      //       ),
                      //       SpecsBlock(
                      //         label: "Brakes",
                      //         value: "ABS",
                      //         icon: Icon(
                      //           Icons.apps,
                      //         ),
                      //       ),
                      //       SpecsBlock(
                      //         label: "Fuel Tank",
                      //         value: "12 L",
                      //         icon: Icon(
                      //           Icons.apps,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 10.0),

                      Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text(
                          "${eventData['description']}",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text(
                          "Brief",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20.sp),
                        ),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Date"),
                          trailing: Text(
                            "${eventData["date"]}",
                            style: bold,
                          ),
                        ),
                      ),

                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Time"),
                          trailing: Text(
                            "${eventData['start_time']} - ${eventData['end_time']}",
                            style: bold,
                          ),
                        ),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Location"),
                          trailing: Text(
                            "${eventData['location']}",
                            style: bold,
                          ),
                        ),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Capacity(Seats)"),
                          trailing: Text(
                            "${eventData['max_entries']}",
                            style: bold,
                          ),
                        ),
                      ),

                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: const Text("Price"),
                          trailing: Text(
                            "Rs. ${eventData['price']}",
                            style: bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, bottom: 20.h),
                        child: Text(
                          "Speakers",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20.sp),
                        ),
                      ),
                      Container(
                        height: 80.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child: CircleAvatar(
                                  radius: 30.h,
                                  backgroundImage: NetworkImage(
                                      "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg"),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child: CircleAvatar(
                                  radius: 30.h,
                                  backgroundImage: NetworkImage(
                                      "https://assets.6sigma.us/wp-content/uploads/2017/05/bill-gates-jpg-768x516.jpg"),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child: CircleAvatar(
                                  radius: 30.h,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcThaNfoY2Y11UfcYszjJglXbiAX91b6wrbJStP6fXHLJmdEQcDWfxnwk9fGwnLhGvn9e1oHAbzCHliNGt0"),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, bottom: 20.h),
                        child: Text(
                          "Timeline",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20.sp),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: Text("${timeList[0]["program"]}"),
                          trailing: Text(
                            "${timeList[0]["time"]}",
                            style: bold,
                          ),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: Text("${timeList[1]["program"]}"),
                          trailing: Text(
                            "${timeList[1]["time"]}",
                            style: bold,
                          ),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: Text("${timeList[2]["program"]}"),
                          trailing: Text(
                            "${timeList[2]["time"]}",
                            style: bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? height;
  final double width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double elevation;

  const BorderedContainer({
    Key? key,
    this.title,
    this.child,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.width = double.infinity,
    this.elevation = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      margin: margin ?? const EdgeInsets.all(0),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16.0),
        width: width,
        height: height,
        child: title == null
            ? child
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  if (child != null) ...[
                    const SizedBox(height: 10.0),
                    child!,
                  ]
                ],
              ),
      ),
    );
  }
}
