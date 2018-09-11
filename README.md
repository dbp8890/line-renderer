# Line Renderer
A GDScript implementation of a line renderer in Godot, useful for rendering cylindrical volume such as lasers, trails, etc. Based on the helpful C# implementation by @paulohyy at https://github.com/paulohyy/linerenderer, with some additional features such as UV tiling and a .tscn file for ease of use.

## Instructions
1. Simply download and unzip the folder, which contains a demo project. If the demo project is not needed, the `LineRenderer` subfolder can be copied directly into the Godot project.
2. Drag and drop the `LineRenderer.tscn` scene into the project, and you should see a line! **Note: There appears to be a bug in certain versions of Godot 3.0 that causes problems involving not being able to edit instanced arrays. Make sure to right click and toggle "Discard Instancing" if you encounter this.**

To edit the line's points, simply edit the `points` member variable of the line renderer, and add/remove points from the array (see demo project for details). This can also be done via the editor in Godot.

![Demonstration](https://github.com/dbp8890/LineRenderer/blob/master/linerendererdemo.gif)

## Features
- **Start thickness/end thickness**: how thick to make the line, which will be interpolated between each segment.
- **Corner smooth/cap smooth**: how much smoothing to apply to the line's corners/caps. Generally, values around 5 work well. A value of 2 results in pointed corners/caps.
- **Draw caps/corners**: Enables/disables drawing caps or corners separately.
- **Global coords**: If enabled, the line's points are assumed to be global coordinates, which are independent of the line's transform or its parent. To have the line move/rotate with either itself or its parent, uncheck this so that the points are local.
- **Scale texture**: Checking this box tiles the texture, automatically repeating in the line's axial direction. Unchecking this box stretches the texture instead along the line's segments.

## Limitations
- Since this effectively uses camera-facing billboards, as with most billboards, certain angles can break the illusion of cylindrical volume.
- Corners and caps currently have suboptimal UV mapping, but textures formed in the shape of a line should generally work well.
- Texture scaling doesn't connect neatly to each segment at the moment; however, this is not very noticable in most cases.

## Demo Instructions
To use the demo, click anywhere on the screen to add a line segment. The camera automatically orbits around a point; use the arrow keys to change direction.

## License
MIT License (credit to @paulohyy for initial implementation)

## Other
Next up: trails! I'll try to see if I can implement this if I have the time. (Although this can be done with the Line Renderer, camera-facing/billboarded trails are not always desired.)
