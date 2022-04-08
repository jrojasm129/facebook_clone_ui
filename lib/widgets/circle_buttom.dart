import 'package:flutter/material.dart';

class CircleButtom extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double? iconSize;
  
  const CircleButtom({
    Key? key, 
    required this.icon, 
    this.onPressed, 
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: iconSize),
        onPressed: onPressed, 
      ),
    );
  }
}