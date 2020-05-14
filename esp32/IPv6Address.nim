##
##  IPv6Address.h - Base class that provides IPv6Address
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
  IPv6Address* {.importcpp: "IPv6Address", header: "IPv6Address.h", bycopy.} = object ##  Constructors


proc constructIPv6Address*(): IPv6Address {.cdecl, constructor,
    importcpp: "IPv6Address(@)", header: "IPv6Address.h".}
proc constructIPv6Address*(address: ptr uint8): IPv6Address {.cdecl, constructor,
    importcpp: "IPv6Address(@)", header: "IPv6Address.h".}
proc constructIPv6Address*(address: ptr uint32): IPv6Address {.cdecl, constructor,
    importcpp: "IPv6Address(@)", header: "IPv6Address.h".}
proc destroyIPv6Address*(this: var IPv6Address) {.cdecl,
    importcpp: "#.~IPv6Address()", header: "IPv6Address.h".}
proc fromString*(this: var IPv6Address; address: cstring): bool {.cdecl,
    importcpp: "fromString", header: "IPv6Address.h".}
proc fromString*(this: var IPv6Address; address: String): bool {.cdecl,
    importcpp: "fromString", header: "IPv6Address.h".}
converter `constuint8*`*(this: IPv6Address): ptr uint8 {.noSideEffect, cdecl,
    importcpp: "IPv6Address::operator constuint8*", header: "IPv6Address.h".}
converter `constuint32*`*(this: IPv6Address): ptr uint32 {.noSideEffect, cdecl,
    importcpp: "IPv6Address::operator constuint32*", header: "IPv6Address.h".}
proc `==`*(this: IPv6Address; `addr`: IPv6Address): bool {.noSideEffect, cdecl,
    importcpp: "(# == #)", header: "IPv6Address.h".}
proc `==`*(this: IPv6Address; `addr`: ptr uint8): bool {.noSideEffect, cdecl,
    importcpp: "(# == #)", header: "IPv6Address.h".}
proc `[]`*(this: IPv6Address; index: cint): uint8 {.noSideEffect, cdecl,
    importcpp: "#[@]", header: "IPv6Address.h".}
proc `[]`*(this: var IPv6Address; index: cint): var uint8 {.cdecl, importcpp: "#[@]",
    header: "IPv6Address.h".}
proc toString*(this: IPv6Address): String {.noSideEffect, cdecl,
                                        importcpp: "toString",
                                        header: "IPv6Address.h".}