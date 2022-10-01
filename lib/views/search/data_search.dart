import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../model/searchmodel/search_model.dart';

class Datasearch extends StatefulWidget {
  const Datasearch({Key? key}) : super(key: key);

  @override
  _DatasearchState createState() => _DatasearchState();
}

class _DatasearchState extends State<Datasearch> {
  static const historyLength = 5;
  final List<String> _searchHistory = [
    "Detergent",
    "Handwash",
    "Cleaner",
    "Toilet cleaner"
  ];

  late List<String> filteredSearchHistory;

  late String selectedTerm;

  List<String> filterSearchTerms({
    required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);

    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    filteredSearchHistory = filterSearchTerms(filter: "hello");
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: "hi");
  }

  void putSearchTermFirst(String term) {
    addSearchTerm(term);
    deleteSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: "namastey");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
          title: const Text("Search",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 18)),
          controller: controller,
          borderRadius: BorderRadius.circular(30),
          iconColor: kPrimaryColor,
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          // transitionCurve: Curves.easeInOut,
          // physics: const BouncingScrollPhysics(),
          // axisAlignment: isPortrait ? 0.0 : -1.0,
          // openAxisAlignment: 0.0,
          // width: isPortrait ? 600 : 500,
          // debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            setState(() {
              filteredSearchHistory = filterSearchTerms(filter: query);
            });

            // Call your model, bloc, controller here.
          },
          onSubmitted: (query) {
            setState(() {
              addSearchTerm(query);
              selectedTerm = query;
            });
            controller.close();
          },

          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return Material(
              color: Colors.white,
              elevation: 4.0,
              child: Builder(
                builder: (BuildContext context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: searchItem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 2),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/detergent.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        searchItem[index].product_name,
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        searchItem[index].product_name,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: kGreyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                                // ignore: avoid_unnecessary_containers
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });

                        controller.close();
                      },
                    );
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        children: filteredSearchHistory
                            .map((term) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/detergent.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    term,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList()),
                  );
                },
              ),
            );
          }),
    );
  }
}

   
          
      //        Padding(
      //   padding: const EdgeInsets.only(top: 15),
      //   child: ListView.builder(
      //   itemBuilder: (context, index) => ListTile(
      //     onTap: () {},
      //     leading: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       radius: 20,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //             image: AssetImage(searchItem[index].image),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     ),
      //     title: Text(
      //       searchItem[index].product_name,
      //       // suggestionList[index].substring(0, query.length),
      //       style: TextStyle(color: Colors.black, fontSize: 13),
      //     ),
      //     subtitle: Text(searchItem[index].refilable),
      //   ),
      //   itemCount: searchItem.length,
      //   ),
      // ),
         
  
      // body: FloatingSearchBar(
      //   child:SearchResultListView(
      //     searchTerm: null;
      //   )
      // ),
    

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: ListView.builder(
//           itemBuilder: (context, index) => ListTile(
//             onTap: () {},
//             leading: CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 20,
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage(searchItem[index].image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             title: Text(
//               searchItem[index].product_name,
//               // suggestionList[index].substring(0, query.length),
//               style: TextStyle(color: Colors.black, fontSize: 13),
//             ),
//             subtitle: Text(searchItem[index].refilable),
//           ),
//           itemCount: searchItem.length,
//         ),
//       ),
//     );
//   }
// }

