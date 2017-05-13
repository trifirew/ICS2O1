/* Keisun Wu
 * 20170513
 * Anim module
 * Animation effects
 */

unit
module Anim
    export LEFT, RIGHT, BOTTOM, TOP, HORI_CENTRE, VERT_CENTRE,
	Slide

    const LEFT : int := 1
    const RIGHT : int := 2
    const BOTTOM : int := 4
    const TOP : int := 8
    const HORI_CENTRE : int := 20
    const VERT_CENTRE : int := 21

    proc Slide (startSide : int, px : int, dl : int)
	case startSide of
	    label LEFT :
		for i : 0 .. maxx by px
		    View.UpdateArea (i, 0, i + px, maxy)
		    delay (dl)
		end for
	    label RIGHT :
		for decreasing i : maxx .. 0 by px
		    View.UpdateArea (i, 0, i - px, maxy)
		    delay (dl)
		end for
	    label BOTTOM :
		for i : 0 .. maxy by px
		    View.UpdateArea (0, i, maxx, i + px)
		    delay (dl)
		end for
	    label TOP :
		for decreasing i : maxy .. 0 by px
		    View.UpdateArea (0, i, maxx, i - px)
		    delay (dl)
		end for
	    label LEFT + RIGHT :
		for i : 0 .. maxx div 2 by px
		    View.UpdateArea (i, 0, i + px, maxy)
		    View.UpdateArea (maxx - i, 0, maxx - i - px, maxy)
		    delay (dl)
		end for
	    label BOTTOM + TOP :
		for i : 0 .. maxy div 2 by px
		    View.UpdateArea (0, i, maxx, i + px)
		    View.UpdateArea (0, maxy - i, maxx, maxy - i - px)
		    delay (dl)
		end for
	    label HORI_CENTRE :
		for i : 0 .. maxx div 2 by px
		    View.UpdateArea (maxx div 2 - i, 0, maxx div 2 + i, maxy)
		    delay (dl)
		end for
	    label VERT_CENTRE :
		for i : 0 .. maxy div 2 by px
		    View.UpdateArea (0, maxy div 2 - i, maxx, maxy div 2 + i)
		end for
	    label :
		Error.Halt ("Invalid slide direction.")
	end case
    end Slide
end Anim
