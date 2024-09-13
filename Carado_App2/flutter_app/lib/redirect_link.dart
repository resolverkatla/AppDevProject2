import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Import the url_launcher package

// Custom widget for a clickable image with a dynamic URL
class ImagetoLink extends StatelessWidget {
  final String imagePath;
  final String url;

  const ImagetoLink({
    super.key,
    required this.imagePath,
    required this.url,
  });

  // Function to launch a dynamic URL
  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),  // Launch the dynamic URL
      child: Image.asset(
        imagePath,  // Use the dynamic image path
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}