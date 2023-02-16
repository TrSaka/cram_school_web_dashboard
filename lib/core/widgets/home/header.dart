import 'package:flutter/material.dart';

import '../../utils/responsive/app_responsive_sizes.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          ProfileCard(),
          SizedBox(width: DefaultResponsiveSizes.defaultResponsiveSizes)
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        margin: const EdgeInsets.only(
            left: DefaultResponsiveSizes.defaultResponsiveSizes),
        padding: const EdgeInsets.symmetric(
          horizontal: DefaultResponsiveSizes.defaultResponsiveSizes,
          vertical: DefaultResponsiveSizes.defaultResponsiveSizes / 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: drop(),
      ),
    );
  }

  Row drop() {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DefaultResponsiveSizes.defaultResponsiveSizes / 2),
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
      ],
    );
  }
}
