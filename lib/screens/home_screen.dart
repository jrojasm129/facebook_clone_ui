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

  final TrackingScrollController controller = TrackingScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(  
      body: Responsive(
        mobile: _HomeScreenMobile(controller: controller),
        desktop: _HomeScreenDesktop(controller: controller)
      ),
      
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _HomeScreenMobile extends StatelessWidget {
  final ScrollController controller;
  
  const _HomeScreenMobile({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
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
    );
  }
}
class _HomeScreenDesktop extends StatelessWidget {
  final ScrollController controller;
  
  const _HomeScreenDesktop({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Row(
      children: [
        const Flexible(
          flex: 2,
          child: _MoreOptions(),
        ),

        const Spacer(),

        _DesktopBody(controller: controller),
        const Spacer(),

        const Flexible(
          flex: 2,
          child: _Contacts(),
        ),
      ],
    );
  }
}

class _Contacts extends StatelessWidget {
  const _Contacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const  BoxConstraints(maxWidth: 300),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text('Contacts', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500, color: Colors.grey[600],
                ),)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.search), color: Colors.grey[600],),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz), color: Colors.grey[600],)
              ],
            ),
          ),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: onlineUsers.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: UserCard(user: onlineUsers[index]),
              );
            },
          ),)
        ]),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
    
          SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories
                ),
              ),
            ),
    
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
    
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final post = posts[index];
    
                return PostContainer(post: post);
    
              },
              childCount: posts.length
              )
            )           
        ],
      ),
    );
  }
}

class _MoreOptions extends StatelessWidget {
  const _MoreOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const  BoxConstraints(maxWidth: 300),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            itemCount: 1 + moreOptions.length,
            itemBuilder: (_, index) {
              if(index == 0){
                 return const Padding(
                   padding: EdgeInsets.only(bottom: 12.0),
                   child: UserCard(user: currentUser),
                 ); 
              }

              final option = moreOptions[index - 1];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _Option(
                  label: option[2], 
                  icon: option[0],
                  iconColor: option[1], 
                )
              );
            },
          ),)
        );
  }
}

class _Option extends StatelessWidget {
  final String label;
  final Color iconColor;
  final IconData icon;

  const _Option({
    Key? key, 
    required this.label, 
    required this.iconColor, 
    required this.icon,
  }) : super(key: key);


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
              Icon(icon, color: iconColor, size: 30),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
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




