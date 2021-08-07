part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
    final bloc = context.read<UserDataBloc>();
    return BlocBuilder<UserDataBloc, UserDataState>(
        bloc: bloc,
        builder: (context, state) {
          return TabBarView(children: tabBarViewChildren(context, state));
        });
  }

  List<Widget> tabBarViewChildren(context, state) {
    List<Widget> widgets = [];
    Widget? check = _checkLoadingDataState(context, state);

    for (int i = 0; i < 4; i++) {
      if (check != null) {
        widgets.add(check);
      } else {
        widgets.add(_listOfCards(context, state, i, check));
      }
    }

    return widgets;
  }

  Widget? _checkLoadingDataState(context, state) {
    if (state is LoadingDataState) {
      return LoadingDataIndicator();
    } else if (state is LoadingDataErrorState) {
      return LoadingDataError();
    } else {
      return null;
    }
  }

  Widget _listOfCards(context, state, num, check) {
    return ListView.builder(
        itemCount: state.cards[num]!.length,
        itemBuilder: (context, index) {
          var values = state.cards.values.toList();
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${values[num][index].id}'),
                  SizedBox(height: 5),
                  Text('${values[num][index].text}'),
                ],
              ),
            ),
          );
        });
  }
}
