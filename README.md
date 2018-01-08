# Node Game

Now that I have some Swift and Xcode down, I wanted to try Apple's well-known API for game creation, SpriteKit. This is a very surface level program to just test the waters of what SpriteKit can do.

## Implementation

The game spawns SpriteKit Nodes on the screen of either red or green color. The SpriteKit method touchesBegan processes each touch, determines if it was on a green or red Node, and performs the appropriate action.

Green node touches increment the score label by one. Red node touches reset the score back to zero and restarts the game.

There is currently no game menu like you would expect from a fully featured App Store game, but I hope to implement one in the future!

![GIF not loaded](https://github.com/Oblivion00/Node-Game-iPhone-App)
