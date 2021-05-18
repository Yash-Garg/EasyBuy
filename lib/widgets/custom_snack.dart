import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetBar customSnack(String? t, String m) => GetBar(
      title: t,
      message: m,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
