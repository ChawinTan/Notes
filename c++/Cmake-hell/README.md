1) clone and build your external library
2) In the root folder, create a CMakeList.txt
3) Fill in the correct config.
4) `cmake -S . -B out/build/` to build into the out/build folder
5) `make -C out/build`
6) `./out/build/<project_name>` to run it

## Patterns that I can rely on

When a library calls itself in the form of `libxyz-dev`, it can be usually be linked with a pattern in the form of

```
find_package(xyz)

add_library(my_library src/my_source_file.cpp)

target_link_libraries(my_library
  PUBLIC
    xyz
)
```

`lib` represents a package the provides a library and `dev` represents some extra utilities to help developers link my library. Take off those 2 parts and what is left is the name of the library, `xyz`.

Can refer to filelist as a reference to how to formulate cmake:

For example, https://packages.ubuntu.com/focal/amd64/libjwt-dev/filelist
