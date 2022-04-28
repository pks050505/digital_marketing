import 'package:digital_marketing/screen/onboarding/widgets/app_styles.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        height: 100,
        width: 100,
        // height: SizeConfig.blockSizeH! * 15.5,
        // width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
