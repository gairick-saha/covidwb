import 'package:covidwb/configuration/app_configuration.dart';
import 'package:covidwb/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuWidget extends StatelessWidget {
  final String title;
  const MenuWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) => Container(
        height: AppConfig.screenHeight(context) <= 600
            ? AppConfig.screenHeight(context) * 0.22
            : AppConfig.screenHeight(context) * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: AppConfig.screenHeight(context) * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
              alignment: Alignment.center,
              child: Text(
                this.title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppConfig.screenHeight(context) * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(controller.menuItems.length, (index) {
                    Widget child;
                    if (controller.menuItems[index] == "OXYGEN") {
                      child = Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'assets/images/oxygen.png',
                              scale: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              controller.menuItems[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: AppConfig.kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (controller.menuItems[index] == "DOCTORS") {
                      child = Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'assets/images/doctor.png',
                              scale: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              controller.menuItems[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: AppConfig.kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (controller.menuItems[index] == "VOLUNTEERS") {
                      child = Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'assets/images/volunteers.png',
                              scale: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              controller.menuItems[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: AppConfig.kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (title == "WHAT YOU NEED NOW") {
                          controller.selectMenu(index);
                        } else {
                          controller.changeMenu(index);
                        }
                      },
                      child: Container(
                        width: AppConfig.screenWidth(context) * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: controller.selectedMenu ==
                                  controller.menuItems[index]
                              ? Color(0xFFDEFDFF)
                              : Colors.transparent,
                        ),
                        child: child,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
