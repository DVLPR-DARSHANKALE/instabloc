import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {
  get heighbox => SizedBox(height: this.h);
  get widthbox => SizedBox(width: this.h);
}
