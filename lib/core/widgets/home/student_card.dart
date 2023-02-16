import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/widgets/home/student_delete_popup_widget.dart';

class StudentCard extends ConsumerWidget {
  const StudentCard({
    Key? key,
    required this.userData,
    required this.index,
  }) : super(key: key);

  final userData;
  final int index;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Card(
      child: ListTile(
        leading: Builder(
          builder: (context) {
            String url = userData['profilePicUrl'];
            return CircleAvatar(
              backgroundColor: Colors.transparent,
              child: url.contains('https://') == false
                  ? Text(userData['name'][0].toString().toString())
                  : CachedNetworkImage(
                      fit: BoxFit.cover,
                      useOldImageOnUrlChange: true,
                      imageUrl: userData['profilePicUrl'],
                    ),
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${userData['name'].toString().toUpperCase()} ${userData['lastName'].toString().toUpperCase()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(userData['userNumber'] ?? 0),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              StudentDeletePopUpWidget(index),
            ],
          ),
        ),
      ),
    );
  }
}

CircleAvatar circle(int index, userData) {
  return CircleAvatar(
    backgroundColor: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
    foregroundColor: Colors.white,
    child: Text(
      userData['name'][0].toString().toUpperCase(), //takes first
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
