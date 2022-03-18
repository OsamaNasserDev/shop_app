import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/screens/sign_in/view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel{
   final String image ;
   final String title ;
   final String body ;
   BoardingModel({required this.image ,required this.title,required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(image: 'assets/images/onboard1.PNG', title: 'Title 1 Title 1Title 1Title 1Title 1Title 1Title 1', body: 'Body 1'),
    BoardingModel(image: 'assets/images/onboard1.PNG', title: 'Title 2', body: 'Body 2'),
    BoardingModel(image: 'assets/images/onboard1.PNG', title: 'Title 3', body: 'Body 3'),
  ];

  PageController boardController = PageController();

  bool isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(onPressed: (){
              CacheHelper.writeFirstTime(key: "isFirstTime", value: false);
            }, child: const Text('SKIP',style: TextStyle(color: Colors.purple),))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if(index == boarding.length -1){
                    setState(() {
                      isLast = true ;
                      // print('last');
                    });

                  }else{
                    setState(() {
                      isLast =false;
                      // print("not last");
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(model: boarding[index], ),
                itemCount: boarding.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller: boardController,  // PageController
                      count:  boarding.length,
                      effect:  const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.purple,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4.0,
                        spacing: 5.0,
                      ), // your preferred effect
                      onDotClicked: (index){

                      }
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsetsDirectional.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        //onPrimary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        if(isLast){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen(),), (route) => false);

                          // save shardpref file >> false
                          CacheHelper.writeFirstTime(key: "isFirstTime", value: false);

                        }else{
                          boardController.nextPage(duration: const  Duration(milliseconds: 800), curve: Curves.fastLinearToSlowEaseIn);
                        }


                      },
                      child: isLast ? const Text(
                        "  Get Started  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic
                        ),
                      ):const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 25,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ));
  }

  Widget buildBoardingItem({required BoardingModel model}) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image(image: AssetImage(model.image))),
             Text(
              model.title,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.body,
              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
  );
}
