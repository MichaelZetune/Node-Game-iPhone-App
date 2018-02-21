# Node Game

Now that I have some Swift and Xcode down, I wanted to try Apple's well-known API for game creation, SpriteKit. This is a very surface level program to test what SpriteKit can do.

Created as a project for Lambda Alpha Nu, a professional technology fraternity at UT Austin.

## Implementation

The game spawns SpriteKit Nodes on the screen of either red or green color. The SpriteKit method touchesBegan processes each touch, determines if it was on a green or red Node, and performs the appropriate action.

Green node touches increment the score label by one. Red node touches reset the score back to zero and restarts the game.

There is currently no game menu like you would expect from a fully featured App Store game, but I hope to implement one in the future!

![GIF not loaded](https://github.com/MichaelZetune/Node-Game-iPhone-App/blob/master/NodeGame.gif)
