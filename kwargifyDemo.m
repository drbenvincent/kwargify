function kwargifyDemo

%% Example 1
% now I want to call myFunction, but I just want to use the defaul options
% and not specify any kwargs
display('Example 1')
myFunction(42,[])

%% Example 2
% Now I want to overwrite the default value for b, and add an extra one d
% so I will specify my kwargs here. You can call them opts though if you
% prefer.
kwargs.b = 5;
kwargs.d = 4; % note this is an additional argument

% call myFunction with these kwargs
display('Example 2')
myFunction(42,kwargs)

%% Example 3
% You can do the same as Example 2, but even more compactly, and kwarg-like
% by not creating the intermediate kwarg structure...
display('Example 3')
myFunction(42, struct('b',5, 'd',4))

return


function myFunction(exampleRequiredArgument,kwargs)
% If you want your function to work with kwargs, then you have to specify
% default options in a structure here. These will be overwritten by
% fieldnames in the kwargs structure. If kwargs are not provided (ie
% kwargs=[]) then the detaults are used.

% Default options
opts.a = 1;
opts.b = 2;
opts.c = 3;

% display the default opts
display('defaults are:'), opts

% This is where the magic happens ~~~
opts = kwargify(opts,kwargs);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% display the updated opts
display('after using ''kwargify'': '), opts

% DO SOMETHING USEFUL HERE USING VALUES IN (opts) STRUCTURE
display(exampleRequiredArgument+ opts.b)

return
