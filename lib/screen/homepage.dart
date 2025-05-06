import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/route.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101010), // Set background color to #101010
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Add 20 pixels of space from the top
                const SizedBox(height: 50),
                // Background Image with Greeting
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RouteManager.profilepage);
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Colors.grey, // Fallback background
                              child: ClipOval(
                                child: Image.network(
                                  'https://snworksceo.imgix.net/jst/2a0b1bee-2c94-4ce9-9c68-4fe0efc81239.sized-1000x1000.jpg?w=1750', // Replace with your image URL
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.person,
                                        size: 30,
                                        color:
                                            Colors.white); // Placeholder icon
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Hello,",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "jack",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Notification Icon on the right
                    IconButton(
                      onPressed: () {
                        // Handle notification icon tap
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white, // White color for the icon
                        size: 30, // Adjust the size of the icon
                      ),
                    ),
                  ],
                ),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search movie..',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white
                          .withOpacity(0.1), // Light background for search bar
                    ),
                  ),
                ),
                // Popular Movies Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular movies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text color
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MovieCard('Moon knight', 'Adventure, Hollywood',
                                'https://images.thedirect.com/media/article_full/moon-knight-eternals.jpg'),
                            MovieCard('Weak hero class 1', 'Action',
                                'https://i.ytimg.com/vi/eFHhlHtkxsA/maxresdefault.jpg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // TV Shows Section
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tv shows',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text color
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TvShowCard('Weak hero class 2', 'Action',
                                'https://asianwiki.com/images/0/08/Weak_Hero_Class_2-p1.jpg'),
                            TvShowCard('Na Zha 2', 'Cartoon',
                                'https://upload.wikimedia.org/wikipedia/en/thumb/b/b6/Ne_Zha_2_poster.jpg/250px-Ne_Zha_2_poster.jpg'),
                            TvShowCard('Stranger Things', 'Drama',
                                'https://i.redd.it/jl4hujvr35qa1.jpg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Add some space at the bottom to avoid overlap with the icon box
                SizedBox(height: 120),
              ],
            ),
          ),
          // Box with 4 icons at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red
                      .withOpacity(0.8), // Semi-transparent red background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.home, color: Colors.white, size: 20),
                    Icon(Icons.movie, color: Colors.white, size: 20),
                    Icon(Icons.tv, color: Colors.white, size: 20),
                    Icon(Icons.person, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  MovieCard(this.title, this.subtitle, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.movie);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TvShowCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;
  TvShowCard(this.title, this.subtitle, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text color
            ),
          ),
          SizedBox(height: 3), // Add spacing between title and subtitle
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70, // Lighter text color for subtitle
            ),
          ),
        ],
      ),
    );
  }
}
