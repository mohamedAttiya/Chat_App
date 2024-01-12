import 'package:chatting/classes/message.dart';
import 'package:flutter/material.dart';
class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({super.key,required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.centerRight,
      child:Container(
        padding:EdgeInsets.only(left:16,top:32,bottom:32,right:32),
        margin:EdgeInsets.symmetric(horizontal:16,vertical:8),
        decoration:BoxDecoration(
          color:Colors.grey[800],
          borderRadius:BorderRadius.only(topLeft:Radius.circular(32),topRight:Radius.circular(32),bottomLeft:Radius.circular(32)),
        ),
        child:Text(message.message,style:TextStyle(color:Colors.white),),),
    );
  }
}