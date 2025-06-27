import 'package:flutter/material.dart';
import 'package:tasty/features/recipe/data/models/recipe_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LetsCookTab extends StatelessWidget {
  final RecipeModel recipe;

  const LetsCookTab({super.key, required this.recipe});

  void launchYouTube(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  String getVideoId(String url) {
    final uri = Uri.parse(url);
    if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v'] ?? '';
    } else if (uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.last;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final videoId = getVideoId(recipe.youtubeLink);
    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';

    return Column(
      spacing: 24,
      children: [
        Text(
          textAlign: TextAlign.center,
          'Prefer a  video guide ?\nWatch the video below',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        GestureDetector(
          onTap: () => launchYouTube(recipe.youtubeLink),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withValues(alpha: 0.5),
                  blurRadius: 24,
                  spreadRadius: 12,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(strokeAlign: 20),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    size: 64,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.black45,
                      child: Text(
                        recipe.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
