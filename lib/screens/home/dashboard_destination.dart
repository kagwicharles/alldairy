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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: .9, crossAxisSpacing: 2),
              children: const [
                Menu(title: "Expert Consultation", image: "consult.png"),
                Menu(title: "Animal Treatment", image: "treatment.png"),
                Menu(title: "My Data", image: "records.png"),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              "Events & Webinars",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            CarouselSlider.builder(
                itemCount: events.length,
                options: CarouselOptions(
                    height: 128,
                    autoPlay: false,
                    viewportFraction: 1,
                    onPageChanged: onSwipe),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Column(
                    children: [
                      events[itemIndex],
                    ],
                  );
                }),
            const SizedBox(
              height: 4,
            ),
            events.length > 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: events.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context)
                                      .colorScheme
                                      .inversePrimary)
                                  .withOpacity(
                                      _currentIndex == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  )
                : const SizedBox()
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary)),
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
