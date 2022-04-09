

import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(  
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
            
             SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.white,
                floating: true,
                centerTitle: false,
                title: const FacebookLogo(),
                actions: [
                  CircleButtom(
                    icon: Icons.search,
                    onPressed: () {},
                  ),
                  CircleButtom(
                    icon: MdiIcons.facebookMessenger,
                    onPressed: () {},
                  )
                ]),

            const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),

            const SliverPadding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              sliver: SliverToBoxAdapter(
                child: Rooms(
                  onlineUsers: onlineUsers,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final post = posts[index];

                return PostContainer(post: post);

              },
              childCount: posts.length
              )
            ),

            
        ],
      ),
      
    );
  }

  @override
  bool get wantKeepAlive => true;
}




