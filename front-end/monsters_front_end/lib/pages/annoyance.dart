// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/API/annoyanceAPI.dart';
import 'package:http/http.dart' as http;
import 'package:monsters_front_end/model/annoyanceModel.dart';

class AnnoyanceRepository implements AnnoyanceApiDataSource{
  final client = http.Client();
  final String domain = "http://10.0.2.2:8080";
  @override
  Future<String> createAnnoyance(Annoyance annoyance) {
    return _createAnnoyance(
      Uri.parse('$domain/annoyance/create'),
      annoyance
    );
  }
  
  // @override
  // Future<Map<String, dynamic>> searchAnnoyance(String account) {
  //   return searchAnnoyance();
  // }

  Future<String> _createAnnoyance(
    Uri url,
    Annoyance annoyance,
  ) async {
    try {
      final request = await client.post(
        url,
        headers: {'Content-type':'application/json'},  
        body: annoyance.toJson()
      );
      if(request.statusCode==200){
        log(
          request.body,
          name: request.statusCode.toString(),
        );
        return request.body;
      }else {
        return request.body;
      }
     } catch (e) {
      return e.toString();
    }
  }

}

class AnnoyancePage extends StatefulWidget{
  @override
  _AnnoyancePage createState() => _AnnoyancePage();

}

class _AnnoyancePage extends State<AnnoyancePage>{
  TextEditingController accountController = TextEditingController();
  TextEditingController annoyanceController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController moodController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
    return Scaffold(
      body : Column(
        children: <Widget>[
          TextField(
            controller: accountController,
            decoration: InputDecoration(
              labelText: '請輸入帳號',
            ),
          ),
          TextField(
            controller: annoyanceController,
            decoration: InputDecoration(
              labelText: '請輸入煩惱',
            ),
          ),
          TextField(
            controller: typeController,
            decoration: InputDecoration(
              labelText: '請輸入類型',
            ),
          ),
          TextField(
            controller: moodController,
            decoration: InputDecoration(
              labelText: '請輸入心情',
            ),
          ),
          TextField(
            controller: indexController,
            decoration: InputDecoration(
              labelText: '請輸入指數',
            ),
          ),
          TextButton(
            child: Text('新增'),
            onPressed: () {
              annoyanceRepository.createAnnoyance(
                Annoyance(
                  account: accountController.text,
                  context: annoyanceController.text,
                  type: int.parse(typeController.text),
                  mood: moodController.text,
                  index: int.parse(indexController.text)
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}