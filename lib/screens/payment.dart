import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

class Payment extends StatelessWidget {
  // const Payment({Key? key}) : super(key: key);

  final String? amount;
  final String? shopName;

 final String date = DateFormat.yMMMd().format(DateTime.now());
 final String time = DateFormat.jm().format(DateTime.now());

  Payment({this.amount, this.shopName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent[400]),
              height: 130,
              width: 130,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 75,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\u{20B9}',
                          style: TextStyle(fontSize: 50),
                        ),
                        Text(
                          '$amount',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Paid to $shopName', style: TextStyle(fontSize: 22)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    Text('$date $time', style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextButton(
                      
                      style: TextButton.styleFrom(
                        primary: Colors.blueAccent[700],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width:1,
                            color: Colors.grey,
                            style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text('Got it')
                      )
                  ],
                ),
              ),
            ),
            //  const SizedBox(
            //     height: 10,
            //   ),
          ],
        ),
      ),
    );
  }
}
