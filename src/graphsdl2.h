/*
** This file is part of the Matrix Brandy Basic VI Interpreter.
** Copyright (C) 2018-2021 Michael McConnell and contributors
**
** SDL additions by Colin Tuckley
**
** Brandy is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2, or (at your option)
** any later version.
**
** Brandy is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with Brandy; see the file COPYING.  If not, write to
** the Free Software Foundation, 59 Temple Place - Suite 330,
** Boston, MA 02111-1307, USA.
**
** This file defines the exported functions which use the SDL library.
*/
#ifndef GRAPHSDL2_INC
#define GRAPHSDL2_INC

typedef struct {
        char *titlepointer;             /* Not NULL to set title bar */
        int32 mousecmd;                 /* Mouse toggle stuff */
        int32 modechange;               /* Is a mode change in flight? */
        int32 x;                        /* X coordinate or parameter 1 */
        int32 y;                        /* Y coordinate or parameter 2 */
        unsigned char crtc6845r10;      /* CRTC Register 10, cursor control */
        boolean mode7forcerefresh;      /* Set to TRUE if we need a force refresh of MODE 7 */
        boolean videothread;            /* Set to 0 when video thread pass finished */
} threadmsg;

extern void get_sdl_mouse(size_t values[]);
extern void warp_sdlmouse(int32 x, int32 y);
extern void sdl_mouse_onoff(int state);
extern void fullscreenmode(int onoff);
extern void setupnewmode(int32 mode, int32 xres, int32 yres, int32 cols, int32 mxscale, int32 myscale, int32 xeig, int32 yeig);
extern void star_refresh(int flag);
extern int get_refreshmode(void);
extern int32 osbyte42(int x);
extern void osbyte112(int x);
extern void osbyte113(int x);
extern int32 osbyte134_165(int32 a);
extern int32 osbyte135(void);
extern int32 osbyte163_242(int32 a);
extern int32 osbyte250(void);
extern int32 osbyte251(void);
extern void reset_sysfont(int x);
extern void hide_cursor(void);
//extern void reveal_cursor(void);
extern void osword09(int64 x);
extern void osword0A(int64 x);
extern void osword0B(int64 x);
extern void osword0C(int64 x);
extern void osword8B(int64 x);
extern void osword8C(int64 x);
extern int32 os_readpalette(int32 colour, int32 mode);
extern void sdl_screensave(char *fname);
extern void sdl_screenload(char *fname);
extern void swi_swap16palette(void);
extern size_t readmodevariable(int32 scrmode, int32 var);
extern void screencopy(int32 src, int32 dst);
extern int32 get_maxbanks(void);
extern void refresh_location(uint32 offset);
extern void add_mouseitem(int x, int y, int b, int64 c);
extern void drain_mousebuffer(void);
extern void set_mouseevent_expiry(uint32 expire);
extern int videoupdatethread(void);

extern Uint8 mousebuttonstate;
extern mousequeue *mousebuffer;

#endif /* GRAPHSDL2_INC */
