import 'dart:io';

import 'package:flutter/services.dart';

class EventMediaModel {
  File? image;
  File? video;
  bool? isVideo;
  Uint8List? thumbnail;
  EventMediaModel({this.image, this.video, this.isVideo, this.thumbnail});
}
