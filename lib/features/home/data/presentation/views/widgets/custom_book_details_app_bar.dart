import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookAppBarDetails extends StatelessWidget {
  const CustomBookAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
                size: 34,
              )),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
    );
  }
}
