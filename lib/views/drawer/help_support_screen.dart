import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How can we help you?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Frequently Asked Questions (FAQs)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ExpansionTile(
                leading: const Icon(Iconsax.info_circle),
                title: const Text('How do I track my order?'),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'You can track your order by logging into your account and going to the "My Orders" section. There, you will find the tracking details for each of your orders.',
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.add),
                title: const Text('What is your return policy?'),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'We offer a 30-day return policy on most items. To initiate a return, go to the "My Orders" section, select the order, and click on "Return or Exchange". Follow the prompts to complete your return request.',
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.add),
                title: const Text('What payment methods do you accept?'),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'We accept all major credit cards, debit cards, and PayPal. You can also choose to pay using Apple Pay or Google Pay during checkout.',
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Iconsax.security_safe),
                title: const Text('Is my personal information safe?'),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Yes, your personal information is safe with us. We use the latest encryption technologies to ensure that your data is secure.',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Need more help?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Iconsax.call),
                title: const Text('Call Us'),
                subtitle: const Text('+123 456 7890'),
                onTap: () {
                  // Call action
                },
              ),
              ListTile(
                leading: const Icon(Iconsax.sms),
                title: const Text('Email Us'),
                subtitle: const Text('support@pranermart.com'),
                onTap: () {
                  // Email action
                },
              ),
              ListTile(
                leading: const Icon(Iconsax.message),
                title: const Text('Live Chat'),
                subtitle: const Text('Chat with our support team'),
                onTap: () {
                  // Chat action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
