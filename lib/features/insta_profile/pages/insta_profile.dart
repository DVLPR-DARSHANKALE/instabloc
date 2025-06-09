import 'package:flutter/material.dart';

class InstaProfile extends StatelessWidget {
  const InstaProfile({super.key});
  final List<String> postImages = const [
    'https://picsum.photos/id/1015/300/300',
    'https://picsum.photos/id/1016/300/300',
    'https://picsum.photos/id/1025/300/300',
    'https://picsum.photos/id/1040/300/300',
    'https://picsum.photos/id/1060/300/300',
    'https://picsum.photos/id/1006/300/300',
    'https://picsum.photos/id/1008/300/300',
    'https://picsum.photos/id/1009/300/300',
    'https://picsum.photos/id/1010/300/300',
    'https://picsum.photos/id/1011/300/300',
    'https://picsum.photos/id/1012/300/300',
    'https://picsum.photos/id/1013/300/300',
    'https://picsum.photos/id/1014/300/300',
    'https://picsum.photos/id/1015/300/300',
    'https://picsum.photos/id/1016/300/300',
    'https://picsum.photos/id/1018/300/300',
    'https://picsum.photos/id/1019/300/300',
    'https://picsum.photos/id/1020/300/300',
    'https://picsum.photos/id/1021/300/300',
    'https://picsum.photos/id/1022/300/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("darshan_kale"),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/1009/300/300',
                    ),
                  ),
                  SizedBox(width: 30),

                  _buildStatColumn("10", "Posts"),
                  SizedBox(width: 20),
                  _buildStatColumn("520", "Followers"),
                  SizedBox(width: 20),
                  _buildStatColumn("200", "Following"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Darshan Kale",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Flutter Developer 💙"),
                    Text(
                      "github.com/darshankale",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Edit Profile"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Share Profile"),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                      ),

                      const SizedBox(height: 4),
                      Text(
                        "Highlight ${index + 1}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
            ),

            const Divider(),

            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.person_pin_outlined)),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [buildGridView(), buildGridView()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: postImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (_, index) {
        return Image.network(postImages[index], fit: BoxFit.cover);
      },
    );
  }
}
