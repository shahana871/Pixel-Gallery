import 'package:flutter/material.dart';

import '../models/image_model.dart';
import '../services/api_service.dart';

class ImageProviderClass with ChangeNotifier {

  List<ImageModel> images = [];

  bool isLoading = false;

  Future<void> fetchImages() async {

    isLoading = true;

    notifyListeners();

    try {

      images = await ApiService().fetchImages();

    } catch (e) {

      print(e);

    }

    isLoading = false;

    notifyListeners();
  }
}