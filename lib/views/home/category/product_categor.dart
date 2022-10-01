import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/model/category_model/category_model.dart';
import 'package:ecommerce_app/repository/category.dart';
import 'package:ecommerce_app/views/products/products.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Categories> {
  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<CategoryModel>(
            future: getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    var path = snapshot.data!.path;
                    var item = snapshot.data!.data![index];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductList(
                                      categoryid: item.id.toString())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image(
                                  height: 80,
                                  image: NetworkImage(
                                    "$path/${item.categoryImage}",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  snapshot.data!.data!.length > 10
                                      ? item.categoryName
                                              .toString()
                                              .substring(0, 9) +
                                          '...'
                                      : item.categoryName.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kBlackColor, fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 2.1,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }
  // ));

}
