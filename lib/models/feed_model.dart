// ignore_for_file: public_member_api_docs, sort_constructors_first
class FeedModel {
  final String title;
  final String bannerUrl;
  final String date;
  final String time;
  final String type;
  final String venue;
  final List<String> tags;
  FeedModel(
      {required this.title,
      required this.bannerUrl,
      required this.date,
      required this.time,
      required this.type,
      required this.venue,
      required this.tags});
}
