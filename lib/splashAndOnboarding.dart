import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(SplashApp());
}

class SplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash App',
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
      ],
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFC3B1F4), Color(0xFFFDF6E3)],
          ),
        ),

        child: Center(
          child: SafeArea(
            maintainBottomViewPadding: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splashphoto.png",

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final _currentPage = 0.obs;

  List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      title: 'İster kitap kurdu ol!',
      image: 'assets/bookworm 2.png',
      gradientColors: [
        Color(0xFFC3B1F4),
        Color(0xFFFDF6E3),
      ],
    ),
    OnboardingPageModel(
      title: 'İster spor tutkunu!',
      image: 'assets/6165846 1.png',
      gradientColors: [
        Color(0xFFC3B1F4),
        Color(0xFFFDF6E3),
      ],
    ),
    OnboardingPageModel(
      title: 'Artık yeni arkadaşların \nSocApp ile \nbir tık uzağında.',
      image: 'assets/Logo 500x500  px.png',
      gradientColors: [
        Color(0xFFC3B1F4),
        Color(0xFFFDF6E3),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _pages[_currentPage.value].gradientColors,
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int index) {
                  _currentPage.value = index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return OnboardingPage(
                    title: _pages[index].title,
                    image: _pages[index].image,
                    gradientColors: _pages[index].gradientColors,
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  dotColor: Colors.purpleAccent,
                  activeDotColor: Colors.pink,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //Login sayfasına geçmek için burayı kullan
                    Get.offAllNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text('GEÇ', style: TextStyle(color:Colors.pinkAccent),),
                ),
              ],
            ),

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String image;
  final List<Color> gradientColors;

  OnboardingPageModel({
    required this.title,
    required this.image,
    required this.gradientColors,
  });
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String image;
  final List<Color> gradientColors;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.image,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 32.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
