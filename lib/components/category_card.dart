import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'image_placeholder.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    double childAspectRatio = 1 / 1.2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 0, // Adjust the spacing as needed
        mainAxisSpacing: 10, // Adjust the spacing as needed
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CatCard();
      },
      itemCount: 8,
    );
  }
}

class CatCard extends StatelessWidget {
  const CatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => {},
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: kPadding, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        imageUrl: "haahha",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const ImagePlaceholder(),
                        errorWidget: (context, url, error) =>
                            const ImagePlaceholder()),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  getRandomCategory(categories),
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getRandomCategory(List<String> categories) {
    final random = Random();
    int index = random.nextInt(categories.length);
    return categories[index];
  }
}
