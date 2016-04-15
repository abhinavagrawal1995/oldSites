class ccCatagories extends ccGraphicComponentBaseClass
{
    var catfont, catfontsize, catfontclr, catimgw, catimgh, xmlnode, catxypadding, igallery, _y, w, _x, getNextHighestDepth, createEmptyMovieClip, cath, h, catw, cathlightwidth, cathlightclr, cathlight, catdobk, catdogradient, catfillclr, catfillalpha, catgradclr, catgradangle, catdobdr, catbdrcolor, catbdrsolid, thumbbtnfillclr, thumbbtnlineclr, thumbbtngradclr, thumbbtnarrowclr, drawSolidBox, catspacing;
    function ccCatagories()
    {
        super();
        catlinks = new Array();
        catnames = new Array();
        cattexts = new Array();
        catimages = new Array();
        catsounds = new Array();
        catfont = "Arial";
        catfontsize = 10;
        catfontclr = 0;
        catimgw = 50;
        catimgh = 30;
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        x = catxypadding;
        y = catxypadding;
        _y = igallery._height;
        _x = (igallery.w - w) / 2;
        catsholder = this.createEmptyMovieClip(_root.getMovieName("catsholder"), this.getNextHighestDepth());
        catsholder._x = 0;
        catsholder._y = 0;
        catsholder._width = w;
        catsrows = 1;
        catcurrentrow = 0;
        catrowheight = catxypadding + cath;
        catrowsperpage = Math.floor(h / catrowheight);
        y = y + catrowheight;
        for (var _loc4 = 0; _loc4 < catlinks.length; ++_loc4)
        {
            x = x + (catxypadding + catw);
            trace (x + catw + " " + w);
            if (x + catw > w)
            {
                x = catxypadding;
                ++catsrows;
                y = y + catrowheight;
            } // end if
        } // end of for
        trace ("H:" + y);
        trace ("cr" + catsrows);
        catsholder._height = y;
        catsholder._xscale = 100;
        catsholder._yscale = 100;
        catsheight = y;
        x = catxypadding;
        y = catxypadding + 10;
        for (var _loc4 = 0; _loc4 < catlinks.length; ++_loc4)
        {
            catsholder.attachMovie("ccCatagoryThumbnail", _root.getMovieName("ccCatagoryThumbnail"), catsholder.getNextHighestDepth(), {w: catw, h: cath, _x: x, _y: y, _width: catw, _height: cath, _alpha: 100, catlink: catlinks[_loc4], catname: catnames[_loc4], cattext: cattexts[_loc4], catimage: catimages[_loc4], catsound: catsounds[_loc4], catfont: catfont, catfontsize: catfontsize, catfontclr: catfontclr, catimgw: catimgw, catimgh: catimgh, highlightwidth: cathlightwidth, highlightclr: cathlightclr, dohighlight: cathlight, igallery: igallery, bkdobk: catdobk, bkdogradient: catdogradient, bkfillclr: catfillclr, bkfillalpha: catfillalpha, bkgradclr: catgradclr, bkgradalpha: 100, bkgradangle: catgradangle, bbkdoimg: false, bkimgx: 0, bkimgy: 0, bkimg: catimage[_loc4], bkimgalpha: 100, bkdobdr: catdobdr, bkbdrcolor: catbdrcolor, bkbdrsolid: catbdrsolid});
            x = x + (catxypadding + catw);
            if (x + catw > w)
            {
                x = catxypadding;
                y = y + (catxypadding + cath);
            } // end if
        } // end of for
        this.makeCloseButton();
        if (catsrows > catrowsperpage)
        {
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
            this.makeBottomScrollButton();
            this.makeTopScrollButton();
        } // end if
    } // End of the function
    function makeCloseButton()
    {
        sW = 10;
        scrollRUX = 0;
        sH = 10;
        sY = 0;
        closebtn = this.createEmptyMovieClip(_root.getMovieName("closebtn"), this.getNextHighestDepth());
        closebtn._width = 16;
        closebtn._height = 16;
        closebtn._xscale = 100;
        closebtn._yscale = 100;
        closebtn._y = 2;
        closebtn._x = w - 18;
        closebtn.attachMovie("x", "xx", 100, {_x: 0, _y: 0, _xscale: 100, _yscale: 100});
        closebtn.igallery = igallery;
        closebtn.onPress = function ()
        {
            igallery.toggleCatagories();
        };
    } // End of the function
    function makeBottomScrollButton()
    {
        sW = w - 1;
        scrollRUX = 0;
        sH = 10;
        sY = h - sH - 2;
        rbScrollBtn = this.createEmptyMovieClip(_root.getMovieName("rbScrollBtn"), this.getNextHighestDepth());
        rbScrollBtn._alpha = 100;
        this.drawSolidBox(rbScrollBtn, scrollRUX, sY, sW, sH, thumbbtnfillclr, 100, thumbbtnlineclr, 100, 0, true, thumbbtngradclr, 100, 30);
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
        rbScrollBtn.onPress = function ()
        {
            _x = _x + 1;
            _y = _y + 1;
            if (catsrows <= catrowsperpage)
            {
                return;
            } // end if
            n = catcurrentrow + catrowsperpage;
            if (n >= catsrows)
            {
                n = catsrows - 1;
            } // end if
            catcurrentrow = n;
            endx = catcurrentrow * catrowheight * -1;
            startx = catsholder._y;
            tweenz = new mx.transitions.Tween(catsholder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, 15, false);
        };
        rbScrollBtn.onRelease = function ()
        {
            _x = _x - 1;
            _y = _y - 1;
        };
    } // End of the function
    function makeTopScrollButton()
    {
        sW = w - 20;
        scrollRUX = 0;
        sH = 10;
        sY = 0;
        topScrollBtn = this.createEmptyMovieClip(_root.getMovieName("topScrollBtn"), this.getNextHighestDepth());
        this.drawSolidBox(topScrollBtn, scrollRUX, sY, sW, sH, thumbbtnfillclr, 100, thumbbtnlineclr, 100, 0, true, thumbbtngradclr, 100, 30);
        topScrollBtn.beginFill(thumbbtnarrowclr, 100);
        topScrollBtn.lineStyle(1, thumbbtnarrowclr, 100);
        t = (sH - 12) / 2 + 3;
        l = (sW - 14) / 2;
        ww = 7;
        hh = 6;
        topScrollBtn.moveTo(l + ww + ww, t + hh);
        topScrollBtn.lineTo(l, t + hh);
        topScrollBtn.lineTo(l + ww, t);
        topScrollBtn.moveTo(l + ww + ww, t + hh);
        topScrollBtn.endFill();
        topScrollBtn.onPress = function ()
        {
            _x = _x + 1;
            _y = _y + 1;
            if (catsrows <= catrowsperpage)
            {
                return;
            } // end if
            n = catcurrentrow - catrowsperpage;
            if (n < 0)
            {
                n = 0;
            } // end if
            catcurrentrow = n;
            endx = catcurrentrow * catrowheight * -1;
            startx = catsholder._y;
            tweenz = new mx.transitions.Tween(catsholder, "_y", mx.transitions.easing.Regular.easeInOut, startx, endx, 15, false);
        };
        topScrollBtn.onRelease = function ()
        {
            _x = _x - 1;
            _y = _y - 1;
        };
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            a = 1;
            fnd = true;
            l = "cat" + String(a) + "link";
            n = "cat" + String(a) + "name";
            t = "cat" + String(a) + "text";
            i = "cat" + String(a) + "image";
            for (s = "cat" + String(a) + "sound"; xmlnode.attributes[l] != undefined; s = "cat" + String(a) + "sound")
            {
                catlinks.push(xmlnode.attributes[l]);
                if (xmlnode.attributes[n] != undefined)
                {
                    catnames.push(xmlnode.attributes[n]);
                }
                else
                {
                    catnames.push("");
                } // end else if
                if (xmlnode.attributes[t] != undefined)
                {
                    cattexts.push(xmlnode.attributes[t]);
                }
                else
                {
                    cattexts.push("");
                } // end else if
                if (xmlnode.attributes[i] != undefined)
                {
                    catimages.push(xmlnode.attributes[i]);
                }
                else
                {
                    catimages.push("");
                } // end else if
                if (xmlnode.attributes[s] != undefined)
                {
                    catsounds.push(xmlnode.attributes[s]);
                    if (a == 1)
                    {
                        igallery.defaultcatsound = xmlnode.attributes[s];
                    } // end if
                }
                else if (a == 1)
                {
                    trace (igallery.bkmp3path);
                    catsounds.push(igallery.bkmp3path);
                }
                else
                {
                    catsounds.push("");
                } // end else if
                ++a;
                l = "cat" + String(a) + "link";
                n = "cat" + String(a) + "name";
                t = "cat" + String(a) + "text";
                i = "cat" + String(a) + "image";
            } // end of for
            if (xmlnode.attributes.catfont != undefined)
            {
                catfont = xmlnode.attributes.catfont;
            } // end if
            if (xmlnode.attributes.catfontsize != undefined)
            {
                catfontsize = Number(xmlnode.attributes.catfontsize);
            } // end if
            if (xmlnode.attributes.catfontclr != undefined)
            {
                catfontclr = Number(xmlnode.attributes.catfontclr);
            } // end if
            if (xmlnode.attributes.catimgw != undefined)
            {
                catimgw = Number(xmlnode.attributes.catimgw);
            } // end if
            if (xmlnode.attributes.catimgh != undefined)
            {
                catimgh = Number(xmlnode.attributes.catimgh);
            } // end if
            if (xmlnode.attributes.catw != undefined)
            {
                catw = Number(xmlnode.attributes.catw);
            } // end if
            if (xmlnode.attributes.cath != undefined)
            {
                cath = Number(xmlnode.attributes.cath);
            } // end if
            if (xmlnode.attributes.catspacing != undefined)
            {
                catspacing = Number(xmlnode.attributes.catspacing);
            } // end if
            if (xmlnode.attributes.catbdrcolor != undefined)
            {
                catbdrcolor = Number(xmlnode.attributes.catbdrcolor);
            } // end if
            if (xmlnode.attributes.catfillclr != undefined)
            {
                catfillclr = Number(xmlnode.attributes.catfillclr);
            } // end if
            if (xmlnode.attributes.catfillalpha != undefined)
            {
                catfillalpha = Number(xmlnode.attributes.catfillalpha);
            } // end if
            if (xmlnode.attributes.catgradclr != undefined)
            {
                catgradclr = Number(xmlnode.attributes.catgradclr);
            } // end if
            if (xmlnode.attributes.catgradangle != undefined)
            {
                catgradangle = Number(xmlnode.attributes.catgradangle);
            } // end if
            if (xmlnode.attributes.cathlightclr != undefined)
            {
                cathlightclr = Number(xmlnode.attributes.cathlightclr);
            } // end if
            if (xmlnode.attributes.cathlightwidth != undefined)
            {
                cathlightwidth = Number(xmlnode.attributes.cathlightwidth);
            } // end if
            if (xmlnode.attributes.cathlight != undefined)
            {
                if (xmlnode.attributes.cathlight == "t")
                {
                    cathlight = true;
                }
                else
                {
                    cathlight = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.bkdogradient != undefined)
            {
                if (xmlnode.attributes.catdogradient == "t")
                {
                    catdogradient = true;
                }
                else
                {
                    catdogradient = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.catdobdr != undefined)
            {
                if (xmlnode.attributes.catdobdr == "t")
                {
                    catdobdr = true;
                }
                else
                {
                    catdobdr = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.catbdrsolid != undefined)
            {
                if (xmlnode.attributes.catbdrsolid == "t")
                {
                    catbdrsolid = true;
                }
                else
                {
                    catbdrsolid = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.catdobk != undefined)
            {
                if (xmlnode.attributes.catdobk == "t")
                {
                    catdobk = true;
                }
                else
                {
                    catdobk = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.cathlight != undefined)
            {
                if (xmlnode.attributes.cathlight == "t")
                {
                    cathlight = true;
                }
                else
                {
                    cathlight = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.cathlightclr != undefined)
            {
                cathlightclr = Number(xmlnode.attributes.cathlightclr);
            } // end if
            if (xmlnode.attributes.cathlightwidth != undefined)
            {
                cathlightwidth = Number(xmlnode.attributes.cathlightwidth);
            } // end if
            if (xmlnode.attributes.cathlightwidth != undefined)
            {
                cathlightwidth = Number(xmlnode.attributes.cathlightwidth);
            } // end if
            if (xmlnode.attributes.catxypadding != undefined)
            {
                catxypadding = Number(xmlnode.attributes.catxypadding);
            } // end if
        } // end if
    } // End of the function
} // End of Class
