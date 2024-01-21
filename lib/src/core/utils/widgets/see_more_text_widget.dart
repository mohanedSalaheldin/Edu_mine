import 'package:flutter/material.dart';

class SeeMoreTextWidget extends StatefulWidget {
  final String text;
  const SeeMoreTextWidget({super.key, required this.text});

  @override
  State<SeeMoreTextWidget> createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreTextWidget> {
  String firstPart = '';
  String secondPart = '';
  bool flag = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > 100) {
      firstPart = widget.text.substring(0, 100);
      secondPart = widget.text.substring(100);
    } else {
      firstPart = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          flag ? '$firstPart...' : firstPart + secondPart,
          style: const TextStyle(
            height: 1.2,
            fontSize: 18,
          ),
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                flag ? "show more" : "show less",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
      ],
    );
  }
}
