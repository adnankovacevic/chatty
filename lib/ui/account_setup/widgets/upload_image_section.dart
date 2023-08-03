import 'package:flutter/material.dart';

class UploadImageSection extends StatelessWidget {
  const UploadImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 185,
          width: 185,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
              ),
              Positioned(
                right: 9,
                bottom: 6,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(6),
                        onPressed: () {
                          print('Upload image');
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
