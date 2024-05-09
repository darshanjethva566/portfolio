import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/custome_textstyle.dart';
import 'package:my_portfolio/views/profille_view/profile_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int menuIndex = 0;
  final yourScrollController = ScrollController();
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }
  final onMenuHover = Matrix4.identity()..scale(1.0);

  final screensList = const <Widget>[
    ProfileDetails(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    // HomePage(),
    // AboutMe(),
    // MyServices(),
    // MyPortfolio(),
    // ContactUs(),
    // FooterClass(),
  ];
  final menuItems = [
    'Home',
    'About',
    'Services',
    'Portfolio',
    'Contact',
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.blackClr,
      appBar: AppBar(
        backgroundColor: AppColors.blackClr,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxWidth<600){
             return Row(
                children: [
                  customTitle(),
                  const Spacer(),
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.whiteClr,
                    ),
                    color: AppColors.whiteClr,
                    position: PopupMenuPosition.under,
                    //aanathi popup andar j rese scafford ni

                    constraints:
                    BoxConstraints.tightFor(width: size.width * 0.9),
                    itemBuilder: (BuildContext context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                        textStyle: AppTextStyles.headerTextStyle(),
                        onTap: () {
                          scrollTo(index: e.key);
                        },
                        child: Text(e.value,style: AppTextStyles.headingStyles(fontSize: 20,color: AppColors.blackClr),),
                      ),
                    )
                        .toList(),
                  ),

                ],
              );
            }else{
             return  Row(
                children: [
                  customTitle(),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) =>
                         SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                menuIndex = index;
                              } else {
                                menuIndex = 0;
                              }
                            });
                          },
                          child: buildNavBarAnimatedContainer(
                              index, menuIndex == index ? true : false),
                        );
                      },
                    ),
                  ),

                ],
              );
            }
          },
        ),
      ),
      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 8,

        interactive: true,
        controller: yourScrollController,
        child: ScrollablePositionedList.builder(
          itemCount: screensList.length,
          itemScrollController: _itemScrollController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetListener: scrollOffsetListener,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: screensList[index],
            );
          },
        ),
      ),
    );
  }
  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
            color: hover ? AppColors.blueClr : AppColors.whiteClr),
      ),
    );
  }

  Text customTitle() => Text('PortFolio',style: AppTextStyles.headingStyles(fontSize: 28,color: AppColors.blueClr),);
}
