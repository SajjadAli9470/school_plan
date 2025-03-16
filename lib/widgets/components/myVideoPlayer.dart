// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myproduct/widgets/components/shimmerLoader.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatelessWidget {
  final String? url;
  final File? file;
  final VideoPlayerController? controller;

  MyVideoPlayer({
    Key? key,
    this.url,
    this.file,
  })  : controller = url != null
            ? VideoPlayerController.networkUrl(Uri.parse(url))
            : file != null
                ? VideoPlayerController.file(file)
                : null,
        super(key: key);

  Future<void> initializeController(BuildContext context) async {
    if (controller != null) {
      await controller!.initialize();
      controller!.addListener(() {
        if (controller!.value.isCompleted) {
          (context as Element).markNeedsBuild();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeController(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: ShimmerLoading()),
            ],
          );
        }

        return GestureDetector(
          onTap: () {
            if (!controller!.value.isPlaying) {
              controller!.play();
            } else {
              controller!.pause();
            }
            (context as Element).markNeedsBuild();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: controller!.value.aspectRatio,
                child: VideoPlayer(controller!),
              ),
              if (!controller!.value.isPlaying || controller!.value.isCompleted)
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.play_circle_filled_rounded,
                      size: 40,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// class MyVideoPlayer extends StatefulWidget {
//   final String? url;
//   final File? file;
//   MyVideoPlayer({
//     Key? key,
//     this.url,
//     this.file,
//   }) : super(key: key);

//   @override
//   State<MyVideoPlayer> createState() => _MyVideoPlayerState();
// }

// class _MyVideoPlayerState extends State<MyVideoPlayer> {
//   VideoPlayerController? _controller;
//   @override
//   void initState() {
//     if (widget.url != null) {
//       _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!))
//         ..initialize().then((_) {
//           // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//           setState(() {});
//         });

//       _controller!.addListener(
//         () {
//           if (_controller!.value.isCompleted) {
//             setState(() {});
//           }
//         },
//       );
//     } else if (widget.file != null) {
//       _controller = VideoPlayerController.file(widget.file!)
//         ..initialize().then((_) {
//           // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//           setState(() {});
//         });
//       _controller!.addListener(
//         () {
//           if (_controller!.value.isCompleted) {
//             setState(() {});
//           }
//         },
//       );
//     }
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return _controller == null
//         ? Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(child: ShimmerLoading()),
//             ],
//           )
//         : GestureDetector(
//             onTap: () {
//               if (!_controller!.value.isPlaying) {
//                 _controller!.play();
//               } else {
//                 _controller!.pause();
//               }
//               setState(() {});
//             },
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller!.value.aspectRatio,
//                   child: VideoPlayer(_controller!),
//                 ),
//                 if (!_controller!.value.isPlaying ||
//                     _controller!.value.isCompleted)
//                   Positioned(
//                       child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: Icon(
//                       Icons.play_circle_filled_rounded,
//                       size: 40,
//                     ),
//                   ))
//               ],
//             ),
//           );
//   }
// }
