import 'package:flutter/material.dart';

import 'onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final onboardingData = [
    {
      'title': 'all-in-one delivery',
      'description':
      'Order groceries, medicines, and meals delivered straight to your door',
      'image': 'asstes/images/image.png'
    },
    {
      'title': 'User-to-User Delivery',
      'description':
      'Send or receive items from other users quickly and easily',
      'image': 'asstes/images/image.png'
    },
    {
      'title': 'Sales & Discounts',
      'description': 'Discover exclusive sales and deals every day',
      'image': 'asstes/images/image.png'
    },
  ];

  void _nextPage() {
    if (_currentIndex == onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final item = onboardingData[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                OnboardingContent(
                  title: item['title']!,
                  description: item['description']!,
                  imagePath: item['image']!,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: Colors.deepPurple),
                  child: Text( style: TextStyle(color: Color(0xffFFFFFF)),
                    _currentIndex == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
