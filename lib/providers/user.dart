
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'collection_names.dart';


class UserModel {
  String userDocId;
  String name;
  String address;
  String phoneNumber;
  String email;

  UserModel(
      {@required this.address,
        @required this.email,
        @required this.name,
        @required this.userDocId,
        @required this.phoneNumber,});
}


class User with ChangeNotifier{

  String _name ='name';
  String _address='address';
  String _phoneNumber='phoneNumber';
  String _email = 'email';

  UserModel _userProfile ;
  UserModel get userProfile => _userProfile;
  String _userStoreId ;
  String get userStoreId => _userStoreId;

  Future<void> getCurrentUser(String currentUserId) async {
    await Firestore.instance.collection(users_collection).document(currentUserId).get().then((value){
      _userProfile = convertToUserModel(value);
    }).catchError((error) {
      throw error;
    });

    notifyListeners();
  }

  UserModel convertToUserModel(DocumentSnapshot docu) {
    var doc = docu.data;
    return UserModel(
      email: doc[_email],
      name: doc[_name],
      address: doc[_address],
      phoneNumber: doc[_phoneNumber],
      userDocId: docu.documentID
    );
  }



}