import 'package:flutter/material.dart';
import 'package:kriyeta_event_manage/theme/Pallete.dart';

showAuthLoader() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Pallete.whitegrey.withOpacity(0.5),
    child: Center(
      child: CircularProgressIndicator(
        color: Pallete.blue,
      ),
    ),
  );
}

showEventCreatingLoader() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Pallete.whitegrey.withOpacity(0.5),
    child: Center(
      child: CircularProgressIndicator(
        color: Pallete.blue,
      ),
    ),
  );
}
