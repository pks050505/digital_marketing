import 'package:better_player/better_player.dart';

import 'package:digital_marketing/bloc/video/video_bloc.dart';
import 'package:digital_marketing/bloc/video/video_event.dart';
import 'package:digital_marketing/bloc/video/video_state.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String videoUrl =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
String courceUrl =
    'https://media.istockphoto.com/photos/portrait-of-smiling-diverse-people-raising-hands-at-seminar-picture-id1342228491?b=1&k=20&m=1342228491&s=170667a&w=0&h=rZuhcq_sbRYQIVWFfsDdqFi6XeQwcwR8gs7ZIlTrVQ8=';

class CourceDetailScreen extends StatefulWidget {
  static const routeName = 'cource_detail_screen';
  const CourceDetailScreen({
    Key? key,
    required this.courceModel,
  }) : super(key: key);
  static MaterialPageRoute route({required CourceModel courceModel}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<VideoBloc>(
        create: (context) => VideoBloc(),
        child: CourceDetailScreen(courceModel: courceModel),
      ),
    );
  }

  final CourceModel courceModel;

  @override
  State<CourceDetailScreen> createState() => _CourceDetailScreenState();
}

class _CourceDetailScreenState extends State<CourceDetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const BuildVideoView(),
          const LinkAndAboutRowButton(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: videosLinks.length,
              itemBuilder: (context, index) {
                return LessionTile(index: index);
              },
            ),
          )
          // Expanded(
          //   child: LessionListView(widget: widget),
          // ),
        ],
      )),
    );
  }
}

class LinkAndAboutRowButton extends StatelessWidget {
  const LinkAndAboutRowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Cource url'),
                      titleTextStyle: const TextStyle(color: Colors.green),
                      children: [
                        Row(
                          children: [
                            const Text('https://www.idp.com/cources'),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: 'https://www.idp.com/cources',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Copied')));
                              },
                              icon: const Icon(Icons.copy),
                            )
                          ],
                        )
                      ],
                    );
                  });
            },
            child: const Text('Cource Links')),
        // Expanded(child: Container()),
        ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "In this course, you will learn how to trade the Stock Market. It's a course designed for Complete Beginners and Intermediate market participants.We start off by covering basic concepts and work our way up to more advanced level material.By the end of this course, you will completely understand how the Stock Market works. You will understand what a Stock is, why you need a Broker, and what are Exchanges \n You will learn about Orders to buy and sell stocks and how they determine the price of a stock. Furthermore, you will get a list of Recommended Resources.We then cover Technical Analysis, including Charts and Candlesticks, Trends, Supports & Resistances, Chart Patterns, Volume, etc.",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Instructor',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Piyus Goel',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Duration',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '1.8 Hours',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('About Cource'),
        )
      ],
    );
  }
}

class BuildVideoView extends StatelessWidget {
  const BuildVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoControllerState>(
      builder: (context, state) {
        if (state is VideoControllerInitial) {
          return Container(
            height: 135,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'start watching',
                  style: TextStyle(fontSize: 30),
                ),
                // Icon(
                //   Icons.play_arrow,
                //   size: 50,
                //   color: Colors.green,
                // ),
              ],
            ),
          );
        }
        if (state is VideoControllerLoaded) {
          return BetterPlayer(
            controller: state.controller,
            key: Key(state.hashCode.toString()),
          );
        } else {
          return const Text('error state');
        }
      },
    );
  }
}

// class VideoViewWidget extends StatefulWidget {
//   const VideoViewWidget({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   State<VideoViewWidget> createState() => _VideoViewWidgetState();
// }

// class _VideoViewWidgetState extends State<VideoViewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       width: widget.size.width,
//       decoration: BoxDecoration(
//         border: Border.all(),
//         color: Colors.amber,
//       ),
//       child: BlocBuilder<VideoBloc, VideoState>(
//         builder: (context, state) {
//           if (state is VideoLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state is VideoLoadedState) {
//             return Center(
//               child: InkWell(
//                 onTap: () {
//                   // state.controller.play();
//                 },
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey,
//                   ),
//                   child: Stack(
//                     children: [
//                       VideoPlayer(state.controller),
//                       Align(
//                         alignment: Alignment.center,
//                         child: VisibilityPlayIcon(controller: state.controller),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return const Center(
//             child: Text('something went wrong'),
//           );
//         },
//       ),
//     );
//   }
// }

