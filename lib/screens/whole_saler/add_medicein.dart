import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddMedicien extends StatefulWidget {
  const AddMedicien({super.key});

  @override
  State<AddMedicien> createState() => _AddMedicienState();
}

class _AddMedicienState extends State<AddMedicien> {
  final _formKey = GlobalKey<FormState>();
  // All Controller
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicinePriceController = TextEditingController();
  TextEditingController medicineQuantityController = TextEditingController();

// VAriables
  String medicineName = '';
  int medicinePrice = 0;
  int medicineQuantity = 0;

  // Clear Data fun
  clear() {
    medicineNameController.clear();
    medicinePriceController.clear();
    medicineQuantityController.clear();
  }

  // Add Data in firebase
  Future<void> addData() {
    return FirebaseFirestore.instance
        .collection('medicines')
        .add({
          "medicineName": medicineName,
          "quantity": medicineQuantity,
          "price": medicinePrice
        })
        .then((value) => print("Data Saved"))
        .catchError((error) => print("somthing went wrong $error"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffD8CDD4), Color(0xffECE6EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: medicineNameController,
                        decoration: InputDecoration(
                          labelText: "Medicine Name",
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Please enter medicine name";
                          }
                          return null;
                        },
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: medicineQuantityController,
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Please enter quantity";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: medicinePriceController,
                      decoration: InputDecoration(
                        labelText: "Price",
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 10),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Please enter price";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff3d5a80)),
                              child: Text("Clear"),
                              onPressed: () {
                                clear();
                              }),
                          ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff3d5a80)),
                              child: Text("Submit"),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    medicineName =
                                        medicineNameController.text.trim();
                                    medicinePrice = int.parse(
                                        medicinePriceController.text.trim());
                                    medicineQuantity = int.parse(
                                        medicineQuantityController.text.trim());

                                    addData();
                                    clear();
                                  });
                                }
                              })
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
