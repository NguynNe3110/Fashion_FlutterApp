import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../../../app.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({required this.title, this.eyebrow, super.key});

  final String title;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Dimens.d20.responsive(),
          Dimens.d32.responsive(),
          Dimens.d20.responsive(),
          Dimens.d8.responsive(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (eyebrow != null) ...[
              Text(eyebrow!, style: AppTextStyles.eyebrow()),
              SizedBox(height: Dimens.d8.responsive()),
            ],
            Text(title, style: AppTextStyles.sectionTitle()),
          ],
        ),
      ),
    );
  }
}
