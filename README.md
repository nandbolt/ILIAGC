<p align="center">
  <img src='https://github.com/nandbolt/ILIAGC/blob/main/promo/iliagc-main.png?raw=true "ILIAGC"' alt="ILIAGC Logo" width=50% height=auto>
</p>

**Available to play on
*[Coolmath Games](https://www.coolmathgames.com/0-iliagc) | 
[Itch](https://nandbolt.itch.io/iliagc) |
[GX Games](https://gx.games/games/bl1f3z/iliagc-i-live-in-a-graphing-calculator/)***

**Watch the gameplay trailer on *[YouTube](https://www.youtube.com/watch?v=pV9QjFDXmaA)*!**

*ILIAGC: I Live In A Graphing Calculator* is something akin to a graphing calculator mixed with a 2D platformer. Made with the LTS version of GameMaker Studio 2, my goal for the game was to make something educational that is fun and gives the user the freedom to explore math equations in a unique way. There are coins to collect, things to buy, and high scores to chase. There's controller support and "seamless"-ish local multiplayer as well. Feel free to use the project however you'd like!

~ | ~
:---:|:-------:
![Default theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc1.png?raw=true "Default theme") | ![Day theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc2.png?raw=true "Day theme")
![83 theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc3.png?raw=true "83 theme") | ![Multiplayer](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc4.png?raw=true "Multiplayer")

# Understanding the code
- [I. Expression trees: the core of ILIAGC](#i-expression-trees-the-core-of-iliagc)
- [II. Understanding the grapher object's relevant variables](#ii-understanding-the-grapher-objects-relevant-variables)
- [III. Entering an equation](#iii-entering-an-equation)
- [IV. Time to (try to) graph!](#iv-time-to-try-to-graph)
- [V. Equation simplification and "implied" operations](#v-equation-simplification-and-implied-operations)
- [VI. Equation validation](#vi-equation-validation)
- [VII. Infix to postfix](#vii-infix-to-postfix)
- [VIII. Postfix to expression tree](#viii-postfix-to-expression-tree)
- [IX. Evaluating your expression tree](#ix-evaluating-your-expression-tree)
- [X. Rendering a graph with an expression tree](#x-rendering-a-graph-with-an-expression-tree)
- [XI. Colliding with a graph](#xi-colliding-with-a-graph)

### I. Expression trees: the core of ILIAGC

Expression trees are at the core of the game, as whatever the user types is utter nonsense until it can be constructed into an expression tree. These unique binary trees are used to process an equation's value, spitting out a number based on the structure of the tree. The trees are constructed binary-ily, with each parent being a mathematical operator and each leaf being an operand, whether that be a constant value such as pi or a variable such time. But, only operators can have children! The biggest hurdle is the tree's construction, as once it exists, it becomes a number-spitting machine ready to be used. So, I'll try my best to explain how ILIAGC goes from a typed equation to a corresponding expression tree used for both graph rendering and collisions!

### II. Understanding the grapher object's relevant variables

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L12-L30

The main variables we want to focus on for this is equation tokens and precedence map. The equation tokens house the equation and the precedence map is used for PEMDAS, or prioritizing certain operations from occuring first. The tree's structure is created with this in mind, with the deepest and left-most operations in the tree will occur first until the root is reached. We'll get into it more later, but for now these are all the variables we care about.

### III. Entering an equation

To start, we need the player to type in an equation. The player has various ways to do this, from using the computer keyboard to the virtual one with a controller. We want to tokenize inputs so we know what's being typed are valid symbols for an equation, so we map the various inputs to a given token (tokens are enum values in this case) and store it in equation tokens.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L308-L318

### IV. Time to (try to) graph!

Alright, the easy part is done: a collection of tokens ripe for tinkering. Once the player is ready, they can slap the graph button and... wallah! Either a graph pops into existence or an error is displayed noting what might be the issue. We'll go through the inner workings of this function, but first lets show it in its entirety.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L47-L112

### V. Equation simplification and "implied" operations

So, the first step on the line (besides checking if the equation is on cooldown) is simplifying the equation and adding implied operations.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L114-L182

### VI. Equation validation

The next step is validating if the equation is ready to be converted into a form that will then be converted into an expression tree.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L184-L248

### VII. Infix to postfix

Now that our infix expression is ready (yes, that what we were doing this whole time!), it is time to convert it into a postfix expression that allows for an expression tree to be constructed easily out of it.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGrapher/Create_0.gml#L250-L294

### VIII. Postfix to expression tree

Your expression is now ready to get expression tree-ed. This occurs after a new graph object is created, to which the postfix expression is passed to it.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGraph/Create_0.gml#L56-L96

### IX. Evaluating your expression tree

Congrats! If you've made it this far, then your expression tree is ready to be used. Simply pass in an input corresponding to the x and your corresponding y should appear. If your expression tree has no x, then it should always pop out the same value!

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGraph/Create_0.gml#L115-L187

An important note are coordinates. The game's built-in coordinate system and the graph's coordinate system are different, so before evaluation conversions between the systems need to be considered.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/scripts/scrWorldFunctions/scrWorldFunctions.gml#L1-L23

### X. Rendering a graph with an expression tree

Rendering a graph is as simple as evaluating your expression tree in a given range and resolution (how far adjacent points are from each other). Save these points and draw a line between them!

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/objects/oGraph/Create_0.gml#L98-L113

### XI. Colliding with a graph

Collisions are calculated by evaluating two point: one where the player is and where they're going. We can tell which side a point is on the graph by evaluating the x and comparing y's: if the player's y is bigger than its on top and vice versa. If both points are on different sides of the graph, then a collision will occur and a normal is necessary to calculate the surface collision. This isn't the best solution to collisions, but it works decently enough and is easy to understand. Despite this, the code is still a handful.

https://github.com/nandbolt/ILIAGC/blob/4e64cf0fd8539bb65dd1a1e4f0aa8c3c78c4fa62/ILIAGC/scripts/scrRigidBodyFunctions/scrRigidBodyFunctions.gml#L50-L143
