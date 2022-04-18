void setup(){
  size(400,289);
  noLoop();
}

void draw(){//void draw
  PImage img = loadImage("Coruja.jpg");
  image(img,0,0);
//---------------------------------------------------------------------------------------------
  PImage imgPB;
  imgPB = createImage(img.width,img.height,RGB);
//---------------------------------------------------------------------------------------------

//Escala de cinza -----------------------------------------------------------------------------
  for(int y = 0; y < img.height; y++){//For do y
    for(int x = 0; x < img.width; x++){//for do x
      int pos = y * img.width + x;
      int blue = int(blue(img.pixels[pos]));
      int red = int(red(img.pixels[pos]));
      int green = int(green(img.pixels[pos]));
      
      //Imagem em cinza (Com o filtro de blurry, a imagem ficou mais clara, sem o filtro a imagem fica toda preta .-.)
      //imgPB.pixels[pos] = color((red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]))/3);
                                //----------------------------- // -------------------------- // -------------------------
                             

      //Imagem em azul
      imgPB.pixels[pos] = color(blue);
                                //----------------------------- // -------------------------- // ------------------------- 
     
      //Imagem em green
      //imgPB.pixels[pos] = color(green);
                                //----------------------------- // -------------------------- // -------------------------
     
      //Imagem em red
      //imgPB.pixels[pos] = color(red);
                                //----------------------------- // -------------------------- // -------------------------
    }//for do x
  }//for do y
  //image(imgPB,0,0);
  //save("CorujaVerde.png");
//Fim da Escala de cinza-----------------------------------------------------------------------



//Filtro de blurry na imagem (usando qtde para estourar a cor branca)
  for(int y=0; y < img.height; y++) {//for do y
   for(int x=0; x < img.width; x++) {//for do x
    int pos = y * img.width + x; 
    int jan = 2, qtde = -2;
    float media = 0;
    
    //Calculo da média para fazer o blurry
    for(int i = jan * (-1); i <= jan; i++) {//for da janela i
     for(int j = jan * (-1); j <= jan; j++) {//for da janela j
      int nx = x + j;
      int ny = y + i;
      
      if (ny >= 0 && ny < imgPB.height && nx >= 0 && nx < imgPB.width){//if
        int pos_imgPB = ny * imgPB.width + nx;
        media += red(img.pixels[pos_imgPB]);
        qtde++;
      }//if
     }//for da janela j
    }//for da janela i
    media = media / qtde;
    imgPB.pixels[pos] = color(media);
   }//for do x
  }//for do y
  //image(imgPB,0,0);
  //save("CorujaBL.png");
//Fim do blurry da imagem----------------------------------------------------------------------- 



//Limiarização da imagem
  PImage imgLimia;
  imgLimia = createImage(img.width,img.height,RGB);
  for(int y = 0; y < img.height; y++){//for do y
    for(int x = 0; x < img.width; x++){//for do x
      int pos = y * img.width + x;
      
      //pintar os pixels de preto e branco
      if(red(imgPB.pixels[pos]) < 210  && x > 240 && x < 356 && y > 70 && y < 221) {//if 
        imgLimia.pixels[pos] = color(255);
      }//if
      else{//else
        imgLimia.pixels[pos] = color(0);
      }//else
    }//for do x
  }//for do y
  //image(imgLimia,0,0);
  //save("CorujaPBL.png");
//Fim da limiarização-----------------------------------------------------------------------


//Imagem Limiarizada pintada
  for(int y = 0; y < img.height; y++){//for do y
    for(int x = 0; x < img.width; x++){//for do x
    int pos = y*img.width + x;
    if(red(imgLimia.pixels[pos]) < 170) {//if
      imgLimia.pixels[pos] = color(0);
    }//if
    else{//else
      imgLimia.pixels[pos] = color(red(img.pixels[pos]), green(img.pixels[pos]), blue(img.pixels[pos]));
    }//else
    }//for do x
  }//for do y
  image(imgLimia,0,0);
  save("CorujaPBLColor.png");
//Fim da pintura----------------------------------------------------------------------- mais alguma?
}//void draw
