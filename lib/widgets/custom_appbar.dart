import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User currentUser;
  final List<IconData> icons;
  final Function(int index) onTap;
  final int selectedIndex;

  const CustomAppBar({
    Key? key, 
    required this.icons, 
    required this.onTap, 
    required this.selectedIndex,
    required this.currentUser
  }) : super(key: key);

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2)
          )
        ]
      ),
      child: Row(
        children: [
          const Expanded(child: FacebookLogo()),
          SizedBox(
            width: 600,
            child: CustomTabBar(
              icons: icons, 
              selectedIndex: selectedIndex, 
              onTap: onTap,
              indicatorPosition: IndicatorPosition.bottom,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _UserCard(currentUser: currentUser),
                const SizedBox(width: 12),
                CircleButtom(
                    icon: Icons.search,
                    onPressed: () {},
                ),
                CircleButtom(
                    icon: MdiIcons.facebookMessenger,
                    onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

 
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize:MainAxisSize.min,
            children: [
              ProfileAvatar(
                showConectionState: false,
                imageUrl: currentUser.imageUrl
              ),
              const SizedBox(width: 4),
              Text(currentUser.name, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600]),)
            ],
          ),
        ),
      ),
    );
  }
}