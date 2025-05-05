import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../custom_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              // max height set to avoid infinite scaling
              maxHeight: 300,
            ),

            child: AspectRatio(
              // helps to align image vertically
              aspectRatio:
                  1, // aspect ratio lets image scale without adding padding from maxheight which is set above
              child: SvgPicture.asset(
                'lib/assets/34433956_8123320.svg',
                semanticsLabel: 'Empty state',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Nothing here yet',
            style: TextStyle(
              fontSize: Style.fontTextM,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Get started by tracking your first training set.'),
        ],
      ),
    );
  }
}
