import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';
import '../views/item_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel =HomeViewModel();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>viewModel,
        child:  Consumer<HomeViewModel>(
        builder: (ctx,model,index)=>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Provider"),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: viewModel.handleRefresh,
            child: ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (ctx, index) {
                return itemOfPost(HomeViewModel(),viewModel.posts[index] );
              },
            ),
          ),
          viewModel.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          viewModel.callCreatePage(context);
        },
      ),
    ),
    ),
    );
  }


}