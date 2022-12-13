#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

camera {perspective angle 75     
        location  <0.0 , 1.0 ,-3.0>
        right     x*image_width/image_height
        look_at   <0.0 , 1.0 , 0.0>}

light_source{< 3000,3000,-3000> color White}                                

sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     }
           }         
           
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}

                finish { phong 0.1}
              } 
     } 
       
object { //Round_Cylinder(point A, point B, Radius, EdgeRadius, UseMerge)
         Round_Cylinder(<0,0,0>, <0,0.3,0>,0.50,0,0)  
         texture{pigment{color rgb<1,0.2,0.35>}}
       }
object{//Round_Cone(point A, radius A, point B, radius B, rounding radius, merge on) 
         Round_Cone(<0,0.3,0>,0.50,<0,0.50,0>,0.25,0,0)  
         texture{pigment{color rgb<0.75,0.35,1>}}}  

cylinder {<0,0.3,0>,<0,0.9,0>,0.40 texture { pigment { color rgb<1,1,1> }
                   }
         }