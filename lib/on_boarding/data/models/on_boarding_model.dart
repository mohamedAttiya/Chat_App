import '../../../assets/app_assets.dart';

class OnBoardingModel
{
  final String image;
  final String title;
  final String subTitle;
  OnBoardingModel({required this.image, required this.title, required this.subTitle});
}
List<OnBoardingModel> onBoardingData =
[
  OnBoardingModel(image:AppAssets.onBoardingOne,title:'Messaging and Texting are among the most popular methods of communication',subTitle: 'Online Messaging Apps are often used by young people to talk to their friends'),
  OnBoardingModel(image:AppAssets.onBoardingTwo,title:'When young people can contact friends their own age , it makes it easier for them to ask for help',subTitle:'Chatting with peers online can help young people to develop and refine new or creative ideas'),
  OnBoardingModel(image:AppAssets.onBoardingThree,title:'Good communication is an important part of all relationships',subTitle:'Be clear when communicating with your partner , so that your message can be received and understood'),
];