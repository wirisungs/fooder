import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  final double rating;
  final String totalReviews;

  const RatingBox({
    super.key,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            rating.toStringAsFixed(rating.truncateToDouble() == rating ? 0 : 1),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 12),
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '($totalReviews đánh giá)',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
