import arduino

proc NimMain() {.importc.}

setup:
  Serial.begin(500_000)
  Serial.setTimeout(30_000)
  NimMain() # initialize garbage collector memory, types and stack

  Stdout = addr Serial
  Stdin = addr Serial

  pinMode LED_BUILTIN, OUTPUT
  delay(5_000)
  Serial.print("starting...\n\n") #     // cursor to home command

loop:
  digitalWrite LED_BUILTIN, HIGH
  delay 500
  digitalWrite LED_BUILTIN, LOW  
  delay 500

  echo "millis: " & $millis()

