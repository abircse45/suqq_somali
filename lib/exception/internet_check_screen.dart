import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/internet.png",
              height: 200,
              width: 300,
            ),
            Text("Check Your Internet Connection And Try Again"),
            // ignore: deprecated_member_use
            SizedBox(height: 25),
            // ignore: deprecated_member_use
            OutlineButton(
              onPressed: () {},
              child: Text("Try Agin"),
            ),
          ],
        ),
      ),
    );
  }
}
