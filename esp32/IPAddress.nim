##
##  IPAddress.h - Base class that provides IPAddress
##  Copyright (c) 2011 Adrian McEwen.  All right reserved.
##
##  This library is free software; you can redistribute it and/or
##  modify it under the terms of the GNU Lesser General Public
##  License as published by the Free Software Foundation; either
##  version 2.1 of the License, or (at your option) any later version.
##
##  This library is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
##  Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public
##  License along with this library; if not, write to the Free Software
##  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
##

##  A class to make it easier to handle and pass around IP addresses
import arduino

type
  IPAddress* {.importcpp: "IPAddress", header: "IPAddress.h", bycopy.} = object ##  Constructors


proc constructIPAddress*(): IPAddress {.cdecl, constructor,
                                     importcpp: "IPAddress(@)",
                                     header: "IPAddress.h".}
proc constructIPAddress*(first_octet: uint8; second_octet: uint8;
                        third_octet: uint8; fourth_octet: uint8): IPAddress {.
    cdecl, constructor, importcpp: "IPAddress(@)", header: "IPAddress.h".}
proc constructIPAddress*(address: uint32): IPAddress {.cdecl, constructor,
    importcpp: "IPAddress(@)", header: "IPAddress.h".}
proc constructIPAddress*(address: ptr uint8): IPAddress {.cdecl, constructor,
    importcpp: "IPAddress(@)", header: "IPAddress.h".}
proc destroyIPAddress*(this: var IPAddress) {.cdecl, importcpp: "#.~IPAddress()",
    header: "IPAddress.h".}
proc fromString*(this: var IPAddress; address: cstring): bool {.cdecl,
    importcpp: "fromString", header: "IPAddress.h".}
proc fromString*(this: var IPAddress; address: String): bool {.cdecl,
    importcpp: "fromString", header: "IPAddress.h".}
converter `uint32`*(this: IPAddress): uint32 {.noSideEffect, cdecl,
    importcpp: "IPAddress::operator uint32", header: "IPAddress.h".}
proc `==`*(this: IPAddress; `addr`: IPAddress): bool {.noSideEffect, cdecl,
    importcpp: "(# == #)", header: "IPAddress.h".}
proc `==`*(this: IPAddress; `addr`: ptr uint8): bool {.noSideEffect, cdecl,
    importcpp: "(# == #)", header: "IPAddress.h".}
proc `[]`*(this: IPAddress; index: cint): uint8 {.noSideEffect, cdecl,
    importcpp: "#[@]", header: "IPAddress.h".}
proc `[]`*(this: var IPAddress; index: cint): var uint8 {.cdecl, importcpp: "#[@]",
    header: "IPAddress.h".}
proc toString*(this: IPAddress): String {.noSideEffect, cdecl, importcpp: "toString",
                                      header: "IPAddress.h".}

var INADDR_NONE* {.importcpp: "INADDR_NONE", header: "IPAddress.h".}: IPAddress 

