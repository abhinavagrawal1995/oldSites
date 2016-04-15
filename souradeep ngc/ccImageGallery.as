class ccImageGallery extends ccGraphicComponentBaseClass
{
    var thumbs, catsShowing, canDoSounds, doplay, playcount, playspeed, thumbspeed, defaultcat, defaultcatsound, dontshowloadingbar, hidethumbnails, hideid, h1, h2, h3, doclickfullsize, xmlnode, docplayonstartup, playbtn, overclicksnd, sndbtn, bkmp3path, docatsonstartup, getNextHighestDepth, attachMovie, getURL, w, display, cats, catbtn, _height, _width, activeThumbnailer, activeThumbnailIndex, igallery, thumbhdrbkbdrcolor, thumbhdrbkimg, bkimgx, bkimgy, bkimgalpha, thumbhdrbkfillclr, thumbhdrbkgradclr, thumbhdrbkfillalpha, thumbhdrbkgradalpha, thumbhdrbkgradangle, thumbhdrbkdogradient, thumbhdrbkdoimg, thumbhz, thumbhdrbkdobdr, thumbhdrbkbdrsolid, thumbhdrbkdo, showbtns, thumbspacing, thumbalpha, thumbw, thumbh, thumbxyoffset, thumbimgh, thumbimgw, thumbimgx, thumbimgy, thumbbdrcolor, thumbfillclr, thumbgradclr, thumbgradangle, thumbhlightclr, thumbhlightwidth, captionfontsize, captionfontcolor, captionfontbkcolor, captionfont, myname, thumbhlight, thumbdogradient, thumbdobdr, thumbbdrsolid, thumbdobk, thumbfxfade, thumbimgaspect, thumbimgscale, dofullclick, thumbbtnfillclr, thumbbtnlineclr, thumbbtngradclr, thumbbtnarrowclr, alwaysshowcaption, dontshowimagenumber, thumbshdw, thumbshdwclr, moveTo;
    function ccImageGallery()
    {
        super();
        thumbs = new Array();
        catsShowing = false;
        canDoSounds = true;
        doplay = false;
        playcount = 0;
        playspeed = 50;
        thumbspeed = 15;
        defaultcat = "";
        defaultcatsound = "";
        dontshowloadingbar = false;
        hidethumbnails = false;
        hideid = false;
        h1 = "Show Photo Albums";
        h2 = "Turn Audio On or Off";
        h3 = "Play or Stop Slideshow";
        doclickfullsize = false;
        if (xmlnode != undefined)
        {
            this.parseXMLnode();
        } // end if
        if (docplayonstartup)
        {
            this.togglePlay();
            playbtn.setToggleDown();
        } // end if
        if (bkmp3 == undefined && overclicksnd == undefined)
        {
            sndbtn.setToggleDown();
        } // end if
        if (!canDoSounds)
        {
            sndbtn.setToggleUp();
        }
        else
        {
            sndbtn.setToggleDown();
        } // end else if
        if (defaultcatsound == "")
        {
            defaultcatsound = bkmp3path;
        } // end if
        if (docatsonstartup)
        {
            this.showCatagories();
        }
        else
        {
            this.showThumbnails(defaultcat, defaultcatsound);
        } // end else if
        if (_root.unreg == true)
        {
            aaa = this.attachMovie("yellowbx", "asd", this.getNextHighestDepth());
            aaa._x = 0;
            aaa._y = 0;
            aaa.onPress = function ()
            {
            };
        } // end if
    } // End of the function
    function createHints()
    {
    } // End of the function
    function showHint(i, xx, yy, ww, hh)
    {
        if (i == 1 && h1 != "")
        {
            y2 = yy - hint1._height;
            if (y2 < 0)
            {
                y2 = yy + hh;
            } // end if
            hint1._y = y2;
            x2 = xx;
            if (x2 + hint1._width > w)
            {
                x2 = w - hint1._width;
            } // end if
            hint1._x = x2;
            hint1._visible = true;
        } // end if
        if (i == 2 && h2 != "")
        {
            y2 = yy - hint2._height;
            if (y2 < 0)
            {
                y2 = yy + hh;
            } // end if
            hint2._y = y2;
            x2 = xx;
            if (x2 + hint2._width > w)
            {
                x2 = w - hint2._width;
            } // end if
            hint2._x = x2;
            hint2._visible = true;
        } // end if
        if (i == 3 && h3 != "")
        {
            y2 = yy - hint3._height;
            if (y2 < 0)
            {
                y2 = yy + hh;
            } // end if
            hint3._y = y2;
            x2 = xx;
            if (x2 + hint3._width > w)
            {
                x2 = w - hint3._width;
            } // end if
            hint3._x = x2;
            hint3._visible = true;
        } // end if
    } // End of the function
    function hideHint(i)
    {
        if (i == 1)
        {
            hint1._visible = false;
        } // end if
        if (i == 2)
        {
            hint2._visible = false;
        } // end if
        if (i == 3)
        {
            hint3._visible = false;
        } // end if
    } // End of the function
    function showInBigWindow(s, i, n, nn, l)
    {
        display.loadImage(s, i, n, nn, l);
    } // End of the function
    function showCatagories()
    {
        if (cats != undefined && catsShowing == false)
        {
            catbtn.setToggleDown();
            catsShowing = true;
            tween = new mx.transitions.Tween(cats, "_y", mx.transitions.easing.Regular.easeOut, cats._y, cats.catxypadding, 10, false);
        } // end if
    } // End of the function
    function hideCatagories()
    {
        if (cats != undefined && catsShowing == true)
        {
            catbtn.setToggleUp();
            catsShowing = false;
            tween = new mx.transitions.Tween(cats, "_y", mx.transitions.easing.Regular.easeOut, cats._y, _height, 10, false);
        } // end if
    } // End of the function
    function toggleCatagories()
    {
        if (catsShowing)
        {
            this.hideCatagories();
        }
        else
        {
            this.showCatagories();
        } // end else if
    } // End of the function
    function toggleSounds()
    {
        if (canDoSounds)
        {
            canDoSounds = false;
            if (catsSound != undefined)
            {
                catsSound.stop();
            } // end if
        }
        else
        {
            canDoSounds = true;
            if (catsSound != undefined)
            {
                catsSound.start();
            } // end if
        } // end else if
    } // End of the function
    function showThumbnails(n, ss)
    {
        this.playThisSound(ss);
        for (var _loc2 = 0; _loc2 < thumbs.length; ++_loc2)
        {
            if (thumbs[_loc2]._visible && thumbs[_loc2].myname != n)
            {
                thumbs[_loc2].istweening = true;
                tween = new mx.transitions.Tween(thumbs[_loc2], "_x", mx.transitions.easing.Strong.easeOut, thumbs[_loc2]._x, _width + 20, 20, false);
                tween.onMotionFinished = function ()
                {
                    tween.obj.istweening = false;
                    tween.obj._visible = false;
                };
            } // end if
        } // end of for
        for (var _loc2 = 0; _loc2 < thumbs.length; ++_loc2)
        {
            if (thumbs[_loc2].myname == n)
            {
                thumbs[_loc2]._visible = true;
                thumbs[_loc2].istweening = true;
                activeThumbnailer = thumbs[_loc2];
                activeThumbnailIndex = 0;
                thumbs[_loc2].loadthumbnails();
                tweenz = new mx.transitions.Tween(thumbs[_loc2], "_x", mx.transitions.easing.Strong.easeOut, -thumbs[_loc2]._width, thumbs[_loc2].myX, 20, false);
                tweenz.onMotionFinished = function ()
                {
                    tweenz.obj.istweening = false;
                    tweenz.obj.showImage(0);
                };
                break;
            } // end if
        } // end of for
    } // End of the function
    function showThumbnailCaption(s)
    {
        if (mousesoverlabel == undefined)
        {
            return;
        } // end if
        mousesoverlabel.settext(s);
    } // End of the function
    function togglePlay()
    {
        if (doplay)
        {
            doplay = false;
            activeThumbnailer.unhighlightlastthumbnail();
        }
        else
        {
            doplay = true;
        } // end else if
    } // End of the function
    function onEnterFrame()
    {
        if (doplay == true)
        {
            if (display.isloading)
            {
                return;
            } // end if
            if (activeThumbnailer != undefined)
            {
                ++playcount;
                if (playcount >= playspeed)
                {
                    playcount = 0;
                    activeThumbnailIndex = activeThumbnailer.showNextImage(activeThumbnailIndex);
                } // end if
            } // end if
        } // end if
        if (currentCatsSound != lastCatsSound)
        {
            catsSound.setVolume(catsSound.getVolume() - 5);
            if (catsSound.getVolume() <= 0)
            {
                lastCatsSound = currentCatsSound;
                catsSound.stop();
                catsSound = new Sound();
                catsSound.igallery = this;
                catsSound.onSoundComplete = function ()
                {
                    if (igallery.canDoSounds)
                    {
                        catsSound.start();
                    } // end if
                };
                catsSound.loadSound(currentCatsSound, true);
            } // end if
        } // end if
    } // End of the function
    function playThisSound(s)
    {
        currentCatsSound = s;
        if (lastCatsSound == "" | lastCatsSound == undefined)
        {
            lastCatsSound = currentCatsSound;
            fadebkmp3 = true;
            catsSound = new Sound();
            catsSound.igallery = this;
            catsSound.onSoundComplete = function ()
            {
                if (igallery.canDoSounds)
                {
                    catsSound.start();
                } // end if
            };
            if (canDoSounds)
            {
                catsSound.loadSound(s, true);
            }
            else
            {
                catsSound.loadSound(s, false);
            } // end if
        } // end else if
    } // End of the function
    function parseXMLnode()
    {
        if (xmlnode != undefined)
        {
            if (xmlnode.attributes.overclick != undefined)
            {
                if (xmlnode.attributes.overclick != "")
                {
                    overclicksnd = new Sound();
                    overclicksnd.loadSound(xmlnode.attributes.overclick);
                } // end if
            } // end if
            if (xmlnode.attributes.mousesoverlabel != undefined)
            {
                mousesoverlabelname = xmlnode.attributes.mousesoverlabel;
            } // end if
            if (xmlnode.attributes.thumbspeed != undefined)
            {
                thumbspeed = xmlnode.attributes.thumbspeed;
            } // end if
            if (xmlnode.attributes.bkmp3 != undefined)
            {
                if (xmlnode.attributes.bkmp3 != "")
                {
                    bkmp3path = xmlnode.attributes.bkmp3;
                } // end if
            } // end if
            if (xmlnode.attributes.doplay != undefined)
            {
                if (xmlnode.attributes.doplay == "t")
                {
                    doplay = true;
                }
                else
                {
                    doplay = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.hideid != undefined)
            {
                if (xmlnode.attributes.hideid == "t")
                {
                    hideid = true;
                }
                else
                {
                    hideid = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.muteaudio != undefined)
            {
                if (xmlnode.attributes.muteaudio == "t")
                {
                    this.toggleSounds();
                }
                else
                {
                    canDoSounds = true;
                } // end if
            } // end else if
            if (xmlnode.attributes.playspeed != undefined)
            {
                playspeed = Number(xmlnode.attributes.playspeed);
            } // end if
            if (xmlnode.attributes.thumbhdrbkbdrcolor != undefined)
            {
                thumbhdrbkbdrcolor = Number(xmlnode.attributes.thumbhdrbkbdrcolor);
            } // end if
            if (xmlnode.attributes.thumbhdrbkimg != undefined)
            {
                thumbhdrbkimg = xmlnode.attributes.thumbhdrbkimg;
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
            if (xmlnode.attributes.thumbhdrbkfillclr != undefined)
            {
                thumbhdrbkfillclr = Number(xmlnode.attributes.thumbhdrbkfillclr);
            } // end if
            if (xmlnode.attributes.thumbhdrbkgradclr != undefined)
            {
                thumbhdrbkgradclr = Number(xmlnode.attributes.thumbhdrbkgradclr);
            } // end if
            if (xmlnode.attributes.thumbhdrbkfillalpha != undefined)
            {
                thumbhdrbkfillalpha = Number(xmlnode.attributes.thumbhdrbkfillalpha);
            } // end if
            if (xmlnode.attributes.thumbhdrbkgradalpha != undefined)
            {
                thumbhdrbkgradalpha = Number(xmlnode.attributes.thumbhdrbkgradalpha);
            } // end if
            if (xmlnode.attributes.thumbhdrbkgradangle != undefined)
            {
                thumbhdrbkgradangle = Number(xmlnode.attributes.thumbhdrbkgradangle);
            } // end if
            if (xmlnode.attributes.bkdogradient != undefined)
            {
                if (xmlnode.attributes.thumbhdrbkdogradient == "t")
                {
                    thumbhdrbkdogradient = true;
                }
                else
                {
                    thumbhdrbkdogradient = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbhdrbkdoimg != undefined)
            {
                if (xmlnode.attributes.thumbhdrbkdoimg == "t")
                {
                    thumbhdrbkdoimg = true;
                }
                else
                {
                    thumbhdrbkdoimg = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbhz != undefined)
            {
                if (xmlnode.attributes.thumbhz == "t")
                {
                    thumbhz = true;
                }
                else
                {
                    thumbhz = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbhdrbkdobdr != undefined)
            {
                if (xmlnode.attributes.thumbhdrbkdobdr == "t")
                {
                    thumbhdrbkdobdr = true;
                }
                else
                {
                    thumbhdrbkdobdr = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbhdrbkbdrsolid != undefined)
            {
                if (xmlnode.attributes.thumbhdrbkbdrsolid == "t")
                {
                    thumbhdrbkbdrsolid = true;
                }
                else
                {
                    thumbhdrbkbdrsolid = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbhdrbkdo != undefined)
            {
                if (xmlnode.attributes.thumbhdrbkdo == "t")
                {
                    thumbhdrbkdo = true;
                }
                else
                {
                    thumbhdrbkdo = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.docatsonstartup != undefined)
            {
                if (xmlnode.attributes.docatsonstartup == "t")
                {
                    docatsonstartup = true;
                }
                else
                {
                    docatsonstartup = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.showbtns != undefined)
            {
                if (xmlnode.attributes.showbtns == "t")
                {
                    showbtns = true;
                }
                else
                {
                    showbtns = false;
                } // end else if
            }
            else
            {
                showbtns = false;
            } // end else if
            if (xmlnode.attributes.thumbspacing != undefined)
            {
                thumbspacing = Number(xmlnode.attributes.thumbspacing);
            } // end if
            if (xmlnode.attributes.thumbalpha != undefined)
            {
                thumbalpha = Number(xmlnode.attributes.thumbalpha);
            } // end if
            if (xmlnode.attributes.thumbspacing != undefined)
            {
                thumbspacing = Number(xmlnode.attributes.thumbspacing);
            } // end if
            if (xmlnode.attributes.thumbw != undefined)
            {
                thumbw = Number(xmlnode.attributes.thumbw);
            } // end if
            if (xmlnode.attributes.thumbh != undefined)
            {
                thumbh = Number(xmlnode.attributes.thumbh);
            } // end if
            if (xmlnode.attributes.thumbxyoffset != undefined)
            {
                thumbxyoffset = Number(xmlnode.attributes.thumbxyoffset);
            } // end if
            if (xmlnode.attributes.thumbimgh != undefined)
            {
                thumbimgh = Number(xmlnode.attributes.thumbimgh);
            } // end if
            if (xmlnode.attributes.thumbimgw != undefined)
            {
                thumbimgw = Number(xmlnode.attributes.thumbimgw);
            } // end if
            if (xmlnode.attributes.thumbimgx != undefined)
            {
                thumbimgx = Number(xmlnode.attributes.thumbimgx);
            } // end if
            if (xmlnode.attributes.thumbimgy != undefined)
            {
                thumbimgy = Number(xmlnode.attributes.thumbimgy);
            } // end if
            if (xmlnode.attributes.thumbbdrcolor != undefined)
            {
                thumbbdrcolor = Number(xmlnode.attributes.thumbbdrcolor);
            } // end if
            if (xmlnode.attributes.thumbfillclr != undefined)
            {
                thumbfillclr = Number(xmlnode.attributes.thumbfillclr);
            } // end if
            if (xmlnode.attributes.thumbgradclr != undefined)
            {
                thumbgradclr = Number(xmlnode.attributes.thumbgradclr);
            } // end if
            if (xmlnode.attributes.thumbgradangle != undefined)
            {
                thumbgradangle = Number(xmlnode.attributes.thumbgradangle);
            } // end if
            if (xmlnode.attributes.thumbhlightclr != undefined)
            {
                thumbhlightclr = Number(xmlnode.attributes.thumbhlightclr);
            } // end if
            if (xmlnode.attributes.thumbhlightwidth != undefined)
            {
                thumbhlightwidth = Number(xmlnode.attributes.thumbhlightwidth);
            } // end if
            if (xmlnode.attributes.captionfontsize != undefined)
            {
                captionfontsize = Number(xmlnode.attributes.captionfontsize);
            } // end if
            if (xmlnode.attributes.captionfontcolor != undefined)
            {
                captionfontcolor = Number(xmlnode.attributes.captionfontcolor);
            } // end if
            if (xmlnode.attributes.captionfontbkcolor != undefined)
            {
                captionfontbkcolor = Number(xmlnode.attributes.captionfontbkcolor);
            } // end if
            if (xmlnode.attributes.captionfont != undefined)
            {
                captionfont = xmlnode.attributes.captionfont;
            } // end if
            if (xmlnode.attributes.myname != undefined)
            {
                myname = xmlnode.attributes.myname;
            } // end if
            if (xmlnode.attributes.thumbhlight != undefined)
            {
                if (xmlnode.attributes.thumbhlight == "t")
                {
                    thumbhlight = true;
                }
                else
                {
                    thumbhlight = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.bkdogradient != undefined)
            {
                if (xmlnode.attributes.thumbdogradient == "t")
                {
                    thumbdogradient = true;
                }
                else
                {
                    thumbdogradient = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbdobdr != undefined)
            {
                if (xmlnode.attributes.thumbdobdr == "t")
                {
                    thumbdobdr = true;
                }
                else
                {
                    thumbdobdr = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbbdrsolid != undefined)
            {
                if (xmlnode.attributes.thumbbdrsolid == "t")
                {
                    thumbbdrsolid = true;
                }
                else
                {
                    thumbbdrsolid = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbdobk != undefined)
            {
                if (xmlnode.attributes.thumbdobk == "t")
                {
                    thumbdobk = true;
                }
                else
                {
                    thumbdobk = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbfxfade != undefined)
            {
                if (xmlnode.attributes.thumbfxfade == "t")
                {
                    thumbfxfade = true;
                }
                else
                {
                    thumbfxfade = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbimgaspect != undefined)
            {
                if (xmlnode.attributes.thumbimgaspect == "t")
                {
                    thumbimgaspect = true;
                }
                else
                {
                    thumbimgaspect = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbimgscale != undefined)
            {
                if (xmlnode.attributes.thumbimgscale == "t")
                {
                    thumbimgscale = true;
                }
                else
                {
                    thumbimgscale = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.docplayonstartup != undefined)
            {
                if (xmlnode.attributes.docplayonstartup == "t")
                {
                    docplayonstartup = true;
                }
                else
                {
                    docplayonstartup = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.dofullclick != undefined)
            {
                if (xmlnode.attributes.dofullclick == "t")
                {
                    dofullclick = true;
                }
                else
                {
                    dofullclick = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.dontshowloadingbar != undefined)
            {
                if (xmlnode.attributes.dontshowloadingbar == "t")
                {
                    dontshowloadingbar = true;
                }
                else
                {
                    dontshowloadingbar = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.hidethumbnails != undefined)
            {
                if (xmlnode.attributes.hidethumbnails == "t")
                {
                    hidethumbnails = true;
                }
                else
                {
                    hidethumbnails = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.thumbbtnfillclr != undefined)
            {
                thumbbtnfillclr = Number(xmlnode.attributes.thumbbtnfillclr);
            } // end if
            if (xmlnode.attributes.thumbbtnlineclr != undefined)
            {
                thumbbtnlineclr = Number(xmlnode.attributes.thumbbtnlineclr);
            } // end if
            if (xmlnode.attributes.thumbbtngradclr != undefined)
            {
                thumbbtngradclr = Number(xmlnode.attributes.thumbbtngradclr);
            } // end if
            if (xmlnode.attributes.thumbbtnarrowclr != undefined)
            {
                thumbbtnarrowclr = Number(xmlnode.attributes.thumbbtnarrowclr);
            } // end if
            if (xmlnode.attributes.alwaysshowcaption != undefined)
            {
                if (xmlnode.attributes.alwaysshowcaption == "t")
                {
                    alwaysshowcaption = true;
                }
                else
                {
                    alwaysshowcaption = false;
                } // end if
            } // end else if
            if (xmlnode.attributes.dontshowimagenumber != undefined)
            {
                if (xmlnode.attributes.dontshowimagenumber == "t")
                {
                    dontshowimagenumber = true;
                }
                else
                {
                    dontshowimagenumber = false;
                } // end else if
            }
            else
            {
                dontshowimagenumber = false;
            } // end else if
            for (var _loc3 = xmlnode.firstChild; _loc3 != null; _loc3 = _loc3.nextSibling)
            {
                if (_loc3.nodeName == "thumbnailer")
                {
                    thumbs.push(this.attachMovie("ccThumbnailer", _root.getMovieName("ccThumbnailer"), this.getNextHighestDepth(), {xmlnode: _loc3, igallery: this, bkdobk: thumbhdrbkdo, bkdogradient: thumbhdrbkdogradient, bkfillclr: thumbhdrbkfillclr, bkfillalpha: thumbhdrbkfillalpha, bkgradclr: thumbhdrbkgradclr, bkgradalpha: thumbhdrbkgradalpha, bkgradangle: thumbhdrbkgradangle, bkdoimg: thumbhdrbkdoimg, bkimg: thumbhdrbkimg, bkdobdr: thumbhdrbkdobdr, bkbdrsolid: thumbhdrbkbdrsolid, bkbdrcolor: thumbhdrbkbdrcolor, showbtns: showbtns, thumbhz: thumbhz, thumbw: thumbw, thumbh: thumbh, thumbimgw: thumbimgw, thumbimgh: thumbimgh, thumbimgx: thumbimgx, thumbimgy: thumbimgy, thumbalpha: thumbalpha, thumbspacing: thumbspacing, thumbxyoffset: thumbxyoffset, thumbfxfade: thumbfxfade, thumbdobdr: thumbdobdr, thumbbdrsolid: thumbbdrsolid, thumbbdrcolor: thumbbdrcolor, thumbhlight: thumbhlight, thumbhlightclr: thumbhlightclr, thumbhlightwidth: thumbhlightwidth, thumbshdw: thumbshdw, thumbshdwclr: thumbshdwclr, thumbdobk: thumbdobk, thumbfillclr: thumbfillclr, thumbdogradient: thumbdogradient, thumbgradclr: thumbgradclr, thumbgradangle: thumbgradangle, thumbimgw: thumbimgw, thumbimgh: thumbimgh, thumbimgscale: thumbimgscale, thumbimgaspect: thumbimgaspect}));
                } // end if
                if (_loc3.nodeName == "imagedisplay")
                {
                    display = this.attachMovie("ccImageDisplay", _root.getMovieName("ccImageDisplay"), this.getNextHighestDepth(), {xmlnode: _loc3, igallery: this});
                    if (!hideid)
                    {
                        display.tweenInAlpha();
                    }
                    else
                    {
                        display._visible = false;
                    } // end else if
                    doclickfullsize = display.doclickfullsize;
                } // end if
                if (_loc3.nodeName == "button")
                {
                    cbtn = this.attachMovie("ccButton", _root.getMovieName("ccButton"), this.getNextHighestDepth(), {xmlnode: _loc3, igallery: this});
                    if (cbtn.action == "showcatagories")
                    {
                        h1 = cbtn.hint;
                    } // end if
                    if (cbtn.action == "togglesounds")
                    {
                        h2 = cbtn.hint;
                    } // end if
                    if (cbtn.action == "toggleplaypause")
                    {
                        h3 = cbtn.hint;
                    } // end if
                    cbtn.tweenInAlpha();
                } // end if
                if (_loc3.nodeName == "label")
                {
                } // end if
                if (_loc3.nodeName == "image")
                {
                    this.drawImage(this, _loc3.attributes.image, _loc3.attributes.x, _loc3.attributes.y, _loc3.attributes.alpha);
                } // end if
            } // end of for
            for (var _loc4 = xmlnode.firstChild; _loc4 != null; _loc4 = _loc4.nextSibling)
            {
                if (_loc4.nodeName == "catagories")
                {
                    cats = this.attachMovie("ccCatagories", _root.getMovieName("ccCatagories"), this.getNextHighestDepth(), {xmlnode: _loc4, igallery: this});
                    break;
                } // end if
            } // end of for
            display.createCaption();
        } // end if
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
