pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()

end


function _update()
secondnode()

end


function _draw()
cls()
rectfill( 0, 0, 128, 128, 12)
drawnotebarleft()
drawnotebarright()
print(fpstosecond ,21,16,8)
print(seconds, 21, 21,8)
spr(4,notenodele.le1[1],notenodele.le1[2])




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
    if fpstosecond == 30 then
        fpstosecond = 0
        seconds +=1
    end
end
-->8

--interaction code
btns ={
    left = btn(M),
    right = btn(X)
}

function btnprsd()
    

end

-->8

--damage code



-->8

--start/end code


-->8

--level code
coupletnotevalue = 0
coupletsplayed = 1
coupletnoteindex = 1
coupletindex = 1
levelselectindex = 1
level1couplets=8
--note node counter counts how much counts have taken place on that node, deciding which note should appear
notenodecount ={
    nnle1 = 0,
    nnle2 = 0,
    nnle3 = 0,
    nnle4 = 0,
    nnle5 = 0,
    nnle6 = 0,
    nnle7 = 0,
    nnle8 = 0,
}



lvlselect = {
    level1 = {
        couplet1={5,0,5,0},
        couplet2={5,0,5,0},
        couplet3={4,0,0,0},
        couplet4={4,0,0,0},
        couplet5={5,0,5,0},
        couplet6={5,0,5,0},
        couplet7={4,0,0,0},
        couplet8={4,0,0,0},
    },
}

function drawnoteonnodele1()
    notenodecount.nnle1 +=1
    if notenodecount.nnle1 <= 4 then
        spr(0 )
end


function coupletnotevaluechecker()
    if coupletnoteindex <= 4 and coupletindex <=8 then
        coupletnotevalue = lvlselect[levelselectindex].levelcoupletindex.coupletnoteindex
        coupletnoteindex +=1
    elseif coupletnoteindex > 4 and coupletindex <=8 then
        coupletnoteindex = 1
        coupletindex = 2
    elseif coupletnoteindex >4 and coupletindex > 8 then
        coupletsplayed = 1
        coupletsnoteindex = 1
        coupletindex = 1
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
00700700100000011000000110000001000000000000700000007000000070008444444444444448844444444444444808444444444444800000000000000000
00077000100000011000000110000001007770000077700000777000007770008444444444444448844444444444444800844444444448000000000000000000
00077000100000011000000110000001007070000070700000777000007770008444444444444448844444444444444800084444444480000000000000000000
00700700100000011000000110000001007770000077700000777000007770008444444444444448844444444444444800008444444800000000000000000000
00000000700000073000000380000008000000000000000000000000000000008444444444444448844444444444444800000884488000000000000000000000
00000000770000773300003388000088000000000000000000000000000000008444444444444448844444444444444800000008800000000000000000000000
