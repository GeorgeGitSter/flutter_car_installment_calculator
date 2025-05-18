// ignore_for_file: sort_child_properties_last

import 'dart:io';
import 'package:flutter_speed_ui_app/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class InputScreenUI extends StatefulWidget {
  const InputScreenUI({super.key});

  @override
  State<InputScreenUI> createState() => _InputScreenUIState();
}

class _InputScreenUIState extends State<InputScreenUI> {
  // ตัวแปรควบคุม TextField
  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _interestCtrl = TextEditingController();

  // ตัวแปรควบคุม Radio
  int _downCtrl = 10;

  // ตัวแปรควบคุม Dropdown
  int _mouthCtrl = 24;

  // ตัวแปรเก็บรูปภาพที่เลือกจากกล้อง
  File? _imageFile;

  //-----------------------------------------------------------------

  // Alert Dialog Method
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(
          msg,
        ),
        actions: [
          //  TextButton ปุ่มไม่มีพื้นหลัง
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  // Result Screen UI Method

  // Open Camera Method
  _openCamera() async {
    final pickerimage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickerimage == null) return;

    // setState มีผลต่อการแสดงผล
    setState(() {
      _imageFile = File(pickerimage.path);
    });
  }

  // Open Gallery Method
  _openGallery() async {
    final pickerimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickerimage == null) return;

    setState(() {
      _imageFile = File(pickerimage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "CI Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'คำนวณค่างวดรถ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        )),
                    child: InkWell(
                      onTap: () {
                        // open snackbar to select image
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    _openCamera();
                                  },
                                  leading: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Open Camera',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    _openGallery();
                                  },
                                  leading: Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Open Gallery',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: _imageFile == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/img02.png',
                                width: 150,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _imageFile!,
                                width: 150,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ราคารถ (บาท)',
                    ),
                  ),
                  TextField(
                    controller: _carPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'จำนวนเงินดาวน์ (%)',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 10,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "10",
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 20,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "20",
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 30,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "30",
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 40,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "40",
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 50,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "50",
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(() {
                              _downCtrl = value!;
                            });
                          },
                          value: 60,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          "60",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ระยะเวลาผ่อน (เดือน)',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: DropdownButton<int>(
                        value: _mouthCtrl,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (int? value) {
                          setState(() {
                            _mouthCtrl = value!;
                          });
                        },
                        items: <int>[
                          24,
                          36,
                          48,
                          60,
                          72,
                        ].map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              '$value เดือน',
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'อัตราดอกเบี้ย (%/ปี)',
                    ),
                  ),
                  TextField(
                    controller: _interestCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // validate UI หากมีปัญหาแสดง alert dialog
                      if (_carPriceCtrl.text.isEmpty) {
                        _warningDialog("ป้อนราคารถด้วย!!!");
                      } else if (_interestCtrl.text.isEmpty) {
                        _warningDialog("ป้อนอัตราดอกเบี้ยด้วย!!!");
                      } else {
                        //แปลง textfield เป็น ตัวเลข (double = เลขจํานวนทศนิยม)
                        double carPrice = double.parse(_carPriceCtrl.text);
                        double interest = double.parse(_interestCtrl.text);
                        // ยอดจัด = ราคารถ - เงินดาวน์
                        double balance = carPrice - (carPrice * _downCtrl / 100);
        
                        // ดอกเบี้ยที่ต้องจ่ายทั้งหมด = ( ยอดจัด * อัตราดอกเบี้ย / 100 / 12 ) * จำนวนเดือนที่ผ่อน
                        double totalInterest =
                            (balance * interest / 100 / 12) * _mouthCtrl;
        
                        //ยอดที่ต้องผ่อนต่อเดือน = ( ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด ) / จำนวนเดือนที่ผ่อน
                        double payPerMouth =
                            (balance + totalInterest) / _mouthCtrl;
        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreenUI(
                              carPrice: carPrice,
                              payPermouth: payPerMouth,
                              month: _mouthCtrl,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'คำนวณ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _carPriceCtrl.text = "";
                        _downCtrl = 10;
                        _mouthCtrl = 24;
                        _interestCtrl.text = "";
                      });
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
