import 'package:akilli_kampus/view/main/view/main_page.dart';
import 'package:flutter/material.dart';
import '../components/contents.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.asset(
                            contents[i].image ?? "",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].title ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contents[i].discription ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(context, index)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            margin: const EdgeInsets.all(40),
            child: ElevatedButton(
              child: Text(currentIndex == contents.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                } else {
                  _controller.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                }
              },
            ),
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Container buildDot(BuildContext context, int index) {
    return Container(
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: currentIndex == index ? 20 : 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
