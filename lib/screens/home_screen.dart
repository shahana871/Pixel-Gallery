import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_provider.dart';
import '../widgets/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ImageProviderClass>(
        context,
        listen: false,
      ).fetchImages();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        Provider.of<ImageProviderClass>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text('My Photo Gallery'),
      ),

      body: provider.isLoading

          ? const Center(
              child: CircularProgressIndicator(),
            )

          : GridView.builder(

              padding: const EdgeInsets.all(10),

              itemCount: provider.images.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 10,

                mainAxisSpacing: 10,
              ),

              itemBuilder: (context, index) {

                return ImageCard(
                  image: provider.images[index],
                );
              },
            ),
    );
  }
}