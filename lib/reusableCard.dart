// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.height,
    required this.width,
    required this.carePlanTitle,
    required this.planDescription,
    required this.price,
    required this.period,
    required this.refund,
    required this.widget,
    required this.isClick,
  });
  final String carePlanTitle;
  final List<String> planDescription;
  final String price;
  final String period;
  final String refund;
  final double height;
  final double width;
  final Widget widget;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      color: const Color(0xff2e3e59),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              carePlanTitle,
              style: TextStyle(
                  fontSize: height * 0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            isClick
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: planDescription.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Flexible(
                            child: Text(
                              planDescription[index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: height * 0.02),
                            ),
                          ),
                        ],
                      );
                    })
                : Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Flexible(
                        child: Text(
                          planDescription[0],
                          style: TextStyle(
                              color: Colors.white, fontSize: height * 0.02),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹$price',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      period,
                      style: TextStyle(
                        color: Colors.blueGrey[200],
                        fontSize: height * 0.018,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  refund,
                  style: TextStyle(
                    color: Colors.blueGrey[50],
                    fontSize: height * 0.018,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
