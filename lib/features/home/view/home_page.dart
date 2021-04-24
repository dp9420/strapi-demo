import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_poc/data/model/dummy_model.dart';
import 'package:jio_poc/data/provider/api.dart';
import 'package:jio_poc/data/repository/api_repository.dart';
import 'package:jio_poc/features/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          init:
              HomeController(repository: ApiRepository(apiClient: ApiClient())),
          builder: (_) {
            return _.isHomeLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 400.0,
                              autoPlay: true,
                              aspectRatio: 1,
                              viewportFraction: 0.8,
                            ),
                            items: _.model[0].image.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration:
                                          BoxDecoration(color: Colors.amber),
                                      child: Image.network(
                                          "http://10.49.120.105:1337${i.url}",
                                          fit: BoxFit.fill,
                                          width: Get.width));
                                },
                              );
                            }).toList(),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: _.model.length,
                              itemBuilder: (BuildContext context, int index) {
                                DummyModel model = _.model[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${model.name}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "${model.description}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height: 300,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: model.categories.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              DummyModel category =
                                                  model.categories[index];
                                              return Column(
                                                children: [
                                                  Container(
                                                    height: 200,
                                                    width: 200,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              "http://10.49.120.105:1337${category.image[0].url}",
                                                            ),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${category.name}",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.1,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
