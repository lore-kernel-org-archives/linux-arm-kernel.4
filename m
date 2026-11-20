Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC852606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fKHAHs4p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=; b=fKHAHs4pWZ5+L21i7DJl42pGV8
	7J445xNxJWcWOih+uuybAxViCdie7GaHNUYuG+JfhcLsBCJxprL14qCXTf+RStDuedi0515LFBY/K
	wc3DzCBDCZijLfu6pz2feg9uHi0U/Yxv8TLSeh8/WbGfSN0mI92+vemkXu96BLgv6+sn7RzhSLRcN
	yJmjyAzuMrDCOt6MkwOJ8ETqSBkVNZaLjWPL0ep/JsHlXqCsb92yGB8dGcw2KoVuDiuIk42FsFyt7
	9MNXdt6JM0rpVDzK1VbplyxVsyciFfKJOag1LAS1oP/eCgSES9ax8jxc/j9tGOttPepfXjr8LKf9F
	LzO+bMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKQa-0000000EPDY-2pXH;
	Fri, 20 Nov 2026 08:57:05 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKQW-0000000EPD4-1amH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:57:03 +0000
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-949b0d32315so64206485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165019; x=1795769819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slnLzkdmpwFbnxdOJOf8j6Mw1PiHOu2DMR+OPWGMV3g=;
        b=v6AIBxmHXh4gFtYjmNvltv2LKtIQTq/nwqiiflfo5uieK03+xuMhK43PvPf6uKPd+t
         fOgxadWkWqsxcYcU7BldVRtn9+sgOFNYV80DCpid7slRCvg9871GUajmjus3ZTkxo6d/
         TNou85aeMC9rexdU8hH8+GKGZIR9kihmdunYyXdBUGrV/Pjkp1x6zbSe1xfRdyUC3l4o
         R6aO+EdtQm5N2/xFzOZn0nT1sc2eWAcbGl7A7Clr7nUGgcU7f+3yOnJbmH3Q7Rb1XP6s
         oDk80Qu4oxHxHke41MfY9Wt6AUc5zKmTfLaN1kjC0mtT0usyy8KyweVaxdpW2pKRYHDe
         qCmA==
X-Forwarded-Encrypted: i=1; AL+hErH1u34uB8hZI8LK9LYMI5W3YvOVQ5VmxDpZ5Q7UD0+P51bGIZiUp42588ipTjfcDDQdhjg3yIc6YwebfYzJl3Pk@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZDs0VSe/7ethgHzg+lBnHInnRU8u/4psX1eF8r9Ldt5YUnb/d
	cy8GIHAFLLS++kyrMGe0YVYZjibmSSnO6vGpwc7tehEkrEuS8rN/oxaEqaMFw1MT
X-Gm-Gg: AYBFou1tCgZKcd/BUHIyJ1VwJXdzILuJlYbqySjVEYrWfeS3FeVzOjiCsjrmW+5/fOP
	ovSc6dqNzGY+AvXeh4M/YLzL2cYSzI5vwzdDWtPVO6AP4C5NJJ+/cfiSV9U0aPlQrVdGekCbrY2
	ZJEf+m9PRsVydUjAwPmE4CVaQ1d3E3QX4OtJNry4Z5epClkpMMHaOOY50wkE0XiamRYeXGz5b83
	FTmqDEyqZliyEmo0AUroVsilb7+rmA+FADy4MAGnwlrCufBUqufJ2859b3Srsjbu5mgA9OWv+nZ
	JZPSX2LUnDSsxeD8Ldn0AtZRNPgWjNc2j2hY+bnrF7jhalN0V/5sNDCnheFsCt8Dpv6NVCOHGne
	QU+8YtWO0OSS24+HSAVelS2cRVwassNIWx/hMePbYMp+Qhmhi+V4tBT4iiLk1cwMFg9locNU/lX
	U4l+Y7fgEuQ0179GanSHaNK8Ds64vAjlDjJs3zroGd+E8LnVakUoUmFp8ViLOwlPLirhHBUE5e1
	DfgCYNLiB0nRuXkGW56BPHf2Uj426bhZREi2znqv58vHPdIhja2OS4z6NpmjjhJVNXc1XcAzdEb
	RwojP2xouvcU5z+0BQA39ZT0SsCu//xmR+xsgFLzEBbkdPAIsVwoLHNSoAX7stdaxgIDTxU=
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr327935385a.3.1795165019074;
        Fri, 20 Nov 2026 00:56:59 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm145559985a.42.2026.11.20.00.56.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:56:58 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-949b0d32315so64205885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:56:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH06Hxy6bg+KXKRpb+7BJSo4HY9/N1S8gH5NYOzUlOjrDABQzvoz448AgqwTbNE1pgzuWu1J2KqP8+dQEbOn9oD@lists.infradead.org
X-Received: by 2002:a05:6102:a49:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7d739587805mr971622137.19.1795164590827; Fri, 20 Nov 2026
 00:49:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info> <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
 <20261120094320.442d064b@kemnade.info>
In-Reply-To: <20261120094320.442d064b@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:49:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
X-Gm-Features: Aa3M54pnWIgbseGoLAFGMXWb1P8DBLFzk6LU-uNSdaE_BgKhwLT8uPsc_3uFT5k
Message-ID: <CAMuHMdWiCODz6RC9Q9-xMM5_k3grHztiLuR+-ikOZYoBawVvZg@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: ettore.chimenti@linaro.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005702_249632_08723992 
X-CRM114-Status: GOOD (  33.83  )
X-Spam-Score: -0.8 (/)
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

Hi Andreas,

On Fri, 20 Nov 2026 at 09:44, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Fri, 20 Nov 2026 08:49:05 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> > > On Thu, 19 Nov 2026 14:40:38 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > > > used for power management, so the latter show up as "deviceless" in the
> > > > consumer column of the clk_summary file in debugfs.
> > > >
> > > > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > > > the consumer device, too.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Compile-tested only.
> > > >
> > > > The first change is probably OK.  The second change may fail if anything
> > > > in the oh->od->pdev->dev chain is not available yet at this point.
> > >
> > > Test on OMAP3:
> >
> > Thanks for testing!
> >
> > > --- clk-old     2026-11-19 22:44:59.810807920 +0100
> > > +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> > > @@ -1,17 +1,17 @@
> > >                                   enable  prepare  protect                                duty  hardware                            connection
> > >     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
> > >  ---------------------------------------------------------------------------------------------------------------------------------------------
> > > - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> > > + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
> > >                                                                                                             deviceless                      no_connection_id

                                deviceless
mcbsp_clks
> >
> > Hmm, so the passed device is always NULL, and thus there is no point
> > in making the change.
> > Do you know if these come from the first or second change in my patch
> > (I guess the second)?
> >
> From the first change, The second piece is nowadys only used by the dm81*
> devices.

Interesting.  So that means all/some of the existing use of
&od->pdev->dev in _add_clkdev() is futile, as it may be NULL?

> I would prefer to have this tested on dm81* too.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

