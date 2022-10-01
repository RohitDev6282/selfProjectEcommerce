import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static String? prop;

  fetchKey() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    prop = preferences.getString("token").toString();
    var headers = {
      'mykey': prop,
    };
  }

  static const String baseurl = "http://kiranewalebackend.bizinfi.in/api";

  static const String loginUrl = "$baseurl/login";
  static const String signUpUrl = "$baseurl/registration";
  static const String categories = "$baseurl/category";
  static const String profileUrl = "$baseurl/profile/view/";
  static const String productlist = "$baseurl/products/1";

  static const String billingCustomer =
      "$baseurl/Billing_customer?slug={%22status%22:1}&relation=[%22Mobile_number%22]";
  static const String pendingOrder =
      "$baseurl/orders/%7B%22order_status%22:%22All%22,%22start_date%22:%222022-7-20%22,%22end_date%22:%222022-07-30%22,%22Complete%22:%22Complete%22%7D?relation=[%22Getcustomer%22,%22GetBranch%22,%22GetreportName%22,%22Getrequest%22,%22Getpartyname%22,%22Getcountry%22,%22Getspocall%22,%22Getinvoice%22]";

  static const String orderListApi =
      "$baseurl/marketing_orders/%7B%22order_status%22:%22All%22,%22start_date%22:%222022-07-04%22,%22end_date%22:%222022-07-19%22%7D?relation=[%22Getcustomer%22,%22GetBranch%22,%22GetreportName%22,%22Getrequest%22,%22Getpartyname%22,%22Getcountry%22,%22Getinvoice%22]";

  static const String newOrderReq = "$baseurl/request?slug={%22status%22:1}";

  static const String followLead = "$baseurl/followleads/%7B%22status%22:1%7D";
  static const String customerList = "$baseurl/Customer/%7B%22status%22:1%7D";

  static const String newOrder = "$baseurl/request";
  static const String qcList = "$baseurl/qc?slug=%7B%22status%22:1%7D";
  static const String branchList = "$baseurl/Branch/";
  static const String reportName =
      "$baseurl/Report_types?slug=%7B%22status%22:1%7D";
  static const String agentList = "$baseurl/sales_team";

  static const String countryList = "$baseurl/country/";
  static const String leadList = "$baseurl/lead/%7B%22status%22:1%7D";
  static const String partyList = "$baseurl/SearchApi/ranja/billing_party_name";
  static const String branchSpoke = "$baseurl/Branch_spocs/";

  static const String deliveryData = "$baseurl/tatApi/";
  static const String searchApi =
      "$baseurl/SearchApi/JTdCJTIycmVjZWlwdG51bWJlciUyMjolMjJNTlNSMDgyMjAwMjkxNjUlMjIlN0Q=?relation=";
}
