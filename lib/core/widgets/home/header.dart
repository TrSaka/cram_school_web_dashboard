import 'package:flutter/material.dart';
import 'package:flutter_school/core/utils/color/scheme_colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const ProfileCard(),
        SizedBox(
          width: UIColors.defaultPadding,
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: UIColors.defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: UIColors.defaultPadding,
        vertical: UIColors.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: drop(),
    );
  }

  Row drop() {
    return Row(
      children: const [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIColors.defaultPadding / 2),
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
