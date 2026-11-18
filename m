Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=riPyn1S1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G6W0Zgap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=; b=riPyn1S1tis9nUXkBSRMcJbgtN
	bz5iXincMXubJd7bIVUM3VuZDo49hljfMh7uHgcUZumSCd5qch/ebCOlgrWYdhmfqyR/dwY0XaOkL
	FvfPCXc90MuuhnTtYQna+ewlFZdFz3C9+5ArWL2cedz62Q4PDneKa/cDvOmEqy7H5I6TqalqW4upY
	20gRQjRjWurxS6qVu9nM2YOehit6c0cNgmdQIJgV1hwG3W4jKNG7b6EqI3AATm5VKuAzZf0rgMwJZ
	DnJSDcwwDmc/3nHnsKenLw67UQAon2+nir3Ppaht0I/1T94vEVu6iANQuweod9R48W2V0Ny87AjnI
	HCg2+qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkl8-0000000A2JA-0j6x;
	Wed, 18 Nov 2026 18:51:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkl2-0000000A2Hw-1erJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:51:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e3b22e971so817854f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795027906; x=1795632706; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=G6W0ZgapSRCPlDGA7vcqseAfBVIrd39SmOUUxX+Wumx1wwykZYfwOBulldDm6Yv66m
         bLl7ax/k4R6b+NoIpmTpoO+o8WNKZXlKwquTodsbZxDXv3COm87IQiRGUmYm4fkJwivS
         /Kgr2q/8XEmvlsd4XnopkAfyKlGY5MPnCB0hREeVokMfBW/ZACnf0IsWZWERyW1tgM4/
         +6MTdMHXOYwTBxxUd/92f3gpLgd5umGQ28Qxus0u650WhlIx5uJi5Tlr3mn0QuieRRgh
         Xu0JWuJhEHSv11z6sC60kxzSXV5fN3QO3NeCrSdb8lIlyK5mzrINSWXtBHKB7RYCwQh+
         MnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027906; x=1795632706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=kNpSYYi85CzKNQ6c4yHIGdsx1LVtfRu1LEyB3R3LFVGKLLe4FDqXZB+53dzHvyz9nF
         w1Q3gnDUrpxUJbG95de41D3MtyvlcGhVCeixYFE+Sv1/lz7sIxV3XGUVsb8+hxCh/YY8
         3BKsX3rhJLjXlRWj3RyJL90kIFxpwQFSgSoqrRAXolRPX2QB/oGEk3MYyBF+OlV0hseY
         jEuXqISFrpLQV0G5ptxezjost0UWUgaK9ZfLGLn7LXJ0C8xM3NHHkx6gRYtUhiL4nqi2
         C2umIQOj/7g3F8a156fIKbNraf3Y8bIK2PPsGta1Mh9XPs8BNjNeKsZyKCnThvUPxu0l
         s45g==
X-Forwarded-Encrypted: i=1; AL+hErESIoYu5VUU9QZQAo88XuTsqOA7Tdh0RZuwsHB/Dfa+m6GwAxsx/D0hyy2EDNNN40tAQejzupQ2RW2nrBWfUEBG@lists.infradead.org
X-Gm-Message-State: APuU4Z/G52lL7kNIisCeTvRnHdfKoKb7Qx6wCNhnrps4szL4vckYGNUZ
	vBKFDSpu5I6+Ix++0YzBWX7jYk4SVmHb6t5Dg5t31qy2DkXGKbyrSo5GVxjYpEjxEoc=
