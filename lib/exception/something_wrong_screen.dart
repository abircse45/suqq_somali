import 'package:flutter/material.dart';

class SomethingWentWrongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Image.asset('assets/images/some.png',
                  fit: BoxFit.cover, height: 400),
            ),
          ],
        ),
      ),
    );
  }
}
