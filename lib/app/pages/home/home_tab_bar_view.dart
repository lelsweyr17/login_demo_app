part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
    final bloc = context.read<UserDataBloc>();
    return BlocBuilder<UserDataBloc, UserDataState>(
        bloc: bloc,
        builder: (context, state) {
          return TabBarView(children: [
            _onHold(context, state),
            _inProgress(context, state),
            _needsReview(context, state),
            _approved(context, state),
          ]);
        });
  }

  Widget _loadingDataIndicator(context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).accentColor),
    );
  }

  Widget _loadingDataError(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded,
              color: Theme.of(context).accentColor, size: 50),
          SizedBox(height: 15),
          Text('Loading data error!'),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
              },
              child: Text('Update', style: TextStyle(color: Colors.teal)),
            ),
          ),
        ],
      ),
    );
  }

  Widget? checkUserDataState(context, state) {
    if (state is LoadingDataState) {
      print('loading...');
      return _loadingDataIndicator(context);
    } else if (state is LoadingDataErrorState) {
      print('loaded!');
      return _loadingDataError(context);
    } else {
      // return _loadingDataError(context);
      return null;
    }
  }

  Widget _onHold(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('on hold'),
                ),
              );
            });
  }

  Widget _inProgress(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('in progress'),
                ),
              );
            });
  }

  Widget _needsReview(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('needs review'),
                ),
              );
            });
  }

  Widget _approved(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
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
