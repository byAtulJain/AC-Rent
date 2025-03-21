import 'package:flutter/material.dart';

import 'Footer/BlogPage.dart';
import 'Footer/FAQsPage.dart';
import 'Footer/PrivacyPolicyPage.dart';
import 'Footer/RefundPolicyPage.dart';
import 'Footer/SupportPage.dart';
import 'Footer/TermsAndConditionsPage.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 600;

        return Container(
          color: Color(0xFF990011),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: isSmallScreen
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              // Top Section: Links (Responsive Layout)
              if (isSmallScreen) ...[
                Row(
                  children: [
                    Expanded(
                      child: _buildFooterColumn(
                        title: 'Pages',
                        links: ['Home', 'Products', 'Enquiry', 'Login'],
                        context: context,
                      ),
                    ),
                    Expanded(
                      child: _buildFooterColumn(
                        title: 'Terms & Policies',
                        links: [
                          'Terms & Conditions',
                          'Privacy Policy',
                          'Refund Policy'
                        ],
                        context: context,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildFooterColumn(
                        title: 'Resources',
                        links: ['FAQs', 'Support', 'Blog'],
                        context: context,
                      ),
                    ),
                    Expanded(
                      child: _buildFooterColumn(
                        title: 'Contact Us',
                        links: [
                          'Email: theaconrent@gmail.com',
                          'Phone: +91 9301778661',
                          'Address: 43 Ramchandra nagar extension, Indore',
                        ],
                        context: context,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Big Screen Layout - Updated for better alignment
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterColumn(
                      title: 'Pages',
                      links: ['Home', 'Products', 'Enquiry', 'Login'],
                      context: context,
                      width: 200, // Fixed column width for alignment
                    ),
                    SizedBox(width: 32.0), // Spacing between columns
                    _buildFooterColumn(
                      title: 'Terms & Policies',
                      links: [
                        'Terms & Conditions',
                        'Privacy Policy',
                        'Refund Policy'
                      ],
                      context: context,
                      width: 200,
                    ),
                    SizedBox(width: 32.0),
                    _buildFooterColumn(
                      title: 'Resources',
                      links: ['FAQs', 'Support', 'Blog'],
                      context: context,
                      width: 200,
                    ),
                    SizedBox(width: 32.0),
                    _buildFooterColumn(
                      title: 'Contact Us',
                      links: [
                        'Email: theaconrent@gmail.com',
                        'Phone: +91 9301778661',
                        'Address: 43 Ramchandra nagar extension, Indore',
                      ],
                      context: context,
                      width: 200,
                    ),
                  ],
                ),
              ],
              SizedBox(height: 24.0),
              // Divider Line
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 1.0,
              ),
              SizedBox(height: 16.0),
              // Bottom Section: Copyright and Social Media
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCopyrightText(isSmallScreen: isSmallScreen),
                  SizedBox(height: 16.0),
                  // _buildSocialMediaIcons(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooterColumn({
    required String title,
    required List<String> links,
    required BuildContext context,
    double? width,
  }) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width / 2 - 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          ...links.map((link) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  _handleNavigation(link, context);
                },
                child: Text(
                  link,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  void _handleNavigation(String link, BuildContext context) {
    if (link == 'Terms & Conditions') {
      Navigator.push(
        context,
        _createPageRoute(TermsAndConditionsPage()),
      );
    } else if (link == 'Privacy Policy') {
      Navigator.push(
        context,
        _createPageRoute(PrivacyPolicyPage()),
      );
    } else if (link == 'Refund Policy') {
      Navigator.push(
        context,
        _createPageRoute(RefundPolicyPage()),
      );
    } else if (link == 'FAQs') {
      Navigator.push(
        context,
        _createPageRoute(FAQsPage()),
      );
    } else if (link == 'Support') {
      Navigator.push(
        context,
        _createPageRoute(SupportPage()),
      );
    } else if (link == 'Blog') {
      Navigator.push(
        context,
        _createPageRoute(BlogPage()),
      );
    } else {
      print('$link tapped');
    }
  }

  Widget _buildCopyrightText({required bool isSmallScreen}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '© 2025 The AC On Rent. All Rights Reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Text(
            'Made with ❤️ by Atul Jain',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    final List<Map<String, String>> socialMedia = [
      {
        'icon': 'https://img.icons8.com/ios-filled/50/ffffff/facebook.png',
        'link': 'https://facebook.com'
      },
      // {
      //   'icon': 'https://img.icons8.com/ios-filled/50/ffffff/twitter.png',
      //   'link': 'https://twitter.com'
      // },
      {
        'icon': 'https://img.icons8.com/ios-filled/50/ffffff/instagram-new.png',
        'link': 'https://instagram.com'
      },
      // {
      //   'icon': 'https://img.icons8.com/ios-filled/50/ffffff/linkedin.png',
      //   'link': 'https://linkedin.com'
      // },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialMedia.map((platform) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              print('Navigate to ${platform['link']}');
            },
            child: Image.network(
              platform['icon']!,
              height: 24,
              width: 24,
            ),
          ),
        );
      }).toList(),
    );
  }
}

PageRouteBuilder _createPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var fadeAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 500), // Adjust duration
  );
}
