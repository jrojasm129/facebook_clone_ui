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
    
    return const Scaffold(  
      body: Responsive(
        mobile: _HomeScreenMobile(),
        desktop: _HomeScreenDesktop()
      ),
      
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
  const _HomeScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.red,
          ),
        ),

        const Spacer(),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: CustomScrollView(
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
        ),
        const Spacer(),

        Flexible(
          flex: 2,
          child: Align(
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
          ),
        ),
      ],
    );
  }
}




