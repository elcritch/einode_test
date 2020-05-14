##
##  ETH.h - espre ETH PHY support.
##  Based on WiFi.h from Ardiono WiFi shield library.
##  Copyright (c) 2011-2014 Arduino.  All right reserved.
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

import arduino
import esp_eth
import IPAddress
import IPv6Address

type
  eth_phy_type_t* {.size: sizeof(cint), importcpp: "eth_phy_type_t", header: "ETH.h".} = enum
    ETH_PHY_LAN8720, ETH_PHY_TLK110, ETH_PHY_MAX

const
  ETH_PHY_ADDR* = 0
  ETH_PHY_TYPE* = ETH_PHY_LAN8720
  ETH_PHY_POWER* = -1
  ETH_PHY_MDC* = 23
  ETH_PHY_MDIO* = 18
  ETH_CLK_MODE* = ETH_CLOCK_GPIO0_IN

type
  ETHClass* {.importcpp: "ETHClass", header: "ETH.h", bycopy.} = object


proc constructETHClass*(): ETHClass {.cdecl, constructor, importcpp: "ETHClass(@)",
                                   header: "ETH.h".}
proc destroyETHClass*(this: var ETHClass) {.cdecl, importcpp: "#.~ETHClass()",
                                        header: "ETH.h".}

proc begin*(this: var ETHClass): bool {.cdecl,
    importcpp: "begin", header: "ETH.h".}
proc beginFull*(this: var ETHClass; phy_addr: uint8 = ETH_PHY_ADDR;
           power: cint = ETH_PHY_POWER; mdc: cint = ETH_PHY_MDC;
           mdio: cint = ETH_PHY_MDIO; `type`: eth_phy_type_t = ETH_PHY_TYPE;
           clk_mode: eth_clock_mode_t = ETH_CLK_MODE): bool {.cdecl,
    importcpp: "begin", header: "ETH.h".}
proc config*(this: var ETHClass; local_ip: IPAddress; gateway: IPAddress;
            subnet: IPAddress; dns1: IPAddress = cast[IPAddress](0x00000000);
            dns2: IPAddress = cast[IPAddress](0x00000000)): bool {.cdecl,
    importcpp: "config", header: "ETH.h".}
proc getHostname*(this: var ETHClass): cstring {.cdecl, importcpp: "getHostname",
    header: "ETH.h".}
proc setHostname*(this: var ETHClass; hostname: cstring): bool {.cdecl,
    importcpp: "setHostname", header: "ETH.h".}
proc fullDuplex*(this: var ETHClass): bool {.cdecl, importcpp: "fullDuplex",
                                        header: "ETH.h".}
proc linkUp*(this: var ETHClass): bool {.cdecl, importcpp: "linkUp", header: "ETH.h".}
proc linkSpeed*(this: var ETHClass): uint8 {.cdecl, importcpp: "linkSpeed",
    header: "ETH.h".}
proc enableIpV6*(this: var ETHClass): bool {.cdecl, importcpp: "enableIpV6",
                                        header: "ETH.h".}
proc localIPv6*(this: var ETHClass): IPv6Address {.cdecl, importcpp: "localIPv6",
    header: "ETH.h".}
proc localIP*(this: var ETHClass): IPAddress {.cdecl, importcpp: "localIP",
    header: "ETH.h".}
proc subnetMask*(this: var ETHClass): IPAddress {.cdecl, importcpp: "subnetMask",
    header: "ETH.h".}
proc gatewayIP*(this: var ETHClass): IPAddress {.cdecl, importcpp: "gatewayIP",
    header: "ETH.h".}
proc dnsIP*(this: var ETHClass; dns_no: uint8 = 0): IPAddress {.cdecl,
    importcpp: "dnsIP", header: "ETH.h".}
proc broadcastIP*(this: var ETHClass): IPAddress {.cdecl, importcpp: "broadcastIP",
    header: "ETH.h".}
proc networkID*(this: var ETHClass): IPAddress {.cdecl, importcpp: "networkID",
    header: "ETH.h".}
proc subnetCIDR*(this: var ETHClass): uint8 {.cdecl, importcpp: "subnetCIDR",
    header: "ETH.h".}
proc macAddress*(this: var ETHClass; mac: ptr uint8): ptr uint8 {.cdecl,
    importcpp: "macAddress", header: "ETH.h".}
proc macAddress*(this: var ETHClass): String {.cdecl, importcpp: "macAddress",
    header: "ETH.h".}

var ETH* {.importcpp: "ETH", header: "ETH.h".}: ETHClass
