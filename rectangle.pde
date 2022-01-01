class rectangle {
       float x;
       float y;
       float w;
       float h;
     
    
      
       rectangle(float x, float y, float w, float h){
          this.x = x;
          this.y = y;
          this.w = w;
          this.h = h;
       
         
       }
       
       boolean intersect(rectangle other){
          
          float left = x;
          float right = x + w;
          float top = y;
          float bottom = y+h;
          
          float oleft = other.x;
          float oright = other.x + other.w;
          float otop = other.y;
          float obottom = other.y + other.h;
          
          return !(left >= oright || right <= oleft || top >= obottom || bottom <= otop );
       }
       void DrawRec(){
       fill(0,0,204);
   
   
       }
       
        
 

}
