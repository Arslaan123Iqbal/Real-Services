import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_services/Pages/Screens/add_agent_page.dart';
import 'package:real_services/Pages/Screens/add_brand_page.dart';
import 'package:real_services/Pages/Screens/add_company_page.dart';
import 'package:real_services/Pages/Screens/add_driver_page.dart';
import 'package:real_services/Pages/warehouse/warehouse_dispatch_page.dart';
import 'package:real_services/main_screen.dart';

import 'package:real_services/provider%20model/company_recovery_provider.dart';
import 'package:real_services/provider%20model/dispatch_enventory_provider.dart';
import 'package:real_services/provider%20model/order_placement_provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/brand_model_provider.dart';

import 'package:real_services/provider%20model/customer_provider.dart';
import 'package:real_services/provider%20model/driver_provider.dart';
import 'package:real_services/screens/add_agent.dart';
import 'package:real_services/screens/add_brand.dart';
import 'package:real_services/screens/add_company_recovery.dart';
import 'package:real_services/screens/warehouse_dispatch.dart';

import 'package:real_services/show_screen/Show_Customer.dart';
import 'package:real_services/show_screen/show_agent.dart';
import 'package:real_services/widget/chec.dart';
import 'package:real_services/widget/check2.dart';

import 'provider model/agent_provider.dart';
import 'provider model/customer_recovery_provider.dart';
import 'provider model/warehouse_enventory_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BrandProvider()),
          ChangeNotifierProvider(create: (_) => CompanyProvider()),
          ChangeNotifierProvider(create: (_) => DriverProvider()),
          ChangeNotifierProvider(create: (_) => DispatchProvider()),
          ChangeNotifierProvider(create: (_) => CustomerProvider()),
          ChangeNotifierProvider(create: (_) => AgentProvider()),
          ChangeNotifierProvider(create: (_) => CustomerRecoveryProvider()),
          ChangeNotifierProvider(create: (_) => WareHouseEnventoryProvider()),
          ChangeNotifierProvider(create: (_) => InventoryDispatchProvider()),
          ChangeNotifierProvider(create: (_) => CompanyRecoveryProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Services',
          theme: ThemeData(primaryColor: Color(0xff575881)),
          home: AddCompanyPage(),
        ));
  }
}
