import 'dart:ui';

import 'package:big_bite/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  accepted,
  rejected,
}

extension OrderStatusExtension on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return AppColors.grey;
      case OrderStatus.accepted:
        return AppColors.green;
      case OrderStatus.rejected:
        return AppColors.red;
      default:
        return Colors.black; // Default color in case of an undefined status
    }
  }
}
