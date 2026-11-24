Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEEB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w6FLaLdP;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=v7Fy4vJH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tUCMqiOrGj4FihXgRmpoFzlOGU9HSbmXuDtn2DKC7dE=; b=w6FLaLdP0DAqFb
	Qbd/ecVK51dpGAsvBJvQNngmjRBEElWA6y/8ZeUZOpSgZwmg8ECeAMfVFgWmuH5eT9j43KGaLLrAx
	hr195lWT9urGjRoRJxrTo9XRc8K5Xp0rcZwXFcqnAgdt4139Ael647xNR5tV5GN0USMZUyUQ4v+uk
	wBX4rbPGswz+uUldiX43JmPixcSrsgYsGFbfNyw7nWikXVbY+IqAwRnDofV2gmtjnM9Ujr36jjB+v
	+N9DsgafpG423ct4VbOz6gdrjn5+VfpIXKh3nytDtfuP4bgcQtWYjk5nUI+tA+lvqOM3BDLziCONw
	gTnRbIOKWVvd40HPIOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzDJ-000000080qq-1lQY;
	Tue, 24 Nov 2026 22:42:13 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzDF-000000080qC-2VO4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=tUCMqiOrGj4FihXgRmpoFzlOGU9HSbmXuDtn2DKC7dE=; t=1795560129; x=1796769729; 
	b=v7Fy4vJH3WriJTFP5OPVb/6moKQbG3G6938aKnYVMgnxp4KY1m2yguHsxiuo/C5h+cLXCbbC9uk
	l5Wl05bW8RvSr2tMoRz8Irzv/1lBwiUZKbqIGpUgwY69pALfpKyC6aUzYLB5VfhQZ7Lri6QmK0vnr
	h+WbLz19e0f3uSVORwACpkUOZTJ/ePHxqJ91knbfKKRob2R6Oq6hjADN4AEVihhLgFsyTRsKGWLwf
	27qY5DwlUofz+nTBfBWmBFCwSyCjUJTghtyNPZfCgDj1b87DGQumaCFAnptq2/3HWLcSGdao2yzdM
	rid/BwoWME7ZCZNfUlLy45OtgRZacf/BARsw==;
Date: Tue, 24 Nov 2026 23:41:43 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH v2 00/20] ARM: omap3: pandora: Modernize audio and
 backlight to use Device Tree to finally remove pdata-quirks
Message-ID: <20261124234143.4f099646@kemnade.info>
In-Reply-To: <1DCFB59E-E5EA-4470-997E-EAA4ED35D906@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
	<20261124151318.GA536798-robh@kernel.org>
	<1DCFB59E-E5EA-4470-997E-EAA4ED35D906@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_144209_641893_DCB08B6A 
X-CRM114-Status: GOOD (  15.92  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 16:27:16 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Surely 
> > this can be broken up into smaller series?  
> 
> Yes it (we?) can. It is just a question how to do it and properly describe
> the dependencies to avoid bisectability problems and avoid that the final
> goal is lost.
> 
I think it is indeed tricky, and probably induces delays.
You can point to the pandora_bl driver  resp the pandora sound card to show the
final goal. 

If I understand it correctly,  you have

1. preparations/extensions for using the standard pwm backlight.
2. REGEN stuff to wire up the power supply. 
3. dts changes to wire up backlight and its power supply. 
4. sound: quirks in twl4030 codec
5. sound: dt conversion of the sound card.
6. dts changes to wire up sound card and its power supply
7. machine quirk cleanup

So what brings it all together: the power supply requirments,
so both backlight and sound depend on 2.

Maybe it is an idea to split this into a set of

One patchset for
7a. machine quirk conditionally depending on available compatible
2.
1.
3.
Each can go into their individual trees.
3. might to in the next release cycle after 7a, 2. 1.

A second patchset sent after 3 is in -next, containg
4.
5.
6.

A third:
7b: remove quirk + pandora_bl

Regards,
Andreas

