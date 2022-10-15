/*
This function is used to add beautiful shimmer loading to the pages
(https://pub.dev/packages/shimmer)
 */

import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color? _shimmerColor = Colors.grey[200];

class ShimmerLoading{
  Widget buildShimmerContent(){
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: CtmColors.appWhiteColor,
                  baseColor: _shimmerColor!,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor!,
                          ),
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: CtmColors.appWhiteColor,
                            ),
                            child: Container(
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor!,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: CtmColors.appWhiteColor,
                                    )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor!,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: CtmColors.appWhiteColor,
                                    )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                width: MediaQuery.of(context).size.width/4, //100,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: CtmColors.appWhiteColor,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  period: Duration(milliseconds: 1000),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  color: _shimmerColor!,
                  height: 1),
            ],
          );
        },
      ),
    );
  }

  Widget buildShimmerImageHorizontal(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.only(right: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
            child: Shimmer.fromColors(
              highlightColor: CtmColors.appWhiteColor,
              baseColor: _shimmerColor!,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    width: boxImageSize,
                    height: boxImageSize,
                    color: _shimmerColor!,
                  ),
                ),
              ),
              period: Duration(milliseconds: 1000),
            ),
          );
        },
      ),
    );
  }

  Widget buildShimmerBookingTicketsLV(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 2,
        padding: EdgeInsets.only(left: 12, right: 12),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: boxImageSize,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              color: CtmColors.appWhiteColor,
              child: Shimmer.fromColors(
                highlightColor:CtmColors.appWhiteColor,
                baseColor: _shimmerColor!,
                period: Duration(milliseconds: 1000),
                child: Container(
                  height: boxImageSize-50,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                          width: double.infinity,
                          height: boxImageSize-70,
                          color: _shimmerColor!,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor!,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor!,
                              ),
                              height: 12,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}


