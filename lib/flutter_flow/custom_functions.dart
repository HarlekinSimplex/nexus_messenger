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
  String time = DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());

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

  message = message.trim();
  nickname = nickname.trim();

  String body = '{"time":"$time","nick":"$nickname","msg":"$message"}';
  return (body);
}

bool validateSettings(
  String serverLink,
  int pollingIntervall,
  String nickName,
) {
  // Add your function code here!

  if (nickName.replaceAll(' ', '').isEmpty) return (false);
  if (pollingIntervall == 0) return (false);
  if (serverLink.length <= 16) return (false);
  return (true);
}

bool validateSendMessage(String messageText) {
  // Add your function code here!
  if (messageText.replaceAll(' ', '').isEmpty) return (false);
  if (messageText.length > 200) return (false);
  return (true);
}
