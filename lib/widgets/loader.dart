import 'package:flutter/material.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            color: Colors.black,
          )),
      Center(child: Image.asset('assets/logo.png', width: 30)),
    ]);
  }
}
