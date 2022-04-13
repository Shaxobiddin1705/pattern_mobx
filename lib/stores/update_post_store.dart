import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/services/http_service.dart';

part 'update_post_store.g.dart';

class UpdatePostStore = _UpdatePostStore with _$UpdatePostStore;

abstract class _UpdatePostStore with Store{

  @observable TextEditingController titleController = TextEditingController();
  @observable TextEditingController bodyController = TextEditingController();
  @observable bool isLoading = false;

  void updatePost(context) async{
    isLoading = true;
    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body);
    if(title.isNotEmpty && body.isNotEmpty) {
      await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((value){
        getResponse(context);
      });
    }
  }

  void getResponse(context) {
    isLoading = false;
    Navigator.pop(context, 'done');
  }

}