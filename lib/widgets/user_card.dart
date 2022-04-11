

import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisSize:MainAxisSize.min,
            children: [
              ProfileAvatar(
                showConectionState: false,
                imageUrl: user.imageUrl
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  user.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,    
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}