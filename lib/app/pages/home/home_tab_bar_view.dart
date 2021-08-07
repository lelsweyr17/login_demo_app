part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      _onHold(context),
      _inProgress(context),
      _needsReview(context),
      _approved(context),
    ]);
  }

  Widget _onHold(context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('on hold'),
            ),
          );
        });
  }

  Widget _inProgress(context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('in progress'),
            ),
          );
        });
  }

  Widget _needsReview(context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('needs review'),
            ),
          );
        });
  }

  Widget _approved(context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('approved'),
            ),
          );
        });
  }
}
