dart-playground
============

A playground to experiment with a `Dart`-based stack.  

[![Build Status](https://drone.io/github.com/fabiosimeoni/dart-playground/status.png)](https://drone.io/github.com/fabiosimeoni/dart-playground/latest)

### Project types 

Projects define `package`s of two broad types:
	
- *library packages* are those you build upon, i.e. have some *public* stuff.
	- may depend on other such packages. 
	- in `Java`, they'd be plain `jar`s with no entrypoint.

- *application packages* run on their two feet,  perhaps in the browser.  
	- will depend on library packages, 	but are not depended upon. 
	- in `Java` they'd be `war`s or executable `jar`s.
	
(`this playground` is intentionally hybrid, for illustration purposes.) 

In all cases, package code is organised in files that can be `import`ed **by relative location**:

	    import 'samedir.dart';
	    import 'dir/file.dart';
	    import  '../../../down/we/go/file.dart';

	
### Libraries 

- across all package types, code is organised in...*libraries* again (darn!).
	- units of *visibility*
	- grain is a tradeoff between 
		- the convenience of import: coarser grain makes for less imports
		- the safety of privacy: smaller grain makes for more access control
	- no such thing in  `Java`,  mapping depends on grain (class, package, set of packages) 
	- I am of a the idea
	
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
		 

### CSS Preprocessing

- there seems to be integration for both `sass` and `stylus`, going for the latter.
  - prefer to rely on `node` rather than `ruby`
  - as capable, looks cool
  - https://github.com/learnboost/stylus 
- (currently has broken dependencies, embedding source directly until fix) 
- `build.dart` gets called by IDE on changes, integration `stylus` is as simple as:

	  	    void main(List<String> args) {
  	        	buildStylus(args);
  	        }
  	        
- would be cleaner to commit only pre-processed `.styl` forms, install `stylus` with `npm` on CI machine, and compile there.
Not sure there's a strong advantage just now to make build longer and configure for excludes. 
