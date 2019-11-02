## Global modules

`npm root -g`

## Search global packages

`npm list -g --depth=0`

## set npm global package.json to current correct path

1. run the the above command to search for global packages. It will print out the global path that is currently in used.

2. check the current npm global prefix. `npm prefix -g`

3. set the path. `npm config set prefix (path)`
