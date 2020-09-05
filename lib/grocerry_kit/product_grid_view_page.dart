import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:japanesefoodappp/grocerry_kit/category_grid_view_Page.dart';
import 'package:japanesefoodappp/providers/collection_names.dart';
import 'package:japanesefoodappp/providers/product.dart';
import 'package:provider/provider.dart';

import 'category_products_package/add_product.dart';
import 'category_products_package/update_product.dart';

class ProductGridView extends StatefulWidget {
  final String categoryDocid;
  final String categoryName;

  ProductGridView(this.categoryDocid, this.categoryName);

  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Theme.of(context).buttonColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(widget.categoryName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddProductPage(
                    categoryDocId: widget.categoryDocid,
                  );
                }));
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("Add Product",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: categoryItems(),
      ),
    );
  }

  Widget categoryItems() {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
          stream: Firestore.instance
              .collection(category_collection)
              .document(widget.categoryDocid)
              .collection(products_collection)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final snapShotData = snapshot.data.documents;
            if (snapShotData.length == 0) {
              return Center(
                child: Text("No products added"),
              );
            }
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  );
                },
                itemCount: snapShotData.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data.documents[index];
                  ProductModel product =
                      Provider.of<Product>(context).convertToProductModel(data);
                  return Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(left: 30, top: 4, bottom: 4, right: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 110,
                          height: 110,
                          //margin: EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            maxRadius: 55,
                            backgroundColor: Theme.of(context).accentColor.withOpacity(0.7),
                            backgroundImage:
                                NetworkImage(product.productImageRef),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              Text(
                                product.productName,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                product.productDescription,
                                maxLines: 2,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "£" + product.productPrice,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return UpdateProductPage(
                                          categoryDocId: widget.categoryDocid,
                                          productModel: product,
                                        );
                                      }));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
//                                      RoundedRectangleBorder(
//                                          borderRadius: BorderRadius.circular(30.0)),
                                      alignment: Alignment.center,
                                        height: 32,
                                        width: 65,
                                        child: Text(
                                          'Edit',

                                          style: TextStyle(letterSpacing: 1.1,
                                              fontSize: 18,
                                              color:
                                                  Colors.white,fontWeight: FontWeight.w400),
                                        )),
                                  )
                                ],
                              )
                            ]))
                      ],
                    ),
                  );
//                    Column(
//                      mainAxisSize: MainAxisSize.min,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        GestureDetector(
//                          onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context){
//                              return ;
//                            }));
//                          },
//                          child: Container(
//                            margin: EdgeInsets.all(10),
//                            width: 130,
//                            height: 130,
//                            alignment: Alignment.bottomCenter,
//                            child: Image(
//                              fit: BoxFit.cover,
//                              //alignment: Alignment.topRight,
//                              image:
//                              NetworkImage(product.productImageRef),
//                            ),
//                            decoration: BoxDecoration(
//                              shape: BoxShape.rectangle,
//                              borderRadius: BorderRadius.circular(4),
//                              //color: Theme.of(context).scaffoldBackgroundColor,
//                              boxShadow: [
//                                BoxShadow(
//                                  color: Colors.black12,
//                                  offset: Offset(0, 5),
//                                  blurRadius: 15,
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                        Container(
//                          width: 130,
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            product.productName,
//                            style: TextStyle(
//                              fontSize: 17,
//                              fontWeight: FontWeight.w500,
//                              color: Colors.black54,
//                            ),
//                          ),
//                        ),
//                        Container(
//                          width: 130,
//                          child: Row(
//                            mainAxisAlignment:
//                            MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//
//                              Text(product.productPrice == '' ? " ":
//                              " "+ product.productPrice +
//                                  " SEK",
//                                style: TextStyle(
//                                  fontSize: 17,
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.bold,
//                                ),
//                              ),
//                              GestureDetector(
//                                onTap: () {
//                                  Navigator.push(context,
//                                      MaterialPageRoute(
//                                          builder: (context) {
//                                            return UpdateProductPage(
//                                              categoryDocId: widget.categoryDocid,
//                                              productModel: product,
//                                            );
//                                          }));
//                                },
//                                child: Padding(
//                                  padding: const EdgeInsets.all(2.0),
//                                  child: Icon(
//                                    Icons.edit,
//                                    size: 20,
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        )
//                      ]);
                });
          }),
    );
  }
}
