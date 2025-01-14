import 'package:flutter/material.dart';

class FAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 600;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'FAQs',
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
                  _buildFAQsContent(isSmallScreen),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFAQsContent(bool isSmallScreen) {
    final List<Map<String, String>> faqSections = [
      {
        'question': 'What services does The AC On Rent offer?',
        'answer': '''
The AC On Rent provides a wide range of services for both residential and commercial spaces. Our offerings include:
- AC rental for short-term and long-term durations.
- Installation services to ensure proper setup.
- Free regular maintenance for optimal performance.
- Free relocation services when you move to a new location.
- Professional support for any technical or operational issues.

We are committed to delivering hassle-free cooling solutions tailored to your needs.
'''
      },
      {
        'question': 'How do I place a rental order?',
        'answer': '''
Placing a rental order with us is easy:
1. Visit our website and browse through the available AC models.
2. Select the model that fits your requirements.
3. Add the product to your cart and proceed to checkout.
4. Provide your delivery address and preferred rental period.
5. Complete the payment to confirm your order.

Once your order is placed, our team will contact you to arrange delivery and installation.
'''
      },
      {
        'question': 'Is there a minimum rental period?',
        'answer': '''
Yes, the minimum rental period is one month. However, we also offer flexible rental plans for longer durations, such as:
- 3 months
- 6 months
- 12 months

Customers opting for extended rental periods may benefit from exclusive offers and reduced monthly charges.
'''
      },
      {
        'question': 'Do you provide maintenance services?',
        'answer': '''
Yes, we provide free maintenance services for all rented ACs throughout the rental period. Our maintenance includes:
- Regular cleaning and servicing of the AC filters.
- Checking and refilling refrigerants if required.
- Diagnosing and fixing any operational issues.

If you encounter any problems with your AC, simply contact our support team, and a technician will be dispatched promptly to resolve the issue.
'''
      },
      {
        'question': 'What if I need to relocate my rented AC?',
        'answer': '''
We understand the need for flexibility. Our relocation service includes:
- Dismantling the AC from your current location.
- Safely transporting the unit to your new address.
- Reinstalling and testing the AC at your new location.

This service is provided free of charge, but we request customers to inform us at least 48 hours in advance to ensure a smooth process.
'''
      },
      {
        'question': 'What are the payment options available?',
        'answer': '''
We offer multiple payment options for your convenience, including:
- Online payments via credit/debit cards, net banking, or UPI.
- Wallet payments through supported platforms.
- Monthly subscriptions with auto-debit options.

All transactions are secure, and you will receive a confirmation email and invoice for your records.
'''
      },
      {
        'question': 'Can I cancel my rental subscription at any time?',
        'answer': '''
Yes, you can cancel your rental subscription at any time. However:
- If you cancel before the completion of the minimum rental period, the remaining balance will not be refunded.
- For cancellations after the minimum rental period, you will only be charged for the days the AC was used in the current billing cycle.

Please contact our support team to process your cancellation request.
'''
      },
      {
        'question': 'Are there any additional charges?',
        'answer': '''
No, there are no hidden charges. Our pricing is transparent and includes:
- Installation and delivery charges.
- Maintenance and relocation costs.
- Taxes and service charges.

You only pay the agreed rental fee for the duration of your subscription.
'''
      },
    ];

    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: faqSections.map((faq) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question
              Text(
                faq['question']!,
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF990011),
                ),
              ),
              SizedBox(height: 8.0),
              // Answer
              Text(
                faq['answer']!,
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  color: Colors.grey[800],
                  height: 1.6,
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
