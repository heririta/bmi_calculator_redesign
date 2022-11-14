import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_bmi_calculator_redesign/constants/constant.dart';
import 'package:tugas_bmi_calculator_redesign/views/bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;

  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;
    final bmi = weight / (heightInMeter * heightInMeter);
    return bmi;
  }

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(fontSize: 20),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5a1d75),
      appBar: AppBar(
        title: Center(
          child: const Text("BMI Calculator"),
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "male";
                  setState(() {});
                },
                child: BMICard(
                  borderColor: (gender == "male") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                    icon: Icons.man,
                    title: 'Male',
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {});
                },
                child: BMICard(
                  borderColor:
                      (gender == "female") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                    title: 'Female',
                    icon: Icons.woman,
                  ),
                ),
              ),
            )
          ]),
          Column(
            children: [
              Text(
                "HEIGHT",
                style: labelTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              BMICard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("$height", style: numberTextStyle),
                        Text("cm", style: labelTextStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      activeColor: Color(0xff5a1d75),
                      thumbColor: Colors.red,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              scrollController:
                                  FixedExtentScrollController(initialItem: 50),
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                weight = val + 20;
                              },
                              children: generateList(20, 220),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("AGE", style: labelTextStyle),
                    BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              scrollController:
                                  FixedExtentScrollController(initialItem: 5),
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                weight = val + 15;
                              },
                              children: generateList(15, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: ((context) {
          //               return BmiResultScreen(
          //                 bmi: calculateBmi(),
          //               );
          //             }),
          //           ),
          //         );
          //       },
          //       child: const Text('Calculate'),
          //     ),
          //   ],
          // ),
          GestureDetector(
            onTap: () {
              //print(calculateBmi());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: calculateBmi(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffEC3C66),
              ),
              height: 80,
              child: Center(
                  child: Text(
                "Hitung BMI",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor!)),
        margin: EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0xff5a1d75),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}
