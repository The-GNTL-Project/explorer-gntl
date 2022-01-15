#------------------------------------------------------------------------------
# CMake helper for the majority of the cpp-ethereum modules.
#
# This module defines
#     GNTL_XXX_LIBRARIES, the libraries needed to use ethereum.
#     GNTL_FOUND, If false, do not try to use ethereum.
#
# File addetped from cpp-ethereum
#
# The documentation for cpp-ethereum is hosted at http://cpp-ethereum.org
#
# ------------------------------------------------------------------------------
# This file is part of cpp-ethereum.
#
# cpp-ethereum is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cpp-ethereum is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cpp-ethereum.  If not, see <http://www.gnu.org/licenses/>
#
# (c) 2014-2016 cpp-ethereum contributors.
#------------------------------------------------------------------------------

set(LIBS common;blocks;cryptonote_basic;cryptonote_core;multisig;net;gntl_mq;
         cryptonote_protocol;daemonizer;mnemonics;epee;lmdb;device;randomx;
         blockchain_db;ringct;wallet;cncrypto;easylogging;version;checkpoints)

set(GNTL_INCLUDE_DIRS "${CPP_GNTL_DIR}")

# if the project is a subset of main cpp-ethereum project
# use same pattern for variables as Boost uses

foreach (l ${LIBS})

	string(TOUPPER ${l} L)

	find_library(GNTL_${L}_LIBRARY
		NAMES ${l}
		PATHS ${CMAKE_LIBRARY_PATH}
		PATH_SUFFIXES "/src/${l}" "/src/" "/external/lib${l}" "/lib" "/external/randomarq/" "/src/crypto" "/contrib/epee/src" "/external/easylogging++/" "/external/${l}"
		NO_DEFAULT_PATH
	)

	set(GNTL_${L}_LIBRARIES ${GNTL_${L}_LIBRARY})

	message(STATUS FindGNTL " GNTL_${L}_LIBRARIES ${GNTL_${L}_LIBRARY}")

	add_library(${l} STATIC IMPORTED)
	set_property(TARGET ${l} PROPERTY IMPORTED_LOCATION ${GNTL_${L}_LIBRARIES})

endforeach()

if (EXISTS ${GNTL_BUILD_DIR}/src/ringct/libringct_basic.a)
	message(STATUS FindGNTL " found libringct_basic.a")
	add_library(ringct_basic STATIC IMPORTED)
	set_property(TARGET ringct_basic PROPERTY IMPORTED_LOCATION ${GNTL_BUILD_DIR}/src/ringct/libringct_basic.a)
endif()

if(EXISTS ${GNTL_BUILD_DIR}/libzmq/lib/libzmq.a)
	message(STATUS FindGNTL " found in-tree libzmq.a")
	add_library(libzmq STATIC IMPORTED)
	set_property(TARGET libzmq PROPERTY IMPORTED_LOCATION ${GNTL_BUILD_DIR}/libzmq/lib/libzmq.a)
endif()

message(STATUS ${GNTL_SOURCE_DIR}/build)

# include GNTL headers
include_directories(
    ${GNTL_SOURCE_DIR}/src
    ${GNTL_SOURCE_DIR}/src/crypto
    ${GNTL_SOURCE_DIR}/external
    ${GNTL_SOURCE_DIR}/external/randomarq/src
    ${GNTL_SOURCE_DIR}/build/release
    ${GNTL_SOURCE_DIR}/build/release/libzmq/include
    ${GNTL_SOURCE_DIR}/external/easylogging++
    ${GNTL_SOURCE_DIR}/contrib/epee/include
    ${GNTL_SOURCE_DIR}/external/liblmdb)
