import 'package:firstdemo/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
   String? amount = '' ;
    String? name = '';
 
    AudioCache player = AudioCache();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        centerTitle: true,
        title: const Text('Gpay but NoPay'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit : BoxFit.fitWidth,
                  child: const Text(
                    'Enter Amount',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.15),
                  child: TextFormField(
                  //  initialValue: '00',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                     onChanged:(value){
                       setState(() {
                         amount = value;
                       });
                    } ,

                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Amount please';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(fontSize: 16),
                      hintText: '00',
                      prefixText: '\u{20B9}',
                      
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text('To get correct name use orginal google pay scanner',style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w500),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged:(value){
                        setState(() {
                          name = value;
                        });
                    } ,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter shop name';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                    decoration:  InputDecoration(
                        errorStyle: TextStyle(fontSize: 16),
                        labelText: 'Enter Shop Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )),
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    
                    primary: Colors.blueAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                    ,
                    elevation: 10,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      player.play('gpay.mp3');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Payment(amount:amount ,shopName: name,)));
                    }
                  },
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: const Text(
                      'Show Payment',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
