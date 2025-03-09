import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const HorizontalList({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 362,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(itemCount, (index) {
              final EdgeInsets padding = EdgeInsets.only(
                left: index == 0 ? 8.0 : 4.0,
                right: index == itemCount - 1 ? 8.0 : 4.0,
              );
              return Padding(
                padding: padding,
                child: SizedBox(
                  width: 200,
                  child: itemBuilder(context, index),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
