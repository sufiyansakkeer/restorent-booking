// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restorant_booking/model/resorts_list_model.dart';
import 'package:restorant_booking/view/edit_resorts.dart';

class ResortView extends StatelessWidget {
  const ResortView({
    Key? key,
    required this.resortsListModal,
  }) : super(key: key);
  final ResortsListModal resortsListModal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resortsListModal.resortName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Text(
                resortsListModal.price.toString(),
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              Column(
                children: [
                  Image.network(resortsListModal.imageOne),
                  Image.network(resortsListModal.imageTwo),
                  Image.network(resortsListModal.imageThree),
                  Image.network(resortsListModal.imageFour),
                ],
              ),
              Text(
                resortsListModal.price.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
