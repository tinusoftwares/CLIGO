
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/ctm_strings.dart';
import 'ctm_header_listtitle_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,

        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).accentColor.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(

            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                          ],
                        ),
                        child: Image.network('https://bdtask-demo.com/backend/public/image/websetting/1655978324_10b0faacf09c0386ba34.png',width:50,height:50,color: Colors.green,)
                      //Icon(Icons.person, size: 50, color: Colors.grey.shade300,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('User Name ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.white),),
                    Text('user@gmail.com', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.white),),
                  ],
                ),
              ),
              CtmHeaderListTitleWidget(titleName: "Home",
                  iconPath: Icons.home,
                  onTapTitle: ()=> Get.toNamed('/find_ticket')
              ),
              CtmHeaderListTitleWidget(titleName: "Login",
                  iconPath: Icons.login,
                  onTapTitle: ()=> Get.toNamed('/login')
              ),
              CtmHeaderListTitleWidget(titleName: "Register",
                iconPath: Icons.app_registration,
                onTapTitle: ()=>Get.toNamed('/register'),
              ),
              CtmHeaderListTitleWidget(titleName: "Booking History",
                  iconPath: Icons.history,
                  onTapTitle: ()=>Get.toNamed('/booking_history')
              ),

              CtmHeaderListTitleWidget(titleName: "About Us",
                  iconPath: Icons.multiline_chart_outlined,
                  onTapTitle: ()=>Get.toNamed('/about_us')
              ),

             /* CtmHeaderListTitleWidget(titleName: "Policy",
                  iconPath: Icons.policy,
                  onTapTitle: ()=>Get.toNamed('/policy')
              ),
              CtmHeaderListTitleWidget(titleName: "Terms and Condition",
                iconPath: Icons.account_tree_rounded,
                onTapTitle: ()=>Get.toNamed('/terms_and_condition')
              ),*/

              CtmHeaderListTitleWidget(titleName: "Logout",
                  iconPath: Icons.logout,
                  onTapTitle: (){
                    print(' Logout Click');
                  }
              ),

              Container(
                height:    Get.size.height/4,
                width: double.infinity,
                // color: Colors.green,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('v-1.0.0',style: TextStyle(fontStyle: FontStyle.italic),),
                    Text(CtmStrings.copyright.toString(),style: TextStyle(fontStyle: FontStyle.italic),),
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
