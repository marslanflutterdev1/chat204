import 'package:chat204/features/chat204/presentation/pages/home_ui/add_group_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/home_ui/group_screen/group_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat204/features/chat204/presentation/pages/home_ui/profile_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/home_ui/user_screen.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_search_text_form_field.dart';
import '../../widgets/custom_popup_menu_button.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  bool isSelect = false;
  late TabController _tabController;

  SizedBox emptyContainer() {
    return const SizedBox(
      width: 0.0,
      height: 0.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch == true
            ? emptyContainer()
            : Text(
                "WA Business",
                style: CustomUtils.customTextStyle(
                    color: customColorStyle.backgroundColor,
                    fontSize: 25,
                    fontFamily: "Lobster"),
              ),
        backgroundColor: customColorStyle.primaryColor,
        flexibleSpace: isSearch == true
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 30, right: 16, bottom: 2),
                child: CustomSearchTextFormField(
                  searchController: searchController,
                  onFieldSubmitted: (value) {
                    setState(() {
                      isSearch = false;
                    });
                    searchController.clear();
                  },
                ),
              )
            : emptyContainer(),
        actions: isSearch == true
            ? []
            : [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                  },
                  child: Icon(
                    Icons.search_sharp,
                    size: 22,
                    color: customColorStyle.backgroundColor,
                  ),
                ),
                const SizedBox(width: 4),
                const CustomPopupMenuButton(),
              ],
        bottom: isSearch == true
            ? null
            : TabBar(
                controller: _tabController,
                indicatorWeight: 4,
                indicatorColor: customColorStyle.backgroundColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: customColorStyle.backgroundColor,
                labelStyle: CustomUtils.customTextStyle(
                    fontFamily: "Lobster", fontSize: 18),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: "Group",
                  ),
                  Tab(
                    text: "User",
                  ),
                  Tab(
                    text: "Profile",
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (e) => const AddGroupScreen()));
        },
        elevation: 10,
        backgroundColor: customColorStyle.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.people_alt_sharp,
          size: 22,
          color: customColorStyle.backgroundColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          GroupScreen(),
          UserScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
