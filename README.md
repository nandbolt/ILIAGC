<p align="center">
  <img src='https://github.com/nandbolt/ILIAGC/blob/main/promo/iliagc-main.png?raw=true "ILIAGC"' alt="ILIAGC Logo" width=50% height=auto>
</p>

**Available to play on
*[Coolmath Games](https://www.coolmathgames.com/0-iliagc) | 
[Itch](https://nandbolt.itch.io/iliagc) |
[GX Games](https://gx.games/games/bl1f3z/iliagc-i-live-in-a-graphing-calculator/)***

**Watch the gameplay trailer on *[YouTube](https://www.youtube.com/watch?v=pV9QjFDXmaA)*!**

*ILIAGC: I Live In A Graphing Calculator* is something akin to a graphing calculator mixed with a 2D platformer. Made with the LTS version of GameMaker Studio 2, my goal for the game was to make something educational that is fun and gives the user the freedom to explore math equations in a unique way. There are coins to collect, things to buy, and high scores to chase. There's controller support and "seamless"-ish local multiplayer as well. Feel free to use the project however you'd like! Some interesting things I did that may be of use to you:
- Turning typed equations into graphs using expression trees
- Actor collisions with graphs
- Basic platforming mechanics
- Drop in/out multiplayer

~ | ~
:---:|:-------:
![Default theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc1.png?raw=true "Default theme") | ![Day theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc2.png?raw=true "Day theme")
![83 theme](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc3.png?raw=true "83 theme") | ![Multiplayer](https://github.com/nandbolt/ILIAGC/blob/main/promo/sc4.png?raw=true "Multiplayer")

# Expression trees

Expression trees are at the core of the game, as whatever the user types is utter nonsense until it can be constructed into an expression tree. These unique binary trees are used to process an equation's value, spitting out a number based on the structure of the tree. The trees are constructed binary-ily, with each parent being a mathematical operator and each leaf being an operand, whether that be a constant value such as pi or a variable such time. But, only operators can have children! The biggest hurdle is the tree's construction, as once it exists, it becomes a number-spitting machine ready to be used. So, I'll try my best to explain how ILIAGC goes from a typed equation to a corresponding expression tree used for both graph rendering and collisions!

## Part 1: Entering an equation

To start, we need the player to type in an equation. In ILIAGC, the player has various ways to do this, from using the computer keyboard or... (to be continued)

<!--## Part 2: It means nothing without converting

## Part 3: You, me-->
