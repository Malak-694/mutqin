import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mutqin/features/student_features/data/models/session_model.dart';

import '../constants/colors.dart';
import '../constants/string.dart';
import '../constants/text.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.sessions});

  final List<SessionModel> sessions;
  String formatArabicDate(String backendDate) {
    // parse the ISO string
    DateTime dateTime = DateTime.parse(backendDate);

    // اضبط الـ locale على العربي
    var formatter = DateFormat.yMMMMEEEEd('ar'); // يوم + شهر + سنة
    var timeFormatter = DateFormat.Hm('ar'); // الساعة والدقيقة

    String formattedDate = formatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    return "$formattedDate - $formattedTime";
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          constraints: BoxConstraints(minHeight: 71.h),
          decoration: BoxDecoration(
            color: AppColors.lightprimery,
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(color: AppColors.darkprimery, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.sheikhUsername!,
                style: AppTextStyles.headline1.copyWith(fontSize: 18.sp),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  session.status == "active"
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              183,
                              246,
                              115,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            side: BorderSide(
                              color: AppColors.primery,
                              width: 1.w,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            AppStrings.enter,
                            style: AppTextStyles.body1,
                          ),
                        )
                      : session.status == "Upcomming"
                      ? Row(
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: const Color.fromARGB(
                            //       255,
                            //       251,
                            //       137,
                            //       122,
                            //     ),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(12.r),
                            //     ),
                            //     side: BorderSide(
                            //       color: AppColors.primery,
                            //       width: 1.w,
                            //     ),
                            //   ),
                            //   child: Text(
                            //     AppStrings.cancel,
                            //     style: AppTextStyles.body1,
                            //   ),
                            // ),
                            // SizedBox(width: 5.w),
                            Text(
                              "قـادمـــة",
                              style: AppTextStyles.body1,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        )
                      : Text("مكــتملة", style: AppTextStyles.headline2),
                  Text(
                    formatArabicDate(session.date!),
                    style: AppTextStyles.body2.copyWith(fontSize: 18.sp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
