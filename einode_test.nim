import esp32/arduino
import esp32/eth
import esp32/ESPmDNS

import strutils
import segfaults
import einode

proc NimMain() {.importc.}

# proc ei_malloc(size: clong): pointer
proc foo*(x: int): int =
    return x + 1
proc bar*(y: int): int =
    return y * 2

setup:
  Serial.begin(500_000)
  Serial.setTimeout(30_000)
  NimMain() # initialize garbage collector memory, types and stack

  Stdout = addr Serial
  Stdin = addr Serial

  # pinMode LED_BUILTIN, OUTPUT
  delay(5_000)
  Serial.print("starting...\n\n") #     // cursor to home command

  discard ETH.begin()
  # // You can browse to wesp32demo.local with this
  discard MDNS.begin("wesp32demo")

  echo("starting: " )
  var node_name = "cnode1"
  var einode = newEiNode(node_name, "127.0.0.1", cookie = "secretcookie")

  einode.initialize()

  ##  Connect to server
  var server_node = "e1@127.0.0.1"
  einode.connectServer(server_node):
    echo("Warning: unable to connect to node: " & server_node)
    delay(1_000)
    
  echo("Connected to: " & server_node);


loop:

  # digitalWrite LED_BUILTIN, HIGH
  # delay 500
  # digitalWrite LED_BUILTIN, LOW  
  # delay 500

  echo "millis: " & $millis()

