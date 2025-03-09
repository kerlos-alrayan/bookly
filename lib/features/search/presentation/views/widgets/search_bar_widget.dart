import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              Icons.clear,
              size: 22,
            ),
          ),
          onPressed: onClear,
        )
            : null,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      onChanged: onChanged,
      onSubmitted: (_) => FocusScope.of(context).unfocus(),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
