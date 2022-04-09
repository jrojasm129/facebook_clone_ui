import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {

  final List<User> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      height: 60, 
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {


          if(index == 0){
            return const _CreateRoomButtom(); 
          }

          final user = onlineUsers[index -1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(imageUrl: user.imageUrl),
          );
        },
      ),
    );
  }
}

class _CreateRoomButtom extends StatelessWidget {
  const _CreateRoomButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        child: Row(
          children: const [
            // ShaderMask(
            //   shaderCallback: Palette.createRoomGradient.createShader,
            //   child: const Icon(
            //     Icons.video_call,
            //     color: Colors.white,
            //     size: 35,
            //   ),
            // ),
            Icon(
                Icons.video_call,
                color: Colors.deepPurple,
                size: 35,
            ),
            SizedBox(width: 4),
            Text('Create\nRoom', style: TextStyle(color: Palette.facebookBlue),)
          ],
        ),
        style: OutlinedButton.styleFrom(        
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: const BorderSide(
            color: Colors.blueAccent,
            width: 2
          )
        ),
        onPressed: (){}, 
        ),
    );
  }
}
