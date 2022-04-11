import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  const Stories({ Key? key, 
   required this.currentUser, 
   required this.stories 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (_, index) {

          if(index == 0) {
            return _StoryCard(
            isAddStory: true,
            currentUser: currentUser
          );
          }

          final story = stories[index - 1];

          return _StoryCard(
            currentUser: currentUser,
            story: story
          );
        },
      )
    );
  }
}

class _StoryCard extends StatelessWidget {

  final bool isAddStory;
  final User currentUser;
  final Story? story;

  const _StoryCard({ Key? key, 
    this.isAddStory = false, 
    required this.currentUser, 
    this.story 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story!.imageUrl,
              height: double.infinity,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            height: double.infinity,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: Palette.storyGradient,
                boxShadow: isDesktop
                    ? const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4)
                      ]
                    : null  
            ),
          ),
      
          Positioned(
            left: 8,
            top: 8,
            child: isAddStory ? Container(
              height: 40,
              width: 40,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add, size: 30, color: Palette.facebookBlue,),
                onPressed: (){}, 
              ),
              decoration: const BoxDecoration(                
              color: Colors.white,
                shape: BoxShape.circle
              ),
            )
            : ProfileAvatar(imageUrl: story!.user.imageUrl, hasBorder: !story!.isViewed)
          ),
      
          Positioned(
            bottom: 8,
            right: 8,
            left: 8,
            child: Text(isAddStory ? 'Add a Story' : story!.user.name,
             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
            )
          )
        
        ],
      ),
    );
  }
}