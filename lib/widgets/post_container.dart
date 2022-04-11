import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 8,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl!),
                )
              : const SizedBox.shrink(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            Responsive.isDesktop(context) ? BorderRadius.circular(10) : null,
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl, showConectionState: false),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(Icons.public, size: 12, color: Colors.grey[600])
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: (){}, 
        )        
      ],
    );
  }
}

class _PostStats extends StatelessWidget {

  final Post post;

  const _PostStats({ Key? key, required this.post }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.thumb_up, color: Colors.white, size: 10),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600]
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PostButtom(
              label: 'Like',
              icon: Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600], size: 20,),
              onPressed: (){},
            ),
            _PostButtom(
              label: 'Comment',
              icon: Icon(MdiIcons.commentOutline, color: Colors.grey[600], size: 20,),
              onPressed: (){},
            ),
            _PostButtom(
              label: 'Share',
              icon: Icon(MdiIcons.shareOutline, color: Colors.grey[600], size: 25,),
              onPressed: (){},
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButtom extends StatelessWidget {

  final String label;
  final Icon icon;
  final Function()? onPressed;

  const _PostButtom({
    Key? key, 
    required this.label, 
    required this.icon, 
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Text(label)
            ],
          ),
        ),
      ),
    );

  }
}