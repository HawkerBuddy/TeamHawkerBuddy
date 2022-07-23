
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';
import 'package:hawker_buddy/data/models/IDdetails.dart';
import 'package:hawker_buddy/data/models/orders_made.dart';

class DataController {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static List<String> SliderText = [""];
  static List<String> CanteenName = [""];
  static List<String> StallsID = [""];
  static List<String> StallsUrl = [""];
  static List<String> PGPStallNames = [""];
  static List<String> PGPStallDes = [""];
  static List<List<String>> PGPFoodName = [[""]];
  static List<List<String>> PGPFoodImgUrl = [[""]];
  static List<List<String>> PGPFoodDes = [[""]];
  static List<List<String>> PGPFoodPrice = [[""]];
  static List<List<String>> PGPFoodID = [[""]];

  static List<String> OrderStallID = [""];
  static List<String> OrderStallName = [""];
  static List<String> OrderStallImgUrl = [""];
  static List<List<String>> OrderFoodName = [[""]];
  static List<List<String>> OrderFoodURl = [[""]];
  static List<List<String>> OrderFoodDes = [[""]];
  static List<List<int>> OrderFoodSize = [[0]];

  static List<String> HistoryStallName = [""];
  static List<String> HistoryOrderTime = [""];


}