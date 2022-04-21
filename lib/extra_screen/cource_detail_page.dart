import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/widgets/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:video_player/video_player.dart';

String courceUrl =
    'https://media.istockphoto.com/photos/portrait-of-smiling-diverse-people-raising-hands-at-seminar-picture-id1342228491?b=1&k=20&m=1342228491&s=170667a&w=0&h=rZuhcq_sbRYQIVWFfsDdqFi6XeQwcwR8gs7ZIlTrVQ8=';

class CourceDetailPage extends StatefulWidget {
  static const routeName = 'cource_detail_page';
  const CourceDetailPage({Key? key, required this.cource}) : super(key: key);
  static MaterialPageRoute route({required CourceModel cource}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CourceDetailPage(cource: cource),
    );
  }

  final CourceModel cource;
  @override
  State<CourceDetailPage> createState() => _CourceDetailPageState();
}

class _CourceDetailPageState extends State<CourceDetailPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() async {
    // app does not allow to take screen shot
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.cource.courceName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info),
            tooltip: 'Cource Info',
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  width: double.infinity,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {},
                          )),
                        ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       _controller.value.isPlaying
            //           ? _controller.pause()
            //           : _controller.play();
            //     });
            //   },
            //   icon: Icon(
            //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //   ),
            // ),
            Flexible(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  CourceContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Share Market Xpert'),
    //     centerTitle: true,
    //     bottom: TabBar(
    //       tabs: [
    //         Tab(
    //           text: "Detail",
    //         ),
    //         Tab(
    //           text: 'Learn',
    //         )
    //       ],
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         CourceHeadingWidget(),
    //         SizedBox(height: 15),
    //         WhatYouLearnWidget(),
    //         CourceDescription(),
    //         CourceContent()
    //       ],
    //     ),
    //   ),
    // );
  }
}

class CourceHeadingWidget extends StatelessWidget {
  const CourceHeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                courceUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'This Cource Includes',
              style: Theme.of(context).textTheme.headline5,
            ),
            CourceIncludeItem(icon: Icons.book, title: " Language - English"),
            CourceIncludeItem(
                icon: Icons.book_online, title: " Subtitles - No"),
            CourceIncludeItem(
                icon: Icons.desktop_mac,
                title: " Use On Desktop , Tablet & Mobile"),
            CourceIncludeItem(
                icon: Icons.alarm, title: " Full Lifetime access"),
            CourceIncludeItem(
                icon: Icons.book, title: " Certificate of Completion"),
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/47.jpg"),
                ),
                SizedBox(width: 10),
                Text(
                  "By Anmol Kashyap",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row CourceIncludeItem({required String title, required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        Text(title)
      ],
    );
  }
}

class WhatYouLearnWidget extends StatelessWidget {
  const WhatYouLearnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What You`ll Learn',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 7),
            WhatYouLearnWidgetTile(
              title:
                  "Build A Digital Marketing Agency From Scretch Digital Marketing Agency From Scretch",
            ),
            SizedBox(
              height: 7,
            ),
            WhatYouLearnWidgetTile(
              title: "Price Your Services to Make Profit.",
            ),
            SizedBox(
              height: 7,
            ),
            WhatYouLearnWidgetTile(
              title:
                  "Build a Strong Website For Your Agency Business using Wordpress",
            ),
            SizedBox(
              height: 7,
            ),
            WhatYouLearnWidgetTile(
              title:
                  "Find Your niche and create content that resonate with your audiance",
            ),
          ],
        ),
      ),
    );
  }
}

class WhatYouLearnWidgetTile extends StatelessWidget {
  final String title;
  const WhatYouLearnWidgetTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.green,
        ),
        SizedBox(width: 10),
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 3,
            overflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}

class CourceDescription extends StatelessWidget {
  const CourceDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cource Description',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20),
            Text(
              "Do you want to learn how to write content for the web and earn money through it? Or do you want to write content just for expressing yourself better? Or do you plan to build this amazing skill and use it to build your own brand? Though being able to write content can help in multiple ways, have you been thinking that content writing is only for the talented and created individuals, who have a flair for writing, to whom the words flow naturally, and have an extensive vocabulary? If yes, this course proves it wrong, by teaching anybody and everybody the skill to translate their thoughts into words that attract readers, captivates them, engages them, educates them, and inspires them, no matter if you don’t have perfect grammar, an extensive vocabulary, the publisher mindset, the set of tools to use, or the technical nuances of writing effectively,",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}

class CourceContent extends StatelessWidget {
  const CourceContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      // title: Text(
      //   'Cource Content',
      //   style: Theme.of(context).textTheme.headline5,
      // ),
      // subtitle: CourceContentDurationTile(
      //   sections: "1",
      //   leactures: "39",
      //   duration: "13Hr 26Min 58Sec",
      // ),
      children: [
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title:
                '2. Is Content Writing Only For The Creative People and Talented Writers',
            duration: "08:39"),
        CourceContentVideoTile(
            title: ' 3. Difference Between Content Writing and Copywriting',
            duration: "13:21"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title:
                '2. Is Content Writing Only For The Creative People and Talented Writers',
            duration: "08:39"),
        CourceContentVideoTile(
            title: ' 3. Difference Between Content Writing and Copywriting',
            duration: "13:21"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
        CourceContentVideoTile(
            title: '1 Why Content Writing', duration: "17:45"),
      ],
    );
  }
}

class CourceContentDurationTile extends StatelessWidget {
  final String sections;
  final String leactures;
  final String duration;
  const CourceContentDurationTile(
      {Key? key,
      required this.leactures,
      required this.duration,
      required this.sections})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$sections Sections'),
        SizedBox(width: 5),
        Text('$leactures leactures'),
        SizedBox(width: 5),
        Text('$duration Length')
      ],
    );
  }
}

class CourceContentVideoTile extends StatelessWidget {
  final String title;
  final String duration;
  const CourceContentVideoTile(
      {Key? key, required this.title, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return VideoItem();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.visible,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(duration),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
