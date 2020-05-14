##
## ESP8266 Multicast DNS (port of CC3000 Multicast DNS library)
## Version 1.1
## Copyright (c) 2013 Tony DiCola (tony@tonydicola.com)
## ESP8266 port (c) 2015 Ivan Grokhotkov (ivan@esp8266.com)
## MDNS-SD Suport 2015 Hristo Gochkov (hristo@espressif.com)
## Extended MDNS-SD support 2016 Lars Englund (lars.englund@gmail.com)
## Rewritten for ESP32 by Hristo Gochkov (hristo@espressif.com)
##
## This is a simple implementation of multicast DNS query support for an Arduino
## running on ESP32 chip.
##
## Usage:
## - Include the ESP32 Multicast DNS library in the sketch.
## - Call the begin method in the sketch's setup and provide a domain name (without
##   the '.local' suffix, i.e. just provide 'foo' to resolve 'foo.local'), and the
##   Adafruit CC3000 class instance.  Optionally provide a time to live (in seconds)
##   for the DNS record--the default is 1 hour.
## - Call the update method in each iteration of the sketch's loop function.
##
## License (MIT license):
##   Permission is hereby granted, free of charge, to any person obtaining a copy
##   of this software and associated documentation files (the "Software"), to deal
##   in the Software without restriction, including without limitation the rights
##   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##   copies of the Software, and to permit persons to whom the Software is
##   furnished to do so, subject to the following conditions:
##
##   The above copyright notice and this permission notice shall be included in
##   all copies or substantial portions of the Software.
##
##   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
##   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
##   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
##   THE SOFTWARE.
##
##

import arduino
import IPAddress
import IPv6Address

## this should be defined at build time

type
  MDNSResponder* {.importcpp: "MDNSResponder", header: "ESPmDNS.h", bycopy.} = object


proc constructMDNSResponder*(): MDNSResponder {.cdecl, constructor,
    importcpp: "MDNSResponder(@)", header: "ESPmDNS.h".}
proc destroyMDNSResponder*(this: var MDNSResponder) {.cdecl,
    importcpp: "#.~MDNSResponder()", header: "ESPmDNS.h".}
proc begin*(this: var MDNSResponder; hostName: cstring): bool {.cdecl,
    importcpp: "begin", header: "ESPmDNS.h".}
proc `end`*(this: var MDNSResponder) {.cdecl, importcpp: "end", header: "ESPmDNS.h".}
proc setInstanceName*(this: var MDNSResponder; name: String) {.cdecl,
    importcpp: "setInstanceName", header: "ESPmDNS.h".}
proc setInstanceName*(this: var MDNSResponder; name: cstring) {.cdecl,
    importcpp: "setInstanceName", header: "ESPmDNS.h".}
proc addService*(this: var MDNSResponder; service: cstring; proto: cstring;
                port: uint16) {.cdecl, importcpp: "addService", header: "ESPmDNS.h".}
proc addService*(this: var MDNSResponder; service: String; proto: String; port: uint16) {.
    cdecl, importcpp: "addService", header: "ESPmDNS.h".}
proc addServiceTxt*(this: var MDNSResponder; name: cstring; proto: cstring;
                   key: cstring; value: cstring): bool {.cdecl,
    importcpp: "addServiceTxt", header: "ESPmDNS.h".}
proc addServiceTxt*(this: var MDNSResponder; name: cstring; proto: cstring;
                   key: cstring; value: cstring) {.cdecl, importcpp: "addServiceTxt",
    header: "ESPmDNS.h".}
proc addServiceTxt*(this: var MDNSResponder; name: String; proto: String; key: String;
                   value: String) {.cdecl, importcpp: "addServiceTxt",
                                  header: "ESPmDNS.h".}
proc enableArduino*(this: var MDNSResponder; port: uint16 = 3232; auth: bool = false) {.
    cdecl, importcpp: "enableArduino", header: "ESPmDNS.h".}
proc disableArduino*(this: var MDNSResponder) {.cdecl, importcpp: "disableArduino",
    header: "ESPmDNS.h".}
# proc enableWorkstation*(this: var MDNSResponder;
                    #    `interface`: wifi_interface_t = ESP_IF_WIFI_STA) {.cdecl,
    # importcpp: "enableWorkstation", header: "ESPmDNS.h".}
proc disableWorkstation*(this: var MDNSResponder) {.cdecl,
    importcpp: "disableWorkstation", header: "ESPmDNS.h".}
proc queryHost*(this: var MDNSResponder; host: cstring; timeout: uint32 = 2000): IPAddress {.
    cdecl, importcpp: "queryHost", header: "ESPmDNS.h".}
proc queryHost*(this: var MDNSResponder; host: String; timeout: uint32 = 2000): IPAddress {.
    cdecl, importcpp: "queryHost", header: "ESPmDNS.h".}
proc queryService*(this: var MDNSResponder; service: cstring; proto: cstring): cint {.
    cdecl, importcpp: "queryService", header: "ESPmDNS.h".}
proc queryService*(this: var MDNSResponder; service: String; proto: String): cint {.
    cdecl, importcpp: "queryService", header: "ESPmDNS.h".}
proc hostname*(this: var MDNSResponder; idx: cint): String {.cdecl,
    importcpp: "hostname", header: "ESPmDNS.h".}
proc IP*(this: var MDNSResponder; idx: cint): IPAddress {.cdecl, importcpp: "IP",
    header: "ESPmDNS.h".}
proc IPv6*(this: var MDNSResponder; idx: cint): IPv6Address {.cdecl, importcpp: "IPv6",
    header: "ESPmDNS.h".}
proc port*(this: var MDNSResponder; idx: cint): uint16 {.cdecl, importcpp: "port",
    header: "ESPmDNS.h".}
proc numTxt*(this: var MDNSResponder; idx: cint): cint {.cdecl, importcpp: "numTxt",
    header: "ESPmDNS.h".}
proc hasTxt*(this: var MDNSResponder; idx: cint; key: cstring): bool {.cdecl,
    importcpp: "hasTxt", header: "ESPmDNS.h".}
proc txt*(this: var MDNSResponder; idx: cint; key: cstring): String {.cdecl,
    importcpp: "txt", header: "ESPmDNS.h".}
proc txt*(this: var MDNSResponder; idx: cint; txtIdx: cint): String {.cdecl,
    importcpp: "txt", header: "ESPmDNS.h".}
var MDNS* {.importcpp: "MDNS", header: "ESPmDNS.h".}: MDNSResponder
