class OnBoardModel {
  final String image;
  final String titleText;
  final String subtitleText;

  OnBoardModel({required this.image,required this.titleText,required this.subtitleText});
}

List<OnBoardModel> contents = [
  OnBoardModel(
    image: 'assets/images/onboard_image1.jpg',
    titleText: '20% Discount \nNew arrival product',
    subtitleText:       'Publish up your selfies to make yourself \nmore beautiful with this app',
  ),
   OnBoardModel(
    image:  'assets/images/onboard_image2.jpg',
    titleText:  'Take Advantage \nOf The Offer Shopping',
    subtitleText:       'Publish up your selfies to make yourself \nmore beautiful with this app',
  ),
   OnBoardModel(
    image:  'assets/images/onboard_image3.jpg',
    titleText:  'All Types Of Offers Within Your Reach',
    subtitleText:       'Publish up your selfies to make yourself \nmore beautiful with this app',
  ),
];
