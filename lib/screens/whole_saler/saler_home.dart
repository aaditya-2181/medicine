import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medical_store/screens/whole_saler/add_medicein.dart';

class SalerHome extends StatefulWidget {
  const SalerHome({super.key});

  @override
  State<SalerHome> createState() => _SalerHomeState();
}

class _SalerHomeState extends State<SalerHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("SALER"),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddMedicien();
                    }));
                  },
                  child: Text(
                    "Add Medi",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
