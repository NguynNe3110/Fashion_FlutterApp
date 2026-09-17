import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import 'bloc/onboarding.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnboardingPageState();
  }
}

class _OnboardingPageState
    extends BasePageState<OnboardingPage, OnboardingBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111110),
      body: Stack(
        children: [
          // Background placeholder / image
          Positioned.fill(child: Container(color: const Color(0xFF1C1C1A))),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top brand
                  Column(
                    children: const [
                      SizedBox(height: 20),
                      Text(
                        'FALL / WINTER 2026',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Nord.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // Bottom editorial
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            height: 1.15,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Thời trang\n'),
                            TextSpan(
                              text: 'được kể lại.',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Khám phá bộ sưu tập được tuyển chọn từ hơn 200 nhà thiết kế độc lập.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () =>
                              bloc.add(const OnboardingStartedPressed()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF111110),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Bắt đầu khám phá',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, size: 16),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
