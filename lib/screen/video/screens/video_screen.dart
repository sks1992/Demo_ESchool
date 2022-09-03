import 'package:flutter/material.dart';
import 'package:untitled2/screen/video/screens/video_player_screen.dart';

import '../../../my_drawer.dart';
import '../models/chennal.dart';
import '../models/video.dart';
import '../utils/service.dart';


class VideoScreen extends StatefulWidget {
  static final String id = '/VideoScreen';

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late ChannelInfo _channelInfo;
  late VideosList _videosList;
  late Item _item;
  late bool _loading;
  late String _playListId;
  late String _nextPageToken;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList.videos = [];
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items![0];
    _playListId = _item.contentDetails!.relatedPlaylists!.uploads!;
    print('_playListId $_playListId');
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: _playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken!;
    _videosList.videos?.addAll(tempVideosList.videos!);
    print('videos: ${_videosList.videos!.length}');
    print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        title: Text('General Video'),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.white,
              child: Column(
                children: [
                  // _buildInfoView(),
                  Expanded(
                    child: NotificationListener<ScrollEndNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (_videosList.videos!.length >=
                            int.parse(_item.statistics!.videoCount!)) {
                          return true;
                        }
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          _loadVideos();
                        }
                        return true;
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _videosList.videos!.length,
                        itemBuilder: (context, index) {
                          VideoItem videoItem = _videosList.videos![index];
                          return SingleChildScrollView(
                            child: Card(
                              elevation: 7,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videoItem.video!.channelTitle!,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(videoItem.video!.publishedAt!
                                            .toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.error_outline),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Flexible(
                                          child: Text(videoItem.video!.title!),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return VideoPlayerScreen(
                                            videoItem: videoItem,
                                          );
                                        }));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                              Icons.slow_motion_video_outlined),
                                          Text(
                                            "Watch Video",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
