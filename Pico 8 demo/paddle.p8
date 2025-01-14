pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

    --variable check if there is a note on a node
nnvactive = {
    nnvleactive = false,
    nnvriactive = false
}

lepressedfpstosecond = 0

--variable that stores note value on note node
notetocounts = {
    nncvle = 0,
    nncvri = 0,
}

--variable that stores the seconds of the counts each player needs to hold the action button in for.
countstoseconds = {
    lecounts = 0,
    ricounts = 0,
}

nnv = {
    le = 0,
    ri = 0,
}

fpstosecondle = 1
gamestart = false

function _init()
gamestart = true
end


function _update()
secondnode()
notedisplayle1()
btnlepressed()
notecountdownle()
damagecheck()
end


function _draw()
cls()
rectfill( 0, 0, 128, 128, 12)
gamestate()
end


-->8
--note code
notes={
    full = 4,
    half = 5,
    quarter = 6,
    eight = 7
}




-->8

--note bar code
fpstosecond = 0
seconds = 0
timescaler = 0
countcounter = 1
lesecondscts = 0
risecondscts = 0



notenodele = {
    le1={8,16},
    le2={8,24},
    le3={8,32},
    le4={8,40},
    le5={8,48},
    le6={8,56},
    le7={8,64},
    le8={8,72},
    le9={8,80}
}

notenoderi = {
    ri1={112,16},
    ri2={112,24},
    ri3={112,32},
    ri4={112,40},
    ri5={112,48},
    ri6={112,56},
    ri7={112,64},
    ri8={112,72},
    ri9={112,80}
}

function drawnotebarleft()
spr(1,8,16)
spr(1,8,24)
spr(1,8,32)
spr(2,8,40)
spr(1,8,48)
spr(1,8,56)
spr(1,8,64)
spr(1,8,72)

end

function drawnotebarright()
    spr(1,112,16)
    spr(1,112,24)
    spr(1,112,32)
    spr(3,112,40)
    spr(1,112,48)
    spr(1,112,56)
    spr(1,112,64)
    spr(1,112,72)

end

function secondnode()
    fpstosecond +=1
    if fpstosecond == 30 
        then
        fpstosecond = 0
        seconds +=1
        if countcounter >= 4 
            then
                countcounter = 1
            else 
                countcounter += 1
        end 
        nnvletest()
        nnvritest()       
    end
end


--check if there is a note on node



-->8
lepressedcounter = 0
function btnlepressed ()
    if btn(❎) 
        then
            lepressed = true
            btnlepressedcounter()
        else 
            lepressed = false
            lepressedcounter = 0
    end        
end

function btnlepressedcounter()
    lepressedfpstosecond +=1
    if lepressedfpstosecond == 15
        then
            lepressedfpstosecond = 0
            lepressedcounter -=0.5
            checknotepres()
            damagecounter()
    end
end

  
-->8

--damage code



-->8

--start/end code


-->8

--level code
noteworth = {
    le = 0,
    ri = 0,
}

totalnotes = {
    le = 0,
    ri = 0
}
function nnvletest()
    if nnv[1] == 4 then
        noteworth.le = 4
        lepressedcounter = 4
        totalnotes.le +=1
    elseif nnv[1] == 5 then
        noteworth.le = 2
        lepressedcounter = 2
        totalnotes.le +=1
    elseif nnv[1] == 6 then
        noteworth.le = 1
        lepressedcounter = 1
        totalnotes.le +=1
    elseif nnv[1] == 7 then
        noteworth.le = 0.5
        lepressedcounter = 0.5
        totalnotes.le +=1
    end
end
function nnvritest()
    if nnv[2] == 4 then
        noteworth.ri = 4
    elseif nnv[2] == 5 then
        noteworth.ri = 2
    elseif nnv[2] == 6 then
        noteworth.ri = 1
    elseif nnv[2] == 7 then
        noteworth.ri = 0.5
    end
end

function notecountdownle()
    fpstosecondle +=1
    if fpstosecondle == 15 then
        fpstosecondle = 1
        if noteworth.le >0 then
            noteworth.le -= 0.5 
        end
    end
end
legood = false
legoodcounts = 0
function checknotepres()
    if noteworth.le == 1 and lepressedcounter <=1.5 then
        legood = true
        legoodcounts +=1
    else
        legood = false
    end
end
damage = 0

function damagecounter()
    damage = totalnotes.le - legoodcounts
end

