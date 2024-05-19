import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/contact_item.dart';

class Contact_mobile extends StatelessWidget {
  const Contact_mobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
        alignment: Alignment.center,
        width: screenWidth,
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (int i = 0;
                    i < contactImage.length & urlContact.length;
                    i++)
                  InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse(urlContact[i]["url"]);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white60)),
                      child: Image.asset(
                        contactImage[i]["img"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
