Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A03606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EroP4Lt/;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GKCxx+68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=; b=EroP4Lt/hPDjPU
	fg8PtNNhvAsGqBKpGE5c5xtszprYxlqD1vx3bRKGc9ecRIIASKADy47vTtnXP+o9Cw+Lc00FnA0oz
	uPa7FSnvNnMJ0DjfZVCmUCWzlE9qyqOU3y+RmTYDq6ve+BmHLsiFyLW+F7Soh/eTDEvMCateGZTQ/
	tyzOoWaSTk24pNjcW2VRQKXIStkXilZ+D7lq66uQgUpzHIdINe4Hx6c23kOR9vgoCfJEd/ndwSwWR
	HASu1SaPnyLAyoJHcVm3X5As89EnU1c3olbHrU0Zw17kcmzwYgkQNiWe8ptEoVGQbzar5Wvy6REDY
	Gd0eMnej8mNwFF/EjjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnfn-00000006Cri-2tRb;
	Tue, 24 Nov 2026 10:22:51 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnfl-00000006Cr7-1vZP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:22:50 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67da69e7c31so4503945d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515768; cv=none;
        d=google.com; s=arc-20260327;
        b=IoXuIYj6/sVsNnvnLJXpxRA3f/kqVDOj0M8HTAaYvWawMTwIMIu0g7i3+yUJvCf0N+
         KPg2LsCwIF/p7zwpxT6dqz2/Cyc4TTkgYDUdTNwjZSdgT4aP2qijt2D0bydpC/OjxIh1
         dgijw7qGJOg61fYYHYoCvulCeBPlIr3m8zRNFadYJQubfQ16A9ywpV1KE+sUtyafgwOJ
         ucCP9Dpd/745/bmrJastTmuzS8ekNVre074hHtZ2pEGFQ9y6we5+SUrSJHK5B6CbCklH
         BzJtp1S9X8J0S+NqTMz4dFEgW6W94rdcHk/2U+uLp2JDI4jPWse/6Bh4X8R2IaWqOw4N
         Ze7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        fh=bxcZCc39RYkEhwGD/BUnY3yAlB3fMTED9TiAnw1gXoY=;
        b=P9U2hOm0fb0SOTmVIj3+E1NwNgBIzIybqZrg6UuagrcYfv5xJhw5C7SlgBUs0gScqh
         ng5IJEVIrvRer9R0x9ePjFDNvnlWXw9N2MHj+JWyTasCQGFgvMYA0TQWsIwZ/IpV1eVh
         2UmSj+kKeHKKDSIwN/hu6ppzO4IB2vyPTHb5uypJRG/Vq1JvHkQ+OimmBbgw/spQMrWS
         Ccg79bnSPE5UcQpxGb70ykt+0mPSL+JMFdoG6b2Hz/s/CxFlri5QIvSTItAfLtOWyjUt
         unW3OW/0iECMm73CodoJ+wgXoQwTTs/ESiTUvMUbl8JWbSXnK3K5cZm+HnpNcl3ydIU9
         4cxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795515768; x=1796120568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=GKCxx+68Y0SYpUgrEoyynGP7GpCKnDQXlNuKM6nQXcypzEx0UQ2YVd3nlfEC2sBf73
         Z53tceN+mWUKignFcsW0h2HyDAU0CtWBIvWpmxrmqWYGY3dj9+2rHEgIQSWFAY+DhTfe
         4+gqfHn5EQ9rRnQo1e7mpqwpFFHAXsGxA2xkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515768; x=1796120568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejx0Vx6mlT/oh5f9iEeflN8sMqKcxSOCTfvOWvcm4hc=;
        b=xoysJZ9lJKhrxJAXvC6rbLK6yN40oxykL/3fPBWeYmimQFBec/b/e3+xQPzom9od8Y
         QJSI57xEcByxIdUz8b9W2iygllxFLe9vbe1a/P4jlqj6zso4p8Egq8VYC42Wgw600Jil
         mgoA4/IBSQ7pck+lf62oFbDEyThgrn0Iz/JJ6N15oPQ6Wu95OrfE8mxxR6WkzblfgV0r
         OS5ml8N6XCUgNPDJsCU9wVRwxLOuTFq/Gbvl6eKOMTv4RIJTs4Ndvei0yA3C4nycmG/J
         Xy/7HF9WSrby019NChHgm2iOMo3TFddKquld+vdRv88mJVT81jLSKfRHN4ACAtZ/E/8L
         mg3Q==
X-Forwarded-Encrypted: i=1; AL+hErEbVobcq5YnytZKvQYGYqQGnwfqfZnBhQDJr3cHA/gkXlEclrQtbEiWDMlHCRqN9oqHlLbgOuCluqF58m/ZJH4e@lists.infradead.org
X-Gm-Message-State: APuU4Z915mMteeKydueaN9Y7nVufk2KzfI5d+US7s9PKEFk2VL50eKPG
	xCPRCpQRwX75kbjCCH5LZLaE2LCNFh6MzItyqGOxqtn3JB6kd+YR9/+zqZSH7npboSLaY6GipNZ
	8VXr+HcfXDf7p8jIsCg3TeE0aJ4OTPfxW/1475bfK
