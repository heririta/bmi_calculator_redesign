import 'package:flutter/material.dart';
import 'package:tugas_bmi_calculator_redesign/views/bmi_data_screen.dart';
import 'package:tugas_bmi_calculator_redesign/constants/constant.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});
  final double bmi;

  determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue >= 40) {
      category = obeseIII;
    }
    return category;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low risk (healthy range";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood presure, stroke, diabetes melitus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood presure, stroke, diabetes melitus";
        break;
      default:
    }

    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHealRiskDescription(determineBmiCategory(bmi));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        Expanded(
            child: const Center(
          child: Text(
            "Hasil Perhitungan",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
        Expanded(
          flex: 5,
          child: BMICard(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${bmi.toStringAsFixed(1)}" == null
                              ? '00.00'
                              : "${bmi.toStringAsFixed(1)}",
                          style: const TextStyle(
                              fontSize: 60, color: Colors.indigo),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bmiCategory,
                              style: TextStyle(
                                  color: bmiCategory == underweightSevere
                                      ? Colors.blue
                                      : bmiCategory == normal
                                          ? Colors.green
                                          : bmiCategory == overweight
                                              ? Colors.yellow.shade700
                                              : bmiCategory == obeseI
                                                  ? Colors.orange
                                                  : bmiCategory == obeseII
                                                      ? Colors.deepOrangeAccent
                                                      : bmiCategory == obeseIII
                                                          ? Colors.red
                                                          : null),
                            ),
                            const Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Nutritional Status',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15)),
                              color: Colors.blue,
                            ),
                            child: const Center(
                                child: Text('Underweight',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.green,
                            child: const Center(
                                child: Text('Normal \nweight',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.yellow.shade700,
                            child: const Center(
                                child: Text('Pre-Obesity',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.orange,
                            child: const Center(
                                child: Text('Obesity \nclass 1',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.deepOrangeAccent,
                            child: const Center(
                                child: Text('Obesity \nclass 2',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(15)),
                              color: Colors.red,
                            ),
                            child: const Center(
                                child: Text('Obesity \nclass 3',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('00',
                            style: TextStyle(
                              color: Colors.transparent,
                            )),
                        Text('18.5',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text('25.0',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text('30.0',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text('35.0',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text('40.0',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text('00',
                            style: TextStyle(
                              color: Colors.transparent,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: BMICard(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ]),
          ),
        )),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Color(0xffEC3C66),
            height: 80,
            child: Center(
                child: Text(
              "Hitung Ulang",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        )
      ]),
    );
  }
}
