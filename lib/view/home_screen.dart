import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_case/providers/participants_provider.dart';
import 'package:voco_case/utils/common.dart';
import 'package:voco_case/view/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _refresh(BuildContext context) {
  context.refresh(ParticipantProvider);
}

class _HomeScreenState extends State<HomeScreen> {

  late SharedPreferences localdata;

  void initial() async {
    localdata = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voco Case'),
        actions: [
          IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            localdata.clear();
            localdata.setBool('login', false);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()),
                    (_) => false);
          },
        ),],
      ),
      body: Center(
        child: _Participants(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _refresh(context),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _Participants extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final participantApiProvider = watch(ParticipantProvider);
    return participantApiProvider.when(
        data: (data) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(30),
            itemCount: data!.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: CustomStyle.secondBoxDecoration,
                padding: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.data[index].name,
                        style: CustomStyle.secondTextStyle),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(data.data[index].color,
                        style: CustomStyle.colorTextStyle)
                  ],
                ),
              );
            },
          );
        },
        error: (_, __) => const ErrorScreen(),
        loading: () => spinkitSecondary);
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hata oluştu");
  }
}
