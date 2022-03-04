if( TARGET stb )
	return()
endif()
file( GLOB STB_HEADERS ${BGFX_DIR}/3rdparty/stb/*.h )
add_library( stb INTERFACE ${STB_HEADERS} )
install(FILES ${STB_HEADERS} DESTINATION "${CMAKE_INSTALL_PREFIX}/include/3rdparty/stb")
target_include_directories( stb INTERFACE
	$<BUILD_INTERFACE:${BGFX_DIR}/3rdparty>
	$<INSTALL_INTERFACE:include/3rdparty>
)
set_target_properties( stb PROPERTIES FOLDER "bgfx/3rdparty" )