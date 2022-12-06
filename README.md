<h1 align="center">Easing Curves 2.0.0</h1>

<p align="center">Standard easing functions as animation curves for GameMaker 2022 LTS</p>

<p align="center"><b>@jujuadams</b></p>

<p align="center"><a href="https://github.com/JujuAdams/Easing-Curves/releases/tag/2.0.0">Download the .yymps</a></p>
<p align="center">Chat about Easing Curves on the <a href="https://discord.gg/8krYCqr">Discord server</a></p>

&nbsp;

**Recommended function for usage:**
```
/// Return: Floating point number interpolated from <start> to <end> using the give animation curve as the lerping factor
/// 
/// @param start      Starting value
/// @param end        End value
/// @param animCurve  Animation curve to use
/// @param posx       x-position to read from

function AnimcurveTween(_start, _end, _curve, _t)
{
    var _w = animcurve_channel_evaluate(animcurve_get_channel(_curve, 0), _t);
    var _value = lerp(_start, _end, _w);
    return _value;
}
```