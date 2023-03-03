// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/product/router/nav_route.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';
import 'package:flutter_school/models/student_model.dart';

class StudentDeletePopUpWidget extends ConsumerWidget {
  final StudentModel userModel;

  const StudentDeletePopUpWidget(this.userModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: popupTitle(),
                content: SizedBox(
                  height: 100,
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(authProvider)
                                  .deleteUserFromDatabase(userModel)
                                  .then((userDataWithEmailAndPassword) {
                                ref.read(authProvider).deleteUserFromAuth(
                                    userDataWithEmailAndPassword);
                                debugPrint("Succesfully");
                              });
                              NavRoute(null).toPop(context);
                            },
                            child: contentButtonTexts(context, "Evet"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: contentButtonTexts(context, "Hayır"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 24,
        ),
      ),
    );
  }

  Text contentButtonTexts(BuildContext context, String text) => Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
      );

  Text popupTitle() =>
      const Text("Öğrenciyi silmek istediğinizden emin misiniz ?");
}
