import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailPage extends StatelessWidget {
  // YouTube URL for the movie (e.g., Moon Knight trailer)
  final String youtubeUrl = 'https://www.youtube.com/watch?v=x7Krla_UxRg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F22),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i3.wp.com/raisingwhasians.com/wp-content/uploads/2022/03/Moon-knight-review-safe-for-kids-680x1024.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      'https://i3.wp.com/raisingwhasians.com/wp-content/uploads/2022/03/Moon-knight-review-safe-for-kids-680x1024.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 50,
                        );
                      },
                    ),
                  ),
                ),
                // Movie Title and Details
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movie',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Moon Knight',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Movie, Hollywood',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              '16+ 2025',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              '8.8',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              '45-49min',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 120),
                      // Watch Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to MovieFramePage with the YouTube URL
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieFramePage(youtubeUrl: youtubeUrl),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Watch now',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Back Button
          Positioned(
            top: 50,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 15,
                ),
                iconSize: 15,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          // Save Icon
          Positioned(
            top: 50,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: IconButton(
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 15,
                ),
                iconSize: 15,
                onPressed: () {
                  // Handle save action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieFramePage extends StatefulWidget {
  final String youtubeUrl;

  const MovieFramePage({super.key, required this.youtubeUrl});

  @override
  _MovieFramePageState createState() => _MovieFramePageState();
}

class _MovieFramePageState extends State<MovieFramePage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    // Load and play the video
    _controller.loadVideo(widget.youtubeUrl).then((_) {
      _controller.playVideo();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load video: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F22),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1F22),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Watch Moon Knight', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
