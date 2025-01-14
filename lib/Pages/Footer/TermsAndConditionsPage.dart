import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 600;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Terms & Conditions',
              style: TextStyle(fontSize: 20),
            ),
            automaticallyImplyLeading: true,
            backgroundColor: Color(0xFF990011),
            foregroundColor: Color(0xFFFCF6F5),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: isSmallScreen
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  _buildTermsContent(isSmallScreen),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTermsContent(bool isSmallScreen) {
    final List<Map<String, String>> termsSections = [
      {
        'title': 'Introduction',
        'content':
            'Welcome to The AC On Rent. These Terms & Conditions outline the rules and regulations for the use of our services. By accessing this website, we assume you accept these terms and conditions in full.'
      },
      {
        'title': 'Service Usage',
        'content':
            'Our services are available for individuals and businesses, subject to the condition that they comply with all applicable laws and regulations. Misuse of our services may result in termination.'
      },
      {
        'title': 'Payments and Refunds',
        'content':
            'All payments must be completed as per the agreed terms. Refunds are processed according to our Refund Policy, which ensures transparency and fairness.'
      },
      {
        'title': 'Cancellation Policy',
        'content':
            'You can cancel your subscription anytime. Any amount already paid will not be refunded for the remaining period unless otherwise stated in our Refund Policy.'
      },
      {
        'title': 'Changes to Terms',
        'content':
            'We reserve the right to modify these Terms & Conditions at any time. Changes will be notified through our website, and continued use of our services implies acceptance of the updated terms.'
      },
    ];

    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: termsSections.map((section) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section['title']!,
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF990011),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                section['content']!,
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  color: Colors.grey[800],
                  height: 1.5,
                ),
                textAlign: isSmallScreen ? TextAlign.left : TextAlign.justify,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