X-Gm-Gg: AZFdTZcV4hCDrl21ph8CVLSDpVTLrGZpP0doCWKcaqPDy3tHnlxDuoVCcQ6Kx75Pi+i
	PzhjRIOJjI7RMciY/k05Bag5OP7EQ8/+e9IZSTKr6FNJEdPokTA51Y9cgHOjzHJuPsgD+gxIzDF
	fL+Uqg718zWEpoqsorjR1J7oRt/2enLTM/NZe9sI3GggwUFyD/hGcbDXJb0ksIeP5i9TWcxr7nR
	UtY4GNl+esF7dpPeLsQWkZi8Tj0CJbXRQVx09OeAXD7HensncSQZhMebXirDwAzkMOkO4kO3Nx/
	YweMmFLH4F5J59t2NokY9HgeuOt2kNFGPANuL9TyyJjIJDIsDs3SOStNs9lBMPSyOFxJIXik5F3
	LuzIPnafdGpoIg2zQxKLbUfecYfgfIsGH24QGcO5sm0gkkhPEY7zlUpl1unwdptEjD1A=
X-Received: by 2002:a05:690c:6e8c:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b5204440fdmr67264947b3.12.1795515768163; Tue, 24 Nov 2026
 02:22:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124074041.115251-1-wenst@chromium.org> <20261124074041.115251-3-wenst@chromium.org>
 <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
In-Reply-To: <19cd5949-05dc-4107-bd2b-d8ad1e2332eb@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Nov 2026 18:22:37 +0800
X-Gm-Features: Aa3M54pNfcesZWo4EiEVJfs9QKzf9OEio3h9s-Qk4g3wBzB4RP2yK5vRHxNLzEQ
Message-ID: <CAGXv+5HSV7MJ96qTcOp+JaKWtmmYYWAmDROrT18pZ9PztNCJ-g@mail.gmail.com>
Subject: Re: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_022249_549287_8D9A7BD9 
X-CRM114-Status: GOOD (  32.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 3:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 24.11.26 um 08:39 schrieb Chen-Yu Tsai:
> > drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
> > framebuffer. However some display drivers want the "clipped" framebuffe=
r
> > instead, as they are also using the clipped coordinates to program the
> > hardware.
> >
> > Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
> > the source coordinates replaced, while others have been incorrectly
> > converted to using drm_fb_dma_get_gem_addr(), which would end up
> > causing incorrect parts of the framebuffer to be displayed if it were
> > somehow clipped.
> >
> > Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
> > drm_fb_dma_get_gem_addr() for these drivers to use.
> >
> > Cc: <stable@vger.kernel.org> # dependency for next patch
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Use new drm_framebuffer_get_block_offset() helper
> > ---
> >   drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++---=
-
> >   include/drm/drm_fb_dma_helper.h     |  4 ++++
> >   2 files changed, 37 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_=
fb_dma_helper.c
> > index ab0f37d8a5ff..0aaf4926db4e 100644
> > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > @@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(s=
truct drm_framebuffer *fb,
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
> >
> >   /**
> > - * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, =
for pixel
> > - * formats where values are grouped in blocks this will get you the be=
ginning of
> > - * the block
> > + * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped fra=
mebuffer,
> > + * for pixel formats where values are grouped in blocks this will get =
you the
> > + * beginning of the block
> >    * @fb: The framebuffer
> >    * @state: Which state of drm plane
> >    * @plane: Which plane
> > - * Return the DMA GEM address for given framebuffer.
> >    *
> >    * This function will usually be called from the PLANE callback funct=
ions.
> > + *
> > + * Return: GEM DMA address for given framebuffer, unclipped.
> >    */
> >   dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
> >                                  struct drm_plane_state *state,
> > @@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_frameb=
uffer *fb,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
> >
> > +/**
> > + * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipp=
ed
> > + * framebuffer, for pixel formats where values are grouped in blocks t=
his
> > + * will get you the beginning of the block
> > + * @fb: The framebuffer
> > + * @state: Which state of drm plane
> > + * @plane: Which plane
> > + *
> > + * This function will usually be called from the PLANE callback functi=
ons.
>
> You should mention what clipping means in this context. It's not obvious
> what it's clipping against. Or maybe point to other docs that explain it.

What about:

/**
 * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
 * of the visible (CRTC-clipped) part of the framebuffer
 * @fb: The framebuffer
 * @state: Which state of drm plane
 * @plane: Which plane
 *
 * A plane may be positioned partially off-screen, in which case it gets
 * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state(=
)
 * (populating the clipped coordinates in &drm_plane_state.src and
 * &drm_plane_state.dst). For example, if a plane extends past the left or
 * top edge of the screen, only its right and/or bottom portion is visible.
 * Drivers whose hardware cannot clip by itself (i.e. accept negative
 * destination coordinates) should use this helper instead of
 * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
 * the framebuffer.
 *
 * For pixel formats where values are grouped in blocks, this returns the
 * beginning of the block.
 *
 * This function will usually be called from the PLANE callback functions.
 *
 * Return: GEM DMA address for the visible part of the framebuffer.
 */

> > + *
> > + * Return: GEM DMA address for given framebuffer, clipped.
> > + */
> > +dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
> > +                                        struct drm_plane_state *state,
> > +                                        unsigned int plane)
> > +{
> > +     struct drm_gem_dma_object *obj;
> > +
> > +     obj =3D drm_fb_dma_get_gem_obj(fb, plane);
> > +     if (!obj)
> > +             return 0;
> > +
> > +     return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane=
,
> > +                                                             state->sr=
c.x1 >> 16,
> > +                                                             state->sr=
c.y1 >> 16);
>
> I had to look several times to spot the difference to the regular

I suppose I should add a comment to make the difference more visible:

    /* Use clipped source coordinates state->src.[xy]1 instead ->src_[xy] *=
/

> helper. In any case
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If the changes above are acceptable to you I'll send out a new version
with your tag kept.


Thanks
ChenYu

