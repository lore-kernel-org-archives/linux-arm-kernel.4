Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF1606A888
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/7HBDQX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=dXXu9RMD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WjpgXx6NEvfU1QpeJ8K6NIoACTTNQ40ei6HG54E25G4=; b=y/7HBDQXQyDzRz7G4GjehG8lVu
	Ml+xJ4Ho87UfbnzaooMhGys1pBcAefs9Y/P7CExE3AKZa//uqsTJsDLAiSMYceQNXipGr/JtYtf/n
	0gfyhoCQv+KqbqoYkkuZJ1bu8kOyj3JoM/FXGpfQLzIidRV8uLV/dmBrbaKGqyK50w72xEN+r/D5e
	mja9jO9sd6LIhPm+wyqSZMCO+E3YHiwqRearFjLKS3Pkk5vJWQBBpeWMO7MCYmaKzyRHvpGcVZFhu
	7FeWt5gSl7eh7ZnfkTL0Tgzgoz5JL/0D0VOJmRRKl3AA1UJRvkcgPDdu7B/q/ETrZGYryhv3qUISx
	fKZqqjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWpW-0000000ATNk-1ZYf;
	Thu, 12 Nov 2026 15:35:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWpO-0000000ATJv-1wsJ;
	Thu, 12 Nov 2026 15:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794497650; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kq9864SPyKvjjMeRkdipd1E35RQlhbP0ilf6aRZxwioSOZqJRi4hUgIpli49TkACpJs+Y+kjV6OsGiZxnOZqzJermko4nVXap6/lqVSYHa2aNJw6g0Y3tpGksvDE4DkMYnrAfxunpoEEzUVTaolJTZO8gQJBTUMKJoi57CBjCzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794497650; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WjpgXx6NEvfU1QpeJ8K6NIoACTTNQ40ei6HG54E25G4=; 
	b=jL5Z6j3nO2eolGSsRFZwEnO/838+wTgReS9TqAHhUAFdXOgBTW7XKnEbORC6W1mUieN9qv06Pt5BNh7oW24fhayZSLAz6BGrt7LWsS2M6thyaMb9UjUhFZjVOa2fynYf6xhhtGDtD9Bz/wduku52/5YHoX1lJDB+kQ5uqvbN8og=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=dXXu9RMDE0xezo6kZ18H2VSiccbq6FlBnZmCo/DcR2ZMbbhHVHrljwAtBAOFm859uXeyyFX/pUyOZhP/wCxZjlKTahs83Fb6HxhROSkyXKsfHvpVpiRwl+92SWmr9RTRScyeK+9IbHmEctP9m3I0//4XQtkGXz38uRPAqK1914E=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=WjpgXx6NEvfU1QpeJ8K6NIoACTTNQ40ei6HG54E25G4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794497647702543.2304470024969;
	Thu, 12 Nov 2026 07:34:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Vidith Madhu <vmadhu@nvidia.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 09/27] drm: Add VRR target frame rate properties
Date: Thu, 12 Nov 2026 16:33:58 +0100
Message-ID: <6MnpleYQQheiUMA8VObDVg@collabora.com>
In-Reply-To: <812a813c-05cf-190d-6006-b8f63764beb7@nvidia.com>
References: <20261105-vrr-limiter-uapi-v2-0-55f4215be2c2@collabora.com>
 <20261105-vrr-limiter-uapi-v2-9-55f4215be2c2@collabora.com>
 <812a813c-05cf-190d-6006-b8f63764beb7@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073506_571951_A5DBE2F2 
