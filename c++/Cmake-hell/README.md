1) clone and build your external library
2) In the root folder, create a CMakeList.txt
3) Fill in the correct config.
4) `cmake -S . -B out/build/` to build into the out/build folder
5) `make -C out/build`
6) `./out/build/<project_name>` to run it
