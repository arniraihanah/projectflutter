import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 178, 149, 149),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Hi,arniraihanah",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/emma.jpg"),
                        radius: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "Abstract Photos Collection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 135, 80, 112),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: ImageSlider(),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ScrollViewItem(
                width: 300,
                height: 400,
                imagePath: 'images/${index + 1}.jpg',
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Color.fromARGB(255, 205, 136, 146)
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ScrollViewItem extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;

  const ScrollViewItem({
    Key? key,
    required this.width,
    required this.height,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 161, 198, 224),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
