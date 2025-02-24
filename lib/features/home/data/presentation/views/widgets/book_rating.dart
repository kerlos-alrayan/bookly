import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffFFDD4F),
        ),
        Text('4.8', style: Styles.textStyle16,),
        const SizedBox(
          height: 3,
        ),
        Text('(2245)', style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),),
      ],
    );
  }
}
