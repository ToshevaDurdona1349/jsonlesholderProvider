import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ngdemo13/models/post_model.dart';
import 'package:provider/provider.dart';
import '../viewmodel/update_viewmodel.dart';

class UpdatePage extends StatefulWidget {
 final Post post;
  const UpdatePage({super.key,required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel updateViewModel =UpdateViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateViewModel.titleController.text=widget.post.title!;
    updateViewModel.bodyController.text=widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
    // keyvord ekran hohlagan joyini bossa yo'qolad
    return ChangeNotifierProvider(
        create: (context)=>updateViewModel,
        child:  Consumer<UpdateViewModel>(
        builder: (ctx,model,index)=>GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Update Post"),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: updateViewModel.titleController,
                  decoration: InputDecoration(
                      hintText: "Title"
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: updateViewModel.bodyController,
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
                      updateViewModel.updatePost(context,widget.post);
                    },
                    child: Text("Update"),
                  )
              ),
            ],
          ),
        ),
      ),
    ),));
  }
}
