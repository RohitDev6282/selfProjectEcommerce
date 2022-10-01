import 'package:ecommerce_app/constant/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  var onPressed;
  SearchBar({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          width: 1.5,
          color: kLightGreyColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Search...",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sort,
                  color: kPrimaryColor,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