X-Gm-Gg: AZFdTZdXWuXNUHBfVN+rLBPp6jqGg/ARJkQSJIhjmmVqsmB61UoY73pkA0ccsjaEqZy
	hjzx02R/ZAuTjUwoYQldkdaGN1dx+xPZlNB/nddQlCe1DKorryrxOc5P/MsvBTmJyPyLONL9LFd
	brgiG7TjFuTHqi8WFZmJo5jH/IY16QP6ebaFzSEzpY204C74TusStPUCKaBjPn06HCQiB+fCTM+
	eLqSUkXvzzjSuwnhP2Bn/NozQD28JVdy2ytmSqE9WMStXRqMc2SxL44gOi+4T/FogHJ+0C/P8ZR
	wiL5LXmafyUCYkP+3CTolq/v/at96ay6Ir9fa8JM4FprRg4T4rYLI4uqXQJk3bKV3RvOakooH96
	OM+76mGefit3OFF2dga9TA5cX4UrWMotv+H5PlP+4Twgwu0Poz247LrtvZOOUfzKmC6pzFlWGrg
	tNOboulU41ADKU/3AC08slSq6dQRG1phCKc895VuPkA6e3cAUYUxpBVn4qCmEFCIz5glo7xMGrm
	jhFNwVGqX6DipS3Er/k01jCzq8C1XjakG049xtfwaJqrzxvB+PzoC0CxhXqU0aC/AZth/r5RVci
	1rv0thNjljOhGxtZmYmXOUya4ekSmL/kqZjMSpnposYXi/mzmgC7Cat0bNJ6/LSODZPsBRDWqtY
	fGwmxQLctxv3nb4pgVi9nuktRtp7DVvTvPH5sLjBLXDTkgw==
X-Received: by 2002:a05:6000:2601:b0:4a8:647c:f965 with SMTP id ffacd0b85a97d-4a8648c3f15mr2958154f8f.41.1795027905569;
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm5807868f8f.10.2026.11.18.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Date: Wed, 18 Nov 2026 19:51:41 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
Message-ID: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179499607256.413320.18141155995846183804.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105148_475050_A69B393B 
X-CRM114-Status: GOOD (  29.60  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > 
> > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > firmware and the init sequences set them up.
> > 
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +

[...]
> > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> 
> Not sure what this imply ?

It means that each of the five bits enables one divider, while the
datasheet only documents the five bits as a single field. I'll reword
the comment to say that.

> > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > +
> > +static const struct pll_mult_range s7_pll_mult_range = {
> > +	.min = 134,
> > +	.max = 265,
> > +};
> > +
> > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > +};
> > +
> > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > +	.mult = 1,
> > +	.div = 2,
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "gp0_pll_div0p5",
> > +		.ops = &clk_fixed_factor_ops,
> > +		.parent_data = &(const struct clk_parent_data) {
> > +			.fw_name = "gp0",
> > +		},
> > +		.num_parents = 1,
> > +	},
> 
> Is it the good old predivider here ? Shouldn't it be modelled with
> a read-only divider rather that a fixed factor ? just in case whatever
> came before did not leave things as we first expected ?
> 
> Applies to the other PLL instances

Nope, not the good old provider, this is separate from N: N is in CTRL0
and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.

Now, it was indeed a read-only divider in an earlier (messier and
unpublished) version. The problem was that with a cold PLL it could
cache the power-on setting (/1) at registration, then the VCO init
sequence would enable /2 without updating that cached parent rate
basically breaking both rate reporting and set_rate. The fixed factor
avoids this mismatch when Linux initializes the PLL.

After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
assumption is that an already-running GP0 has div0p5 enabled. That
matches the firmware I tested, but the driver does not check it.

I could (in theory) return to read-only dividers but with probe-time
setup before registering the clocks to establish the divider setting for
PLLs Linux will initialize, and selecting suitable multiplier limits for
any inherited setting we preserve (the current limits assume /2).

Any preference (or any other approach at all)?

[...]
> > +/* hifi is HIFI0 in the datasheet */
> 
> What is stopping us from calling that then ?

Nothing, I kept the S4 name.

[...]
> > +/*
> > + * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
> > + * each is two power-of-two dividers.
> 
> This comment is somehow confusing because it only partialy matches the clocks
> defined bellow. Please clarify.

Riiight. [22:19] holds od0 [20:19] and od1 [22:21], and [18:15] holds
the hdmi_pll divider [16:15] plus [18:17], which isn't modelled. I'll
clarify.

Thanks,

--
Carlo Caione

