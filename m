Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA88606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y5gmgFd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=; b=y5gmgFd3H/kj1Fx8jiBwswORxf
	UnE3OMdSS3jZeaafDovrfPVEs1UNLIckQykBGEDirYNWDxPCm7RhfOwnvZJRQT2ku8YQNswFfa4PZ
	V6My7rqS6NqtlyhiBsW1cQcPnCPVSN0xFQeXKhzgUwjAxHYBUXmfGQSDO0QmA2kCdgDVcyj4Nh7wi
	U/OswQgQWVzfvPVc4+VBX/fo6kTwfVHDyro/h5Cmzqa7QfpPBjE6BBFPsvfjJjIrD3Lgw391TXcuS
	jZ2vKGk2T3U3WWDjc6DYWiTsayDg/yK5fxf7xAwYcONvafJWs72EFIE+IU9iUbJi9o3wQT2clvmrs
	RWw5apOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJN3-0000000EH9w-0B2F;
	Fri, 20 Nov 2026 07:49:21 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJN0-0000000EH93-1Cvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:49:19 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso184341e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160957; x=1795765757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=;
        b=H+NBa9lq9WtGc0WZ1lbnDgSTkgpqEwcbFIv/uD6P4M+RPWLMCk9ShRFcNTW4jW9VpI
         Hc9Br7qFuFwxkDnDM16JMKO/DSF6esbRehFFGZCv7NdcM313MO0iq5RmvZBNnee1EZzV
         cAAHJks7yKx80U5cQ7ukC0PzvAi8wTycwNAJLPntabKUsDp2GDQSTkAT+EveTC/z9cru
         Le9/nl9ttgg0Gh4qmLYomXA7huHCkUrHRt3Yb++B2bTZ7x8++lUDhauZ/RsP97IcGTji
         7pCjEwtjH9wNFbx4YS/DHST1HjgqSRPqkV2V/r4jw2sXvA7kY3CrAmevKN/P2M74qSrm
         uZbg==
X-Forwarded-Encrypted: i=1; AL+hErF4qcT8Gjcs8nHNfCa+ccqyyD4xAkQMpCAXIxZ0uME3KiG96Z+i0zD8cNdI6bOOAZOmAgy+O7BdLDZS1YeHnVVY@lists.infradead.org
X-Gm-Message-State: APuU4Z8gGVexZhwfsDePnDHMKLh0grhBcZfj/hghhlC1aabHcZexbE1J
	o/pvmDsTCSOm8ocTl4fnzcnDeBPnIn8Yacxi6WbJBKn8yWnO2mXLo304/F7HK4lY
X-Gm-Gg: AZFdTZdQLKoasLcqh9i6NrjGh/zgDNx5QaYEjlamWpKpSFbmjrHUFaoz+CViEh4bpBp
	KSDYVSn+JCVmi0ruIsVwaB1wYAZHxAYOr0cdqnnNAAvgb38K7QhohObGpEayvEziaMSihsX8RWz
	mL4dNamjk8/gLj26ctfmNDlS4I43UvFj8LeSVh5M09r6mNY6+03hi9DWCNjFcFSXgIrIlCR9af/
	lTXN+UMYkKX+whhrMe0bCQzLBl3jOGUihhYx++HXMkXKlmzMU8EP9gpQT7bc9ct5UmXLJFob96y
	OkeP/f/RSBEDVxQ0EUNLdIpkeKP8Dno5MGfKyG5BcFmMjAzpVXJ5fFGGqVAefPBkDvZk++U5I/J
	yt6d4QWGYRIO3zv6SYduZBb1JYTlyLx/DD6r02sUonLqFeUetBbgMsPJehYvLsYQP5/IeDz2hUp
	U8dxly6aRgoiyEzifQhqlD0Gu5Y0gWh2skxgbZ0eGpMldYAPzrWztphOt8A0JlxEPf/W40M2ZFS
	gLZlQFBAYoISdUl3EcPU45xQW3Tzr5menPvCC2rkWQMbgh2XQ2EoPoHSLRFLddbCDaXrV5Qpn98
	tPPu3xYCzxf+1u6ycT5BqU/0wkMjm1aoTUe4EnPUtyhe0ESqFRitJtABUpmUOvYAMA4=
X-Received: by 2002:a05:6122:4890:b0:5ea:c77f:2f22 with SMTP id 71dfb90a1353d-5ee8af637fcmr983653e0c.22.1795160956735;
        Thu, 19 Nov 2026 23:49:16 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a91bdsm1867232e0c.9.2026.11.19.23.49.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:49:16 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2db1b9bf2so178554137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:49:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBeL2wi11CW3pt2KFDwNXSazH0/wc6mE+sDUhQtn8uiDOCwEiYbq3wQissMkGYa1hjowrpKZMrgE7xsv7WF1h2@lists.infradead.org
X-Received: by 2002:a05:6102:6c4:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d7393caab1mr683612137.13.1795160956421; Thu, 19 Nov 2026
 23:49:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info>
In-Reply-To: <20261119225017.15a7b5cc@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:49:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
X-Gm-Features: Aa3M54rfGlA3UrmhLbFF7B0m1MfxoFvw1pyboKcP24dUngkkG_fWLkpDdrOnbn8
Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_234918_350887_28A753DF 
X-CRM114-Status: GOOD (  27.35  )
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

On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Thu, 19 Nov 2026 14:40:38 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > used for power management, so the latter show up as "deviceless" in the
> > consumer column of the clk_summary file in debugfs.
> >
> > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > the consumer device, too.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> >
> > The first change is probably OK.  The second change may fail if anything
> > in the oh->od->pdev->dev chain is not available yet at this point.
>
> Test on OMAP3:

Thanks for testing!

> --- clk-old     2026-11-19 22:44:59.810807920 +0100
> +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> @@ -1,17 +1,17 @@
>                                   enable  prepare  protect                                duty  hardware                            connection
>     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
>  ---------------------------------------------------------------------------------------------------------------------------------------------
> - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> - secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> -    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      of_clk_get_from_provider
> +    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
>      gpt12_fck                        0       1        0        32768       0          0     50000      Y      48304000.timer                  fck
>                                                                                                                48304000.target-module          fck
> -                                                                                                              deviceless                      of_clk_get_from_provider
> +                                                                                                              deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
> - dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
>   mcbsp_clks                          0       5        0        0           0          0     50000      Y   deviceless                      mcbsp_clks
>                                                                                                             deviceless                      mcbsp_clks

Hmm, so the passed device is always NULL, and thus there is no point
in making the change.
Do you know if these come from the first or second change in my patch
(I guess the second)?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

