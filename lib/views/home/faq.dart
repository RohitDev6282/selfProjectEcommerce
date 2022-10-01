import 'package:ecommerce_app/constant/colors.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:ecommerce_app/widget/widget.dart';
import 'package:flutter/material.dart';
import '../../constant/string_const.dart';

class FAQPages extends StatefulWidget {
  const FAQPages({Key? key}) : super(key: key);

  @override
  State<FAQPages> createState() => _FAQPagesState();
}

class _FAQPagesState extends State<FAQPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
          faq_question,
          color: kPrimaryColor,
          titleTextStyle: kWhiteLrgTextStyle,
          elevation: 0,
          backWidget: IconButton(
              onPressed: () {
                // finish(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: kWhiteColor)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: <Widget>[
                  // CachedNetworkImage(
                  //   imageUrl: "",
                  //   height: 70,
                  //   width: 70,
                  //   fit: BoxFit.cover,
                  // ).cornerRadiusWithClipRRect(35),
                  // 16.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Ask Your question", style: kBMTextStyle),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // EditText(
              //     text: grocery_typeQuestion,
              //     isPassword: false,
              //     keyboardType: TextInputType.text),
              // 16.height,
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: kGreyColor, width: 2)),
                child: TextFormField(
                  style: kBLTextStyle,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                      label: Text('0 of 50 ' "words")),
                ),
              ),
              CustomButton(
                text: "Send",
                onTap: () {
                  // finish(context);
                },
                colors: kPrimaryColor,
              )
            ],
          )),
        ));
  }
}
