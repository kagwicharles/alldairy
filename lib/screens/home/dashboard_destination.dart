import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashBoardSection extends StatefulWidget {
  DashBoardSection({super.key});

  @override
  State<DashBoardSection> createState() => _DashBoardSectionState();
}

class _DashBoardSectionState extends State<DashBoardSection> {
  List<Widget> events = [CarouselItem(), CarouselItem()];

  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  List<Widget> dashItems = [DashItem()];
  List<Widget> learningItems = [
    const LearnMenu(image: "books.png", title: "Books"),
    const LearnMenu(image: "blog.png", title: "Blogs"),
    const LearnMenu(image: "course.png", title: "Courses")
  ];
  List<Widget> quickMenu = [
    const QuickMenu(
      icon: Icons.table_chart,
      title: "Record",
      color: Colors.orange,
    ),
    const QuickMenu(
        icon: Icons.table_view, title: "Stats", color: Colors.blueAccent),
    const QuickMenu(
      icon: Icons.notifications_active,
      title: "Reminder",
      color: Colors.purple,
    ),
    const QuickMenu(
      icon: Icons.calendar_month,
      title: "Calendar",
      color: Colors.purpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://img.freepik.com/free-photo/cow-bulls-cowshed-farm_1303-30828.jpg?w=1380&t=st=1704766358~exp=1704766958~hmac=70938a9b8c3ffba02d55d5fabc6c9ccd9d474750ae6c4b1b83b7a52783ef0634",
                          maxHeight: 168,
                        ),
                        fit: BoxFit.cover)),
                child: ClipRRect(
                    // make sure we apply clip it properly
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Making Dairy Farming\nEasy for Farmers",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                  height: 100,
                                  child: Center(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: quickMenu.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return quickMenu[index];
                                          }))),
                            ],
                          ),
                        )))),
            SizedBox(
              height: 12,
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 2),
              children: const [
                Menu(title: "Expert Consultation", image: "consult.png"),
                Menu(title: "Animal Treatment", image: "treatment.png"),
                Menu(title: "AI Assist", image: "ai.png"),
                Menu(title: "My Data", image: "records.png"),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Learn & Grow",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
                height: 125,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: learningItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return learningItems[index];
                    })),
          ],
        ));
  }

  onSwipe(int index, CarouselPageChangedReason? reason) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.inversePrimary,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12),
        //     side: BorderSide(
        //         color: Theme.of(context).colorScheme.inversePrimary)),
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/$image",
                      height: 48,
                      width: 48,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    )
                  ]),
            )));
  }
}

class CarouselItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://img.freepik.com/free-photo/full-shot-woman-holding-box_23-2149894684.jpg?w=1380&t=st=1704651177~exp=1704651777~hmac=e152f2f66e37b14f26bef6a1a6d299e281578dcb21c86422701f86b2b84f47a6",
      fit: BoxFit.contain,
    );
  }
}

class DashItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("200"), Text("Milk production")],
    );
  }
}

class LearnMenu extends StatelessWidget {
  final String image;
  final String title;

  const LearnMenu({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/$image",
              height: 58,
              width: 58,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ));
  }
}

class QuickMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const QuickMenu(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
