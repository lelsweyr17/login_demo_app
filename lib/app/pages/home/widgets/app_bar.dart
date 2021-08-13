part of "../home_page.dart";

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;
  HomeAppBar(this.tabs);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        // TODO: debag the button (size)
        LogOutButton(),
      ],
      bottom: TabBar(
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Size get preferredSize => Size.fromHeight(60);
}
