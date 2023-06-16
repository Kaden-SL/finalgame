# Team Members<br/>
Kaden Sedmak-Locke<br/>
Ellen Brannon<br/>
Jorge Gonzalez<br/>
Chloe Liang<br/>
<br/>
<br/>
<br/>

# Project Archive Rubric:<br/>
## Link to deployed version of main game that works in mobile browser<br/>
- Main Game Link: 
## Links to deployed, mobile-playable versions of all three prototypes
- Cinematics Link: 
- Core Gameplay Link: 
- Scene Flow Link: 
## Explanation of theme


## Explanation of selectable requirements attempted
- Advanced Visual Assets: 3d model, mesh, and mesh animation for our rover, and the splash screen video
- Procedural Graphics: 
- Alternate Control Device: Our background changes from day/night variants according to the user's system time

map gen, mesh/model and variable sounds


## Identifies all direct contributors and their roles
- Production Lead: Chloe Liang
- Testing Lead: Ellen Brannon
- Technology Lead: Kaden Sedmak-Locke
- Art Lead: Jorge Gonzalez

## Gives credit for all major upstream assets
- 

## Uses hand-typed textual program code
- We coded using the GDScript language native to Godot. Any files with the .gd extension are written using GDScript. 

## Repository shows contributions from several team members
- Check our Github commit history

## Repository shows most design changes with useful commit messages
- Asset additions all say what they are adding

## Playable using only touch-screen controls
- On-screen arrows and settings/menu button 

## Full-screen gameplay available on mobile browsers
- Clicking the gear icon opens the menu and it has a fullscreen button

## No mobile-specific technical issues blocking completability of the game


## Player can learn controls from within the game while full screen
- Buttons are apparent immediately and remain present while full-screened. You also get a textual indicator to allow you to move. 

## Music can be turned off from inside of the game

## Music preference is remembered across gameplay sessions in new browser windows

## Core gameplay can be reached within 1 minute

## Main progression can be completed within 10 minutes for new players experienced with related games

## Selectable requirement #1 is satisfied

## Selectable requirement #2 is satisfied

## Selectable requirement #3 is satisfied




# Core Gameplay<br/>
## Audio<br/>
The game has a background track in the main level, as well as a crunchy gravel sound effect that plays when the player moves to the left or the right.
<br/>

## Visual<br/>
The 3D scene has 3D meshes as well as 2D background objects<br/>
## Motion<br/>
The main game scene lets the player move from left to right using the arrow keys<br/>
## Progression<br/>
Player travels to initiate minigames, collecting data. Player then uploads data to mission control, or at least attempts to. There is an emphasis on loneliness that develops as the player keeps going. So far the minigames are not triggered by player movement on specific tiles, just placeholder
in the menu.<br/>
## Prefabs<br/>
Godot is made almost entirely of prefabs, buttons, player, sprites, etc. Each of our "Scenes" inhereit the relevant ones, like the character "scene" is what is inherited by the main menu.<br/>
<br/>
<br/>
<br/>
# Scene Flow<br/>

## Main Title<br/>
It's there<br/>
## Credits<br/>
It's on the title, not really a point making a whole new scene for it<br/>
## Gameplay<br/>
There's the 3D overworld scene and 2d minigame scenes (not yet implemented)<br/>
## Menus<br/>
There are 2 menus, access the first by tapping the rover, access the second by tapping "Collect Data"<br/>
## Communication<br/>
Godot uses signals in order to trigger things in other scenes, this is how the menu scenes and minigames start. This means that the game scenes are maintained between transistions as long as they are paused (like pulling up the menu keeps the rover where it is)<br/>
## Reachability<br/>
All scenes are almost immediately reachable, the controls are simple insofar and clear instructions on the menu are given.<br/>
## Transitions<br/>
none<br/>
## Coordinated Fades<br/>
none<br/>
## Cross-Fades<br/>
none<br/>
<br/>
<br/>
<br/>
# Cinematics<br/>

## Non-interactive cinematic<br/>
Intro to the game is a cinematic that plays our "logo" with sound, then fades to black.<br/>
## Interactive cinematic<br/>
Our main menu screen is interactive within all its elements.<br/>
## Choreography in code<br/>
If you look at the intro.gd script, it utilzes timed events to trigger the fade, as well as play.<br/>












2d Art Assets (Parallax backgrounds, main menu background, minigame pixel art, navigation arrows and gear icon) - Made by Ellen Brannon using Clip Studio Paint EX
Background music - made by Ellen Brannon using Anvil Studio