import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/core/util/responsive_utils.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:news/features/news/presentation/pages/article_details/article_details.dart';
import 'package:gap/gap.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const ArticleTile({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetails(article),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: article.urlToImage ?? kDefaultImage,
                height: h(context, 0.2),
                width: w(context, 1),
                fit: BoxFit.fill,
              ),
              const Gap(10),
              Text(
                article.title ?? 'Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(10),
              Text(
                article.description ?? 'Title',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
