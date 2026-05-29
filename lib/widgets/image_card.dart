import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/image_model.dart';

class ImageCard extends StatelessWidget {

  final ImageModel image;

  const ImageCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(20),

      child: Stack(

        fit: StackFit.expand,

        children: [

          CachedNetworkImage(

            imageUrl: image.downloadUrl,

            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 500),

            placeholder: (context, url) =>
                const Center(
                  child: CircularProgressIndicator(),
                ),

            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          ),

          Container(

            alignment: Alignment.bottomCenter,

            padding: const EdgeInsets.all(8),

            color: Colors.black45,

            child: Text(

              image.author,

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}