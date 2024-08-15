import 'dart:math';
import 'package:quran/sajdah_verses.dart';
import 'package:flutter/material.dart';
import 'quranictextscreen.dart'; 
import 'audiorecitationscreen.dart';
import 'bookmarkingscreen.dart';
import 'communityscreen.dart';
import 'package:quran/quran.dart' as quran;



class HomeScreen extends StatelessWidget {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 180, 5),
        title: Text(
          'Talawat-e-Quran\nHome',
          textAlign: TextAlign.center,
        ),
        
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'images/logo.png', // Adjust the path to your logo image
                ),
              ),
            ),
            width: 40, // Adjust the width of the container
            height: 40, // Adjust the height of the container
          ),
          
        ),
      ),
     
      body: Padding(
        
        padding: EdgeInsets.all(20.0),
        
        child: Row(

  
 
          children: [
            

        

 
            
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Adjusted for better layout on small screens
                children: [
                 
                Text(quran.getVerse(quran.getSurahCountByPage(6), quran.getVerseCount(quran.getSurahCountByPage(6)))),
                  QuickAccessButton(
                    title: 'Quranic Text',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuranicTextScreen(),
                        ),
                      );
                    },
                  
         
            child: Container(
               height: 70,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'data:image/png;base64,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',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Quranic Text',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              
                            ),
                            
textAlign: TextAlign.center,
                          ),
                        ),
                      ),
          
                  ),
                  QuickAccessButton(
                    title: 'Audio Recitation',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioRecitationScreen(),
                        ),
                      );
                    },
                    child: Container(
                       height: 170,
                        width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'data:image/png;base64,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',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Audio Recitation',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  QuickAccessButton(
                    title: 'Bookmarking',
                    onPressed: () {
                      // Navigate to Bookmarking screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookmarkScreen(),
                        ),
                      );
                    },
                    child: Container(
                       height: 170,
                        width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABLS0uEhISysrK7u7u4uLju7u7x8fH19fUwMDD4+PgsLCwoKCgkJCQpKSkzMzPp6enc3Nzi4uKNjY1UVFQVFRWUlJRoaGicnJwJCQmHh4fKysqoqKh2dnZZWVlISEg7OzttbW3Nzc15eXnpjnCiAAAE3klEQVR4nO2da3PaMBBFYx7GYMiDJEAeTdK0//83tsQBe41sJC97pXbu+UgnWk61Yq/ITHx1NZy7ycPjapPZslk9PkzuFO9yMPfbhbFbk8X2Huy33gH1KnZroF85hvvtGZcowbX12etiA9rGaSS/PVOE4FNEwSx7+t8Fs+yHteBrZMEse7UVvG+Vex9vJ7Zsx++tmrbjX0z528nctNiB+USUXVjW2jYKPeeWlVrkz43KW7s6d40yo5ldHQezD0ifvtRFdmZFumjkxBerGmXjCFrV6OG2Lm8V3yZ1CWyLVszq8hOjEvVRACQLB3XY+LApUDfpEhby5RtYGrfpa+QtbA4rm2Dz47g+8i7aZH18Bzbp9O2wvGmo6OWYbd5Mlj/mw5HJ8j4cP+veTZYfxZv2B3a2/8lHw7HJ8j6MaaiDhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIYAaKiEhgBoqISGAGiohIZ+qB50/Q8YPo02I8VTTJM3nP/8+vmfg/cxdcNi9b3AdTFwhcQNZ/Uz4JcDnwmdtmHRfMj9ctguJm1YrrIm14POYsqGxXUmuR7SqAkbzhZZm8UAxXQN58sTwSxbhTdqsobzG4fgkLOYquHMtYNfuxjaqIkaFrdNqwfNWUzTsBSfovlVrmjUJA0LMQenf1+ZCsWg0Z+ioRwT06/XhGJQgEvQUES1vy1aIRo1JMClZyijWn58fehZTM7w9AwekGfRu1FTM5zddgm2FL2HRmKGMqrlrX8Vjeob4NIylFGtLTjsLCZl6BoTEtGoN16NmpKhjGqnO7hH7OLCZ2gkZNg1JiSyUcvzy6Zj2D0mJKEBLhnDvjEhCRwaqRjOnVHNTViAS8Tw3JiQBM3FNAwLIdjXohWiUc/c+pMwLLzP4IGAs5iCYViLVvg3agKGQwTbc7Hn4ya+4fmo5sb31h/d0CequfEMcLENy0EtWuEX4CIb+kY1N14BLq6hf1Rz4zM0ohqGRDU3MsA5h0ZMw2FjQnJ+LkY0LMR3MuEtWnH21h/PcPiYkMihcaoYzdDvRu/Dma+nYhnOA28TfcibRntoRDLUjglJ79CIY3ipM3igL8BFMdRENTdyaIgAF8NQF9XcdP/aJoJh+I3eh86ziDfURzU3olFv6qEBN+z/7ZKGjgCHNiwG3uh9cN/6wYaXHhMS59DAGl5+TEhct36oYegXv+E4AhzS8LJRzc3p0AAazk3P4IGTs4gzLM3GhKQ9NFCGL+VFbvQ+yLNYvoAMPz9Qgi3Fj0+QocCuRStyZ1WgobVghyLO0LZFK6aOujBD+x3c49hFlCFG0KUIMkS0aMVJo2IMcYKnihBDVItW5HhDrGBbEWCIbNGKKdYQvYN7cqRhDEGhaGN4jL0RWrSibtRPk/XXsQUbimub9Z9itmjFt6Lijxb08+v9efP73mp1L+7ebja715Cf+AOFJzb1P9++NQAAAABJRU5ErkJggg==',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Bookmarking',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickAccessButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget child;

  QuickAccessButton({
    required this.title,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}


