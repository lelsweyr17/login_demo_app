part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(builder: (context, state) {
      BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
      if (state is LoadingDataState) {
        // print('loading...');
        return loadingDataIndicator(context);
      } else if (state is LoadedDataState) {
        print('loaded!');
        // return loadingDataIndicator(context);
        return TabBarView(children: [
          _onHold(context),
          _inProgress(context),
          _needsReview(context),
          _approved(context),
        ]);
      }
      return Center(child: Icon(Icons.error, color: Theme.of(context).accentColor));
    });
  }

  Widget loadingDataIndicator(context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).accentColor),
    );
  }

  Widget _onHold(context) {
    return Text('');
    // return ListView.builder(
    //     itemCount: 10,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: ListTile(
    //           title: Text('on hold'),
    //         ),
    //       );
    //     });
  }

  Widget _inProgress(context) {
    return Text('');
    // return ListView.builder(
    //     itemCount: 5,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: ListTile(
    //           title: Text('in progress'),
    //         ),
    //       );
    //     });
  }

  Widget _needsReview(context) {
    return Text('');
    // return ListView.builder(
    //     itemCount: 7,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: ListTile(
    //           title: Text('needs review'),
    //         ),
    //       );
    //     });
  }

  Widget _approved(context) {
    return Text('');
    // return ListView.builder(
    //     itemCount: 2,
    //     itemBuilder: (context, index) {
    //       return Card(
    //         child: ListTile(
    //           title: Text('approved'),
    //         ),
    //       );
    //     });
  }
}
