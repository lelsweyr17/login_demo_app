part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataBloc, UserDataState>(
      listener: (context, state) {
        BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
        print('get data event');
        if (state is LoadingDataState) {
          CircularProgressIndicator();
        } else if (state is LoadedDataState) {
          CircularProgressIndicator();
        } else if (state is LoadingDataErrorState) {
          CircularProgressIndicator();
        }
      },
      child:
          BlocBuilder<UserDataBloc, UserDataState>(builder: (context, state) {
        return TabBarView(children: [
          _onHold(context),
          _inProgress(context),
          _needsReview(context),
          _approved(context),
        ]);
      }),
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
