import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String assemblePostBody(
  String message,
  String nickname,
) {
  // Add your function code here!
  String time = DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now());

  message = message.replaceAll("\\", "\\\\");
  message = message.replaceAll('"', '\\"');
  message = message.replaceAll("\n", "\\n");
  message = message.replaceAll("\r", "\\r");
  message = message.replaceAll("\t", "\\t");

  nickname = nickname.replaceAll("\\", "\\\\");
  nickname = nickname.replaceAll('"', '\\"');
  nickname = nickname.replaceAll("\n", "\\n");
  nickname = nickname.replaceAll("\r", "\\r");
  nickname = nickname.replaceAll("\t", "\\t");

  String body = '{"time":"$time","nick":"$nickname","msg":"$message"}';
  return (body);
}

bool validateSettings(
  String serverLink,
  int pollingIntervall,
) {
  // Add your function code here!

  if (pollingIntervall > 0) return (true);
  if (serverLink.length > 16) return (true);
  return (false);
}

bool validateSendMessage(String messageText) {
  // Add your function code here!
  if (messageText.trim().isEmpty) return (false);
  if (messageText.length > 200) return (false);
  return (true);
}