// class LessionsTabView extends StatelessWidget {
//   final CourceModel cource;
//   const LessionsTabView({Key? key, required this.cource}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VideoBloc, VideoState>(
//       builder: (context, state) {
//         return Container(
//           color: Colors.white,
//           child: ListView.builder(
//             shrinkWrap: true,
//             padding: const EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 10,
//             ),
//             itemCount: 10,
//             itemBuilder: ((context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   debugPrint(index.toString());
//                 },
//                 child: LessionTile(index: index),
//               );
//               // return Card(
//               //   color: Colors.grey.shade300,
//               //   child: ListTile(
//               //     leading: const Icon(Icons.lock_open),
//               //     title: Text(
//               //       'Lession ${index + 1}',
//               //       style: Theme.of(context).textTheme.headline6,
//               //     ),
//               //     trailing: const Text('10:05 min'),
//               //     onTap: () {
//               //       context.read<VideoBloc>().add(NextVideo(state.url));
//               //     },
//               //   ),
//               // );
//             }),
//           ),
//         );
//       },
//     );
//   }
// }

var videosLinks = [
  "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
];

class LessionTile extends StatefulWidget {
  final int index;
  const LessionTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<LessionTile> createState() => _LessionTileState();
}

class _LessionTileState extends State<LessionTile> {
  @override
  Widget build(BuildContext context) {
    // var connectivitySevice = ConnectivitySevice();
    // var isConnected = true;
    // connectivitySevice.connectivityStream.stream.map(((event) {
    //   if (event == ConnectivityResult.none) {
    //     isConnected = false;
    //     setState(() {});
    //   } else {
    //     setState(() {});
    //     isConnected = true;
    //   }
    // }));
    return GestureDetector(
      onTap: () {
        // print('isConnnnnnectttted  $isConnected');
        // isConnected
        BlocProvider.of<VideoBloc>(context)
            .add(NextVideo(videosLinks[widget.index]));
        // : isConnected = false;
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(courceUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'lesson ${widget.index + 1}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'how to create facebook ads from dashboard',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Container(
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade100,
                        ),
                        child: Center(
                          child: Text(
                            '15s rest',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(height: 10),
            // Row(
            //   children: [

            //     SizedBox(width: 20),
            //     for (int i = 0; i <= 80; i++)
            //       i.isEven
            //           ? Container(
            //               height: 1,
            //               width: 3,
            //               color: Colors.blueGrey.shade100,
            //             )
            //           : Container(
            //               height: 1,
            //               width: 3,
            //               color: Colors.white,
            //             )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class AboutTabView extends StatelessWidget {
  final CourceModel courceModel;
  const AboutTabView({Key? key, required this.courceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(courceModel.courceUrl),
            ),
          ),
          Text(
            courceModel.courceName,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}

// class VisibilityPlayIcon extends StatefulWidget {
//   final VideoPlayerController controller;
//   const VisibilityPlayIcon({Key? key, required this.controller})
//       : super(key: key);

//   @override
//   State<VisibilityPlayIcon> createState() => _VisibilityPlayIconState();
// }

// class _VisibilityPlayIconState extends State<VisibilityPlayIcon> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//         visible: widget.controller.value.isPlaying ? false : true,
//         maintainState: true,
//         child: IconButton(
//           iconSize: 30,
//           icon: const Icon(Icons.play_arrow),
//           onPressed: () {
//             widget.controller.play();
//           },
//         ));
//   }
// }

// class VideoView extends StatefulWidget {
//   final String url;

//   const VideoView({Key? key, required this.url}) : super(key: key);
//   @override
//   State<VideoView> createState() => _VideoViewState();
// }

// class _VideoViewState extends State<VideoView> {
//   late final VideoBloc videoBloc;
//   @override
//   void initState() {
//     videoBloc = VideoBloc();
//     super.initState();
//   }

//   // late BetterPlayerController _betterPlayerController;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//   //       BetterPlayerDataSourceType.network,
//   //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
//   //   _betterPlayerController = BetterPlayerController(
//   //     BetterPlayerConfiguration(
//   //         overlay: Opacity(
//   //       opacity: 0.2,
//   //       child: Marquee(
//   //         text: 'user name    email@gmail.com',
//   //         blankSpace: 300,
//   //         crossAxisAlignment: CrossAxisAlignment.center,
//   //       ),
//   //     )),
//   //     betterPlayerDataSource: betterPlayerDataSource,
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VideoBloc, VideoState>(
//       builder: (context, state) {
//         return BetterPlayer.network(
//           widget.url,
//           betterPlayerConfiguration: BetterPlayerConfiguration(
//             overlay: Opacity(
//               opacity: 0.2,
//               child: Marquee(
//                 text: 'user name   email@email.com',
//                 blankSpace: 300,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
