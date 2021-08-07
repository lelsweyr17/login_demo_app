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

  Widget? checkUserDataState(context, state) {
    if (state is LoadingDataState) {
      print('loading...');
      return LoadingDataIndicator();
    } else if (state is LoadingDataErrorState) {
      print('error!');
      return LoadingDataError();
    } else {
      return null;
    }
  }

  Widget _onHold(context, state) {
    Widget? check = checkUserDataState(context, state);
    // var values = state.cards.values.toList();
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: state.cards[0]!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${state.cards.values.toList()[0][index].id}'),
                      SizedBox(height: 5),
                      Text('${state.cards.values.toList()[0][index].text}'),
                    ],
                  ),
                ),
              );
            });
  }

  Widget _inProgress(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: state.cards[1]!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${state.cards.values.toList()[1][index].id}'),
                      SizedBox(height: 5),
                      Text('${state.cards.values.toList()[1][index].text}'),
                    ],
                  ),
                ),
              );
            });
  }

  Widget _needsReview(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: state.cards[2]!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${state.cards.values.toList()[2][index].id}'),
                      SizedBox(height: 5),
                      Text('${state.cards.values.toList()[2][index].text}'),
                    ],
                  ),
                ),
              );
            });
  }

  Widget _approved(context, state) {
    Widget? check = checkUserDataState(context, state);
    return (check != null)
        ? check
        : ListView.builder(
            itemCount: state.cards[3]!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${state.cards.values.toList()[3][index].id}'),
                      SizedBox(height: 5),
                      Text('${state.cards.values.toList()[3][index].text}'),
                    ],
                  ),
                ),
              );
            });
  }
}
