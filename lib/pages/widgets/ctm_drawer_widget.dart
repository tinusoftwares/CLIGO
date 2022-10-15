import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../local_db_sqflite/db_helper.dart';
import '../../models/profile_info_model.dart';
import '../../pages/widgets/ctm_header_listtitle_widget.dart';
import 'package:get/get.dart';

import '../../local_db_sqflite/db_helper_local.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  ProfileController profileController= ProfileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: CtmColors.appWhiteColor,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
                child:

                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 5, color: CtmColors.appWhiteColor),
                          color: CtmColors.appWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Image.network(
                          'https://bdtask-demo.com/backend/public/image/websetting/1655978324_10b0faacf09c0386ba34.png',
                          width: 50,
                          height: 50,
                          color: Colors.green,
                        )
                      //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'App Name : '+CtmStrings.appName,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: CtmColors.appWhiteColor),
                    ),

                  ],
                )
               /*  Obx((){
                   if (profileController.isLoadingData.value) {
                     ProfileInfoModel profileInfo = profileController.profile.value;
                     print('mail >>:'+profileInfo.loginEmail.toString());
                     print('Name  >>:'+profileInfo.lastName.toString());
                      return    Column(
                       children: [
                         Container(
                             padding: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               border: Border.all(
                                   width: 5, color: CtmColors.appWhiteColor),
                               color: CtmColors.appWhiteColor,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 20,
                                   offset: const Offset(5, 5),
                                 ),
                               ],
                             ),
                             child: Image.network(
                               'https://bdtask-demo.com/backend/public/image/websetting/1655978324_10b0faacf09c0386ba34.png',
                               width: 50,
                               height: 50,
                               color: Colors.green,
                             )
                           //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           profileInfo.lastName??'user name',
                           style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.normal,
                               color: CtmColors.appWhiteColor),
                         ),
                         Text(
                   profileInfo.loginEmail??'example@gamil.com',
                           style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.normal,
                               color: CtmColors.appWhiteColor),
                         ),
                       ],
                     );
                   }
                   else {
                     return    Column(
                       children: [
                         Container(
                             padding: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               border: Border.all(
                                   width: 5, color: CtmColors.appWhiteColor),
                               color: CtmColors.appWhiteColor,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 20,
                                   offset: const Offset(5, 5),
                                 ),
                               ],
                             ),
                             child: Image.network(
                               'https://bdtask-demo.com/backend/public/image/websetting/1655978324_10b0faacf09c0386ba34.png',
                               width: 50,
                               height: 50,
                               color: Colors.green,
                             )
                           //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           'user Name',
                           style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.normal,
                               color: CtmColors.appWhiteColor),
                         ),
                         Text(
                          'mail@gmail.com',
                           style: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.normal,
                               color: CtmColors.appWhiteColor),
                         ),
                       ],
                     );
                   }
                 })*/

              ),

              CtmHeaderListTitleWidget(
                  titleName: "Home",
                  iconPath: Icons.home,
                  onTapTitle: () => Get.toNamed('/find_ticket')),
              DBHelper01.getToken('token') != null
                  ? Container()
                  :
              CtmHeaderListTitleWidget(
                  titleName: "Login",
                  iconPath: Icons.login,
                  onTapTitle: () => Get.toNamed('/login')),

              DBHelper01.getToken('token')== null
                  ? Container()
                  : CtmHeaderListTitleWidget(
                      titleName: "Booking History",
                      iconPath: Icons.history,
                      onTapTitle: () => Get.toNamed('/booking_history')),
              CtmHeaderListTitleWidget(
                  titleName: "About Us",
                  iconPath: Icons.multiline_chart_outlined,
                  onTapTitle: () => Get.toNamed('/about_us')),
              CtmHeaderListTitleWidget(
                  titleName: "Policy",
                  iconPath: Icons.policy,
                  onTapTitle: () => Get.toNamed('/policy')),
              CtmHeaderListTitleWidget(
                  titleName: "Terms and Condition",
                  iconPath: Icons.note_alt,
                  onTapTitle: () => Get.toNamed('/terms_and_condition')),
              CtmHeaderListTitleWidget(
                  titleName: "FAQ",
                  iconPath: Icons.note,
                  onTapTitle: () => Get.toNamed('/company_faq')),
              CtmHeaderListTitleWidget(
                  titleName: "Question",
                  iconPath: Icons.question_mark,
                  onTapTitle: () => Get.toNamed('/company_question')),
              DBHelper01.getToken('token') == null
                  ? Container()
                  :
              CtmHeaderListTitleWidget(
                  titleName: "Logout",
                  iconPath: Icons.logout,
                  onTapTitle: () {
                    print(' Logout Click');
                     DBHelper01().logout();
                    Get.toNamed('/login');
                  }),

              Container(
                height: Get.size.height / 4,
                width: double.infinity,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'v-1.0.0',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      CtmStrings.copyright.toString(),
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
