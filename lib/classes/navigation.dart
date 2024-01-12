import 'package:flutter/material.dart';
Future customReplacementNavigate(context,screen)=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>screen));
Future customNavigate(context,screen)=>Navigator.push(context,MaterialPageRoute(builder:(context)=>screen));