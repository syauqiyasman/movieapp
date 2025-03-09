import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardSkeleton extends StatelessWidget {
  const MovieCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 200,
              height: 300,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Skeleton
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150, // Sesuaikan dengan ukuran title di MovieCard
                height: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 60,
                height: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
