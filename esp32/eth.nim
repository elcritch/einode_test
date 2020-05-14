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

type
  eth_phy_type_t* = enum
    ETH_PHY_LAN8720, ETH_PHY_TLK110, ETH_PHY_MAX

const 
  ETH_PHY_ADDR = 0
  ETH_PHY_TYPE = ETH_PHY_LAN8720
  ETH_PHY_POWER = -1
  ETH_PHY_MDC = 23
  ETH_PHY_MDIO = 18
  ETH_CLK_MODE = 0

type
  ETHClass* {.bycopy.} = object


proc constructETHClass*(): ETHClass {.cdecl, constructor.}
proc destroyETHClass*(this: var ETHClass) {.cdecl.}
proc begin*(this: var ETHClass; phy_addr: uint8 = ETH_PHY_ADDR;
           power: cint = ETH_PHY_POWER; mdc: cint = ETH_PHY_MDC;
           mdio: cint = ETH_PHY_MDIO; `type`: eth_phy_type_t = ETH_PHY_TYPE;
           clk_mode: eth_clock_mode_t = ETH_CLOCK_GPIO0_IN): bool {.cdecl.}
proc config*(this: var ETHClass; local_ip: IPAddress; gateway: IPAddress;
            subnet: IPAddress; dns1: IPAddress = cast[uint32](0x00000000);
            dns2: IPAddress = cast[uint32](0x00000000)): bool {.cdecl.}
proc getHostname*(this: var ETHClass): cstring {.cdecl.}
proc setHostname*(this: var ETHClass; hostname: cstring): bool {.cdecl.}
proc fullDuplex*(this: var ETHClass): bool {.cdecl.}
proc linkUp*(this: var ETHClass): bool {.cdecl.}
proc linkSpeed*(this: var ETHClass): uint8 {.cdecl.}
proc enableIpV6*(this: var ETHClass): bool {.cdecl.}
proc localIPv6*(this: var ETHClass): IPv6Address {.cdecl.}
proc localIP*(this: var ETHClass): IPAddress {.cdecl.}
proc subnetMask*(this: var ETHClass): IPAddress {.cdecl.}
proc gatewayIP*(this: var ETHClass): IPAddress {.cdecl.}
proc dnsIP*(this: var ETHClass; dns_no: uint8 = 0): IPAddress {.cdecl.}
proc broadcastIP*(this: var ETHClass): IPAddress {.cdecl.}
proc networkID*(this: var ETHClass): IPAddress {.cdecl.}
proc subnetCIDR*(this: var ETHClass): uint8 {.cdecl.}
proc macAddress*(this: var ETHClass; mac: ptr uint8): ptr uint8 {.cdecl.}
proc macAddress*(this: var ETHClass): String {.cdecl.}
var ETH*: ETHClass
