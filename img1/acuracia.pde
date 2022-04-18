void acuracia(PImage img1, PImage img2){
  int FP = 0, FN = 0, Resto=0;
  float perc_acuracia;
   
  for(int y = 0 ; y < img1.height; y++){
    for(int x = 0; x < img1.width; x++){
      int pos = y*img1.width + x;
      
        if(red(img1.pixels[pos]) == red(img2.pixels[pos])){ Resto++;}
      
        if(red(img1.pixels[pos]) != red(img2.pixels[pos]) && red(img2.pixels[pos]) == 0){
          FN++;}
        if(red(img1.pixels[pos]) != red(img2.pixels[pos]) && red(img2.pixels[pos]) == 255){
          FP++;
        }
      }
      
      
    }
  
    float qntd_pixels_img = img1.width * img1.height;
      
      perc_acuracia = ((qntd_pixels_img - FP - FN) * 100)/ qntd_pixels_img;
      
      println("Acuracia: ", perc_acuracia);
      println("Falso Positivo: ", FP);
      println("Falso Negativo: ", FN);
      println("Pixels Iguais: " + Resto);      
}
