import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cross = const Icon(Icons.cancel, size: 30);
  var circle = const Icon(Icons.circle, size: 30);
  var edit = const Icon(
    Icons.circle_outlined,
    size: 30,
  );

  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    gameState = List.filled(9, "empty");
    message = "empty";
    super.initState();
  }

  playgGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      message = "";
    });
  }

  Icon getIcon(String title) {
    switch (title) {
      case ("empty"):
        return edit;

      case ("cross"):
        return cross;

      case ("circle"):
        return circle;

      default:
        return circle;
    }
  }

  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = gameState[0] + "Win";
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = gameState[3] + "Win";
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = gameState[6] + "Win";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = gameState[0] + "Win";
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = gameState[1] + "Win";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = gameState[2] + "Win";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        message = gameState[0] + "Win";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        message = gameState[2] + "Win";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text("TIC TAC TOE")),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 10,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: gameState.length,
                    itemBuilder: (context, i) => SizedBox(
                          width: 100,
                          height: 100,
                          child: MaterialButton(
                            onPressed: () {
                              playgGame(i);
                            },
                            child: getIcon(gameState[i]),
                          ),
                        )),
              ),
              Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: () => resetGame(),
                  child: Text("Resat Game"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Devloped By; Shivahari Gajurel")
            ]));
  }
}
