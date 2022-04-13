
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/pages/update_post_page.dart';
import 'package:pattern_mobx/stores/home_store.dart';

Widget itemOfPost(HomeStore store, Post post, context) {
  return Slidable(
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(post.body!),
        ],
      ),
    ),
    startActionPane: ActionPane(
      extentRatio: 0.3,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Update',
          backgroundColor: Colors.indigo,
          icon: Icons.edit,
          onPressed: (_) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePostPage(post: post,))).then((value){
              if(value == 'done') {
                store.apiPostList();
              }
            });
          },
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      extentRatio: 0.3,
      children: [
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (_) {
            store.apiPostDelete(post);
          },
        ),
      ],
    ),
  );
}