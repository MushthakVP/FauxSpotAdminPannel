import 'package:dotted_border/dotted_border.dart';
import 'package:faux_admin/app/module/desktop/upload_view/controller/district_controller.dart';
import 'package:faux_admin/app/module/desktop/upload_view/controller/post_conroller.dart';
import 'package:faux_admin/app/module/desktop/upload_view/controller/upload_controller.dart';
import 'package:faux_admin/app/util/colors.dart';
import 'package:faux_admin/app/util/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/image_picker.dart';

class UploadView extends StatelessWidget {
  UploadView({super.key});
  final controller = Get.put(UploadController());
  final dropDown = Get.put(DistrictController());
  final imageController = Get.put(ImagePickController());
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkGreen,
        title: const Text('Upload'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FirstWidget(
            imageController: imageController,
            controller: controller,
          ),
          space(height: 20),
          Text(
            "Amentities",
            style: gSans(),
          ),
          space(),
          AmenitiesWidget(controller: controller),
          space(height: 20),
          Text(
            "Category",
            style: gSans(),
          ),
          space(),
          CategoryWidget(controller: controller),
          space(height: 20),
          Text(
            "Info",
            style: gSans(),
          ),
          space(),
          TurfInfoWidget(
            controller: controller,
          ),
          space(),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              child: const Text("UPDATED"),
              onPressed: () {
                postController.postDAta();
              },
            ),
          )
        ],
      ),
    );
  }
}

class TurfInfoWidget extends StatelessWidget {
  final UploadController controller;
  const TurfInfoWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.morningPrice,
            decoration: const InputDecoration(
              labelText: "Morning Price",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
        Expanded(
          child: TextField(
            controller: controller.afternoonPrice,
            decoration: const InputDecoration(
              labelText: "Afternoon Price",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
        Expanded(
          child: TextField(
            controller: controller.eveningPrice,
            decoration: const InputDecoration(
              labelText: "Evening Price",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
        Expanded(
          child: TextField(
            controller: controller.turfPlace,
            decoration: const InputDecoration(
              labelText: "Turf Place",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
        space(),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UploadController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: const Text("Cricket"),
              value: controller.cricket.value,
              onChanged: (newValue) {
                controller.cricket.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Football"),
              value: controller.football.value,
              onChanged: (newValue) {
                controller.football.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Yoga"),
              value: controller.yoga.value,
              onChanged: (newValue) {
                controller.yoga.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Badminton"),
              value: controller.badminton.value,
              onChanged: (newValue) {
                controller.badminton.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Sevence"),
              value: controller.sevence.value,
              onChanged: (newValue) {
                controller.sevence.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Fives"),
              value: controller.fives.value,
              onChanged: (newValue) {
                controller.fives.value = newValue!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UploadController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: const Text("Cafeteria"),
              value: controller.cafeteriaUp.value,
              onChanged: (newValue) {
                controller.cafeteriaUp.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Gallery"),
              value: controller.galleryUp.value,
              onChanged: (newValue) {
                controller.galleryUp.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Parking"),
              value: controller.parkingUp.value,
              onChanged: (newValue) {
                controller.parkingUp.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Shower"),
              value: controller.showerUp.value,
              onChanged: (newValue) {
                controller.showerUp.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Dressing"),
              value: controller.dressingUp.value,
              onChanged: (newValue) {
                controller.dressingUp.value = newValue!;
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text("Water"),
              value: controller.waterUp.value,
              onChanged: (newValue) {
                controller.waterUp.value = newValue!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({
    Key? key,
    required this.imageController,
    required this.controller,
  }) : super(key: key);
  final UploadController controller;
  final ImagePickController imageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            imageController.uploadImage1();
          },
          child: GetBuilder<ImagePickController>(
            init: ImagePickController(),
            builder: (obj) {
              return obj.cloudinary1 == null
                  ? ImagePickWidget(loading: obj.cimage)
                  : ImageSuccessWidget(image: obj.uImage1);
            },
          ),
        ),
        space(),
        GestureDetector(
          onTap: () {
            imageController.uploadImage2();
          },
          child: GetBuilder<ImagePickController>(
            init: ImagePickController(),
            builder: (obj) {
              return obj.cloudinary2 == null
                  ? ImagePickWidget(loading: obj.cimage2)
                  : ImageSuccessWidget(image: obj.uImage2);
            },
          ),
        ),
        space(),
        GestureDetector(
          onTap: () {
            imageController.uploadImage3();
          },
          child: GetBuilder<ImagePickController>(
            init: ImagePickController(),
            builder: (obj) {
              return obj.cloudinary3 == null
                  ? ImagePickWidget(loading: obj.cimage3)
                  : ImageSuccessWidget(image: obj.uImage3);
            },
          ),
        ),
        space(),
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: controller.turfName,
                decoration: const InputDecoration(
                  labelText: "Turf Name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
              space(),
              TextField(
                controller: controller.turfLink,
                decoration: const InputDecoration(
                  labelText: "Map link",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
              space(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: white,
                        boxShadow: const [
                          BoxShadow(
                            color: grey,
                            blurRadius: 15,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: GetBuilder<DistrictController>(
                        init: DistrictController(),
                        builder: (obj) => DropdownButtonHideUnderline(
                          child: Flexible(
                            child: DropdownButton(
                              elevation: 10,
                              style: const TextStyle(
                                fontSize: 18,
                                color: balck,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              dropdownColor: white,
                              hint: Flexible(
                                child: Text(
                                  'Select District',
                                  style: gSans(),
                                ),
                              ),
                              value: obj.dropdownValue,
                              items: obj.dstrictList.map((newList) {
                                return DropdownMenuItem(
                                  value: newList,
                                  child: Text(newList),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                obj.muncipal.clear();
                                obj.districtChange(obj.dstrict[newValue]);
                                obj.changeDropName(dropdownValue: newValue);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  space(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: white,
                        boxShadow: const [
                          BoxShadow(
                            color: grey,
                            blurRadius: 15,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: GetBuilder<DistrictController>(
                        init: DistrictController(),
                        builder: (obj) => DropdownButtonHideUnderline(
                          child: Flexible(
                            child: DropdownButton(
                              elevation: 10,
                              style: const TextStyle(
                                fontSize: 18,
                                color: balck,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              dropdownColor: white,
                              hint: Flexible(
                                child: Text(
                                  'Select Muncipality',
                                  style: gSans(),
                                ),
                              ),
                              value: obj.mDropdownValue,
                              items: obj.muncipal.map((newList) {
                                return DropdownMenuItem(
                                  value: newList,
                                  child: Text(newList),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                obj.changemDropName(mDropdownValue: newValue);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImagePickWidget extends StatelessWidget {
  final bool loading;
  const ImagePickWidget({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      dashPattern: const [10],
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: white,
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Center(
                child: Text("Select Image"),
              ),
      ),
    );
  }
}

class ImageSuccessWidget extends StatelessWidget {
  final Uint8List image;
  const ImageSuccessWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: grey,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
        image: DecorationImage(
          image: MemoryImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
