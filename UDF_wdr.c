#include "udf.h"
/* Script written by Ooi Chin Chun */
/* Institute of High Performance Computing, Singapore */
/* Copyright (c) 2018. */


/* BOUNDARY PROFILES FOR WIND SPEED 		Uref 	= 2.0 m/s  (at 15m height) */
/* ROUGHESS LENGTH				zo 	= 0.24 m */
/* FRICTION VELOCITY				Uf	= Uref*0.42/ln( (15+zo)/zo ) ) = 0.202358931 m/s  */
/* for urbanflow test. ABL log law profile */
real href = 15.; /* reference height (m) */
real uref = 6.8;  /* velocity at reference height */
real u_star = 1.0306; /* friction velocity for ABL flow */
real z0 = 1.0; /* aerdynamic roughness  */
real C_mu = 0.09; /* C_mu */
real kappa = 0.42; /* von karman constant. by default, KAPPA=0.41 in FLUENT 17.2 */

/* CALCULATION OF THE PROFILE FOR HORIZONTAL WIND SPEED */

DEFINE_PROFILE(Uvel, thread, nv) /* function name, thread and variable number */
{
	face_t f;
	real x[ND_ND];
	
	begin_f_loop (f,thread)
	{
	  F_CENTROID(x,f,thread);
        F_PROFILE(f,thread,nv) = uref*log((x[2]+z0)/z0)/log((href+z0)/z0);
	}
	end_f_loop(f,thread)
}

 
/* CALCULATION OF THE PROFILE FOR TKE */

DEFINE_PROFILE(tke, thread, nv) /* function name, thread and variable number */
{
	face_t f;
	real x[ND_ND];
	
	begin_f_loop (f,thread)
	{
	  F_CENTROID(x,f,thread);
        F_PROFILE(f,thread,nv) = pow(u_star,2.)/sqrt(C_mu);
	}
	end_f_loop(f,thread)
}




 /* CALCULATION OF THE PROFILE FOR DISSIPATION */

DEFINE_PROFILE(eps, thread, nv) /* function name, thread and variable number */
{
	face_t f;
	real x[ND_ND];
	
	begin_f_loop (f,thread)
	{
	  F_CENTROID(x,f,thread);
        F_PROFILE(f,thread,nv) = pow(u_star,3.)/kappa/(x[2]+z0);
	}
	end_f_loop(f,thread)
}



 /* User-defined Cs */
 /* Cs = 9.793*z0 / ks, z0 < ks < yp */
 /* where yp is the centroid of the first-cell from the ground   */
/* for this case, yp = 1.0, take ks = z0 = 1 */

DEFINE_PROFILE(Cs,t,i)
{
  face_t f;  
  begin_f_loop(f,t)
    {
      F_PROFILE(f,t,i) = 9.793;
    }
  end_f_loop(f,t)
}


DEFINE_DPM_DRAG(particle_drag_force,Re,p)
{
  real force = 0.751;
  real drag_force = 0.0;

  if (Re<1.80){
    force = 15.0;
  }
  else if (Re<9.61){
    force = (Re-1.80)/(9.61-1.80)*(15.0-4.20)+15.0;
  }
  else if (Re<23.4){
    force = (Re-9.61)/(23.4-9.61)*(2.40-4.20)+4.20;
  }
  else if (Re<43.2){
    force = (Re-23.4)/(43.2-23.4)*(1.66-2.40)+2.40;
  }
  else if (Re<68.7){
    force = (Re-43.2)/(68.7-43.2)*(1.28-1.66)+1.66;
  }
  else if (Re<98.9){
    force = (Re-68.7)/(98.9-68.7)*(1.07-1.28)+1.28;
  }
  else if (Re<134.0){
    force = (Re-98.9)/(134.0-98.9)*(0.926-1.07)+1.07;
  }
  else if (Re<175.0){
    force = (Re-134.0)/(175.0-134.0)*(0.815-0.926)+0.926;
  }
  else if (Re<220.0){
    force = (Re-175.0)/(220.0-175.0)*(0.729-0.815)+0.815;
  }
  else if (Re<269.0){
    force = (Re-220.0)/(269.0-220.0)*(0.671-0.729)+0.729;
  }
  else if (Re<372.0){
    force = (Re-269.0)/(372.0-269.0)*(0.607-0.671)+0.671;
  }
  else if (Re<483.0){
    force = (Re-372.0)/(483.0-372.0)*(0.570-0.607)+0.607;
  }
  else if (Re<603.0){
    force = (Re-483.0)/(603.0-483.0)*(0.545-0.570)+0.570;
  }
  else if (Re<3549.0){
    force = 0.6557 - 0.0002502*Re + 0.0000001102*Re*Re - 9.084*Re*Re*Re*pow(10,-12.0);
  }
  drag_force = 18.0*force*Re/24.0;
  return drag_force;
  
}
 

 
 
