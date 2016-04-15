class ccGraphicComponentBaseClass extends MovieClip
{
    var xmlnode, _width, w, _height, h, _xscale, _yscale, bkdomask, bkdobk, bkgradangle, bkgradalpha, bkgradclr, bkfillalpha, bkfillclr, bkdogradient, bkdohzstp, bkhzstpw, bkhzstpalpha, bkhzstpclr, bkhzstpspace, bkdovtstp, bkvtstpw, bkvtstpalpha, bkvtstpclr, bkvtstpspace, bkdoimg, bkimgx, bkimgy, bkimgalpha, bkimg, bkdobdr, createEmptyMovieClip, bkbdrsolid, bkbdrcolor, canTween, _x, _y, moveTo;
    function ccGraphicComponentBaseClass()
    {
        super();
        if (xmlnode != undefined)
        {
            this.parseXMLnode2();
        } // end if
        w = _width;
        h = _height;
        _xscale = 100;
        _yscale = 100;
        if (bkdomask)
        {
            this.drawAndSetMask(this, 0, 0, w, h);
        } // end if
        if (bkdobk)
        {
            this.drawSolidBox(this, 0, 0, w, h, bkfillclr, bkfillalpha, 0, 0, 0, false, bkgradclr, bkgradalpha, bkgradangle);
        } // end if
        if (bkdogradient)
        {
            this.drawSolidBox(this, 0, 0, w, h, bkfillclr, bkfillalpha, 0, 0, 0, bkdogradient, bkgradclr, bkgradalpha, bkgradangle);
        } // end if
        if (bkdohzstp)
        {
            drawhorzstripes(this, 0, 0, w, h, bkhzstpspace, bkhzstpclr, bkhzstpalpha, bkhzstpw);
        } // end if
        if (bkdovtstp)
        {
            this.drawVertStripes(this, 0, 0, w, h, bkvtstpspace, bkvtstpclr, bkvtstpalpha, bkvtstpw);
        } // end if
        if (bkdoimg)
        {
            if (bkimgx != undefined && bkimgy != undefined)
            {
                this.drawBkImage(this, bkimg, bkimgx, bkimgy, bkimgalpha);
            }
            else
            {
                this.drawBkImage(this, bkimg, 0, 0, 100);
            } // end if
        } // end else if
        if (bkdobdr)
        {
            bdr = this.createEmptyMovieClip("Ebd", l++);
            bdr._y = 0;
            bdr._x = 0;
            if (bkbdrsolid)
            {
                this.drawSolidBox(bdr, 0, 0, w - 1, h - 1, 0, 0, bkbdrcolor, 100, 1, false, 0, 0, 0);
            }
            else
            {
                this.drawDashedBox(bdr, 0, 0, w - 1, h - 1, bkbdrcolor, 100);
            } // end if
        } // end else if
        canTween = true;
    } // End of the function
    function parseXMLnode2()
    {
        if (xmlnode.attributes.w != undefined)
        {
            _width = Number(xmlnode.attributes.w);
        } // end if
        if (xmlnode.attributes.h != undefined)
        {
            _height = Number(xmlnode.attributes.h);
        } // end if
        if (xmlnode.attributes.x != undefined)
        {
            _x = Number(xmlnode.attributes.x);
        } // end if
        if (xmlnode.attributes.y != undefined)
        {
            _y = Number(xmlnode.attributes.y);
        } // end if
        if (xmlnode.attributes.bkbdrcolor != undefined)
        {
            bkbdrcolor = Number(xmlnode.attributes.bkbdrcolor);
        } // end if
        if (xmlnode.attributes.bkimg != undefined)
        {
            bkimg = xmlnode.attributes.bkimg;
        } // end if
        if (xmlnode.attributes.bkimgx != undefined)
        {
            bkimgx = Number(xmlnode.attributes.bkimgx);
        } // end if
        if (xmlnode.attributes.bkimgy != undefined)
        {
            bkimgy = Number(xmlnode.attributes.bkimgy);
        } // end if
        if (xmlnode.attributes.bkimgalpha != undefined)
        {
            bkimgalpha = Number(xmlnode.attributes.bkimgalpha);
        } // end if
        if (xmlnode.attributes.bkfillclr != undefined)
        {
            bkfillclr = Number(xmlnode.attributes.bkfillclr);
        } // end if
        if (xmlnode.attributes.bkgradclr != undefined)
        {
            bkgradclr = Number(xmlnode.attributes.bkgradclr);
        } // end if
        if (xmlnode.attributes.bkfillalpha != undefined)
        {
            bkfillalpha = Number(xmlnode.attributes.bkfillalpha);
        } // end if
        if (xmlnode.attributes.bkgradalpha != undefined)
        {
            bkgradalpha = Number(xmlnode.attributes.bkgradalpha);
        } // end if
        if (xmlnode.attributes.bkgradangle != undefined)
        {
            bkgradangle = Number(xmlnode.attributes.bkgradangle);
        } // end if
        if (xmlnode.attributes.bkhzstpspace != undefined)
        {
            bkhzstpspace = Number(xmlnode.attributes.bkhzstpspace);
        } // end if
        if (xmlnode.attributes.bkhzstpclr != undefined)
        {
            bkhzstpclr = Number(xmlnode.attributes.bkhzstpclr);
        } // end if
        if (xmlnode.attributes.bkhzstpalpha != undefined)
        {
            bkhzstpalpha = Number(xmlnode.attributes.bkhzstpalpha);
        } // end if
        if (xmlnode.attributes.bkhzstpw != undefined)
        {
            bkhzstpw = Number(xmlnode.attributes.bkhzstpw);
        } // end if
        if (xmlnode.attributes.bkdogradient != undefined)
        {
            if (xmlnode.attributes.bkdogradient == "t")
            {
                bkdogradient = true;
            }
            else
            {
                bkdogradient = false;
            } // end if
        } // end else if
        if (xmlnode.attributes.bkdoimg != undefined)
        {
            if (xmlnode.attributes.bkdoimg == "t")
            {
                bkdoimg = true;
            }
            else
            {
                bkdoimg = false;
            } // end if
        } // end else if
        if (xmlnode.attributes.bkdobdr != undefined)
        {
            if (xmlnode.attributes.bkdobdr == "t")
            {
                bkdobdr = true;
            }
            else
            {
                bkdobdr = false;
            } // end if
        } // end else if
        if (xmlnode.attributes.bkbdrsolid != undefined)
        {
            if (xmlnode.attributes.bkbdrsolid == "t")
            {
                bkbdrsolid = true;
            }
            else
            {
                bkbdrsolid = false;
            } // end if
        } // end else if
        if (xmlnode.attributes.bkdobk != undefined)
        {
            if (xmlnode.attributes.bkdobk == "t")
            {
                bkdobk = true;
            }
            else
            {
                bkdobk = false;
            } // end if
        } // end else if
        if (xmlnode.attributes.bkdomask != undefined)
        {
            if (xmlnode.attributes.bkdomask == "t")
            {
                bkdomask = true;
            }
            else
            {
                bkdomask = false;
            } // end else if
        }
        else
        {
            bkdomask = true;
        } // end else if
    } // End of the function
    function tweenInAlpha()
    {
        if (canTween == false)
        {
            return;
        } // end if
        canTween = false;
        tween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Regular.easeInOut, 0, 100, 20, false);
        tween.onMotionFinished = function ()
        {
            tween.obj.canTween = true;
        };
    } // End of the function
    function tweenOutAlpha()
    {
        if (canTween == false)
        {
            return;
        } // end if
        canTween = false;
        tween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Regular.easeInOut, 100, 0, 20, false);
        tween.onMotionFinished = function ()
        {
            tween.obj.canTween = true;
        };
    } // End of the function
    function tweenAlpha(f, t, frames)
    {
        tween = new mx.transitions.Tween(this, "_alpha", mx.transitions.easing.Regular.easeInOut, f, t, frames, false);
        tween.onMotionFinished = function ()
        {
            tween.obj.canTween = true;
        };
    } // End of the function
    function drawAndSetMask(mc, x, y, w, h)
    {
        mask = mc.createEmptyMovieClip("mask", 1);
        mask.beginFill(0, 100);
        mask.lineStyle(0, 0, 100);
        mask.moveTo(x, y);
        mask.lineTo(x + w, y);
        mask.lineTo(x + w, y + h);
        mask.lineTo(x, y + h);
        mask.lineTo(x, y);
        mask.endFill();
        mc.setMask(mask);
    } // End of the function
    function drawBkImage(mc, img, x, y, a)
    {
        bkImage = mc.createEmptyMovieClip("Ebk", mc.getNextHighestDepth());
        bkImage.loadMovie(img);
        bkImage._y = y;
        bkImage._x = x;
        bkImage._alpha = a;
        trace (x);
        trace (y);
        trace (a);
    } // End of the function
    function drawImage(mc, img, x, y, a)
    {
        bkImage = mc.createEmptyMovieClip(getMovieName("Ebk"), mc.getNextHighestDepth());
        bkImage._y = y;
        bkImage._x = x;
        bkImage._alpha = a;
        var myMCL = new MovieClipLoader();
        myMCL.onLoadStart = function (targetMC)
        {
            var _loc1 = myMCL.getProgress(targetMC);
        };
        myMCL.onLoadProgress = function (targetMC, loadedBytes, totalBytes)
        {
        };
        myMCL.onLoadComplete = function (targetMC)
        {
        };
        myMCL.loadClip(img, bkImage);
    } // End of the function
    function drawSolidBox(mc, dx, dy, dw, dh, fillClr, fillAlpha, lineClr, lineAlpha, lineThickness, doGradient, gradClr, gradAlpha, gradAngle)
    {
        if (doGradient)
        {
            colors = [gradClr, fillClr];
            alphas = [gradAlpha, fillAlpha];
            ratios = [0, 255];
            matrix = {matrixType: "box", x: dx, y: dy, w: dw, h: dh, r: gradAngle / 180 * 3.141593E+000};
            mc.beginGradientFill("linear", colors, alphas, ratios, matrix);
        }
        else
        {
            mc.beginFill(fillClr, fillAlpha);
        } // end else if
        mc.lineStyle(lineThickness, lineClr, lineAlpha);
        mc.moveTo(dx, dy);
        mc.lineTo(dx + dw, dy);
        mc.lineTo(dx + dw, dy + dh);
        mc.lineTo(dx, dy + dh);
        mc.lineTo(dx, dy);
        mc.endFill();
    } // End of the function
    function drawHorzStripes(mc, dx, dy, dw, dh, hInc, lineClr, lineAlpha, lineThickness)
    {
        mc.beginFill(0, 0);
        mc.lineStyle(lineThickness, lineClr, lineAlpha);
        for (a = 1; a < dh; a = a + hInc)
        {
            mc.moveTo(dx, a + dy);
            mc.lineTo(dx + dw, a + dy);
        } // end of for
        mc.endFill();
    } // End of the function
    function drawVertStripes(mc, dx, dy, dw, dh, vInc, lineClr, lineAlpha, lineThickness)
    {
        mc.beginFill(0, 0);
        mc.lineStyle(lineThickness, lineClr, lineAlpha);
        for (a = 1; a < dw; a = a + vInc)
        {
            mc.moveTo(a + dx, dy);
            mc.lineTo(a + dx, dy + dh);
        } // end of for
        mc.endFill();
    } // End of the function
    function drawBoxes(mc, dx, dy, dw, dh, bw, bh, bs, fillClr, fillAlpha, lineClr, lineAlpha, lineThickness, doGradient, gradClr, gradAlpha, gradAngle)
    {
        for (y = 1; y < dh; y = y + (bh + bs))
        {
            for (x = 1; x < dw; x = x + (bw + bs))
            {
                this.drawSolidBox(mc, dx + x, dy + y, bw, bh, fillClr, fillAlpha, lineClr, lineAlpha, lineThickness, doGradient, gradClr, gradAlpha, gradAngle);
            } // end of for
        } // end of for
    } // End of the function
    function draw3dBorder(mc, dx, dy, dw, dh, lineClr, lineAlpha, lineThickness)
    {
        mc.beginFill(0, 0);
        mc.lineStyle(4, lineClr, 100);
        mc.moveTo(dx, dy);
        mc.lineTo(dx + dw, dy);
        mc.lineTo(dx + dw, dy + dh);
        mc.lineTo(dx, dy + dh);
        mc.lineTo(dx, dy);
        mc.endFill();
    } // End of the function
    function drawDashedBox(mc, x, y, w, h, lineClr, lineAlpha)
    {
        mc.lineStyle(1, lineClr, lineAlpha);
        this.dashTo(mc, x, y, x, y + h, 4, 4);
        this.dashTo(mc, x, y + h, x + w, y + h, 4, 4);
        this.dashTo(mc, x + w, y + h, x + w, y, 4, 4);
        this.dashTo(mc, x + w, y, x, y, 4, 4);
    } // End of the function
    function dashTo(src, startx, starty, endx, endy, len, gap)
    {
        var _loc10;
        var _loc8;
        var _loc7;
        var _loc9;
        var _loc3;
        var _loc2;
        _loc10 = len + gap;
        _loc8 = endx - startx;
        _loc7 = endy - starty;
        delta = Math.sqrt(_loc8 * _loc8 + _loc7 * _loc7);
        _loc9 = Math.floor(Math.abs(delta / _loc10));
        radians = Math.atan2(_loc7, _loc8);
        _loc3 = startx;
        _loc2 = starty;
        _loc8 = Math.cos(radians) * _loc10;
        _loc7 = Math.sin(radians) * _loc10;
        for (var _loc4 = 0; _loc4 < _loc9; ++_loc4)
        {
            src.moveTo(_loc3, _loc2);
            src.lineTo(_loc3 + Math.cos(radians) * len, _loc2 + Math.sin(radians) * len);
            _loc3 = _loc3 + _loc8;
            _loc2 = _loc2 + _loc7;
        } // end of for
        src.moveTo(_loc3, _loc2);
        delta = Math.sqrt((endx - _loc3) * (endx - _loc3) + (endy - _loc2) * (endy - _loc2));
        if (delta > len)
        {
            src.lineTo(_loc3 + Math.cos(radians) * len, _loc2 + Math.sin(radians) * len);
        }
        else if (delta > 0)
        {
            src.lineTo(_loc3 + Math.cos(radians) * delta, _loc2 + Math.sin(radians) * delta);
        } // end else if
        this.moveTo(endx, endy);
    } // End of the function
} // End of Class
