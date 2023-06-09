// list_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_movie/post_dto.dart';
import 'package:flutter_movie/post_repository.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDTOTable>>([]);

    useEffect(() {
      PostRepository.getDTOList().then((value){
        if(value != null) {
          listState.value = value;
        }
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value.map((e) => ListItem(postDTOTable: e)).toList(),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable;

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Column(
        children: [
          Text("영화랭킹 : ${postDTOTable.rank}"),
          Divider(),
          Text("관객 수 : ${postDTOTable.auiCnt}"),
          Divider(),
          Text("영화 이름 : ${postDTOTable.movieNm}"),
          Divider(),
          Text("개봉일 : ${postDTOTable.openDt}")
        ],
      ),
    );
  }
}
