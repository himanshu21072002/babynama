import 'package:care_plans/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:quickalert/quickalert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> descriptionPlan1 = [
    "Pediatric Care in 15 minutes",
    'Instant chat with pediatricians on WhatsApp',
    'Free pediatrician consultations (day)',
    'Live Yoga Sessions'
  ];
  List<String> descriptionPlan2 = [
    'Pediatric care in 15 minutes, lactation, nutrition, monthly milestones, emergency support',
    'Everything in Basic Care',
    '24x7 free pediatrician consultations',
    'Monthly growth and milestones tracking by pediatrician',
    'Lactation and Weaning Support'
  ];
  List<String> descriptionPlan3 = [
    'Dedicated pediatrician for your baby, personal care plan, Best possible baby care',
    'Everything included in the PRIME Plan',
    'Dedicated pediatrician just for your baby',
    'Personalized care plan for your baby and you',
    'All Consultations and workshops free*',
    'We keep adding new services to provide more value to you'
  ];

  bool isClick1 = false;
  bool isClick2 = false;
  bool isClick3 = false;
  bool is1Month = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1e293b),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0f172a),
          centerTitle: true,
          title: GradientText(
            "Babynama",
            colors: const [Colors.blue, Colors.orange],
            style: TextStyle(fontSize: height * 0.03),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Center(
                child: Text(
              'Our Care Plans',
              style: TextStyle(
                  fontSize: height * 0.04,
                  color: const Color(0xFFbfdbfe),
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * 0.22,
                    height: height * 0.05,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: is1Month
                                ? Colors.blue
                                : Colors.white // background// foreground
                            ),
                        onPressed: () {
                          setState(() {
                            is1Month = true;
                          });
                        },
                        child: Text(
                          '1 Month',
                          style: TextStyle(
                              fontSize: width * 0.034,
                              color: is1Month ? Colors.white : Colors.blue),
                        ))),
                SizedBox(
                  width: width * 0.03,
                ),
                SizedBox(
                  width: width * 0.23,
                  height: height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: is1Month
                          ? Colors.white
                          : Colors.blue, // background// foreground
                    ),
                    onPressed: () {
                      setState(() {
                        is1Month = false;
                      });
                    },
                    child: Text(
                      '3 Months',
                      style: TextStyle(
                          fontSize: width * 0.034,
                          color: is1Month ? Colors.blue : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ReusableCard(
              height: height,
              width: width,
              carePlanTitle: "Basic Care",
              planDescription: descriptionPlan1,
              price: is1Month ? '999' : '2499',
              period: is1Month ? 'Per Month' : 'Per 3 Months',
              refund: is1Month ? "" : '10 days Refund Policy',
              isClick: isClick1,
              widget: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isClick1 = isClick1 ? false : true;
                        });
                      },
                      child: Text(
                        isClick1?'Know Less':'Know More',
                        style: TextStyle(fontSize: height * 0.02),
                      )),
                  const Spacer(),
                  GetStartedButton(height: height),
                ],
              ),
            ),
            ReusableCard(
              height: height,
              width: width,
              carePlanTitle: 'Prime Care',
              planDescription: descriptionPlan2,
              price: is1Month ? '1999' : '4999',
              period: is1Month ? 'Per Month' : 'Per 3 Month',
              refund: is1Month ? '' : '10 days Refund Policy',
              isClick: isClick2,
              widget: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isClick2 = isClick2 ? false : true;
                        });
                      },
                      child: Text(
                        isClick2?'Know Less':'Know More',
                        style: TextStyle(fontSize: height * 0.02),
                      )),
                  const Spacer(),
                  GetStartedButton(height: height),
                ],
              ),
            ),
            ReusableCard(
              height: height,
              width: width,
              carePlanTitle: 'Holistic Care',
              planDescription: descriptionPlan3,
              price: is1Month ? '3998' : '9999',
              period: is1Month ? 'Per Month' : 'Per 3 Month',
              refund: is1Month ? "" : '10 days Refund Policy',
              isClick: isClick3,
              widget: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isClick3 = isClick3 ? false : true;
                        });
                      },
                      child: Text(
                        isClick3?'Know Less':'Know More',
                        style: TextStyle(fontSize: height * 0.02),
                      )),
                  const Spacer(),
                  GetStartedButton(height: height),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.payment,
                    color: Colors.green,
                  ),
                  title: const Text('Payment'),
                  content: const Text('Do you want to confirm the Payment? '),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('NO')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Transaction Completed Successfully!',
                          );
                        },
                        child: const Text('YES'))
                  ],
                );
              });
        },
        child: Text(
          'Get Started',
          style: TextStyle(fontSize: height * 0.02),
        ));
  }
}

