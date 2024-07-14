import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../reusables/navigators.dart';
import '../../../models/climate_model.dart';
import '../weather/weather_screen.dart';
import '../../../bloc/fetchBlocs/fetch_city_climate_bloc.dart';
import '../../../constants/app_list_constants.dart';
import '../../../reusables/loader.dart';
import '../../../reusables/styles.dart';
import '../../../constants/app_constants.dart';
import '../../../reusables/buttons.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/text_fom_fields.dart';
import 'weather_dashboard_widgets.dart';

class WeatherDashboardScreen extends StatelessWidget {
  const WeatherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWeatherBloc, FetchWeatherState>(
      builder: (context, fwb) {
        return fwb is FetchWeatherSuccess
            ? WeatherDashboardBody(
                weather: fwb.climates,
              )
            : const LoaderContainerWithMessage(
                message: "Fetching weather data...",
              );
      },
    );
  }
}

class WeatherDashboardBody extends StatelessWidget {
  final WeatherModel weather;
  WeatherDashboardBody({
    super.key,
    required this.weather,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                CustomTextFormField(controller: searchController),
                sh20,
                Card(
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(AppConstants.weatherImg1),
                  ),
                ),
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
                    CustomButton(
                      onPressed: () {
                        pushSimple(
                          context,
                          WeatherScreen(
                            weatherModel: weather,
                          ),
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
