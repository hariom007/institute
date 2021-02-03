import 'package:flutter/material.dart';
import 'package:institute/Values/AppColors.dart';

class VerificationPending extends StatefulWidget {
  @override
  _VerificationPendingState createState() => _VerificationPendingState();
}

class _VerificationPendingState extends State<VerificationPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/pending.png',height: 100,
              fit: BoxFit.fill,color: AppColors.red_00,),
            SizedBox(height: 20,),
            Text('Your Verification is still pending.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),

          ],
        ),
      ),
    );
  }
}
