import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> loadUersListJson() async {
  String UersList =
      rootBundle.loadString("lib/UersData/UsersList.json").toString();
  return await UersList;
}
