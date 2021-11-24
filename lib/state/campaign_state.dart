import 'package:flutter/material.dart';
import 'package:gngappv1/models/camp_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CampaignState with ChangeNotifier {
  LocalStorage storage = new LocalStorage('usertoken');

  List<CampaignModel> _campaign = [];

  Future<bool> getCampaigns() async {
    var url = Uri.parse("https://sdp4.pythonanywhere.com/api/campaign/");

    var token = storage.getItem('token');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<CampaignModel> temp = [];
      data.forEach((element) {
        CampaignModel product = CampaignModel.fromJson(element);
        temp.add(product);
      });
      _campaign = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
