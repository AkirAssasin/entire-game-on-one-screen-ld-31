int daypassed = 1;
int timenextday = 0;
int raider = round(random(1,5));
int raidcount = 1;
int raidtime = 0;
int siegetime = 0;
int siegepower = 0;
int siegeamount = 0;
int wallsieged = 0;
int housing = round(random(3,10));
int money = round(random(900,1200));
int weapon = round(random(3,5));
int food = round(random(10,30));
int medikit = round(random(10,15));
int newmember = 0;
int news = 0;
int newsview = 0;
int talk = 0;
int talkview = 0;
int[] wallhp = {100,100,100,100};

var boom = new Howl({
  urls: ['sound/boom.mp3', 'sound/boom.ogg']
});

void setup()
{
  noCursor();
  size(1420, 799);
  stroke(255);
  PFont fontA = loadFont("courier");
  textFont(fontA, 30);
  strokeWeight(10);
}

void draw(){  
  if (siegetime == 1) {background(60,0,0);} else {background(0,30,0);};
  
  stroke(255,255,255); fill(255,255,255);
  if (wallsieged == 0 && siegetime == 1) {stroke(255,155,0);fill(255,155,0);};
  if (wallhp[0] < 40) {stroke(255,0,0);fill(255,0,0);};
  if (wallhp[0] > 0) {line(300,170,100,400);};
  text(wallhp[0],110,285);
  
  stroke(255,255,255); fill(255,255,255);
  if (wallsieged == 1 && siegetime == 1) {stroke(255,155,0);fill(255,155,0);};
  if (wallhp[1] < 40) {stroke(255,0,0);fill(255,0,0);};
  if (wallhp[1] > 0) {line(100,400,400,500);};
  text(wallhp[1],200,500);
  
  stroke(255,255,255); fill(255,255,255);
  if (wallsieged == 2 && siegetime == 1) {stroke(255,155,0);fill(255,155,0);};
  if (wallhp[2] < 40) {stroke(255,0,0);fill(255,0,0);};
  if (wallhp[2] > 0) {line(400,500,600,300);};
  text(wallhp[2],550,400);
  
  stroke(255,255,255); fill(255,255,255);
  if (wallsieged == 3 && siegetime == 1) {stroke(255,155,0);fill(255,155,0);};
  if (wallhp[3] < 40) {stroke(255,0,0);fill(255,0,0);};
  if (wallhp[3] > 0) {line(600,300,300,170);};
  text(wallhp[3],450,215);
  
  fill(255,255,255);
  text("Day " + daypassed,10,30);
  
  fill(255,255,255);
  text(housing + "/60 People",210,30);
  
  fill(255,255,0);
  if (raidtime <=0) {text("> <",435,32)};
  
  fill(255,255,255);
  if (raider == 0) {fill(255,0,0)};
  text(raider + "/15 Raiders",510,30);
  
  fill(255,255,0);
  if (raidtime <= 0 && raider > 0 && raider <= food && weapon > 0 && siegetime == 0) {text("Raid",580,80)};
  
  fill(255,255,255);
  text("$" + money,10,790);
  
  fill(255,255,0);
  text("Armory",200,760);
  fill(255,255,255);
  if (raidtime <= 0) {
    if (raider > weapon) {fill(255,155,0)};
    if (weapon == 0) {fill(255,0,0)};
    text(weapon + "/15",210,790);
  } else {
    text("?/15",210,790);
  };
  
  fill(255,255,0);
  text("Food",420,760);
  fill(255,255,255);
  if (raider > food || housing + raider > food) {fill(255,155,0)};
  if (food == 0) {fill(255,0,0)};
  text(food + "/90",410,790);
  
  fill(255,255,0);
  text("Medikits",590,760);
  fill(255,255,255);
  if (medikit == 0) {fill(255,0,0)};
  text(medikit + "/50",610,790);
  fill(255,255,255);
  
  if ((random(1) > 0.997) && medikit >= 2) {
    if ((random(1)) > 0.3) {
      medikit -= 2;
      housing += 1;
      news = 7;
      newsview = 200;
    } else {
      news = 8;
      newsview = 200;
    };
    if (housing > 60) {
      housing = 60;
    };
  };
  
  if (raidtime > 0) {
    raidtime -= 1/(raider*raidcount);
    if ((random(1) > 0.7)) {
      money += round(random((raider/(raidcount*10)),(70*(raider/(raidcount*10)))));
    };
    
    if ((random(1) > 0.993 && weapon < raider)) {
      if ((random(1) > 0.4) && medikit >= 3) {
        talk = 5;
        talkview = 200;
        medikit -= 3;
        news = 1;
        newsview = 200;
      } else {
        talk = 5;
        talkview = 200;
        raider -= round(random(raider));
        raidtime -= 50;
        news = 2;
        newsview = 200;
      };
    };
    
    if ((random(1) > 0.999)) {
      newmember = (round(random(raider + 1)));
      if ((raider + newmember) <= 15) {
        raider += newmember;
        news = 3;
        newsview = 200;
      }
    };
    
    if ((random(1) > 0.995)) {
      food += (round(random(raider + 1)));
      news = 4;
      newsview = 200;
      if (food > 90) {
        food = 90;
      };
    };
    
    if ((random(1) > 0.998)) {
      weapon += (round(random(raider + 1)));
      news = 5;
      newsview = 200;
      if (weapon > 15) {
        weapon = 15;
      };
    };
    
    if ((random(1) > 0.995)) {
      weapon -= 1;
      news = 6;
      newsview = 200;
      if (weapon < 0) {
        weapon = 0;
      };
    };
    
    line(510,45,510 + raidtime,45);
  };
  
  if (newsview > 0) {
    newsview -= 1;
    textSize(30);
    fill(0,255,0);
    if (news == 3) {text("Raider team found survivor.",10,650)};
    if (news == 4) {text("Raider team found food.",10,650)};
    if (news == 5) {text("Raider team found weaponry.",10,650)};
    if (news == 7) {text("Rescued someone outside the bunker.",10,650)};
  
    fill(255,155,0);
    if (news == 1) {text("Raider team injured. Wounds taken care of.",10,650)};
    if (news == 6) {text("A weapon malfunctioned.",10,650)};
    if (news == 10) {text("The bunker is under siege!",10,650)};
  
    fill(255,0,0);
    if (news == 2) {text("A raider succumbed to injuries.",10,650)};
    if (news == 8) {text("Rescue attempt failed.",10,650)};
    if (news == 9) {text("People died of famine.",10,650)};
  
    fill(255,255,255);
    if (news == 11) {text("The siege has ended.",10,650)};
  };
  
  if (talkview > 0) {
    talkview -= 1;
    textSize(15);
    fill(0,255,0);
    if (talk == 1) {text("We have more people than them, stop the siege!",10,680)};
    if (talk == 4) {text("Go and never come back, losers!",10,680)};
  
    fill(255,155,0);
    if (talk == 2) {text("Just a few more weapons and we can defeat them!",10,680)};
    if (talk == 5) {text("The raiders are under attack!",10,680)};
  
    fill(255,0,0);
    if (talk == 6) {text("We need backup!",10,680)};
  
    fill(255,255,255);
    if (talk == 3) {text("Finally, they had gone away!",10,680)};
  
    textSize(30);
  };
  
  
  if (timenextday < 1000) {
    timenextday += 1;
  } else {
    timenextday = 0;
    daypassed += 1;
    if ((random(1)) > 0.3 && siegetime == 1) {
      siegetime = 0;
      news = 11;
      newsview = 200;
      talk = 3;
      talkview = 200;
    };
    if (food > housing + raider) {
      food -= housing + raider;
    } else {
      food = 0;
      housing -= (round(random((housing - food))));
      raider -= (round(random((2))));
      if (raider < 0) {raider = 0};
      news = 9;
      newsview = 200;
    };
  };
  
  if ((random(1)) > 0.9998 && siegetime == 0 && raidcount > 1.3) {
    siegeamount = round(random(30));
    siegepower = round(random(5));
    siegetime = 1;
    wallsieged = (round(random(3)));
    news = 10;
  };
  
  if (siegetime == 1) {
    text(siegeamount + " Enemies",210,60);
    if ((random((1+(siegeamount/200)))) > 0.99 && wallhp[wallsieged] > 0) {
      boom.play();
      wallhp[wallsieged] -= round(random(siegepower));
      if (wallhp[wallsieged] < 0) {wallhp[wallsieged] = 0};
    };
    
    if ((random((1+(siegeamount/300)))) > 0.999 && wallhp[wallsieged] == 0 && food > 0) {
      boom.play();
      food -= round(random(2));
      if (food < 0) {food = 0};
    };
    
    if (raider <= weapon && (housing + (raider*2)) >= siegeamount) {
      talk = 1;
      talkview = 200;
      if ((random(1)) > 0.99) {
        boom.play();
        siegeamount -= round(random((housing + (raider*2)) - siegeamount));
      };
    };
    
    if (siegeamount < 3) {
      talk = 4;
      talkview = 200;
      siegetime = 0;
      news = 11;
      newsview = 200;
    };
    
    if (raider > weapon && (housing + (raider*2)) >= siegeamount) {
      talk = 2;
      talkview = 200;
    };
    
    if ((housing + (raider*2)) < siegeamount) {
      talk = 6;
      talkview = 200;
    };
  };
  
  stroke(60);
  fill(60);
  rect(800,0,1420,799);
  stroke(8,11,0);
  strokeWeight(50);
  line(800,0,800,799);
  
  stroke(0,255,0);
  strokeWeight(10);
  if (dist(610,80,mouseX,mouseY) < 30 || dist(460,775,mouseX,mouseY) < 80 || dist(260,775,mouseX,mouseY) < 80 || dist(660,775,mouseX,mouseY) < 80 || dist(435,32,mouseX,mouseY) < 15 || (475,32,mouseX,mouseY) < 15 || dist(135,300,mouseX,mouseY) < 30 || dist(225,515,mouseX,mouseY) < 30 || dist(575,415,mouseX,mouseY) < 30 || dist(475,230,mouseX,mouseY) < 30) {stroke(255,255,0);strokeWeight(15);};
  line(mouseX,mouseY,mouseX,mouseY);
  stroke(255,255,255);
  strokeWeight(10);
}

