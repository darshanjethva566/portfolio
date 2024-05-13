import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive/responsive_design.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/custome_textstyle.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'My ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Skills',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.blueClr),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        AnimatedCircularProgressIndicator(label: "Flutter",percentage: 0.8,)
      ],
    );
  }
}
class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            for(int i = 0;i<5; i++)
              buildPadding()
          ],
        ),
      ],
    );
  }

   buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 100,width: 100,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: Duration(seconds: 2),
              builder: (context, double value, child) => Stack(
            fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(

                    value: value,
                    color: AppColors.blueClr,
                    strokeWidth: 5,
                    backgroundColor: AppColors.blackClr,
                  ),
                  Center(
                    child: Text(
                        (value * 100).toInt().toString() + "%",
                        style: AppTextStyles.headingStyles(fontSize: 14)
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.headingStyles(fontSize: 14),
          ),
        ],
      ),
    );
  }
}