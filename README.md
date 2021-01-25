<h1 align="center">Easing Curves 1.0.0</h1>

<p align="center">Standard easing functions as animation curves for GameMaker Studio 2.3.1</p>

<p align="center"><b>@jujuadams</b></p>

<p align="center"><a href="https://github.com/JujuAdams/Easing-Curves/releases/tag/1.0.0">Download the .yymps</a></p>
<p align="center">Chat about Easing Curves on the <a href="https://discord.gg/8krYCqr">Discord server</a></p>

Notes:
- Curves range from `0.0` to `1.0` on both the x and y axes
- Curves are exported with an x-axis resolution of 0.01 (each curve has 101 points)
- Includes in/out/inout variants e.g. `curveBounce` `curveBounceInv` `curveBounceInOut`

Recommended function for usage:
```
/// Return: Floating point number interpolated from <start> to <end> using the give animation curve as the lerping factor
/// 
/// @param start      Starting value
/// @param end        End value
/// @param animCurve  Animation curve to use
/// @param posx       x-position to read from

function animcurve_tween(_start, _end, _curve, _t)
{
    var _w = animcurve_channel_evaluate(animcurve_get_channel(_curve, 0), _t);
    var _value = lerp(_start, _end, _w);
    return _value;
}
```
