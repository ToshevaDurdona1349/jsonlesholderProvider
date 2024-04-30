import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/creat_viewmodel.dart';

class CreatPage extends StatefulWidget {
  const CreatPage({super.key});

  @override
  State<CreatPage> createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  CreatViewModel creatViewModel =CreatViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>creatViewModel,
        child:  Consumer<CreatViewModel>(
        builder: (ctx,model,index)=>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Creat Post"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: creatViewModel.titleController,
                decoration: InputDecoration(
                    hintText: "Title"
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: creatViewModel.bodyController,
                decoration: InputDecoration(
                    hintText: "Body"
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    creatViewModel.creatPost(context);
                  },
                  child: Text("Creat"),
                )
            ),
          ],
        ),
      ),
    ),
        ),
    );
  }
}