import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {

  final User currentUser;

  const CreatePostContainer({
    Key? key, 
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Column(children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl, showConectionState: false,),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration.collapsed(
                    hintText: 'What\'s on your mint?'),
              ),
            )
          ],
        ),
        const Divider(height: 10, thickness: 0.5),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextButton.icon(
              label: const Text('Live'),
              icon: const Icon(
                Icons.videocam,
                color: Colors.red
              ), 
              onPressed: (){}, 
            ),
            const VerticalDivider(width: 8.0),
            TextButton.icon(
              label: const Text('Photo'),
              icon: const Icon(
                Icons.photo_library,
                color: Colors.green
              ), 
              onPressed: (){}, 
            ),
            const VerticalDivider(width: 8.0),
            TextButton.icon(
              label: const Text('Video Call'),
              icon: const Icon(
                Icons.video_call,
                color: Colors.purpleAccent,
              ), 
              onPressed: (){}, 
            ),
          ],),
        )
      ]),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            Responsive.isDesktop(context) ? BorderRadius.circular(10) : null,
      ),
    );
  }
}