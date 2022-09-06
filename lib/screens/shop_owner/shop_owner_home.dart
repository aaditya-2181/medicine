import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopOwnerHome extends StatefulWidget {
  const ShopOwnerHome({super.key});

  @override
  State<ShopOwnerHome> createState() => _ShopOwnerHomeState();
}

class _ShopOwnerHomeState extends State<ShopOwnerHome> {
  final Stream<QuerySnapshot> mediciensStream =
      FirebaseFirestore.instance.collection('medicines').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffD8CDD4), Color(0xffECE6EA)])),
          child: StreamBuilder(
            stream: mediciensStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              // check connction state
              if (snapshot.hasError) {
                print("somthing went wrong");
              }

              // if connection is waiting
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // when all okey
              final List storedocs = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a = document.data() as Map<String, dynamic>;
                storedocs.add(a);
                a['id'] = document.id;
              }).toList();

              return Container(
                color: Colors.amber,
                child: Card(
                  child: InkWell(
                    splashColor: Color(0xffcdb4db),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                          color: Colors.black, child: Text("Hallow World")),
                    ),
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
