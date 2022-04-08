

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {

  final String imageUrl;
  final bool isActive;
  final bool showConectionState;
  final bool hasBorder;

  const ProfileAvatar({ Key? key, 
    required this.imageUrl, 
    this.isActive = false,
    this.showConectionState = true, 
    this.hasBorder = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: hasBorder ? 17 : 20,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        if(showConectionState)
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
             color: Colors.green,
             shape: BoxShape.circle,
             border: Border.all(color: Colors.white, width: 2)
            ),
          )
        )
      ],
    );
  }
}