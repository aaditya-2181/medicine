import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medical_store/screens/shop_owner/shop_owner_home.dart';
import 'package:medical_store/screens/whole_saler/saler_home.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffD8CDD4), Color(0xffECE6EA)])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Color(0xff98c1d9),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SalerHome();
                }));
              },
              child: Text(
                "Whole Saler",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  color: Colors.black,
                ),
                Text("or"),
                Divider(),
              ],
            ),
            CupertinoButton(
              color: Color(0xff3d5a80),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShopOwnerHome();
                }));
              },
              child: Text("Shop Owner"),
            )
          ],
        ),
      ),
    );
  }
}
