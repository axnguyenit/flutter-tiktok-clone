import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

class VideoCreationIcon extends StatelessWidget {
  const VideoCreationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            width: 38,
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 38,
            decoration: BoxDecoration(
              color: context.aquaColor,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
