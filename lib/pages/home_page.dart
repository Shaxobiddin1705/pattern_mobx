import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/pages/add_post_page.dart';
import 'package:pattern_mobx/stores/home_store.dart';
import 'package:pattern_mobx/views/item_of_posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("MobX"),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                ListView.builder(
                  itemCount: store.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(store ,store.items[index], context);
                  },
                ),
                store.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AddPostPage.id).then((value) {
                  if(value == 'done') {
                    store.apiPostList();
                  }
                });
              },
              child: const Icon(Icons.add),
            )),
    );
  }
}
