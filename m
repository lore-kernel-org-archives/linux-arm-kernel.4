Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC69606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8/V7B3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=; b=u8/V7B3k6inTTSAUw0NOVgqhmf
	xfu8IGpXDyyW3CvbtJViOEd80bITTdmP4DI9Obmlb8c0zmrHNK3hHAtARD3E00rgzPbzpw0cCSc2e
	tmlNFTEsBQxNQhH5tsgBhj0K8iFCBuDpUijiTeSo+2m/HtysPAMxRAGgeUwEGmNsXpPfc+Uob2q1P
	gzTAo4EzT1vDT4+lMbq5cWMtY//uRE5tdYPTpBOEy1OhzDGdciA2qqRaEDktl/BVeVFgmU4RgU5Py
	tHsnHD93pba6TNLrW6W87lnNb5858AbZZ1rj/xI/FV0pk7L8lKHie9nfOEsFtX2OW56QWdbLr4/Vw
	UoiT9uYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJIf-0000000EGil-17o6;
	Fri, 20 Nov 2026 07:44:49 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJIc-0000000EGhh-09pc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:44:47 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ab99038afso397527137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160682; x=1795765482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=;
        b=WdCAHwGlPvLGC+sUJz8p6C/tA3phIcWLONNrc/cBhdK1DG3AAdlfQD50O6B1234pFG
         Fe6dLyyb6ThnuHv2qO2w+dp9IsOl5KPab15WsK7m4/+OZ1rJ7fkDKsXKkT5KLXr0kY57
         BB8oqBzjNH0S4NcZAI6jjzknLrt7RQsDkttXhv1dP3L+WJssDvlecDUl6ps1sHkC4W56
         EFI2FdmBr9bgbzsxH4STVOpw2PKUUl9eIul+oMKpKTJpSExfeOzfLLiC4s2TRLK80Bd7
         AbhV32Q0WawyhikyHKcWEA8VUDw9i8jCIAX9nyO4WB4csxlGUQFqYE2zxK5/BBOLwpNe
         gOVQ==
X-Forwarded-Encrypted: i=1; AL+hErGPN3Nz0i9gR7d+iL+VThZcps9G93U61XZlUKojCyea0bH15yN3pjZzYxet/0Vncvua/LNRvNOGBO6j+XeTgR05@lists.infradead.org
X-Gm-Message-State: APuU4Z+TzlzFfyRwJ/4lYpt9dYaAWFUX3lRJ2CQC1akzKFtXIbq0vK7X
	tLzLeu8nqBCEDX+XiicSHT1mkcqa7A8HpRE0q60mUVXePX6Z4k1agT4DAuaKIwil
X-Gm-Gg: AZFdTZfDyiyoplZapaBXDjR7QlkPnxmpwHzSKpHJ9+IUYUW2Gn+8xL4qPEKYSBka09O
	pBbYmXAtcF6/fcH7P7kguqOrqqrRbyF4ksagMIAKvZbpbUZpq8s7wDKQkGOmAs4pAY+rNnVobgo
	3Iq3VLq2S5KO83dtN0qtM7Cv4ZiyAGqiz7KPrMu4b4eTULRIRRgmJqTCiRg/5gD8/BB/9p8FOJN
	qDxgOUXPIDWdezrqt2Cwm1J/tj1y3I2fVuAFZaT4R4nVBf/95QFH7izMT4vIWxyn2iKBAorYys4
	++3tklWINFy8y8k4z+xcfeA27RCMsHEe1WFuDhPP9/gNSvqe1zKz7snYPojBzNhcoiNqDwSldZo
	ahn09jK/iQcnz4E/wO4OE12jSN4LbSjSLaMIDG2P2OEIhnUymNH/dROJLHa/jm0p3NtP7xNvBd7
	3oh1wjHoenIT/MHA8XrDiJRO3q1IX+MBi/AbBy41No/QJkDZ2abWYYVN+YvgyNPwSu+x41riTeV
	XhG0J61l2BNIh0cj+l6JMT8a5p4VxIqOdlnC+iN0EuGlfHgPorPJzcEbXi2yUZStkF6LawIiKJj
	DhrxsIuLOw0lpxaEq176kpIhzjf3qPwdAbZs0rHN7FHAs9HvwTUzbuyVEFUDpp1M5+s=
X-Received: by 2002:a05:6102:951:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d73939011emr875548137.12.1795160681637;
        Thu, 19 Nov 2026 23:44:41 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm1895533e0c.1.2026.11.19.23.44.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:44:41 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso338050137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHo2jRTEcVwnbKNoD3xF5Zp5K7J6mp+h2j1AYQxSDTJ0sXUcmllLKVIDW4l7GucS6RGvkrD7evUqRpg+EyBOh6Q@lists.infradead.org
X-Received: by 2002:a05:6102:441e:b0:7cb:bda3:27ab with SMTP id
 ada2fe7eead31-7d7393925f5mr941037137.13.1795160681386; Thu, 19 Nov 2026
 23:44:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
 <179513882271.284394.17357508909448455391.b4-review@b4>
In-Reply-To: <179513882271.284394.17357508909448455391.b4-review@b4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:44:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
X-Gm-Features: Aa3M54p6yw1Lhc431P_jQfP5g0YMf_od8mct8UUR6SclOJC7dcSgYi-awR9w8qQ
Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
To: Brian Masney <masneyb@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
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
X-CRM114-CacheID: sfid-20261119_234446_311888_391F3D3A 
X-CRM114-Status: GOOD (  22.60  )
X-Spam-Score: -0.7 (/)
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

Hi Brian,

On Fri, 20 Nov 2026 at 02:40, Brian Masney <masneyb@kernel.org> wrote:
> > This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> > about consumer devices").
> >
> > This commit added a struct device pointer member to struct clk and a
> > parameter to clk_hw_create_clk(), but the new member was never used
> > beyond setting.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/clk.h
> > +++ b/drivers/clk/clk.h
> > @@ -5,8 +5,6 @@
> >   */
> >
> >  struct clk_hw;
> > -struct device;
> > -struct of_phandle_args;
>
> Did you mean to remove of_phandle_args?

Yes, it was added by efa850487a6b6742, too (although it was
used in that header file before). Currently it's not used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