void mouseClicked() {
  if (dist(610,80,mouseX,mouseY) < 30 && raidtime <= 0 && raider > 0 && raider <= food && weapon > 0 && siegetime == 0) {
    raidtime = 222;
    raidcount += 0.1;
    food -= raider;
  };
  
  if (dist(460,775,mouseX,mouseY) < 80 && money >= 100 && food <= 90) {
    food += 3;
    money -= 100;
    if (food > 90) {
      food = 90;
    };
  };
  
  if (dist(260,775,mouseX,mouseY) < 80 && money >= 300 && weapon <= 15 && raidtime <= 0) {
    weapon += 2;
    money -= 300;
    if (weapon > 15) {
      weapon = 15;
    };
  };
  
  if (dist(660,775,mouseX,mouseY) < 80 && money >= 250 && medikit <= 50) {
    medikit += 4;
    money -= 250;
    if (medikit > 50) {
      medikit = 50;
    };
  };
  
  if (dist(435,32,mouseX,mouseY) < 15 && housing > 1 && raider < 15 && raidtime <= 0) {
    housing -= 1;
    raider += 1;
  };
  
  if (dist(475,32,mouseX,mouseY) < 15 && raider >= 1 && housing < 60 && raidtime <= 0) {
    housing += 1;
    raider -= 1;
  };
  
  if (dist(135,300,mouseX,mouseY) < 30 && wallhp[0] < 150 && money > 60) {
    wallhp[0] += 10;
    money -= 60;
    if (wallhp[0] > 150) {wallhp[0] = 150;};
  };
  
  if (dist(225,515,mouseX,mouseY) < 30 && wallhp[1] < 150 && money > 60) {
    wallhp[1] += 10;
    money -= 60;
    if (wallhp[1] > 150) {wallhp[1] = 150;};
  };
  
  if (dist(575,415,mouseX,mouseY) < 30 && wallhp[2] < 150 && money > 60) {
    wallhp[2] += 10;
    money -= 60;
    if (wallhp[2] > 150) {wallhp[2] = 150;};
  };
  
  if (dist(475,230,mouseX,mouseY) < 30 && wallhp[3] < 150 && money > 60) {
    wallhp[3] += 10;
    money -= 60;
    if (wallhp[3] > 150) {wallhp[3] = 150;};
  };
};