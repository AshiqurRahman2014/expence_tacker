
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/expence_model.dart';

class MultiScreenProvider extends ChangeNotifier{
  late int total;

  List<ExpenseModel>foodExpenceList=[];

  void getFoodExpence(String catagory)async{
    foodExpenceList=await DbHelper.getFoodExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>travelExpenceList=[];

  void getTravelsExpence(String catagory)async{
    travelExpenceList=await DbHelper.getTravelsExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>educationExpenceList=[];

  void getEducationExpence(String catagory)async{
    educationExpenceList=await DbHelper.getEducationExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>medicalExpenceList=[];

  void getMedicalExpence(String catagory)async{
    medicalExpenceList=await DbHelper.getMedicalExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>mobileBillCostExpenceList=[];

  void getMobileBillCostExpence(String catagory)async{
    mobileBillCostExpenceList=await DbHelper.getMobileBillCostExpence(catagory);
    notifyListeners();
  }

}