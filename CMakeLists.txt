cmake_minimum_required(VERSION 3.28.0)

set(ZEPHYR_BASE "${CMAKE_CURRENT_LIST_DIR}/lib/zephyr-workspace/zephyr" CACHE PATH "Zephyr base" FORCE)
set(Zephyr_DIR "${ZEPHYR_BASE}/share/zephyr-package/cmake" CACHE PATH "Zephyr package" FORCE) 

find_package(Zephyr HINTS "${CMAKE_CURRENT_LIST_DIR}/lib/zephyr-workspace/zephyr")

project (IEEE_Blinky C CXX)

add_subdirectory(Blinky)
