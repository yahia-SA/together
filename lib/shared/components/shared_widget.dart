// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/shared/components/shared_data.dart';

class DefaultTextButton extends StatelessWidget {
  final Function() press;
  final String text;
  const DefaultTextButton({Key? key, required this.press, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: AutoSizeText(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? hint;
  final VoidCallback? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? suffixPressed;
  final bool isClickable;
  final bool readOnly;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Color? color;

  const DefaultFormField({
    required this.controller,
    Key? key,
    this.type,
    this.onSubmit,
    this.onChange,
    this.hint,
    this.onTap,
    this.validate,
    this.suffix,
    this.prefix,
    this.suffixPressed,
    this.isPassword = false,
    this.readOnly = false,
    this.isClickable = true,
    this.maxLength,
    this.maxLengthEnforcement,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      style: TextStyle(color: color ?? Colors.white70),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: color ?? Colors.white),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: color ?? Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}

class BorrowCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final String category;
  final String duration;
  final String price;
  final String city;
  final String name;
  final VoidCallback onPressed;
  final IconData icon;
  final VoidCallback iconPressed;
  const BorrowCard({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.category,
    required this.duration,
    required this.price,
    required this.onPressed,
    required this.name,
    required this.icon,
    required this.iconPressed,
    required this.city,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r), topLeft: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(blurRadius: 10.r, color: Colors.black.withOpacity(0.5)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(textColor2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.r),
                  )),
              child: Padding(
                padding: EdgeInsets.all(20.0.r),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 200.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: AutoSizeText(
                            description,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Category:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              category,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Duration:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              duration,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'city:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              city,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: AutoSizeText(
                              price,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                            MaterialButton(
                              onPressed: onPressed,
                              color: const Color(textColor2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0.r),
                              ),
                              child: AutoSizeText(
                                name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                shape: const CircleBorder(),
                                color: const Color(textColor2),
                                onPressed: iconPressed,
                                child: Icon(
                                  icon,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GiveawayCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final String category;
  final String duration;
  final String price;
  final String name;
  final String city;
  final VoidCallback onPressed;
  final IconData icon;
  final VoidCallback iconPressed;

  const GiveawayCard({
    required this.imagePath,
    required this.description,
    required this.category,
    required this.duration,
    required this.price,
    required this.onPressed,
    Key? key,
    required this.name,
    required this.icon,
    required this.iconPressed,
    required this.city,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r), topLeft: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(blurRadius: 10.r, color: Colors.black.withOpacity(0.5)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff720974),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.r),
                  )),
              child: Padding(
                padding: EdgeInsets.all(20.0.r),
                child: SingleChildScrollView(
                  child: SizedBox(
                      height: 200.w,
                      child:Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: AutoSizeText(
                            description,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Category:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              category,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Duration:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              duration,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'City:',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AutoSizeText(
                              city,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: AutoSizeText(
                              price,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                            MaterialButton(
                              onPressed: onPressed,
                              color: const Color(0xff720974),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0.r),
                              ),
                              child: AutoSizeText(
                                name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                shape: const CircleBorder(),
                                color: const Color(0xff720974),
                                onPressed: iconPressed,
                                child: Icon(
                                  icon,
                                  size: 24.r,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.5965, 32.2715),
    zoom: 12,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMylocation,
        label: const Text('My Location!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToMylocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
