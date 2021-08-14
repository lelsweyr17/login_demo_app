part of "../screen_states/loading_data_error.dart";

class UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<UserDataBloc>(context)
              .add(GetDataEvent(globals.tabIndex));
        },
        child: Text(
          'Update',
          style: TextStyle(color: Colors.teal),
        ),
      ),
    );
  }
}
