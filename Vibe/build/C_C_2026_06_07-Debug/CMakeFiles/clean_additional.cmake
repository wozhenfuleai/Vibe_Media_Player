# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appVibe_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appVibe_autogen.dir/ParseCache.txt"
  "appVibe_autogen"
  )
endif()
