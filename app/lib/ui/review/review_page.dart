import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'bloc/review.dart';

@RoutePage()
class ReviewPage extends StatefulWidget {
  const ReviewPage({
    super.key,
    required this.productId,
    required this.productName,
  });

  final String productId;
  final String productName;

  @override
  State<StatefulWidget> createState() {
    return _ReviewPageState();
  }
}

class _ReviewPageState extends BasePageState<ReviewPage, ReviewBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(ReviewPageInitiated(productId: widget.productId));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Đánh giá sản phẩm',
        leadingIcon: LeadingIcon.back,
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state.loadException != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(handleExceptionMessage(state.loadException!)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => bloc.add(
                      ReviewPageInitiated(productId: widget.productId),
                    ),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          if (state.isShimmerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product title
                Text(
                  widget.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                // Review input card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE8E5DE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'VIẾT ĐÁNH GIÁ CỦA BẠN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          color: Color(0xFF6B6862),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Rating stars
                      Row(
                        children: List.generate(5, (index) {
                          final star = index + 1;
                          return IconButton(
                            onPressed: () => bloc.add(RatingChanged(rating: star)),
                            icon: Icon(
                              star <= state.selectedRating ? Icons.star : Icons.star_border,
                              color: const Color(0xFFE65100),
                              size: 28,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      // Comment textfield
                      TextField(
                        onChanged: (val) => bloc.add(CommentChanged(comment: val)),
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Chia sẻ cảm nhận của bạn về chất lượng sản phẩm...',
                          hintStyle: const TextStyle(color: Color(0xFFA5A199), fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFFE8E5DE)),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: state.comment.trim().isNotEmpty
                              ? () => bloc.add(SubmitReviewPressed(productId: widget.productId))
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF111110),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Gửi đánh giá'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Review list section
                Text(
                  'TẤT CẢ ĐÁNH GIÁ (${state.reviews.length})',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: Color(0xFF6B6862),
                  ),
                ),
                const SizedBox(height: 12),
                if (state.reviews.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'Chưa có đánh giá nào cho sản phẩm này.',
                        style: TextStyle(color: Color(0xFF6B6862)),
                      ),
                    ),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.reviews.length,
                    separatorBuilder: (_, __) => const Divider(
                      color: Color(0xFFE8E5DE),
                      height: 24,
                    ),
                    itemBuilder: (context, index) {
                      final review = state.reviews[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                review.userName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (i) => Icon(
                                    i < review.rating ? Icons.star : Icons.star_border,
                                    size: 14,
                                    color: const Color(0xFFE65100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            review.comment ?? '', // xử lý trường hợp null
                            style: const TextStyle(color: Color(0xFF333333), fontSize: 13),
                          ),
                        ],
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
