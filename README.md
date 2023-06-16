# Team Members
Kaden Sedmak-Locke,
Ellen Brannon,
Jorge Gonzalez,
Chloe Liang

# Project Archive Rubric:
## Link to deployed version of main game that works in mobile browser (Disclaimer IOS devices have issues with Itch HTML5 games, it functions perfectly on Android However)
- Main Game Link: https://fuzzyshaque.itch.io/cmpm120game
## Links to deployed, mobile-playable versions of all three prototypes
- Cinematics Link: https://fuzzyshaque.itch.io/cmpm120-game-cinematic-only
- Core Gameplay Link: https://fuzzyshaque.itch.io/cmpm-120-game-core-gameplay-only
- Scene Flow Link(Our scene flow is woven between the entire project, so it is exemplified by the full game): https://fuzzyshaque.itch.io/cmpm120game
## Explanation of theme
- "Nearby in space, but distant in time" was explored in our project through a mars rover that has been left alone after humanity's demise. The mars rover continues doing its job analyzing samples, but the people it's supposed to be sending data to are long gone, and the experience is never-ending. 

## Explanation of selectable requirements attempted
- Advanced Visual Assets: 3d model, mesh, and mesh animation for our rover, and the splash screen video
- Procedural Graphics: 
- Alternate Control Device: Our background changes from day/night variants according to the user's system time

## Identifies all direct contributors and their roles
- Production Lead: Chloe Liang
- Testing Lead: Ellen Brannon
- Technology Lead: Kaden Sedmak-Locke
- Art Lead: Jorge Gonzalez

## Gives credit for all major upstream assets
- View "Asset Credits" section below

## Uses hand-typed textual program code
- We coded using the GDScript language native to Godot. Any files with the .gd extension are written using GDScript

## Repository shows contributions from several team members
- Check our Github commit history

## Repository shows most design changes with useful commit messages
- Check our Github commit history

## Playable using only touch-screen controls
- On-screen arrows and settings/menu button 

## Full-screen gameplay available on mobile browsers
- Clicking the gear icon opens the menu, which has a fullscreen button

## No mobile-specific technical issues blocking completability of the game
- IOS devices have issues with Itch HTML5 games, it functions perfectly on Android However

## Player can learn controls from within the game while full screen
- Buttons are apparent immediately and remain present while full-screened. You also get a text indicator to allow you to move

## Music can be turned off from inside of the game
- Music can be turned off from the menu, which you can access from the gear icon

## Music preference is remembered across gameplay sessions in new browser windows
- The music preference is remembered between scenes, but not cached in individual browsers.

## Core gameplay can be reached within 1 minute
- Yes

## Main progression can be completed within 10 minutes for new players experienced with related games
- Players can complete all game elements within 10 minutes. The game intentionally doesn't have an end point, so there is no end screen, but all available options can be exhausted within 10 minutes. 

## Selectable requirement #1 is satisfied
- Advanced Visual Assets: We use custom meshes made in blender as well as animations.
## Selectable requirement #2 is satisfied
- Procedural Graphics: Upon re-run, every single tile changes variably and randomly except the event ones.
## Selectable requirement #3 is satisfied
- Alternate Control Device: The devices current time is used to determine if the game will be set in the night scene or the day scene.

# Asset Credits
- 3D rover model, mesh, textures, and animations made by Jorge Gonzalez in Blender
- 3D rock assets made by Jorge Gonzalez in Blender
- 3D minigame indicators (drill, flag) made by Jorge Gonzalez in Blender
- Minigame pixel assets made by Ellen Brannon in Clip Studio Paint
- On-screen buttons made by Ellen Brannon in Clip Studio Paint
- Title screen backgrounds made by Ellen Brannon in Clip Studio Paint
- Background music procedurally generated by Ellen Brannon using Prog and edited in Audacity
- Splash screen art and animation made by Kaden Sedmak-Locke in Piskel, splash screen audio SFX made in Videopad
- Gravel SFX made by Kaden Sedmak-Locke made in Videopad



# SPECIFIC PROTOTYPE DETAILS



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
It's there, second scene overall<br/>
## Credits<br/>
We have a credits scene acessible through the main menu<br/>
## Gameplay<br/>
There's the 3D overworld scene and 2d minigame scenes (not yet implemented)<br/>
## Menus<br/>
There are 2 menus, access the first by tapping the rover, access the second by tapping "Collect Data"<br/>
## Communication<br/>
Godot uses signals in order to trigger things in other scenes, this is how the menu scenes and minigames start. This means that the game scenes are maintained between transistions as long as they are paused (like pulling up the menu keeps the rover where it is)<br/>
## Reachability<br/>
All scenes are almost immediately reachable, the controls are simple insofar and clear instructions on the menu are given.<br/>
## Transitions<br/>
Scenes and the cinematics have fade to blacks, as well as small screen dim menu transitions.<br/>
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