function failscreen()
    rectfill( 20, 20, 108, 108, 9)
    rect( 20, 20, 108, 108, 4)
    rect( 21, 21, 107, 107, 4)
    print("de boot is gezonken", 27, 25, 7)
    print('aantal noten '..totalnotes.le, 27, 40, 7)
    print('aantal goed '..legoodcounts, 27, 48, 7)
    print('opnieuw ❎', 27, 92, 7)
end

function gamestate()
    if gamestart == false then
    failscreen()
    elseif gamestart == true then
        drawnotebarleft()
        drawnotebarright()
        notedisplayle1()
        notedisplayle2()
        notedisplayle3()
        notedisplayle4()
        notedisplayle5()
        notedisplayle6()
        notedisplayle7()
        notedisplayle8()
        notedisplayri1()
        notedisplayri2()
        notedisplayri3()
        notedisplayri4()
        notedisplayri5()
        print(fpstosecond ,21,16,8)
        print(seconds, 21, 21,8)
        print(nnc.nncle4,50,50,9)
        print(levels.level1[nnc.nncle4],50,60,9)
        print(nnv[1], 50, 70, 3)
        print(nnv[2], 50, 78, 3)
        print(countcounter, 50, 86, 8)
        print(noteworth.le, 50, 94, 8)
        print(noteworth.ri, 50, 100, 8)
        print(lepressedcounter, 50, 108, 8)
        print(legood, 50, 116, 8)
        print(damage, 40, 100, 8)
        print(totalnotes.le, 40, 108, 8)
        print(legoodcounts, 40, 116, 8)
        print(gamestart, 21, 29, 8)
    elseif gamestart == false then
        failscreen()
    end
end

function damagecheck()
    if damage == 3 then gamestart = false
    end
end
--nnc == note node counter, counts which note should be displayed on specific note node. has one for each note node
nnc = {
    nncle1 = 0,
    nncle2 = 0,
    nncle3 = 0,
    nncle4 = 0,
    nncle5 = 0,
    nncle6 = 0,
    nncle7 = 0,
    nncle8 = 0,
    nncri1 = 0,
    nncri2 = 0,
    nncri3 = 0,
    nncri4 = 0,
    nncri5 = 0,
    nncri6 = 0,
    nncri7 = 0,
    nncri8 = 0,
}

--note node counter counts how much counts have taken place on that node, deciding which note should appear

levels = {
    level1 = {
        5,0,5,0,
        5,0,5,0,
        4,0,0,0,
        4,0,0,0,
        5,0,5,0,
        5,0,5,0,
        4,0,0,0,
        4,0,0,0,
    }
}

--displays correct note on note node
function notedisplayle1()
    if nnc.nncle1 <=32 
        then
            nnc.nncle1 = seconds-4
            spr(levels.level1[nnc.nncle1],notenodele.le1[1],notenodele.le1[2])

    elseif nnc.nncle1 >32 
        then
            spr(0,notenodele.le1[1],notenodele.le1[2])
            nnc.nncle1 = 33
    end
end

function notedisplayle2()
    if nnc.nncle2 <=32 
        then
            nnc.nncle2 = seconds-5
            spr(levels.level1[nnc.nncle2],notenodele.le2[1],notenodele.le2[2])
    elseif nnc.nncle2 >30 
        then
            spr(0,notenodele.le2[1],notenodele.le2[2])
            nnc.nncle2 =33
    end
end

function notedisplayle3()
    if nnc.nncle3 <= 32 
        then
            nnc.nncle3 = seconds - 6
            spr(levels.level1[nnc.nncle3], notenodele.le3[1], notenodele.le3[2])
    elseif nnc.nncle3 > 32 
        then
            spr(0, notenodele.le3[1], notenodele.le3[2])
            nnc.nncle3 =33
    end
end

function notedisplayle4()
    if nnc.nncle4 <= 32 
        then
            nnc.nncle4 = seconds - 7
            spr(levels.level1[nnc.nncle4], notenodele.le4[1], notenodele.le4[2])
            --stores note that is on note node le 4 in nnv (note node value) left
            nnv[1] = levels.level1[nnc.nncle4]
    elseif nnc.nncle4 > 32 
        then
            spr(0, notenodele.le4[1], notenodele.le4[2])
            nnc.nncle4 = 33
            nnv[1] = 0
    end
end


