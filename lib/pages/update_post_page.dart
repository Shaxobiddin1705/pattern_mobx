import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/services/http_service.dart';
import 'package:pattern_mobx/stores/update_post_store.dart';

class UpdatePostPage extends StatefulWidget {
  UpdatePostPage({Key? key, this.post}) : super(key: key);
  static const String id = 'update_post_page';
  Post? post;

  @override
  State<UpdatePostPage> createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends State<UpdatePostPage> {
  UpdatePostStore store = UpdatePostStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.titleController = TextEditingController(text: widget.post!.title!);
    store.bodyController = TextEditingController(text: widget.post!.body!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.post != null ? Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: store.titleController,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: store.bodyController,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30,),

                  MaterialButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    minWidth: MediaQuery.of(context).size.width - 100,
                    height: 45,
                    onPressed: (){
                      store.updatePost(context);
                    },
                    child: const Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 17),),
                  ),

                ],
              ),
              store.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
            ],
          ) : const Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
