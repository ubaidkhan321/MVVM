import 'package:flutter/material.dart';
import 'package:handel_exception/Res/appcolors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onpress,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: AppColor.ButtonColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: AppColor.whitecolor,
                  strokeWidth: 2,
                )
              : Text(
                  title,
                  style:
                      const TextStyle(color: AppColor.whitecolor, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
