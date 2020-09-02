
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:japanesefoodappp/providers/collection_names.dart';

import '../SignIn.dart';

class CouponDeliveryPage extends StatefulWidget {
  @override
  _CouponDeliveryPageState createState() => _CouponDeliveryPageState();
}

class _CouponDeliveryPageState extends State<CouponDeliveryPage> {

  final _formKey = GlobalKey<FormState>();
//  final _formKey1 = GlobalKey<FormState>();
  String _couponCode = '';
  String _discPercentage = '';
  TextEditingController _first = TextEditingController();
  TextEditingController _second = TextEditingController();
  TextEditingController _third = TextEditingController();
  TextEditingController _helpEmailController = TextEditingController();
  TextEditingController _helpNumberController = TextEditingController();
//  File _categoryImageFile;
//  void _pickedImage(File image) {
//    _categoryImageFile = image;
//  }

  @override
  void dispose() {
    _helpEmailController.dispose();
    _helpNumberController.dispose();
    _first.dispose();
    _second.dispose();
    _third.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
//        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        title: Text(
          'Admin',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
//        actions: <Widget>[
//          GestureDetector(
//              onTap: () {
//                FirebaseAuth.instance.signOut();
//                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
//                  return SignInPage();
//                }),(Route<dynamic> route) => false);
//              },
//              child: Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(right: 8.0),
//                    child: Text("Logout",style:TextStyle(color:Colors.white)),
//                  )
//                ],
//              ))
//        ],
      ),

      body: Center(
        child: Container(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

//              SizedBox(
//                height: 50,
//              ),
//              Text(
//                'Add Coupon',
//                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              Form(
//                key: _formKey,
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(
//                          left: 16, right: 16, top: 8, bottom: 8),
//                      child: TextFormField(
//                        validator: (val) {
//                          return val.trim().isEmpty
//                              ? "code cannot be empty."
//                              : null;
//                        },
//                        onSaved: (val) {
//                          _couponCode = val.trim();
//                        },
//                        keyboardType: TextInputType.text,
//                        style: TextStyle(fontSize: 18),
//                        decoration: InputDecoration(
//                          hintText: 'Coupon Code',
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(8),
//                              borderSide: BorderSide(color: Colors.grey)),
//                          focusedBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(8),
//                              borderSide: BorderSide(color: Colors.grey)),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(
//                          left: 16, right: 16, top: 8, bottom: 8),
//                      child: TextFormField(
//                        validator: (String val) {
//                          bool isNumeric(String str) {
//                            try{
////                              var value = double.parse(str);
//                                return true;
//                            } on FormatException {
//                              return false;
//                            }
//                          }
//                          if (val.trim().isEmpty) {
//                            return "Percentage cannot be empty";
//                          } else if (isNumeric(val.trim()) == false) {
//                            return "Must be a number e.g 20";
//                          }
//                          return null;
//                        },
//                        onSaved: (val) {
//                          _discPercentage = val.trim();
//                        },
//
//                        style: TextStyle(fontSize: 18),
//                        keyboardType: TextInputType.text,
//                        decoration: InputDecoration(
//                          hintText: 'Percentage',
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(8),
//                              borderSide: BorderSide(color: Colors.grey)),
//                          focusedBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(8),
//                              borderSide: BorderSide(color: Colors.grey)),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//                Container(
//                  margin: EdgeInsets.only(top: 16, bottom: 16),
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).accentColor,
//                    shape: BoxShape.rectangle,
//                    borderRadius: BorderRadius.all(Radius.circular(8)),
//                  ),
//                  width: 200,
//                  child: FlatButton(
//                    child: Text('Add coupon',
//                        style: TextStyle(fontSize: 20, color: Colors.white)),
//                    onPressed: () {
//                      if (_formKey.currentState.validate()) {
//                        //Only gets here if the fields pass
//                        _formKey.currentState.save();
//                        Firestore.instance.collection(discount_coupons_collection).add({
//                          "promoCode": _couponCode,
//                          'discPercentage':_discPercentage
//                        });
//                        setState(() {
//                          _discPercentage = '';
//                          _couponCode = "";
//                        });
//                        Scaffold.of(context).showSnackBar(SnackBar(
//                          content: Text("Coupon has been added.",
//                            style: TextStyle(color:Colors.white),),
//                          backgroundColor: Theme.of(context).accentColor,
//                        ));
//                      }
//                    },
//                  ),
//                ),
//
//            ],
//          ),
//
//          Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[SizedBox(height: 20,),
//              ///Available Coupons Section
//              Container(
//                alignment: Alignment.centerLeft,
//                padding: EdgeInsets.only(left: 16, top: 4),
//                child: Text(
//                  "Available Coupons",
//                  style: TextStyle(
//                    fontSize: 22,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//              Container(height: 150,
//                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                padding:
//                EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                decoration: BoxDecoration(
//                    border: Border.all(color: Colors.grey, width: 2),
//                    shape: BoxShape.rectangle,
//                    borderRadius: BorderRadius.circular(8),
//                    color: Colors.white70),
//                child: StreamBuilder(
//                  stream: Firestore.instance
//                      .collection(discount_coupons_collection)
//                      .snapshots(),
//                  builder: (context, AsyncSnapshot snapshot) {
//                    switch (snapshot.connectionState) {
//                      case ConnectionState.waiting:
//                        return Center(
//                            child: CircularProgressIndicator());
//                        break;
//                      default:
//                        return ListView.builder(
//                            shrinkWrap: true,
//                            physics: ClampingScrollPhysics(),
//                            //scrollDirection: Axis.horizontal,
//                            itemCount:
//                            snapshot.data.documents.length,
//                            itemBuilder: (context, index) {
//                              return Padding(
//                                padding: const EdgeInsets.all(4.0),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    Text(
//                                      "code: "+ snapshot.data.documents[index].data['promoCode'],
//                                      style: TextStyle(
//                                          fontSize: 18,
//                                          fontWeight: FontWeight.w500,
//                                          color: Colors.grey
//                                      ),
//                                    ),
//                                    Text(
//                                      snapshot.data.documents[index].data['discPercentage']+"%",
//                                      style: TextStyle(
//                                        color: Theme.of(context).primaryColor,
//                                        fontSize: 18,
//                                        fontWeight: FontWeight.w500,
//                                      ),
//                                    ),
//                                    IconButton(icon: Icon(Icons.delete),
//                                    onPressed: (){
//                                      DocumentSnapshot doc= snapshot.data.documents[index];
//
//                                      Firestore.instance.collection(discount_coupons_collection)
//                                          .document(doc.documentID)
//                                          .delete();
//                                    },
//                                    )
//                                  ],
//                                ),
//                              );
//                            });
//                    }
//                  },
//                ),
//              ),
//
//              SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                shape: BoxShape.rectangle,
                borderRadius:
                BorderRadius.all(Radius.circular(8)),
              ),
              width: 200,
              child: FlatButton(
                child: Text('Logout',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white)),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
