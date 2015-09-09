# arduino-nano-with-ruby

## Question
+ Q0: Morse 摩斯電碼
>題目說明：解開摩斯電碼

+ Q1: Maze 迷宮
>題目說明：在 9 秒內從 14 * 14 的迷宮中，從起點是 (1,1) 走到終點 (14,14)

+ Q2: Calculator 四則混和計算
>在 1 秒內回答四則混和計算式的答案


## Driver
Windows: <a href="http://catalog.update.microsoft.com/v7/site/ScopedViewRedirect.aspx?updateid=032a878e-8ca0-40d2-b7b1-936640b0eecb">Download link</a>

## Note
+ 可能會碰到的問題, readline卡住
>詳情: https://hitcon.hackpad.com/IoT-nano--Fx9aehf98Y9#:h=UBUNTU-OS-實務上遇到的問題和解法:

+ ans game1 是暴力解, 做了201次, 第28次拿到key, 一切都是命阿 ( ▔___▔)y-～
```shell
for /l %x in (1, 1, 100) do ruby ans.rb >> tmp.log
```

![alt tag](https://github.com/frsnic/arduino-nano-with-ruby/blob/master/game1.png)

## Keywords
hitcon2015, arduino nano, ruby

--------------------------
Copyright © 2015 frsnic. All rights reserved.
