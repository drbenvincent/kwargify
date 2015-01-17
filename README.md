# kwargify
A simple, lightweight attempt to get keyword arguments (kwargs) in Matlab.

## Why would I want to use kwargify
You can write a function that uses default parameters under normal operation, but which you can selectively overwrite if you need to. 

## How to use kwargify

See `kwargifyDemo.m` for a worked example.

If you want to use kwargify, then all you need to do is right at the top of your function then:

1. Define an options structure of default values.
2. Call kwargify to overwrite your defaults with any which you may have specified, e.g. `opts = kwargify(opts,kwargs);`

So your function will look a bit like this:

    function myFunction(exampleRequiredArgument,kwargs)
    % Define default parameter values
    opts.a = 1;
    opts.b = 2;
    opts.c = 3;
    
    % This is where the magic happens ~~~
    opts = kwargify(opts,kwargs);
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    % DO SOMETHING USEFUL HERE
    
    return

If you call this function without specifying any kwargs `myFunction(42,[])` then it will use the defaults specified in myFunction.

But you can use the kwargs like this

    kwargs.b=666;
    kwargs.c=1
    myFunction(42,kwargs)
    
and it will overwrite the fields `b` and `c` but use the default `a` specified in your function.

## Licence

Released under the The MIT License (MIT), see `LICENCE.txt`.
