# Team Members<br/>
Kaden Sedmak-Locke<br/>
Ellen Brannon<br/>
Jorge Gonzalez<br/>
Chloe Liang<br/>
<br/>
<br/>
<br/>
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
