part of "../home_page.dart";

class ListOfCards extends StatelessWidget {
  final state;

  ListOfCards(this.state);

  @override
  Widget build(BuildContext context) {
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
      },
    );
  }
}
