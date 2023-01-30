import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchmde_assessment/provider/contact_details_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ContactDetailsProvider>(
          builder: (context, value, _) {
            return Column(
              children: [
                Container(
                  height: 90.h,
                  padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  color: Colors.grey.shade300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 26,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: GestureDetector(
                            onTap: () {
                              value.setContactDetails = value.fetchMatchingContacts(index);
                            },
                            child: CircleAvatar(
                              minRadius: 20.r,
                              backgroundColor:
                              (value.getSelectedAlphabet != index) ? Colors.teal.shade200 : Colors.white,
                              child: Text(String.fromCharCode(index + 65),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: (value.getSelectedAlphabet == index)
                                          ? Colors.teal.shade200
                                          : Colors.white)),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 10.sp),
                (value.getContactDetails.isNotEmpty)
                    ? Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: ListView.builder(
                          itemCount: value.getContactDetails.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Container(
                                height: 50.h,
                                color: Colors.grey.shade300,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.sp),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.getContactDetails[index],
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      ),
                    )
                    : Expanded(
                  child: Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
