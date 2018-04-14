[array]$Numbers=@('')*11
$Numbers[0]=@'
  000000      000000      000000      000000  
 00    00    00    00    00    00    00    00 
00    0 00  00    0 00  00    0 00  00    0 00
00   0  00  00   0  00  00   0  00  00   0  00
00  0   00  00  0   00  00  0   00  00  0   00
 000   00    000   00    000   00    000   00 
  000000      000000      000000      000000  
'@
$Numbers[1]=@'
  000000      000000      000000        11    
 00    00    00    00    00    00      111    
00    0 00  00    0 00  00    0 00    1111    
00   0  00  00   0  00  00   0  00      11    
00  0   00  00  0   00  00  0   00      11    
 000   00    000   00    000   00       11    
  000000      000000      000000      111111  
'@
$Numbers[2]=@'
  000000      000000        11        000000  
 00    00    00    00      111       00    00 
00    0 00  00    0 00    1111      00    0 00
00   0  00  00   0  00      11      00   0  00
00  0   00  00  0   00      11      00  0   00
 000   00    000   00       11       000   00 
  000000      000000      111111      000000  
'@
$Numbers[3]=@'
  000000      000000        11          11    
 00    00    00    00      111         111    
00    0 00  00    0 00    1111        1111    
00   0  00  00   0  00      11          11    
00  0   00  00  0   00      11          11    
 000   00    000   00       11          11    
  000000      000000      111111      111111  
'@
$Numbers[4]=@'
  000000        11        000000      000000  
 00    00      111       00    00    00    00 
00    0 00    1111      00    0 00  00    0 00
00   0  00      11      00   0  00  00   0  00
00  0   00      11      00  0   00  00  0   00
 000   00       11       000   00    000   00 
  000000      111111      000000      000000  
'@
$Numbers[5]=@'
  000000        11        000000        11    
 00    00      111       00    00      111    
00    0 00    1111      00    0 00    1111    
00   0  00      11      00   0  00      11    
00  0   00      11      00  0   00      11    
 000   00       11       000   00       11    
  000000      111111      000000      111111  
'@
$Numbers[6]=@'
  000000        11          11        000000  
 00    00      111         111       00    00 
00    0 00    1111        1111      00    0 00
00   0  00      11          11      00   0  00
00  0   00      11          11      00  0   00
 000   00       11          11       000   00 
  000000      111111      111111      000000  
'@
$Numbers[7]=@'
  000000        11          11          11    
 00    00      111         111         111    
00    0 00    1111        1111        1111    
00   0  00      11          11          11    
00  0   00      11          11          11    
 000   00       11          11          11    
  000000      111111      111111      111111  
'@
$Numbers[8]=@'
    11        000000      000000      000000  
   111       00    00    00    00    00    00 
  1111      00    0 00  00    0 00  00    0 00
    11      00   0  00  00   0  00  00   0  00
    11      00  0   00  00  0   00  00  0   00
    11       000   00    000   00    000   00 
  111111      000000      000000      000000  
'@
$Numbers[9]=@'
    11        000000      000000        11    
   111       00    00    00    00      111    
  1111      00    0 00  00    0 00    1111    
    11      00   0  00  00   0  00      11    
    11      00  0   00  00  0   00      11    
    11       000   00    000   00       11    
  111111      000000      000000      111111  
'@

$exit=$true

$pshost = Get-Host
$pswindow = $pshost.UI.RawUI

# Set width

$newsize = $pswindow.BufferSize
$newsize.Width = 40
$pswindow.BufferSize = $newsize

$newsize = $pswindow.WindowSize
$newsize.Width = 46
$pswindow.WindowSize = $newsize

$pshost = Get-Host
$pswindow = $pshost.UI.RawUI

# Set height

$newsize = $pswindow.BufferSize
$newsize.Height = 45
$pswindow.BufferSize = $newsize

$newsize = $pswindow.WindowSize
$newsize.Height = 45
$pswindow.WindowSize = $newsize


while($exit -eq $true) {
cls
$hourA,$hourB = [string](Get-Date -f HH) -split "" | Where {$_}
$minuteA, $minuteB = [string](Get-Date -f mm) -split "" | Where {$_}
$secondA, $secondB = [string](Get-Date -f ss) -split "" | Where {$_}

# Hour position 1
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($hourA -eq $counter2) {
        $hourA = $Numbers[$count]
    }
    $counter2++
}

# Hour position 2
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($hourB -eq $counter2) {
        $hourB = $Numbers[$count]
    }
    $counter2++
}

# Minute position 1
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($minuteA -eq $counter2) {
        $minuteA = $Numbers[$count]
    }
    $counter2++
}

# Minute position 2
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($minuteB -eq $counter2) {
        $minuteB = $Numbers[$count]
    }
    $counter2++
}

# Second position 1
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($secondA -eq $counter2) {
        $secondA = $Numbers[$count]
    }
    $counter2++
}

# Second position 2
$counter2 = 0
for($count = 0; $count -lt 10; $count++) {

    if($secondB -eq $counter2) {
        $secondB = $Numbers[$count]
    }
    $counter2++
}

$hourA
$hourB
"=============================================="
$minuteA
$minuteB
"=============================================="
$secondA
$secondB

Start-Sleep -s 1
}