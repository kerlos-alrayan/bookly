import 'package:bookly/features/home/presentation/views/widgets/loading_custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/shimmer.dart';

class LoadingBookListViewItem extends StatelessWidget {
  const LoadingBookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 125,
          width: MediaQuery.of(context).size.width * .85,
          child: Shimmer.fromColors(
            baseColor: ShimmerColors.baseShimmerColor,
            highlightColor: ShimmerColors.highlightShimmerColor,
            child: Row(
              children: [
                LoadingCustomBookImage(),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customLoadingContainer(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .5,
                      ),
                      const SizedBox(height: 10),
                      customLoadingContainer(
                        height: 20,
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          customLoadingContainer(
                            height: 20,
                            width: 50,
                          ),
                          const Spacer(),
                          customLoadingContainer(
                            height: 20,
                            width: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customLoadingContainer(
      {required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ShimmerColors.widgetShimmerColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