function notedisplayle5()
    if nnc.nncle5 <= 33 then
        nnc.nncle5 = seconds - 8
        spr(levels.level1[nnc.nncle5], notenodele.le5[1], notenodele.le5[2])
    elseif nnc.nncle5 > 34 then
        spr(0, notenodele.le5[1], notenodele.le5[2])
        nnc.nncle5 = 33
    end
end

function notedisplayle6()
    if nnc.nncle6 <= 33 then
        nnc.nncle6 = seconds - 9
        spr(levels.level1[nnc.nncle6], notenodele.le6[1], notenodele.le6[2])
    elseif nnc.nncle6 > 34 then
        spr(0, notenodele.le6[1], notenodele.le6[2])
        nnc.nncle6 = 33
    end
end

function notedisplayle7()
    if nnc.nncle7 <= 33 then
        nnc.nncle7 = seconds - 10
        spr(levels.level1[nnc.nncle7], notenodele.le7[1], notenodele.le7[2])
    elseif nnc.nncle7 > 34 then
        spr(0, notenodele.le7[1], notenodele.le7[2])
        nnc.nncle7 = 33
    end
end

function notedisplayle8()
    if nnc.nncle8 <= 33 then
        nnc.nncle8 = seconds - 11
        --stores note that is on note node ri 4 in nnv (note node value) right
        spr(levels.level1[nnc.nncle8], notenodele.le8[1], notenodele.le8[2])
    elseif nnc.nncle8 > 34 then
        spr(0, notenodele.le8[1], notenodele.le8[2])
        nnc.nncle8 = 33
    end
end

function notedisplayri1()
    if nnc.nncri1 <=32 then
        nnc.nncri1 = seconds-4
        spr(levels.level1[nnc.nncri1],notenoderi.ri1[1],notenoderi.ri1[2])
    elseif nnc.nncri1 >32 then
        spr(0,notenoderi.ri1[1],notenoderi.ri1[2])
        nnc.nncri1 = 33
    end
end

function notedisplayri2()
    if nnc.nncri2 <=32 then
        nnc.nncri2 = seconds-5
        spr(levels.level1[nnc.nncri2],notenoderi.ri2[1],notenoderi.ri2[2])
    elseif nnc.nncri2 >32 then
        spr(0,notenoderi.ri2[1],notenoderi.ri2[2])
        nnc.nncri2 = 33
    end
end

function notedisplayri3()
    if nnc.nncri3 <=32 then
        nnc.nncri3 = seconds-6
        spr(levels.level1[nnc.nncri3],notenoderi.ri3[1],notenoderi.ri3[2])
    elseif nnc.nncri3 >32 then
        spr(0,notenoderi.ri3[1],notenoderi.ri3[2])
        nnc.nncri3 = 33
    end
end

function notedisplayri4()
    if nnc.nncri4 <=32 then
        nnc.nncri4 = seconds-7
        spr(levels.level1[nnc.nncri4],notenoderi.ri4[1],notenoderi.ri4[2])
        nnv[2] = levels.level1[nnc.nncri4]
    elseif nnc.nncri4 >32 then
        spr(0,notenoderi.ri4[1],notenoderi.ri4[2])
        nnc.nncri4 = 33
        nnv[2] = 0
    end
end

function notedisplayri5()
    if nnc.nncri5 <=32 then
        nnc.nncri5 = seconds-8
        spr(levels.level1[nnc.nncri5],notenoderi.ri5[1],notenoderi.ri5[2])
    elseif nnc.nncri5 >32 then
        spr(0,notenoderi.ri5[1],notenoderi.ri5[2])
        nnc.nncri5 = 33
    end
end
--[[ 
function lvlnotestonode()
    if seconds == 4 then

end
]]








__gfx__
00000000770000773300003388000088000000000000000000000000000000008888888888888888844444444444444884444444444444480000000000000000
00000000700000073000000380000008000000000000700000007000000077008444444444444448844444444444444808444444444444800000000000000000
00000000100000011000000110000001000000000000700000007000000070008444444444444448844444444444444808444444444444800000000000000000
00000000100000011000000110000001007770000077700000777000007770008444444444444448844444444444444800844444444448000000000000000000
00000000100000011000000110000001007070000070700000777000007770008444444444444448844444444444444800084444444480000000000000000000
00000000100000011000000110000001007770000077700000777000007770008444444444444448844444444444444800008444444800000000000000000000
00000000700000073000000380000008000000000000000000000000000000008444444444444448844444444444444800000884488000000000000000000000
00000000770000773300003388000088000000000000000000000000000000008444444444444448844444444444444800000008800000000000000000000000
