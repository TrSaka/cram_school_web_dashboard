import 'package:flutter/material.dart';
import 'package:flutter_school/core/widgets/home/search_bar.dart';
import '../../utils/responsive/app_responsive_sizes.dart';
import 'dropdown_widget.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  width: DefaultResponsiveSizes.defaultResponsiveSizes * 2),
              const SearchField(),
              Padding(
                padding: const EdgeInsets.only(
                    right: DefaultResponsiveSizes.defaultResponsiveSizes * 2),
                child: Visibility(
                  visible: width < 600 ? false : true,
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: DropDownButton(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DefaultResponsiveSizes.defaultResponsiveSizes),
        ],
      ),
    );
  }
}
