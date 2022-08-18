import 'package:flutter/material.dart';

const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const Color kAmber = Colors.amber;
const Color kCyanAccent = Colors.cyanAccent;

class Button extends StatelessWidget {

  final String tile;
  final Color color;
  final VoidCallback onPress;
  final FontWeight w;
  final double size;

  const Button({Key? key, required this.tile, this.color = kCyanAccent, required this.onPress, this.w = FontWeight.w500, this.size = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: SizedBox(
            height: 80,
            // decoration: const BoxDecoration(
            //   shape: BoxShape.rectangle,
            //   color: kBlack,
            // ),
            child: Center(
              child: Text(tile, style: TextStyle(fontSize: size, color: color, fontWeight: w)),
            ),
          ),
        ),
      ),
    );
  }
}
