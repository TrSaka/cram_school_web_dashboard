import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/riverpod/search_field_riverpod.dart';

class SearchField extends ConsumerWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          child: TextFormField(
            onChanged: (newText) {
              ref.read(searchBarTextProvider.notifier).state = newText;
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search_rounded),
              suffixIconColor: Theme.of(context).primaryColor,
              hintText: "Search",
              fillColor: Theme.of(context).primaryColorLight,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
