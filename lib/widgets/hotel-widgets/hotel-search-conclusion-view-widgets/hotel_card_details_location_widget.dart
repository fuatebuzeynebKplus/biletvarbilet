import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HotelCardDetailsLocationWidget extends StatelessWidget {
  const HotelCardDetailsLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    Key mapKey = UniqueKey();
    LatLng latLng = LatLng(hotelCubit.hotelDetailsValue!.geoLocation!.latitude!,
        hotelCubit.hotelDetailsValue!.geoLocation!.longitude!);
    List<dynamic> description = [];
    List<dynamic> distances = [];
    List<dynamic> unitTypes = [];
    for (var item in hotelCubit.hotelDetailsValue!.hotelDistances) {
      description.add(item.description!);
      distances.add(item.distance);
      unitTypes.add(item.unitType!);
    }

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 200,
                      child: FlutterMap(
                        key: mapKey,
                        options: MapOptions(
                          initialCenter: latLng,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: latLng,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                rotate: true,
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: context.height * 0.368,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          description.length,
                          (index) {
                            final location = description[index];
                            final distance = distances[index];
                            final unitType = unitTypes[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_sharp,
                                    color: Colors.deepOrange,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextWidget(
                                      text:
                                          '$location ($distance ${unitType == 0 ? 'M' : unitType == 1 ? 'Km' : 'Mi'})',
                                      isHaveOverflow: true,
                                      fontSize: 14,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
}
