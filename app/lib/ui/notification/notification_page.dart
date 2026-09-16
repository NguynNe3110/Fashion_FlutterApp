import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../app.dart';
import 'bloc/notification.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<NotificationPage, NotificationBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const NotificationPageInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        text: 'Thông báo',
        titleTextStyle: AppTextStyles.h2Serif().copyWith(
          fontSize: Dimens.d20.responsive(),
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
        leadingIcon: LeadingIcon.back,
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state.isShimmerLoading && state.notifications.isEmpty) {
            return const Center(child: CircularProgressIndicator(color: AppColors.ink));
          }

          if (state.notifications.isEmpty) {
            return _buildEmptyState();
          }

          return ListView.separated(
            padding: EdgeInsets.all(Dimens.d20.responsive()),
            itemCount: state.notifications.length,
            separatorBuilder: (_, __) => Divider(height: Dimens.d32.responsive(), color: AppColors.line),
            itemBuilder: (context, index) {
              final item = state.notifications[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['title'] ?? '',
                          style: AppTextStyles.s14w400Primary().copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        item['time'] ?? '',
                        style: AppTextStyles.eyebrow().copyWith(fontSize: Dimens.d9.responsive()),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimens.d8.responsive()),
                  Text(
                    item['content'] ?? '',
                    style: AppTextStyles.s14w400Secondary().copyWith(height: 1.4),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none_rounded, size: Dimens.d64.responsive(), color: AppColors.ink4),
          SizedBox(height: Dimens.d24.responsive()),
          Text('Không có thông báo', style: AppTextStyles.h2Serif()),
          SizedBox(height: Dimens.d12.responsive()),
          Text('Chúng tôi sẽ thông báo cho bạn khi có tin mới.', style: AppTextStyles.s14w400Secondary()),
        ],
      ),
    );
  }
}
