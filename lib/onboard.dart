
import 'package:abyssinia/webview/webview.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Map<String, String?>> _onboardingData = [
    {
      "title": "Welcome to Abyssina Secured Finance Manager App",
      "text": "this app helps to manage your daily Finance activity Easily. For Merchants and Companies",
      "image": "assets/images/lg2.png"
    },
    {
      "title": "High Security Features",
      "text": "The app has Advanced Security Features.It stores every information in encrypted formate",
      "image": "assets/images/lg2.png"
    },
    {
      "title": "Data Security ",
      "text": "Any Information you entered are highly Protected and Secured No one access to your Data. You can Store or remove or download Your Data locally whenever you want!",
      "image": "assets/images/lg2.png"
    },
     {
      "title": "You can use computer or Phone",
      "text": "Same Data and Interface on computer and phone. You can use mobile app or the website Version at https://finance.abyssiniasoftware.com/",
      "image": "assets/images/lg2.png"
    },
     {
      "title": "Features ",
      "text": "it has Budget Management, Expense and Income Managment, Data report and more...",
      "image": "assets/images/lg2.png"
    },
     {
      "title": "Cheap to Use",
      "text": "Most the app feature is completely Free for Ever but for advanced Systems like Sales and inventory system,logistic logistic transportation online order and paymnet, CRM You need to subscribe",

      "image": "assets/images/lg2.png"
    },
      {
      "title": "Language",
      "text": "the app supports Four Languages English,አማርኛ, Affan Oromo, ትግርኛ.",
      "image": "assets/images/lg2.png"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) => OnboardingPage(
                    image: _onboardingData[index]["image"] ?? "",
                    title: _onboardingData[index]["title"] ?? "",
                    text: _onboardingData[index]["text"] ?? "",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage != 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.ease,
                        );
                      },
                      child: Text("Previous"),
                    ),
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                  if (_currentPage != _onboardingData.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Text("Next"),
                    ),
                  if (_currentPage == _onboardingData.length - 1)
                    ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebviewTwo(url: 'https://finance.abyssiniasoftware.com/',)),
                        );
                      },
                      child: Text("Get Started"),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Theme.of(context).primaryColor


: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 300,
        ),
        SizedBox(height: 30),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 15),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}


