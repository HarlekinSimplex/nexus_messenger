import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String assemblePostBody(String message) {
  // Add your function code here!
  String time = DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now());

  message = message.replaceAll("\\", "\\\\");
//  message = message.replaceAll("'", "\\'");
  message = message.replaceAll('"', '\\"');
  message = message.replaceAll("\n", "\\n");
  message = message.replaceAll("\r", "\\r");
  message = message.replaceAll("\t", "\\t");

  String body = '{"time": "$time", "msg": "$message"}';
  return (body);
}

bool validateSettings(
  String serverLink,
  String fromAddress,
  String toAddress,
  String pollingIntervall,
) {
  // Add your function code here!

  try {
    if (pollingIntervall.isEmpty) return (false);
    if (serverLink.length > 16) {
      if (fromAddress.length == 20) {
        if (toAddress.length == 20) {
          if (int.parse(pollingIntervall) > 0) {
            return (true);
          }
        }
      }
    }
  } catch (e) {
    return (false);
  }

  return (false);
}

bool validateSendMessage(
  String fromAddress,
  String toAddress,
  String messageText,
) {
  // Add your function code here!
  if (messageText.length > 0) {
    if (fromAddress.length == 20) {
      if (toAddress.length == 20) {
        return (true);
      }
    }
  }
  return (false);
}
