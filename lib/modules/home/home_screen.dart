import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/modules/common/common.dart';
import 'package:tiktok/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildMusicIcon(String imageUrl) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.black87,
            Colors.grey,
          ],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: XAvatar(imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.aquaColor,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.AppHorizontalPadding,
        ),
        child: PageView.builder(
          itemCount: 10,
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // VideoPlayer(controller),
                Column(
                  children: [
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // video info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // username
                              XText.labelLarge(
                                'username',
                                style: context.labelLarge?.copyWith(
                                  color: context.lightColor,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              XText.bodySmall(
                                // ignore: lines_longer_than_80_chars
                                'this is description, this is description, this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description,this is description, this is description, this is description, this is description',
                                style: context.bodySmall?.copyWith(
                                  color: context.lightColor,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        // video actions
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            // const XAvatar(),
                            ...VideoActions.values.map((e) {
                              return VideoActionButton(
                                icon: e.getIcon,
                                amount: '10k',
                                onPressed: () {},
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.music_note_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                              XText.bodySmall(
                                'name song',
                                style: context.bodySmall?.copyWith(
                                  color: context.lightColor,
                                ),
                              )
                            ],
                          ),
                          CircleAnimation(
                            child: _buildMusicIcon(
                                'https://vcdn1-giaitri.vnecdn.net/2022/09/23/-2181-1663929656.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=apYgDs9tYQiwn7pcDOGbNg'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
