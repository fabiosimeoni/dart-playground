dart-playground
============

A playground to experiment with a `Dart`-based stack.  

[![Build Status](https://drone.io/github.com/fabiosimeoni/dart-playground/status.png)](https://drone.io/github.com/fabiosimeoni/dart-playground/latest)

### Project types 

- Projects define `package`s of two broad types:
	- *library packages* are those you build upon: have some *public* stuff
		- may depend on other such packages. 
		- in `Java`, they'd be plain `jar`s with no entrypoint.
	- *application packages* run on their two feet,  perhaps in the browser.  
		- depend on library packages, but top-level: not depended upon. 
		- in `Java` they'd be `war`s or executable `jar`s.
	- `playground` is intentionally hybrid, for illustration purposes. 

- in all cases, package code is organised in files that can be `import`ed **by relative location**:

	    import 'samedir.dart';
	    import 'dir/file.dart';
	    import  '../../../down/we/go/file.dart';

	- we have to avoid relative path
	
### Libraries 

- in all package types, code is organised in...libraries again. 
	- units of *visibility* and target of `import`s.
	- grain is a tradeoff between 
		- the convenience of import
		- the safety of privacy.
	- no such thing in  `Java`, but grain typically on par with `Java package` . 
	- (code stuffed in a single file is implicitly in an anonymous library).

-  libraries can be explicitly named and *can* spread across many files.
	- one file serves as *header*, the others as *parts*. 
	- a single `import` to clients: as if it were a single file.
	- head names the library upfront:	
	
		    library playground; 
		    ...
		    
	- next, head imports other lib heads (platform, in deps, internal too): 
	
		    ...
		    import 'dart:<lib-name>'; 
		    import 'package:<pkg-name>/<lib-path>';
		    ...
	
	- next, head lists its own parts **by (relative) location**:  
		
		    ...
		    part 'lib/part1.dart';
		    part `lib/part2.dart'
		    //any organisational mechanism in principle, above seems 'typical'
		    ....
			
	- head should stop there
		- perhaps lib-wide constants and utils (if not too many)?
			
	- part declares library, upfront and **by name**: 
	 
		    part of playground;
		    ...

### Project layout

- `Pub Manager` defines layout conventions that guarantee alignment with tools 
	- first and foremost the manager itself. 

- applications that run in the browser organise their code under `web`.
- applications that do not run in the browser organise it under `bin`.
- libraries organise it under `lib`.
	- clients can import from `lib`. 
	- anywhere but below `lib\src`, however, it's discouraged. sort of private implementation.
	- any public *asset* can go under `lib`, e.g. `css` or `html` that can be referred to from other such resources:
	
		    <link href="packages/playground/<lib-rel-path>/.css" rel="stylesheet">
		 



