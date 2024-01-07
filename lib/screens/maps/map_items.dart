import 'dart:async';
import 'package:courier_connect/services/province_service.dart';
import 'package:courier_connect/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapItems extends ConsumerWidget {
  static const String name = 'map_items';
  const MapItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final provincesAsyncValue = ref.watch(provinceProvider);
    final colors = Theme.of(context).colorScheme;
    // final size = MediaQuery.of(context).size;
    String? selectedValueStatus;
    return Scaffold(
      backgroundColor: const Color(0xff282929),
      body: Center(
        child: Stack(
          children: [
            const MapSample(),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              maxChildSize: 0.4,
              minChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: colors.onPrimaryContainer,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: const Offset(
                                0, -34.0), // Desplaza el botón hacia arriba
                            child: Material(
                              elevation: 8.0,
                              color: colors.surfaceTint,
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(
                                  iconSize: 34,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.lunch_dining_outlined,
                                    color: colors.background,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'JM-CARGO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 0.9,
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: colors.surfaceTint,
                            ),
                            Text(
                              'Av. Abraham Lincoln No. 1009',
                              style: TextStyle(
                                height: 3,
                                color: colors.surfaceTint,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // color: Colors.amber,
                          child: Column(
                            children: [
                              const Text(
                                'Desde:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 0.9,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              provincesAsyncValue.when(
                                data: (data) {
                                  return CustomDropdownButton2(
                                    buttonPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    items: data.map((state) {
                                      return DropdownMenuItem(
                                        value: state.code,
                                        child: Text(state.name),
                                      );
                                    }).toList(),
                                    hint: 'Seleccione: ',
                                    onChanged: (value) {
                                      // stateId = value!;
                                      selectedValueStatus = value;
                                    },
                                    value: selectedValueStatus,
                                  );
                                },
                                error: (error, stackTrace) =>
                                    Center(child: Text('Error: $error')),
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                            ],
                          ),
                        ),

                        // const SizedBox(
                        //   height: 60,
                        // ),
                        // SizedBox(
                        //   height: 50, // Ajusta según tus necesidades
                        //   width: 200, // Ajusta según tus necesidades
                        //   child: FilledButton(
                        //     onPressed: () {},
                        //     child: const Text(
                        //       'Iniciar Sesión',
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.459474, -69.995044),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
