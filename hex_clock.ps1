[array]$HexArray=@('')*18
$HexArray[0]=@'
  000000
 00    00
00    0 00
00   0  00
00  0   00 
 000   00
  000000
'@
$HexArray[1]=@'
    11
   111
    11  
    11
    11
    11
   1111    
'@
$HexArray[2]=@'
2222222222 
       222
      222
   22222
 222
222
2222222222
'@
$HexArray[3]=@'
333333333
       333
       333 
333333333
       333
       333
333333333
'@
$HexArray[4]=@'
44      44
44      44
44      44 
 44444444
        44
        44
        44
'@
$HexArray[5]=@'
5555555555
555
 555
  55555
      555
       555 
5555555555
'@
$HexArray[6]=@'
 66666666
66
66
 666666666 
66      66
66      66
 66666666
'@
$HexArray[7]=@'
7777777777 
       77
      77
     77
    77
   77
  77
'@
$HexArray[8]=@'
 88888888
88      88
88      88
 88888888
88      88 
88      88
 88888888
'@
$HexArray[9]=@'
 99999999
99      99
99      99
 99999999
        99 
        99
 99999999
'@
$HexArray[10]=@'
    AA
   AAAA
  AA  AA
 AAAAAAAA
AA      AA 
AA      AA
AA      AA
'@
$HexArray[11]=@'
BBBBBBBBB
BB      BB
BB     BB
BBBBBBBB
BB     BB
BB      BB 
BBBBBBBBB
'@
$HexArray[12]=@'
  CCCCCCC
 CC     CC 
CC
CC
CC
 CC     CC
  CCCCCCC
'@
$HexArray[13]=@'
DDDDDDDD
DD     DD
DD      DD
DD      DD
DD      DD
DD     DD
DDDDDDDD
'@
$HexArray[14]=@'
EEEEEEEEEE
EE
EE
EEEEEEEEE
EE
EE
EEEEEEEEEE
'@
$HexArray[15]=@'
FFFFFFFFFF
FF
FF
FFFFFFFFF
FF
FF
FF
'@
$HexArray[16]=@'
      //
     //
    //
   //
  //
 //
//
'@
$HexArray[17]=@'



  ####  



'@

Function Get-HexTime()
{
$Now=Get-Date
$Hour=[Convert]::ToString($Now.Hour, 16).padleft(2, '0')
$Minute=[Convert]::ToString($Now.Minute, 16).padleft(2, '0')
$Second=[Convert]::ToString($Now.Second, 16).padleft(2, '0')

Return ("$Hour/$Minute/$Second")
}

# Clear the screen
Clear-Host
$Position=$host.ui.RawUI.CursorPosition

# Set the Home position of the clock
$Position.Y=3
$Position.X=4

do {
    
    $host.UI.RawUI.CursorPosition=$Position

    $CurrentPosition=$Position

    # Grab the current time
    do {
        $HexTime=Get-HexTime
    # Don't go forward until time has changed
    } Until ($HexTime -ne $LastHexTime)
    Clear-Host
    # Step through the various digits in the Time string
    for ($Count=0; $Count -lt ($HexTime.Length); $Count++) {
        # Obtain Array character based on match
        $Character=($HexArray[('0123456789abcdef/-' | 
            Select-String -pattern ($HexTime[$Count])).Matches.Index])

        # Split the Here-String when you see the Linefeed (ASCII 10)
        $CharacterArray=$Character.Split([char][byte]10)

        # Capture and store the current Row and Column
        $CurrentRow=$CurrentPosition.Y
        $Column=$CurrentPosition.X

        # Step through the various rows in the Here-String
        for ($Row=0; $Row -lt 7; $Row++) {
            # Set the cursor position
            $host.UI.RawUI.CursorPosition=$CurrentPosition

            # Draw the row for the character
            $CharacterArray[$Row]

            # Move up to the next row
            $CurrentPosition.Y=$CurrentPosition.Y + 1
        }
    # Increase the counter for the column
    $CurrentPosition.X=$CurrentPosition.X + 10

    # Reset the row back to the start
    $CurrentPosition.Y=$CurrentRow
    }

    # Track the time to note when it changes
    $LastHexTime=$HexTime

} Until ($False)