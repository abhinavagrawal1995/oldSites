class ccThumbnailer extends ccGraphicComponentBaseClass
{
    var _visible, istweening, images, imagePos, bigimages, imagecaption, imagelinks, thumbobjects, lasthlightthumb, scrollButtonAlpha, thumbbtnfillclr, thumbbtnlineclr, thumbbtngradclr, thumbbtnarrowclr, igallery, xmlnode, _x, myX, _y, myY, thumbh, thumbw, getNextHighestDepth, createEmptyMovieClip, thumbHolder, bkdobdr, w, h, bgScrollInc, scrollPos, numimages, thumbxyoffset, thumbalpha, thumbdobk, thumbfillclr, thumbdogradient, thumbgradclr, thumbgradangle, thumbdobdr, thumbbdrcolor, thumbbdrsolid, thumbfxfade, thumbhlight, thumbhlightclr, thumbhlightwidth, thumbimgx, thumbimgy, thumbimgw, thumbimgh, thumbimgscale, thumbimgaspect, thumbhz, thumbspacing, alpha, myname, showbtns, drawSolidBox, thumbnailer;
    function ccThumbnailer()
    {
        super();
        _visible = false;
        istweening = false;
        images = new Array();
        imagePos = new Array();
        bigimages = new Array();
        imagecaption = new Array();
        imagelinks = new Array();
        thumbobjects = new Array();
        lasthlightthumb = -1;
        scrollButtonAlpha = 100;
        thumbbtnfillclr = 8421504;
        thumbbtnlineclr = 8421504;
        thumbbtngradclr = 16777215;
        thumbbtnarrowclr = 0;
        if (igallery.thumbbtnfillclr != undefined)
        {
            thumbbtnfillclr = igallery.thumbbtnfillclr;
        } // end if
        if (igallery.thumbbtnlineclr != undefined)
        {
            thumbbtnlineclr = igallery.thumbbtnlineclr;
        } // end if
        if (igallery.thumbbtngradclr != undefined)
        {
            thumbbtngradclr = igallery.thumbbtngradclr;
        } // end if
        if (igallery.thumbbtnarrowclr != undefined)
        {
            thumbbtnarrowclr = igallery.thumbbtnarrowclr;
        } // end if
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        myX = _x;
        myY = _y;
        thumbHolder = this.createEmptyMovieClip(_root.getMovieName("thumbHolder"), this.getNextHighestDepth(), {_x: 0, _y: 0, _height: thumbh, _width: thumbw});
        if (bkdobdr)
        {
            x = 2;
            y = 2;
            mask = this.createEmptyMovieClip("mask", 1);
            mask.beginFill(0, 100);
            mask.lineStyle(0, 0, 100);
            mask.moveTo(x, y);
            mask.lineTo(w - x, y);
            mask.lineTo(w - x, h - y);
            mask.lineTo(x, y + h - y);
            mask.lineTo(x, y);
            mask.endFill();
            thumbHolder.setMask(mask);
        } // end if
        bgScrollInc = 0;
        scrollPos = 0;
        numimages = images.length;
        x = thumbxyoffset;
        y = thumbxyoffset;
        for (var _loc4 = 0; _loc4 < numimages; ++_loc4)
        {
            s = _root.getMovieName("ccThumbnail");
            thumbobjects.push(s);
            thumbHolder.attachMovie("ccThumbnail", s, thumbHolder.getNextHighestDepth(), {w: thumbw, h: thumbh, _x: x, _y: y, _width: thumbw, _height: thumbh, _alpha: thumbalpha, numimages: numimages, imgnum: _loc4 + 1, bkdobk: thumbdobk, bkfillclr: thumbfillclr, bkfillalpha: 100, bkdogradient: thumbdogradient, bkgradclr: thumbgradclr, bkgradalpha: 100, bkgradangle: thumbgradangle, bkdobdr: thumbdobdr, bkbdrcolor: thumbbdrcolor, bkbdrsolid: thumbbdrsolid, thumbalpha: thumbalpha, thumbfxfade: thumbfxfade, thumbhlight: thumbhlight, highlightclr: thumbhlightclr, highlightwidth: thumbhlightwidth, igallery: igallery, thumbholder: this, thumbimgx: thumbimgx, thumbimgy: thumbimgy, thumbimg: images[_loc4], thumbimgw: thumbimgw, thumbimgh: thumbimgh, thumbimgscale: thumbimgscale, thumbimgaspect: thumbimgaspect, imagecaption: imagecaption[_loc4], bigimage: bigimages[_loc4], imagelink: imagelinks[_loc4]});
            if (thumbhz == false)
            {
                imagePos.push(y);
                if (y + thumbh < h)
                {
                    ++bgScrollInc;
                } // end if
                y = y + (thumbh + thumbspacing);
                continue;
            } // end if
            imagePos.push(x);
            if (x + thumbw < w)
            {
                ++bgScrollInc;
            } // end if
            x = x + (thumbw + thumbspacing);
        } // end of for
        if (thumbhz == false)
        {
            this.makebottomscrollbutton();
            this.makeTopScrollButton();
        }
        else
        {
            this.makeLeftScrollButton();
            this.makeRightScrollButton();
        } // end else if
        if (igallery.hidethumbnails == true)
        {
            _visible = false;
            alpha = 0;
            _y = -10000;
            _x = -10000;
        } // end if
    } // End of the function
    function loadthumbnails()
    {
        numimages = images.length;
        for (var _loc2 = 0; _loc2 < numimages; ++_loc2)
        {
            thumbHolder[thumbobjects[_loc2]].loadimage(images[_loc2]);
        } // end of for
    } // End of the function
    function showImage(i)
    {
        if (i > bigimages.length)
        {
            return;
        } // end if
        igallery.showInBigWindow(bigimages[i], imagecaption[i], i + 1, numimages, imagelinks[i]);
        if (lasthlightthumb > -1)
        {
            thumbHolder[thumbobjects[i]].onRollOver();
        } // end if
        if (lasthlightthumb > -1)
        {
            thumbHolder[thumbobjects[lasthlightthumb]].onRollOut();
        } // end if
        this.autoscroll(i);
        lasthlightthumb = i;
    } // End of the function
    function unhighlightlastthumbnail()
    {
        if (lasthlightthumb > -1)
        {
            thumbHolder[thumbobjects[lasthlightthumb]].onRollOut();
            lasthlightthumb = -1;
        } // end if
    } // End of the function
    function showNextImage(i)
    {
        ++i;
        if (i >= numimages)
        {
            i = 0;
        } // end if
        this.showImage(i);
        return (i);
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            a = 1;
            i = "image" + String(a);
            b = "bigimage" + String(a);
            c = "imagecaption" + String(a);
            for (l = "imagelink" + String(a); xmlnode.attributes[i] != undefined; l = "imagelink" + String(a))
            {
                images.push(xmlnode.attributes[i]);
                if (xmlnode.attributes[b] != undefined)
                {
                    bigimages.push(xmlnode.attributes[b]);
                }
                else
                {
                    bigimages.push("");
                } // end else if
                if (xmlnode.attributes[c] != undefined)
                {
                    imagecaption.push(xmlnode.attributes[c]);
                }
                else
                {
                    imagecaption.push("");
                } // end else if
                if (xmlnode.attributes[l] != undefined)
                {
                    imagelinks.push(xmlnode.attributes[l]);
                }
                else
                {
                    imagelinks.push("");
                } // end else if
                ++a;
                i = "image" + String(a);
                b = "bigimage" + String(a);
                c = "imagecaption" + String(a);
            } // end of for
            if (xmlnode.attributes.myname != undefined)
            {
                myname = xmlnode.attributes.myname;
                if (igallery.defaultcat == "")
                {
                    igallery.defaultcat = myname;
                } // end if
            } // end if
        } // end if
    } // End of the function
    function makeLeftScrollButton()
    {
        sW2 = 10;
        scrollRUX2 = 0;
        sY2 = 0;
        sH2 = h;
        ltScrollBtn = this.createEmptyMovieClip(_root.getMovieName("ltScrollBtn"), this.getNextHighestDepth());
        ltScrollBtn.thumbnailer = this;
        if (showbtns)
        {
            this.drawSolidBox(ltScrollBtn, scrollRUX2, sY2, sW2, sH2, thumbbtnfillclr, scrollButtonAlpha, thumbbtnlineclr, scrollButtonAlpha, 0, true, thumbbtngradclr, scrollButtonAlpha, 30);
        }
        else
        {
            ltScrollBtn._alpha = 0;
        } // end else if
        ltScrollBtn.beginFill(thumbbtnarrowclr, 100);
        ltScrollBtn.lineStyle(1, thumbbtnarrowclr, 100);
        t = (sH2 - 23) / 2 + 5;
        l = 2;
        ww = 6;
        hh = 7;
        ltScrollBtn.moveTo(l, t + hh);
        ltScrollBtn.lineTo(l + ww, t);
        ltScrollBtn.lineTo(l + ww, t + hh + hh);
        ltScrollBtn.lineTo(l, t + hh);
        ltScrollBtn.endFill();
        ltScrollBtn.onRollOver = function ()
        {
            if (thumbnailer.showbtns == false)
            {
                z = thumbnailer.scrollPos - thumbnailer.bgScrollInc;
                if (z < 0)
                {
                    z = 0;
                } // end if
                thumbnailer.scrollPos = z;
                startx = thumbnailer.thumbHolder._x;
                endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
                tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_x", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
            } // end if
        };
        ltScrollBtn.onRelease = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x - 1;
                _y = _y - 1;
            } // end if
        };
        ltScrollBtn.onPress = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x + 1;
                _y = _y + 1;
            } // end if
            z = thumbnailer.scrollPos - thumbnailer.bgScrollInc;
            if (z < 0)
            {
                z = 0;
            } // end if
            thumbnailer.scrollPos = z;
            startx = thumbnailer.thumbHolder._x;
            endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
            tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_x", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
        };
    } // End of the function
    function makeRightScrollButton()
    {
        sW = 11;
        scrollRUX = w - sW;
        sY = 0;
        sH = h;
        rbScrollBtn = this.createEmptyMovieClip(_root.getMovieName("rbScrollBtn"), this.getNextHighestDepth());
        rbScrollBtn.thumbnailer = this;
        if (showbtns)
        {
            rbScrollBtn._alpha = scrollButtonAlpha;
            this.drawSolidBox(rbScrollBtn, scrollRUX, sY, sW, sH, thumbbtnfillclr, scrollButtonAlpha, thumbbtnlineclr, scrollButtonAlpha, 0, true, thumbbtngradclr, scrollButtonAlpha, 30);
        }
        else
        {
            rbScrollBtn._alpha = 0;
        } // end else if
        rbScrollBtn.beginFill(thumbbtnarrowclr, 100);
        rbScrollBtn.lineStyle(1, thumbbtnarrowclr, 100);
        t = (sH2 - 23) / 2 + 5;
        l = (sW - 12) / 2 + scrollRUX + 4;
        ww = 6;
        hh = 7;
        rbScrollBtn.moveTo(l + ww, t + hh);
        rbScrollBtn.lineTo(l, t);
        rbScrollBtn.lineTo(l, t + hh + hh);
        rbScrollBtn.lineTo(l + ww, t + hh);
        rbScrollBtn.endFill();
        rbScrollBtn.onRollOver = function ()
        {
            if (thumbnailer.showbtns == false)
            {
                l = thumbnailer.imagePos.length;
                inc = thumbnailer.bgScrollInc;
                thumbnailer.scrollPos = thumbnailer.scrollPos + inc;
                if (thumbnailer.scrollPos + inc > l)
                {
                    z = thumbnailer.scrollPos + inc;
                    x = inc - (z - l);
                    thumbnailer.scrollPos = thumbnailer.scrollPos - inc;
                    thumbnailer.scrollPos = thumbnailer.scrollPos + x;
                } // end if
                startx = thumbnailer.thumbHolder._x;
                endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
                tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_x", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
            } // end if
        };
        rbScrollBtn.onRelease = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x - 1;
                _y = _y - 1;
            } // end if
        };
        rbScrollBtn.onPress = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x + 1;
                _y = _y + 1;
            } // end if
            l = thumbnailer.imagePos.length;
            inc = thumbnailer.bgScrollInc;
            thumbnailer.scrollPos = thumbnailer.scrollPos + inc;
            if (thumbnailer.scrollPos + inc > l)
            {
                z = thumbnailer.scrollPos + inc;
                x = inc - (z - l);
                thumbnailer.scrollPos = thumbnailer.scrollPos - inc;
                thumbnailer.scrollPos = thumbnailer.scrollPos + x;
            } // end if
            startx = thumbnailer.thumbHolder._x;
            endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
            tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_x", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
        };
    } // End of the function
    function autoscroll(i)
    {
        if (igallery.thumbhz == true)
        {
            startx = thumbHolder._x;
            endx = thumbxyoffset - imagePos[i];
            tweenz = new mx.transitions.Tween(thumbHolder, "_x", mx.transitions.easing.Regular.easeInOut, startx, endx, igallery.thumbspeed, false);
        }
        else
        {
            startx = thumbHolder._y;
            endx = thumbxyoffset - imagePos[i];
            tweenz = new mx.transitions.Tween(thumbHolder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, igallery.thumbspeed, false);
        } // end else if
    } // End of the function
    function makebottomscrollbutton()
    {
        sW = w;
        sX = 0;
        sH = 11;
        sY = h - sH;
        rbScrollBtn = this.createEmptyMovieClip(_root.getMovieName("rbScrollBtn"), this.getNextHighestDepth());
        rbScrollBtn.thumbnailer = this;
        if (showbtns)
        {
            rbScrollBtn._alpha = scrollButtonAlpha;
            this.drawSolidBox(rbScrollBtn, sX, sY, sW, sH, thumbbtnfillclr, scrollButtonAlpha, thumbbtnlineclr, scrollButtonAlpha, 0, true, thumbbtngradclr, scrollButtonAlpha, 30);
        }
        else
        {
            rbScrollBtn._alpha = 0;
        } // end else if
        rbScrollBtn.beginFill(thumbbtnarrowclr, 100);
        rbScrollBtn.lineStyle(1, thumbbtnarrowclr, 100);
        t = sY + 3;
        l = (sW - 14) / 2;
        ww = 7;
        hh = 6;
        rbScrollBtn.moveTo(l + ww, t + hh);
        rbScrollBtn.lineTo(l, t);
        rbScrollBtn.lineTo(l + ww + ww, t);
        rbScrollBtn.lineTo(l + ww, t + hh);
        rbScrollBtn.endFill();
        rbScrollBtn.onRollOver = function ()
        {
            if (thumbnailer.showbtns == false)
            {
                if (thumbnailer.showbtns)
                {
                    _x = _x + 1;
                    _y = _y + 1;
                } // end if
                l = thumbnailer.imagePos.length;
                inc = thumbnailer.bgScrollInc;
                thumbnailer.scrollPos = thumbnailer.scrollPos + inc;
                if (thumbnailer.scrollPos + inc > l)
                {
                    z = thumbnailer.scrollPos + inc;
                    x = inc - (z - l);
                    thumbnailer.scrollPos = thumbnailer.scrollPos - inc;
                    thumbnailer.scrollPos = thumbnailer.scrollPos + x;
                } // end if
                startx = thumbnailer.thumbHolder._y;
                endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
                tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
            } // end if
        };
        rbScrollBtn.onRelease = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x - 1;
                _y = _y - 1;
            } // end if
        };
        rbScrollBtn.onPress = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x + 1;
                _y = _y + 1;
            } // end if
            l = thumbnailer.imagePos.length;
            inc = thumbnailer.bgScrollInc;
            thumbnailer.scrollPos = thumbnailer.scrollPos + inc;
            if (thumbnailer.scrollPos + inc > l)
            {
                z = thumbnailer.scrollPos + inc;
                x = inc - (z - l);
                thumbnailer.scrollPos = thumbnailer.scrollPos - inc;
                thumbnailer.scrollPos = thumbnailer.scrollPos + x;
            } // end if
            startx = thumbnailer.thumbHolder._y;
            endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
            tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
        };
    } // End of the function
    function makeTopScrollButton()
    {
        sW2 = w;
        sX = 0;
        sY2 = 0;
        sH2 = 10;
        ltScrollBtn = this.createEmptyMovieClip(_root.getMovieName("ltScrollBtn"), this.getNextHighestDepth());
        ltScrollBtn.thumbnailer = this;
        if (showbtns)
        {
            ltScrollBtn._alpha = scrollButtonAlpha;
            this.drawSolidBox(ltScrollBtn, sX, sY2, sW2, sH2, thumbbtnfillclr, scrollButtonAlpha, thumbbtnlineclr, scrollButtonAlpha, 0, true, thumbbtngradclr, scrollButtonAlpha, 30);
        }
        else
        {
            ltScrollBtn._alpha = 0;
        } // end else if
        ltScrollBtn.beginFill(thumbbtnarrowclr, 100);
        ltScrollBtn.lineStyle(1, thumbbtnarrowclr, 100);
        t = (sH2 - 12) / 2 + 3;
        l = (sW2 - 14) / 2;
        ww = 7;
        hh = 6;
        ltScrollBtn.moveTo(l + ww + ww, t + hh);
        ltScrollBtn.lineTo(l, t + hh);
        ltScrollBtn.lineTo(l + ww, t);
        ltScrollBtn.moveTo(l + ww + ww, t + hh);
        ltScrollBtn.endFill();
        ltScrollBtn.onRollOver = function ()
        {
            if (thumbnailer.showbtns == false)
            {
                z = thumbnailer.scrollPos - thumbnailer.bgScrollInc;
                if (z < 0)
                {
                    z = 0;
                } // end if
                thumbnailer.scrollPos = z;
                startx = thumbnailer.thumbHolder._y;
                endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
                tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
            } // end if
        };
        ltScrollBtn.onRelease = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x - 1;
                _y = _y - 1;
            } // end if
        };
        ltScrollBtn.onPress = function ()
        {
            if (thumbnailer.showbtns)
            {
                _x = _x + 1;
                _y = _y + 1;
            } // end if
            z = thumbnailer.scrollPos - thumbnailer.bgScrollInc;
            if (z < 0)
            {
                z = 0;
            } // end if
            thumbnailer.scrollPos = z;
            startx = thumbnailer.thumbHolder._y;
            endx = thumbnailer.thumbxyoffset - thumbnailer.imagePos[thumbnailer.scrollPos];
            tweenz = new mx.transitions.Tween(thumbnailer.thumbHolder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, thumbnailer.igallery.thumbspeed, false);
        };
    } // End of the function
    function loadIcon(i, m)
    {
        var myMCL = new MovieClipLoader();
        myMCL.onLoadStart = function (targetMC)
        {
            var _loc1 = myMCL.getProgress(targetMC);
        };
        myMCL.loadClip(i, m);
    } // End of the function
} // End of Class
