/*
This function is used to add beautiful shimmer loading to the pages
(https://pub.dev/packages/shimmer)
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color? _shimmerColor = Colors.grey[200];
Color? _shimmerColorDark = Colors.grey[500];

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
                  highlightColor: Colors.white,
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
                              color: Colors.white,
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
                                      color: Colors.white,
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
                                      color: Colors.white,
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
                                width: 100,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      color: Colors.white,
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
              highlightColor: Colors.white,
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
        itemCount: 3,
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
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
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

 /* Widget buildShimmerHomeFlashsale(boxImageSize) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.only(left: 12, right: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Container(
              width: boxImageSize,
              height: boxImageSize,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColor!,
                        period: Duration(milliseconds: 1000),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: Container(
                              width: boxImageSize,
                              height: boxImageSize,
                              color: _shimmerColor!,
                            ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top:10,
                        child: Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: _shimmerColorDark!,
                          period: Duration(milliseconds: 1000),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _shimmerColorDark!,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                            ),
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Container(
                              width: 20,
                              height: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: _shimmerColor,
                    period: Duration(milliseconds: 1000),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerHorizontalProduct(boxImageSize) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.only(left: 12, right: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: Container(
                width: boxImageSize,
                height: boxImageSize,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Container(
                        width: boxImageSize,
                        height: boxImageSize,
                        color: _shimmerColor,
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
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Row(
                            children: [
                              for(int i=1;i<=5;i++) Icon(Icons.star, color: _shimmerColor, size: 12),
                            ],
                          )
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
    );
  }

  Widget buildShimmerHomeBanner(homeBannerWidth, homeBannerHeight) {
    return Column(
      children: [
        Container(
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: Container(
                width: homeBannerWidth,
                height: homeBannerHeight,
                color: _shimmerColor,
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children : List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _shimmerColor,
                ),
              );
            })
        ),
      ],
    );
  }

  Widget buildShimmerCategoryBanner(homeBannerWidth, homeBannerHeight) {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        child: Container(
          child: Container(
            width: homeBannerWidth,
            height: homeBannerHeight,
            color: _shimmerColor,
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }

  Widget buildShimmerFlashsale(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      primary: false,
      childAspectRatio: 4/6.7,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: _shimmerColor,
                      period: Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top:10,
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColorDark!,
                        period: Duration(milliseconds: 1000),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _shimmerColorDark!,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                          ),
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Container(
                            width: 20,
                            height: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerProduct(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      primary: false,
      childAspectRatio: 5/8,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: ListView(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Container(
                      width: boxImageSize,
                      height: boxImageSize,
                      color: _shimmerColor,
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
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                          width: 50,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Row(
                          children: [
                            for(int i=1;i<=5;i++) Icon(Icons.star, color: _shimmerColor, size: 12),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerTrending(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      primary: false,
      childAspectRatio: 4/1.6,
      shrinkWrap: true,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return Container(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                period: Duration(milliseconds: 1000),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        child: Container(
                          width: (boxImageSize)*(1.6/4)-12-1,
                          height: (boxImageSize)*(1.6/4)-12-1,
                          color: _shimmerColor,
                        )
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      }),
    );
  }

  Widget buildShimmerCategory() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: List.generate(8, (index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: _shimmerColor,
                ),
                SizedBox(
                  height: _spaceHeight,
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _shimmerColor,
                  ),
                  height: 12,
                ),
              ]),
        );
      }),
    );
  }

  Widget buildShimmerReviewProduct() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Container(
            child: Column(
              children: [
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: _containerHeight,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: _containerHeight,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: _containerHeight,
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerReview() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            margin: EdgeInsets.only(top: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
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
    );
  }

  Widget buildShimmerCategoryForYou(homeBannerWidth, homeBannerHeight) {
    return Container(
      margin: EdgeInsets.only(top:8),
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        child: Container(
          child: Container(
            width: homeBannerWidth,
            height: homeBannerHeight,
            color: _shimmerColor,
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }

  Widget buildShimmerSearch() {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        period: Duration(milliseconds: 1000),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerPDetails(homeBannerWidth, homeBannerHeight,boxImageSize) {
    return Column(
      children: [
        buildShimmerHomeBanner(homeBannerWidth,homeBannerHeight),
        // Container(
        //   margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //         width: 50,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Row(
        //         children: [
        //           for(int i=1;i<=5;i++) Icon(Icons.star, color: _shimmerColor, size: 12),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        // // detailsProduct.choiceOptions.length!=0 ?
        // // _createProductVariant():Wrap(),
        // Container(
        //   margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: _shimmerColor,
        //         ),
        //         height: 12,
        //         width: 50,
        //       ),
        //       SizedBox(
        //         height: _spaceHeight,
        //       ),
        //       Row(
        //         children: [
        //           for(int i=1;i<=5;i++) Icon(Icons.star, color: _shimmerColor, size: 12),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        // _createProductInformation(),
        Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
                width: 50,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Row(
                children: [
                  for(int i=1;i<=5;i++) Icon(Icons.star, color: _shimmerColor, size: 12),
                ],
              )
            ],
          ),
        ),
        // _createProductDescription(),

        SizedBox(height: 2),
        Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
                width: 50,
              ),
              SizedBox(
                height: _spaceHeight,
              ),

            ],
          ),
        ),

        SizedBox(height: 2),
        Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
              ),
              SizedBox(
                height: _spaceHeight,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _shimmerColor,
                ),
                height: 12,
                width: 50,
              ),
              SizedBox(
                height: _spaceHeight,
              ),

            ],
          ),
        ),
        //----------

      ],
    );
  }

  Widget shimmerForShippingAddress() {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: _shimmerColor,
      period: Duration(milliseconds: 1000),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 120,
          width: double.infinity,
          color: _shimmerColor,
        ),
      ),
    );
  }

  Widget shimmerForPhoneNumber() {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: _shimmerColor,
      period: Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 55,
            width: double.infinity,
            color: _shimmerColor,
          ),
        ),
      ),
    );
  }

  Widget shimmerForCategories() {
    return ListView(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(10, (index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: _shimmerColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 70,
                  color: _shimmerColor,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget shimmerForCartItems() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 80,
                height: 120,
                color: _shimmerColor,
              ),
              title: Container(
                height: 10,
                width: 80,
                color: _shimmerColor,
              ),
              subtitle: Container(
                height: 5,
                width: 10,
                color: _shimmerColor,
              ),
              trailing: CircleAvatar(
                backgroundColor: _shimmerColor,
              ),
            ),
          ),
        );
      },
    );
  }

  /// Product Details Image Shimma
  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: _shimmerColor,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }*/


}