X-CRM114-Status: GOOD (  37.60  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, 12 November 2026 06:24:50 Central European Standard Time Vidith Madhu wrote:
> 
> On Thu, 5 Nov 2026, Nicolas Frattaroli wrote:
> 
> > Userspace may wish to set a target frame rate for the Variable Refresh
> > Rate mechanism. There are multiple possible ways such a target could be
> > communicated.
> > 
> > It's desirable for userspace to not only set a fixed target, but a
> > target range within which VRR may operate. This is because even if a
> > sink advertises a certain range as supported, said range may not be the
> > ideal range to use, as numbers on the extreme end of the range may
> > induce flickering or other glitches.
> > 
> > There's four choices to how one bracketing value for the target range
> > could be communicated:
> > 1. Target frame rate in something like millihertz
> > 2. Target frame period in something like usecs
> > 3. Target vtotal value
> > 4. Target frame rate as a fraction expressed by two integers
> > 
> > Choice 1 is unpleasant as it would introduce some amount of rounding to
> > common broadcast framerates like 24/1.001, which seems minor except that
> > exact matches to standard framerates would rely on making all userspace
> > and kernel agree on a specific method of rounding. This is sure to go
> > wrong, so is disqualified.
> > 
> > Choice 2 has the same problem as 1, with the added complication that
> > the EDID's VRR range is expressed in frames per second, and other HDMI
> > features express things in frames per second as well, which would
> > require possibly imprecise computations.
> > 
> > Choice 3 is disqualified as mechanisms other than VRR, such as FVA, may
> > also modify the vtotal value. Additionally, it has the same drawbacks of
> > choice 2 and 1.
> > 
> > Choice 4 is therefore what's implemented. The frame rate 24/1.001Hz, for
> > example, is expressed as nominator=24000 and denominator=1001. As there
> > is both a minimum and a maximum, there are 4 properties in total: two
> > numerators, and two denominators. A fixed rate with no variability is
> > expressed by setting the minimum fractional and the maximum fractional
> > properties to the same value.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++++
> >  drivers/gpu/drm/drm_atomic_uapi.c | 24 ++++++++++++++++++++
> >  drivers/gpu/drm/drm_connector.c   | 48 +++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_crtc.c        | 34 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_mode_config.c | 20 ++++++++++++++++
> >  include/drm/drm_crtc.h            |  6 +++++
> >  include/drm/drm_mode_config.h     | 45 ++++++++++++++++++++++++++++++++++++
> >  7 files changed, 191 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 9bb761eda59f..da5c6925c349 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -489,6 +489,7 @@ EXPORT_SYMBOL(drm_atomic_get_crtc_state);
> >  static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
> >  				 const struct drm_crtc_state *new_crtc_state)
> >  {
> > +	const struct drm_crtc_vrr_state *vrr = &new_crtc_state->vrr_state;
> >  	struct drm_crtc *crtc = new_crtc_state->crtc;
> >  
> >  	/* NOTE: we explicitly don't enforce constraints such as primary
> > @@ -544,6 +545,19 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
> >  		return -EINVAL;
> >  	}
> >  
> > +	/*
> > +	 * Reject VRR limiter ranges that only specify one end of the limit, or
> I think specifying just one end of the limit should still be a valid case, 
> the client may want to use the default bound on one side implied by the 
> base timings/min. refresh rate and constrain the other.

That is what the RFC did, but unfortunately this leads to problems for
the kernel and non-obvious behaviour for userspace. Specifically, userspace
may set what is a fixed rate without intending to do so, and the kernel needs
to do a chicken-and-egg dance to determine whether something could be a fixed
rate to see if CinemaVRR lowering the minimum rate applies at which point it
may no longer be a fixed rate.

The new display-min/max properties are so that userspace knows what limits the
kernel is using (so that it factors in quirks applied outside of what's in the
EDID) and get to essentially specify one end that way.

> 
> > +	 * specify a numerator > 0 with a denominator that is 0.
> > +	 */
> > +	if ((!vrr->vrr_min_n || !vrr->vrr_min_d ||
> > +	     !vrr->vrr_max_n || !vrr->vrr_max_d) &&
> > +	    (vrr->vrr_min_n > 0 || vrr->vrr_max_n > 0)) {
> > +		drm_dbg_atomic(crtc->dev,
> > +			       "[CRTC:%d:%s] incomplete VRR limiter range\n",
> > +			       crtc->base.id, crtc->name);
> > +		return -EINVAL;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
>> [snip]





