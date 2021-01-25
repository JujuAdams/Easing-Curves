///*
__curveDevOutput([easeQuad,
                  easeCubic,
                  easeQuart,
                  easeQuint,
                  easeSine,
                  easeExpo,
                  easeCirc,
                  easeBack,
                  easeElastic,
                  easeBounce],
                  101, 0);
                  
__curveDevOutput([easeQuad,
                  easeCubic,
                  easeQuart,
                  easeQuint,
                  easeSine,
                  easeExpo,
                  easeCirc,
                  easeBack,
                  easeElastic,
                  easeBounce],
                  101, 1);
                  
__curveDevOutput([easeQuad,
                  easeCubic,
                  easeQuart,
                  easeQuint,
                  easeSine,
                  easeExpo,
                  easeCirc,
                  easeBack,
                  easeElastic,
                  easeBounce],
                  101, 2);

function easeQuad(time)
{
	return time*time;
}

function easeCubic(time)
{
	return time*time*time;
}

function easeQuart(time)
{
	return time*time*time*time;
}

function easeQuint(time)
{
	return time*time*time*time*time;
}

function easeSine(time)
{
    return 1.0 - cos(0.5*(time*pi));
}

function easeExpo(time)
{
    if (time == 0.0) return 0.0;
    return power(2.0, 10.0*time - 10.0);
}

function easeCirc(time)
{
    return 1.0 - sqrt(1.0 - time*time);
}

function easeBack(time)
{
    var param = 1.70158;
	return time*time*((param + 1.0)*time - param);
}

function easeElastic(time)
{
    if (time == 0.0) return 0.0;
    if (time == 1.0) return 1.0;
    return -power(2.0, 10.0*time - 10.0) * sin((time*10.0 - 10.75) * (2.0*pi) / 3.0);
}

function easeBounce(time)
{
	var n1 = 7.5625;
	var d1 = 2.75;
    
    time = 1.0 - time;
    
	if (time < 1.0 / d1)
    {
		return 1.0 - n1*time*time;
	}
    else if (time < 2.0 / d1)
    {
        time -= 1.5/d1;
		return 1.0 - (n1*time*time + 0.75);
	}
    else if (time < 2.5 / d1)
    {
        time -= 2.25/d1;
		return 1.0 - (n1*time*time + 0.9375);
	}
    else
    {
        time -= 2.625/d1;
		return 1.0 - (n1*time*time + 0.984375);
	}
}

/// @param functionsArray
/// @param points
/// @param mode
function __curveDevOutput(_functionsArray, _count, _mode)
{
    if (_count < 2) throw "Need 2 or more points";
    
    var _copy_paste_string = "";
    
    var _i = 0;
    repeat(array_length(_functionsArray))
    {
        var _func = _functionsArray[_i];
        
        switch(_mode)
        {
            case 0: var _name = script_get_name(_func);           break;
            case 1: var _name = script_get_name(_func) + "Inv";   break;
            case 2: var _name = script_get_name(_func) + "InOut"; break;
        }
        
        _name = string_replace_all(_name, "ease", "curve");
        
        var _buffer = buffer_create(1, buffer_grow, 1);
        buffer_write(_buffer, buffer_text, "{\n");
        buffer_write(_buffer, buffer_text, "  \"function\": 0,\n");
        buffer_write(_buffer, buffer_text, "  \"channels\": [\n");
        buffer_write(_buffer, buffer_text, "    {\"colour\":4290799884,\"visible\":true,\"points\":[\n");
        
        var _t = 0;
        repeat(_count)
        {
            switch(_mode)
            {
                case 0: var _value = _func(_t); break;
                case 1: var _value = 1 - _func(1 - _t); break;
                case 2: var _value = (_t < 0.5)? ((1 - _func(1 - 2*_t))/2) : ((1 + _func(2*_t - 1))/2); break;
            }
            
            buffer_write(_buffer, buffer_text, "        {\"th0\":0.0,\"th1\":0.0,\"tv0\":0.0,\"tv1\":0.0,\"x\":" + string_format(_t, 0, 10) + ",\"y\":" + string_format(_value, 0, 10) + "},\n");
            
            _t += 1 / _count;
        }
        
        buffer_write(_buffer, buffer_text, "        {\"th0\":0.0,\"th1\":0.0,\"tv0\":0.0,\"tv1\":0.0,\"x\":1.0,\"y\":1.0,},\n");
        buffer_write(_buffer, buffer_text, "      ],\"resourceVersion\":\"1.0\",\"name\":\"curve1\",\"tags\":[],\"resourceType\":\"GMAnimCurveChannel\",},\n");
        buffer_write(_buffer, buffer_text, "  ],\n");
        buffer_write(_buffer, buffer_text, "  \"parent\": {\n");
        buffer_write(_buffer, buffer_text, "    \"name\": \"Animation Curves\",\n");
        buffer_write(_buffer, buffer_text, "    \"path\": \"folders/Animation Curves.yy\",\n");
        buffer_write(_buffer, buffer_text, "  },\n");
        buffer_write(_buffer, buffer_text, "  \"resourceVersion\": \"1.2\",\n");
        buffer_write(_buffer, buffer_text, "  \"name\": \"" + _name + "\",\n");
        buffer_write(_buffer, buffer_text, "  \"tags\": [],\n");
        buffer_write(_buffer, buffer_text, "  \"resourceType\": \"GMAnimCurve\",\n");
        buffer_write(_buffer, buffer_text, "}");
        buffer_save(_buffer, _name + ".yy");
        buffer_delete(_buffer);
        
        _copy_paste_string += "\n    {\"id\":{\"name\":\"" + _name + "\",\"path\":\"animcurves/" + _name + ".yy\",},\"order\":0,},";
        
        ++_i;
    }
    
    //clipboard_set_text(_copy_paste_string);
}
//*/