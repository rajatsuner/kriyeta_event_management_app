import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:kriyeta_event_manage/views/view_my_event/view_my_event.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  List<String> createdEventList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Created Events",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),

              StreamBuilder(
                stream: _users
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    List<String> eventIdList =
                        (streamSnapshot.data!["createdEvents"] as List)
                            .map((e) => e as String)
                            .toList();

                    return ListView.builder(
                        itemCount: eventIdList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CreatedEventsTab(eventId: eventIdList[index]);
                        });
                  }

                  return Container(
                    height: 50.h,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "No Events",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w300),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Registered Events",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Center(
              //     child: Text(
              //         "It will show events created and joined by the user. Also he/she can edit the events info and can add more details like timeline, speakers, judges"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatedEventsTab extends StatefulWidget {
  String eventId;
  CreatedEventsTab({super.key, required this.eventId});

  @override
  State<CreatedEventsTab> createState() => _CreatedEventsTabState();
}

class _CreatedEventsTabState extends State<CreatedEventsTab> {
  final CollectionReference _events =
      FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _events.doc(widget.eventId).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          Map<String, dynamic> eventData =
              streamSnapshot.data!.data() as Map<String, dynamic>;
          print(streamSnapshot.data!.data() as Map<String, dynamic>);

          String title = eventData["event_name"];
          String location = eventData["location"];
          String date = eventData["date"];

          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyEventDetails(
                    eventData: eventData,
                  );
                }));
              },
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.edit_location),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(location)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.date_range),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(date)
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )

              // Container(
              //   height: 100.h,
              //   decoration: BoxDecoration(
              //       color: Pallete.white,
              //       border: Border.all(color: Pallete.whitegrey),
              //       borderRadius: BorderRadius.circular(15.w),
              //       boxShadow: [
              //         BoxShadow(
              //             offset: Offset(0, 5),
              //             spreadRadius: 0.5,
              //             blurRadius: 2,
              //             color: Pallete.whitegrey)
              //       ]),
              //   child: Column(
              //     children: [
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              //         child: Column(
              //           children: [
              //             Text(
              //               title,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 18.sp),
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Icon(Icons.edit_location),
              //                     SizedBox(
              //                       width: 3.w,
              //                     ),
              //                     Text(location)
              //                   ],
              //                 ),
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Icon(Icons.date_range),
              //                     SizedBox(
              //                       width: 3.w,
              //                     ),
              //                     Text(date)
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 5.h,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              );
        }

        return Container(
          height: 50.h,
          width: double.infinity,
          child: Center(
              child: CircularProgressIndicator(
            color: Pallete.blue,
          )),
        );
      },
    );
  }
}
