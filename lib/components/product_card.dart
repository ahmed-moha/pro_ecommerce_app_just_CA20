import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/constants.dart';
import 'image_placeholder.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: List.generate(
          10,
          (index) => const ProCard(),
        ),
      ),
    );
  }
}

class ProCard extends StatelessWidget {
  const ProCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
      ),
      width: size.width / 2 - 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 205,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  child: CachedNetworkImage(
                      imageUrl: "",
                      fit: BoxFit.cover,
                      height: 180,
                      width: double.infinity,
                      placeholder: (context, url) => const ImagePlaceholder(),

                      // ),
                      errorWidget: (context, url, error) =>
                          const ImagePlaceholder()),
                ),
                
                Positioned(
                  bottom: 12,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: Theme.of(context).cardColor, width: 2),
                    ),
                    child: const Text(
                      '\$399.9',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Text(
                          "30% off",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Gap(8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding),
                child: Text(
                  "name",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap(8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.17),
                    borderRadius: BorderRadius.circular(3)),
                child: const Text(
                  'New',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 8,
                  ),
                ),
              ),
              const Gap(kPadding),
            ],
          ),
          const Gap(8),
        ],
      ),
    );
  }
}
