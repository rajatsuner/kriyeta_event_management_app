import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kriyeta_event_manage/controller/data_controller.dart';
import 'package:kriyeta_event_manage/models/feed_model.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';
import 'package:kriyeta_event_manage/views/event_detail/event_detail.dart';

final feedFilterProvider = StateProvider((ref) => 0);

class FeedView extends ConsumerWidget {
  FeedView({super.key});

  final CollectionReference _events =
      FirebaseFirestore.instance.collection('events');

  List<FeedModel> feedList = [
    FeedModel(
        title: "Kriyeta Hackathon 2023",
        bannerUrl:
            "https://www.equalexperts.com.au/wp-content/uploads/2021/07/EE_EDA_Confluent-Blog-Asset-1170x720-1.png",
        date: "10/06/23",
        time: "8.00 am",
        type: "Hackathon",
        venue: "Block II, AITR",
        tags: [
          "Hackathon",
        ]),
    FeedModel(
        title: "Kriyeta Hackathon 2023",
        bannerUrl:
            "https://www.shutterstock.com/image-vector/thin-line-flat-design-banner-260nw-400060873.jpg",
        date: "10/06/23",
        time: "8.00 am",
        type: "Hackathon",
        venue: "Block II, AITR",
        tags: ["Meetup", "Community"]),
    FeedModel(
        title: "Kriyeta Hackathon 2023",
        bannerUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbfjPX1lDzlqiRT6mG24GlTdAGsNTjsSRoNzbqR_jDwVAgVEF9hoo4z9496hnhDm38lz95mR4EHuQ&usqp=CAU&ec=48600113",
        date: "10/06/23",
        time: "8.00 am",
        type: "Hackathon",
        venue: "Block II, AITR",
        tags: ["Meetup"]),
    FeedModel(
        title: "Kriyeta Hackathon 2023",
        bannerUrl:
            "https://www.equalexperts.com.au/wp-content/uploads/2021/07/EE_EDA_Confluent-Blog-Asset-1170x720-1.png",
        date: "10/06/23",
        time: "8.00 am",
        type: "Hackathon",
        venue: "Block II, AITR",
        tags: ["Web"])
  ];

  Widget feedCard(DocumentSnapshot documentSnapshot, BuildContext context) {
    String eventImage = '';
    try {
      List media = documentSnapshot.get('media') as List;
      Map mediaItem =
          media.firstWhere((element) => element['isImage'] == true) as Map;
      eventImage = mediaItem['url'];
    } catch (e) {
      eventImage = '';
    }

    String title = documentSnapshot['event_name'];
    String location = documentSnapshot['location'];
    String date = documentSnapshot['date'];
    List<String> tags = [];

    try {
      tags = (documentSnapshot.get('tags') as List<dynamic>)
          .map((e) => e as String)
          .toList();
    } catch (e) {
      tags = [];
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetails(
            eventSnap: documentSnapshot,
          );
        }));
      },
      child: Container(
        height: 270.h,
        decoration: BoxDecoration(
            color: Pallete.white,
            border: Border.all(color: Pallete.whitegrey),
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  color: Pallete.whitegrey)
            ]),
        child: Column(
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.w),
                      topRight: Radius.circular(15.w)),
                  image: DecorationImage(
                      image: NetworkImage(
                        eventImage,
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  Row(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      ...tags
                          .map(
                            (tag) => Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 2.h),
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: Pallete.whitegrey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15.w)),
                              child: Text(
                                "#${tag as String}",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Pallete.black),
                              ),
                            ),
                          )
                          .toList()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setFilterTagIndex(int index, WidgetRef ref) {
    ref.read(feedFilterProvider.notifier).update((state) => index);
  }

  Widget filterTag(WidgetRef ref, String text, int index, int currentIndex) {
    return GestureDetector(
      onTap: () {
        if (index == currentIndex) {
          return;
        }
        setFilterTagIndex(index, ref);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        height: 30.h,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Pallete.blue
                : Pallete.whitegrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.w)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14.sp,
              color: currentIndex == index ? Pallete.white : Pallete.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentTagIndex = ref.watch(feedFilterProvider);

    //DataController dataController = Get.find<DataController>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feeds",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
          bottom: PreferredSize(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  filterTag(ref, "This Week", 0, currentTagIndex),
                  filterTag(ref, "Next Week", 1, currentTagIndex),
                  filterTag(ref, "Next Month", 2, currentTagIndex)
                ],
              ),
              preferredSize: Size(
                360.w,
                30.h,
              )),
        ),
        body: StreamBuilder(
          stream: _events.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 20.h,
                    );
                  },
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return feedCard(documentSnapshot, context);
                  },
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
