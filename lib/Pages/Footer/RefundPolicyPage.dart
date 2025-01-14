import 'package:flutter/material.dart';

class RefundPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Refund Policy',
          style: TextStyle(fontSize: 20),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF990011),
        foregroundColor: Color(0xFFFCF6F5),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final isSmallScreen = screenWidth < 600;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 16.0 : 32.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Cancellation Policy'),
                _buildSectionContent(
                  'You can cancel your subscription anytime before the next billing cycle. Any charges incurred before the cancellation are non-refundable.',
                ),
                SizedBox(height: 16.0),
                _buildSectionTitle('Refund Eligibility'),
                _buildSectionContent(
                  'Refunds are only provided in the case of defective products or if the services are not delivered as promised. Please report such issues within 7 days of receiving the product.',
                ),
                SizedBox(height: 16.0),
                _buildSectionTitle('Refund Process'),
                _buildSectionContent(
                  'To request a refund, contact us at theaconrent@gmail.com with your order details. Once approved, the refund will be processed within 5-7 business days.',
                ),
                SizedBox(height: 16.0),
                _buildSectionTitle('Non-Refundable Items'),
                _buildSectionContent(
                  'Delivery charges, installation fees, and any damages caused during the rental period are non-refundable.',
                ),
                SizedBox(height: 16.0),
                _buildSectionTitle('Contact Us'),
                _buildSectionContent(
                  'If you have any questions about this Refund Policy, please contact us at theaconrent@gmail.com.',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
        height: 1.5,
      ),
    );
  }
}
