import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController vaccineController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double? result;
  String showtext = "ไม่ได้ทำรายการสั่งซื้อ";

  void cleardata() {
    priceController.clear();
    vaccineController.clear();
    doseController.clear();
    setState(() {
      showtext = "ไม่ได้ทำรายการสั่งซื้อ";
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Container(
                  child: Image(
                    width: size,
                    image: NetworkImage(
                        "https://cdn.newsfirst.lk/english-uploads/2021/05/4c7e4ec8-a17493ab-covid-vaccines_850x460_acf_cropped.jpg"),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size * 0.7,
                      child: TextFormField(
                        controller: vaccineController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("กรุณาใส่วัคซีนที่ต้องการสั่งซื้อด้วยครับ");
                          } else {}
                        },
                        decoration: InputDecoration(
                          labelText: "กรุณาใส่วัคซีน",
                          prefixIcon: Icon(Icons.medication_outlined),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size * 0.7,
                      child: TextFormField(
                        controller: doseController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("กรุณาใส่จำนวนวัคซีนด้วยครับ");
                          } else {}
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "จำนวน(โดส)",
                          prefixIcon: Icon(Icons.medication_outlined),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size * 0.7,
                      child: TextFormField(
                        controller: priceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("กรุณาใส่ราคาของวัคซีนที่ต้องการสั่งซื้อด้วยครับ");
                          } else {}
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "ราคาโดสละ(บาท)",
                          prefixIcon: Icon(Icons.money_rounded),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size * 0.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              String vaccine = vaccineController.text;
                              String dose = doseController.text;
                              String price = priceController.text;
                              int quatity = int.parse(dose);
                              int total = int.parse(price);
                              result = (quatity * total) + (quatity * total * 0.07);

                              setState(() {
                                showtext =
                                    "คุณสั่งซื้อวัคซีน ${vaccineController.text} จำนวน ${NumberFormat("#,###").format(int.parse(doseController.text))} โดส เป็นจำนวนเงินทั้งหมด(บวกภาษี 7%) ${NumberFormat("#,###.##").format(result)} บาท";
                              });
                              print(
                                  "คุณสั่งซื้อวัคซีน ${vaccineController.text} จำนวน ${NumberFormat("#,###").format(int.parse(doseController.text))} โดส เป็นจำนวนเงินทั้งหมด(บวกภาษี 7%) ${NumberFormat("#,###.##").format(result)} บาท");
                            } else {
                              setState(() {
                                showtext = "ไม่ได้ทำรายการสั่งซื้อ";
                              });
                            }
                          },
                          child: Text(
                            'รวมราคา',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: size * 0.7,
                  child: Text(
                    showtext,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cleardata,
        child: Text(
          'ล้างข้อมูล',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ), // This trail
    );
  }
}
