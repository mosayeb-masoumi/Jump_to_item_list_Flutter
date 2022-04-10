import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jump_to_item_list_flutter/utils/textfiled.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  // source https://www.youtube.com/watch?v=VOV2V0asFaE

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newPasswordController = TextEditingController();


   final itemController = ItemScrollController();

   Future scrollToItem(int item) async {
     // itemController.jumpTo(
     itemController.scrollTo(
         index: item,
         alignment: 0.5,
         duration: Duration(seconds: 1) ,  // center location

     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("jump to specific item"),
        ),
        body: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFieldSingleton.instance.buildTextField(newPasswordController, "عدد ایتم مورد نظر را وارد نمایید...", "جستجو", 10, 5),
            ),

            RaisedButton(child: Text("جستجو"), onPressed: () {
              String item = newPasswordController.text.trim().toString();
               scrollToItem(int.parse(item));
            }),


            Expanded(
              child: ScrollablePositionedList.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) => buildCard(index),
                  itemScrollController: itemController,
              ),

            ),
          ],
        ));
  }

  Widget buildCard(int index) {
    bool isEven = index % 2 == 0;
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: isEven ? Colors.blue : Colors.green,
      child: Center(child: Text("item $index")),
    );
  }
}
