part of "../home_page.dart";

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).accentColor,
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        },
        splashRadius: 25,
      ),
    );
  }
}
