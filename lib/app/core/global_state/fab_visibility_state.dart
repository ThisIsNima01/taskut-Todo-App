import 'package:flutter/cupertino.dart';

class FabChanged extends Notification {
  final bool visibility;
  FabChanged(this.visibility);
}
