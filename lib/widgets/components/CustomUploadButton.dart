// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproduct/bloc_state/ThemeState/theme_switch_bloc.dart';
import 'package:myproduct/helpers/constants/app_utils.dart';
import 'package:myproduct/widgets/components/myText.dart';
import 'package:myproduct/widgets/components/myVideoPlayer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CustomUploadButton extends StatelessWidget {
  String text;
  final File? file;
  final String? url;
  final double? width;
  final double? width2;
  final double? height;
  final double? radius;
  final Function() ontap;
  final bool? isVideo;
  final bool isResume;

  CustomUploadButton({
    Key? key,
    required this.text,
    this.file,
    this.url,
    required this.isResume,
    this.width,
    this.width2,
    this.height,
    this.radius,
    this.isVideo,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (context, state) {
        return Stack(
          children: [
            GestureDetector(
              onTap: ontap,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(20),
                color: state.selected.grey.withOpacity(0.3),
                dashPattern: [10, 5],
                strokeWidth: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
                  child: Container(
                    height: isResume
                        ? height ?? MediaQuery.sizeOf(context).height * 0.7
                        : (isVideo ?? false)
                            ? 220.sp
                            : height ?? 150.sp,
                    width: width ?? MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: state.selected.grey.withOpacity(0.1)),
                    // color: index == 0
                    //     ? state.selected.primaryColor
                    //         .withOpacity(0.1)
                    //     : state.selected.white
                    //         .withOpacity(0.001),
                    // width: 150,
                    // SfPdfViewer.file(io.File(path))
                    child: (file != null || url != null) && (isVideo ?? false)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: MyVideoPlayer(
                                file: file,
                                url: url,
                              )),
                            ],
                          )
                        : file != null
                            ? checkFileExtension(file?.path ?? '', ["pdf"])
                                ? SfPdfViewer.file(file!)
                                // Container(
                                //     padding: EdgeInsets.all(20),
                                //     child: Image.asset(
                                //         "assets/extIcon/${getExtension(widget.file?.path ?? '')}.png"),
                                //   )
                                : Image.file(file!)
                            : (url != null && url!.isNotEmpty)
                                ? checkFileExtension(url ?? '', ["pdf"])
                                    ? SfPdfViewer.network(url ?? '')
                                    : CachedNetworkImage(
                                        imageUrl: url!,
                                        errorWidget: (context, url, error) =>
                                            getDefaultUploadWidget(text),
                                      )
                                : getDefaultUploadWidget(text),
                  ),
                ),
              ),
            ),
            if (file != null || url != null)
              Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: ontap,
                    child: Image.asset(
                        height: 30, width: 30, "assets/icons/editSquare.png"),
                  ))
          ],
        );
      },
    );
  }
}

Widget getDefaultUploadWidget(String text) {
  return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/upload.png"),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: text,
                fw: FontWeight.bold,
                tcolor: state.selected.grey,
                tsize: 14.sp,
              )
            ],
          ),
        ],
      );
    },
  );
}
