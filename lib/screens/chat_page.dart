// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:chatting/classes/app_text_styles.dart';
import 'package:chatting/screens/chat_bubble.dart';
import 'package:chatting/screens/chat_bubble_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../classes/message.dart';
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  TextEditingController messageController = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  final listController = ScrollController();
  @override
  Widget build(BuildContext context) {
        var email = ModalRoute.of(context)!.settings.arguments;
        return StreamBuilder<QuerySnapshot>(stream:messages.orderBy('createdAt',descending:true).snapshots(),
            builder:(context,snapshot)
        {
         if(snapshot.hasData)
         {
           List<Message> messageList =[];
           for(int i=0;i<snapshot.data!.docs.length;i++)
           {
             messageList.add(Message.fromJson(snapshot.data!.docs[i]));
           }
           return Scaffold(
             appBar:AppBar(
               title:Row(
                 mainAxisAlignment:MainAxisAlignment.center,
                 children:
                 [
                   Padding(padding:EdgeInsets.only(right:5),child:Text('Tawaswl',style:CustomTextStyles.pacifico400style64.copyWith(fontSize:25,color:Colors.green[900]),),),
                   SizedBox(width:5.0,),

                 ],
               ),
             ),
             body:Column(
               children:
               [
                 Expanded(child:ListView.builder(
                     reverse:true,
                     controller:listController,
                     itemCount:messageList.length,
                     physics:BouncingScrollPhysics(),
                     itemBuilder:(context,index)=>messageList[index].id == email ? ChatBubble(message:messageList[index]):ChatBubbleFriend(message:messageList[index]))),
                 Padding(padding:EdgeInsets.all(16),child:TextFormField(
                   controller:messageController,
                   onFieldSubmitted:(message)
                   {
                   FirebaseFirestore.instance.collection('messages').add({
                   'message':message,
                   'createdAt': DateTime.now(),
                     'id':email
                   });
                     messageController.clear();
                     listController.animateTo(0,duration:Duration(milliseconds:500),curve:Curves.fastOutSlowIn);
                   },
                   cursorColor:Colors.grey,
                   decoration:InputDecoration(
                       hintText:'Message',
                       suffixIcon:Icon(Icons.send,color:Colors.grey,),
                       enabledBorder:OutlineInputBorder(
                         borderSide:BorderSide(color:Colors.grey),
                         borderRadius:BorderRadius.circular(16.0),
                       ),
                       focusedBorder:OutlineInputBorder(
                         borderSide:BorderSide(color:Colors.grey),
                         borderRadius:BorderRadius.circular(16.0),
                       )
                   ),
                 ),),
               ],
             ),
           );
         }else
         {
           return Center(child:CircularProgressIndicator(),);
         }
        });
  }
}