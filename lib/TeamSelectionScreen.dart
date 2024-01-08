import 'package:flutter/material.dart';

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  // Assume there are four players for team selection
  List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];

  // Team selections for each player
  Map<String, bool> teamSelections = {};

  @override
  void initState() {
    super.initState();
    // Initialize team selections
    players.forEach((player) {
      teamSelections[player] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Selection'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Choose Teams',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                String player = players[index];
                return ListTile(
                  title: Text(player),
                  trailing: Checkbox(
                    value: teamSelections[player] ?? false,
                    onChanged: (value) {
                      setState(() {
                        teamSelections[player] = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add logic to handle team selections and navigate to the game screen
              // You can access teamSelections to determine which players are in which teams
              List<String> team1 = [];
              List<String> team2 = [];
              teamSelections.forEach((player, isSelected) {
                if (isSelected) {
                  // Assign players to teams based on selection
                  // For example, alternate assignment to Team 1 and Team 2
                  // You can customize this logic based on your requirements
                  if (team1.length <= team2.length) {
                    team1.add(player);
                  } else {
                    team2.add(player);
                  }
                }
              });

              // Navigate to the game screen with team information
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(team1: team1, team2: team2),
                ),
              );
            },
            child: Text('Start Game'),
          ),
        ],
      ),
    );
  }

  GameScreen({required List<String> team1, required List<String> team2}) {}
}
