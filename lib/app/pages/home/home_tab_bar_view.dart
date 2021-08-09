part of "home_page.dart";

class HomeTabBarView extends StatelessWidget {
  int tabsLength;

  HomeTabBarView(this.tabsLength);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDataBloc>(context).add(GetDataEvent(0));
    final bloc = context.read<UserDataBloc>();
    return BlocBuilder<UserDataBloc, UserDataState>(
        bloc: bloc,
        builder: (context, state) {
          return TabBarView(children: _tabBarViewChildren(context, state));
        });
  }

  List<Widget> _tabBarViewChildren(context, state) {
    List<Widget> widgets = [];
    late Widget? check;

    for (int i = 0; i < tabsLength; i++) {
      check = _checkLoadingDataState(context, state);
      if (i != globals.tabIndex) {
        widgets.add(LoadingDataIndicator());
      } else if (check != null) {
        widgets.add(check);
      } else {
        widgets.add(_listOfCards(context, state));
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
      globals.tabIndex = state.index;
      return null;
    }
  }

  Widget _listOfCards(context, state) {
    return ListView.builder(
        itemCount: state.cards.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${state.cards[index].id}'),
                  SizedBox(height: 5),
                  Text('${state.cards[index].text}'),
                ],
              ),
            ),
          );
        });
  }
}
