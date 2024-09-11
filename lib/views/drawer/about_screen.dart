import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // আপনার লোগো এখানে দিন
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pranermart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to Pranermart, your number one source for all things [product, i.e., shoes, bags, electronics, etc.]. We\'re dedicated to giving you the very best of products, with a focus on quality, customer service, and uniqueness.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Founded in [Year] by [Founder\'s Name], Pranermart has come a long way from its beginnings in [Starting Location]. When [Founder\'s Name] first started out, their passion for [brand message - e.g., "eco-friendly products"] drove them to quit their day job, do tons of research, etc., so that Pranermart can offer you [competitive differentiator - e.g., "the world’s most advanced product"]. We now serve customers all over [place - town, country, the world], and are thrilled that we\'re able to turn our passion into our own website.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Iconsax.call),
                  SizedBox(width: 10),
                  Text(
                    'Phone: +123 456 7890',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Iconsax.sms),
                  SizedBox(width: 10),
                  Text(
                    'Email: support@pranermart.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Follow Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.facebook),
                  SizedBox(width: 10),
                  Text(
                    'Facebook: facebook.com/pranermart',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Iconsax.instagram),
                  SizedBox(width: 10),
                  Text(
                    'Instagram: instagram.com/pranermart',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.facebook),
                  SizedBox(width: 10),
                  Text(
                    'Twitter: twitter.com/pranermart',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
