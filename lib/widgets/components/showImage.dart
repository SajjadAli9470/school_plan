import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class showImage extends StatelessWidget {
  final File? file;
  final String? url;
  final double? width;
  final double? height;
  final Function() ontap;
  final double? radius;

  const showImage(
      {super.key,
      this.file,
      this.url,
      this.width,
      this.height,
      this.radius,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(radius ?? 100),
            // border: Border.all(color: Colors.grey.withOpacity(0.3))
          ),
          clipBehavior: Clip.none,
          height: height ?? 130,
          width: width ?? 130,
          child: (file == null && url == null)
              ? Image.asset("assets/icons/defaultUser.png")
              : file != null
                  ? Image.file(file!)
                  : url != null
                      ? CachedNetworkImage(
                          imageUrl: url!,
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/icons/defaultUser.png"),
                        )
                      : Image.asset("assets/icons/defaultUser.png"),
        ),
      ),
    );
  }
}
