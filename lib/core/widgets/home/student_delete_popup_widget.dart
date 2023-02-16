import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/riverpod/firebase_riverpod.dart';

class StudentDeletePopUpWidget extends ConsumerWidget {
  final int userIndex;
  const StudentDeletePopUpWidget(this.userIndex, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 30,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: popupTitle(),
                content: SizedBox(
                  height: 300,
                  width: 600,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          ref.read(authProvider).deleteUser(userIndex);
                        },
                        child: Text("Evet"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Hayır"),
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
        ),
      ),
    );
  }

  Text popupTitle() =>
      const Text("Öğrenciyi silmek istediğinizden emin misiniz ?");
}
