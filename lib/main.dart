import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement(){
    setState(() {
      if(count > 0) {
        count--;
      }
    });
  }

  void increment(){
    setState(() {
      if(count < 20){
        count++;
      }
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpeg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                '$count',
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w800,
                    color: isFull ? Colors.red : Colors.white
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                  ),
                    child: const Text(
                        'Saiu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                      ),
                    ),
                ),
                const SizedBox(width: 32),
                TextButton(
                    onPressed: increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.5) : Colors.white,
                        fixedSize: const Size(100, 100),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                        )
                    ),
                    child: const Text(
                        'Entrou',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                      ),
                    ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
