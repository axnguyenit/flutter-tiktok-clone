import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/models/models.dart';
import 'package:tiktok/widgets/widgets.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel? user;

  const ProfileInfo({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const XAvatar(
          size: 96,
          imageUrl:
              'https://vcdn1-giaitri.vnecdn.net/2022/09/23/-2181-1663929656.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=apYgDs9tYQiwn7pcDOGbNg',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: XText('@username'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  const XText.headlineSmall('0'),
                  XText.bodySmall(
                    'Following',
                    style: context.bodySmall?.copyWith(
                      color: context.borderDisableColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  const XText.headlineSmall('0'),
                  XText.bodySmall(
                    'Follower',
                    style: context.bodySmall?.copyWith(
                      color: context.borderDisableColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 96,
              child: Column(
                children: [
                  const XText.headlineSmall('0'),
                  XText.bodySmall(
                    'Likes',
                    style: context.bodySmall?.copyWith(
                      color: context.borderDisableColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
