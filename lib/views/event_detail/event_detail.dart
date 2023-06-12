import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/models/feed_model.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';

// class EventDetails extends StatelessWidget {
//   final DocumentSnapshot eventSnap;
//   const EventDetails({super.key, required this.eventSnap});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Event Details",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
//         ),
//       ),
//       body: ListView(
//         children: [
//           // Image.network(
//           //  eventSnap[],
//           //   width: double.infinity,
//           // )
//           Text(eventSnap["event_name"])
//         ],
//       ),
//     );
//   }
// }

class EventDetails extends StatelessWidget {
  final DocumentSnapshot eventSnap;

  static const String path = "lib/src/pages/bike/bike_details.dart";

  final TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);

  const EventDetails({super.key, required this.eventSnap});
  @override
  Widget build(BuildContext context) {
    String title = eventSnap['event_name'];

    List<String> imageUrls = [];
    List<String> tagsList = [];

    try {
      List media = eventSnap.get('media') as List;

      media.forEach((element) {
        if (element['isImage']) {
          imageUrls.add(element['url']);
        }
      });
    } catch (e) {
      print(e);
      imageUrls = [
        "https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1"
      ];
    }

    try {
      tagsList = (eventSnap.get('tags') as List<dynamic>)
          .map((e) => e as String)
          .toList();
    } catch (e) {
      tagsList = [];
    }

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
                        child: PageView(
                          children: [
                            ...imageUrls
                                .map((e) => Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                    ))
                                .toList()
                          ],
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
                            "${int.parse(eventSnap['price']) == 0 ? "FREE" : "PAID"}"),
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
                          "${eventSnap['description']}",
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
                            "${eventSnap["date"]}",
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
                            "${eventSnap['start_time']} - ${eventSnap['end_time']}",
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
                            "${eventSnap['location']}",
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
                            "${eventSnap['max_entries']}",
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
                            "Rs. ${eventSnap['price']}",
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
                          title: const Text("Tags"),
                          subtitle: Row(
                            children: [
                              ...tagsList
                                  .map(
                                    (tag) => Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 10.w, top: 10.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7.w, vertical: 2.h),
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          color: Pallete.whitegrey
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15.w)),
                                      child: Text(
                                        "#${tag as String}",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Pallete.black),
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
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
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h, right: 20.w),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blue,
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w)),
                icon: const Icon(Icons.app_registration),
                label: const Text("Register Now"),
                onPressed: () {},
              ),
            ),
          )
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
