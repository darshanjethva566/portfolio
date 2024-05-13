
import 'package:flutter/material.dart';

import 'package:my_portfolio/responsive/responsive_design.dart';
import 'package:my_portfolio/utils/app_assets.dart';
import 'package:my_portfolio/utils/custome_textstyle.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {

    return ResponsiveDesign(mobile:
    Padding(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          introText(),

          myImage(),

        ],
      ),
    ), desktop: desktopTablet(), tablet:  desktopTablet(), bgcolor: Colors.blue.withOpacity(0.3));
  }

  Image myImage() {
    return Image.asset( AppAssets.myPic,
          height: 400,
          width: 400,
          fit: BoxFit.contain,);
  }

   desktopTablet() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        myImage(),
        Expanded(child: introText())
      ],
        ),
    );
  }

    introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(text: TextSpan(text: "About"  ,style: AppTextStyles.headingStyles(),children: [
          TextSpan(text: " ME!",style: AppTextStyles.headingStyles(color: Colors.blue))
        ]),),
        SizedBox(height: 10,),
        Text('Flutter Developer',style: AppTextStyles.headingStyles(),),
        SizedBox(height: 10,),
        Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
          style: AppTextStyles.comfortaaStyle(),),


      ],
    );
  }
}
