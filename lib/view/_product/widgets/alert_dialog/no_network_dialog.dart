import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/Animation/Fade_Animation.dart';


class NoNetworkAlertDialog extends StatelessWidget {
  const NoNetworkAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: 4.0, sigmaY: 4.0),
      child: FadeAnimation(
        delay: 0.3,
        child: AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title:   const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.yellow),
              SizedBox(width: 8),
              Text(
                "1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text("2"),
          actions: [
            TextButton(
                style: ButtonStyle( backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.pink)),
                onPressed: (){
                  SystemNavigator.pop();
                }, child: Text("3",style: const TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
