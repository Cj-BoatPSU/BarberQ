import 'package:flutter/material.dart';

class ReserveInfo {
  TimeOfDay time;
  String name;
  String phone;
  bool reserved;
  bool cutService;
  bool washService;
  bool shavingService;
 ReserveInfo(this.time, this.name, this.phone, this.reserved, this.cutService, this.washService, this.shavingService);
}