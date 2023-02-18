import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/extensions/upper_case.dart';
import 'package:flutter_school/core/widgets/home/edit_add_popup_widget.dart';
import 'package:flutter_school/core/widgets/home/student_delete_popup_widget.dart';

import '../../../models/student_model.dart';

class StudentCard extends ConsumerWidget {
  const StudentCard({
    Key? key,
    required this.userData,
    required this.index,
  }) : super(key: key);

  final StudentModel userData;
  final int index;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // StudentModel userModel = StudentModel.fromMap(userData);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: ListTile(
            leading: Builder(
              builder: (context) {
                String url = userData.profilePicUrl!;
                return circleProfilePic(url);
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${userData.name.toUpc} ${userData.lastName.toUpc}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(userData.userNumber.toString()),
              ],
            ),
            trailing: SizedBox(
              width: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StudentAddPopUpButtonWidget(true, userData),
                  StudentDeletePopUpWidget(userData),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar circleProfilePic(String url) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: url.contains('https://') == false
          ? Text(userData.name[0])
          //if database storage gives error use native image for profile photo
          : CachedNetworkImage(
          //else just load user's photo
              fit: BoxFit.cover,
              useOldImageOnUrlChange: true,
              imageUrl: url,
            ),
    );
  }
}
