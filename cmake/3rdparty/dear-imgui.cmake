# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( TARGET dear-imgui )
	return()
endif()

file( GLOB dear_IMGUI_SOURCES ${BGFX_DIR}/3rdparty/dear-imgui/*.cpp ${BGFX_DIR}/3rdparty/dear-imgui/*.h ${BGFX_DIR}/3rdparty/dear-imgui/*.inl )
file( GLOB dear_IMGUI_HEADERS ${BGFX_DIR}/3rdparty/dear-imgui/*.h ${BGFX_DIR}/3rdparty/dear-imgui/*.inl)
file( GLOB dear_IMGUI_WIDGET_HEADERS ${BGFX_DIR}/3rdparty/dear-imgui/widgets/*.h ${BGFX_DIR}/3rdparty/dear-imgui/widgets/*.inl )
add_library( dear-imgui STATIC EXCLUDE_FROM_ALL ${dear_IMGUI_SOURCES} )
target_compile_definitions( dear-imgui PRIVATE "-D_CRT_SECURE_NO_WARNINGS" "-D__STDC_FORMAT_MACROS" )
install(FILES ${dear_IMGUI_HEADERS} DESTINATION "${CMAKE_INSTALL_PREFIX}/include/3rdparty/dear-imgui")
install(FILES ${dear_IMGUI_WIDGET_HEADERS} DESTINATION "${CMAKE_INSTALL_PREFIX}/include/3rdparty/dear-imgui/widgets")
target_include_directories( dear-imgui PUBLIC
	$<BUILD_INTERFACE:${BGFX_DIR}/3rdparty>
	$<INSTALL_INTERFACE:include/3rdparty>
)
target_link_libraries( dear-imgui PUBLIC bx )
set_target_properties( dear-imgui PROPERTIES FOLDER "bgfx/3rdparty" )
