import 'package:flutter/material.dart';

import '../../../reusables/globals.dart';
import '../../../reusables/navigators.dart';
import '../weather/weather_screen.dart';
import '../../../constants/app_list_constants.dart';
import '../../../reusables/snackbar.dart';
import '../../../reusables/styles.dart';
import '../../../constants/app_constants.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/text_fom_fields.dart';
import 'weather_dashboard_widgets.dart';

class WeatherDashboardScreen extends StatelessWidget {
  WeatherDashboardScreen({
    super.key,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalNotifier globalNotifier = GlobalNotifier();
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Container(
        height: size.height,
        decoration: const BoxDecoration(gradient: primaryGradient),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh20,
                //searchbar
                CustomTextFormField(controller: searchController),
                sh20,
                Card(
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(AppConstants.weatherImg1),
                  ),
                ),
                //list of popular cities
                Text(
                  "Popular cities",
                  style: smallTextWhite(),
                ),
                sh20,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                  ),
                  itemCount: citiesList.length,
                  itemBuilder: (context, index) {
                    final city = citiesList[index];
                    return CityCard(
                      city: city,
                      onTap: () {
                        searchController.text = city;
                        searchController.selection = TextSelection.fromPosition(
                          TextPosition(offset: searchController.text.length),
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //search action
                    CustomButton(
                      onPressed: () {
                        globalNotifier.cityName.value = searchController.text;
                        searchController.text.isNotEmpty
                            ? pushSimple(
                                context,
                                const WeatherScreen(),
                              )
                            : showSnackBar(
                                context,
                                "Enter a location to search",
                                error: true,
                              );
                      },
                      title: "Search",
                    ),
                  ],
                ),
                sh40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
