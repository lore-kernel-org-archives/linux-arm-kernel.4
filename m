Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701D606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tnxa248Z;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I3pMIz5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=; b=tnxa248ZwmbVOs
	KtdcIZ4SJALaSqAS+DTAVFmkfUQBbP61y4ZMM328ps8oqEAL/zytBOpzxQhfXZJEgzo4+F3wsmQg7
	gxP25+a9LqBRdA6JoDKIv1+OlKjMBchktsk5DD/MkdGTxoyo0rUonZreBCF0+aOfp2M1X4GTDXJYn
	vvTR2CTyyhWiCKizNALtPRK2M+AJWulf0FIt7S9jD/zbwOKCVyMPfFzU6PcyJLe73OIkyNcuYN01n
	HTuMF4WYu+vGgqjuqdF9tFVA56gw2fkXXCfw6EcmPZ5wlqpH3MAe1sOpqmHYxAh3r2xACffCTs/25
	UOubOsGaUsacCKfP3YSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvtS-0000000GFI6-2wa7;
	Fri, 27 Nov 2026 13:21:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvtP-0000000GFH7-3FKY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:21:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so69662765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795785694; x=1796390494; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=I3pMIz5bhFmJ2MJaxqICWamZQvkHEhRGEGaToL4H+84m2UEYTz2YrA2hit5WNWZUog
         AlEsYyCW3mDI0ikkrf9GOKYVTCw+uN2eX10aItLUU40MZbywYf7eQU5/OeUDqamECsTL
         S/EzEpH+S9aWqmGqT69evftIS/9osIXinXr5vTnuwlOWJM2F32F9YOU8lYCxpYp5cT1d
         jOCP43rEh6aD2lxXCxmVb/CGc7HKcs/OWK4aF+/BnO+YgTpyLRvbu/vqmcRqlsVmPIks
         d9AibZrw8ITA54B/eyqyZSR2u7oZ8MiEkm781tXV9lG/aZzsPTR8FPwRUdIzGgsnlZRd
         dMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785694; x=1796390494;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=yYvlo1PzewEQIM1WOKDDfyVw4XZaBLv4RjfZJslXm5Cb5j6f0l/rT1wxPFBhn6360B
         qS6rC7ngJBjXSZ2vTdbhpGuoQpAv9C8CYhUjftQ0RsJtDxPajSbgGSLPoRvvVOpBC5w5
         slo4gTZCBj5R7m1CNKtjqK+oFrgv7uIwNrbGcw261JA+dgvH2uwMzqvPCJcGMCtO0BBN
         XvTHdCIgJr3ytgq9TpixxSO3bteBbnrTuIx6jpHWfNUsmgTFYPGQq1Ib+tad0W/qhDmj
         kQ0c3baRljJraobcw1VMce+vWK3Dr3OLDjaut+sU0yRyV2MrDXDyoKiqzJr5uGy32WI/
         VrUA==
X-Forwarded-Encrypted: i=1; AL+hErGkxn08nHWBO+iefAB6KG4Q9UctO6FBCswJqIOUkpdf6N7nJxT1uoBltmlie8/bUUKt4EWosZfmfeGzEyvC0Ihc@lists.infradead.org
X-Gm-Message-State: APuU4Z9Th12RpvmtGo4wzV3SInvkNBvtsbIFLJMBruBkfCylR6Czvt74
	kls5O8g+5sQOfUegDj4MSruGdJzXYUN35kjClui7Txg0s7Pbtdt+s5dkhURhG8usIEc=
X-Gm-Gg: AZFdTZek9ZzeuGfoEFz+yJ77JZybXFbfQEm6dmDCxzr7CT18jn1mNaDnhDldBT5H0Uf
	49PxQwo6HtrttjOmuLGkXDgQD1HyHs/k0rNzOPOYa0xPoueXWN/s56mrjAz9DtZcTfQD7BaWuZ6
	muRBkyA1POiBImQi0Dnfbw9HT2vr88+ZD2OvouUfpAD1ex5HnPi6ZLB+5hJo35NqVXKx6/67bqe
	PX9G8+rCwJd9hHIfBqHiB+PvsQWoT6nw8U56RENiNeOS+dvd9r1dKLfz5DMwuDyJDNPJIlPDUo/
	KN3gJzHOPdfjkN7u+Iylp0oSXNHQKxSakQyLF4z5HUDKrRkmCBVEa4aXfEXLMep5QXkBjKEYgxB
	GSy4BWhXD3Y7CkBBkIs5wJm64i7z20DQ1uqDdMUwS3cb+qbSHTLD6sMLtCvNbY7yZc554IIhwmg
	YV+R/NDel9x1adkRTQv/yrXRkB6S8LS98dT9pvliOwfT7a3kl8nYOfK4FGBD6CJ2tG5LSN5KM2O
	TjMTFW1EvzqK8ZQuCHZ3MNS2cn/LhGhd9MDUCGP7ygtnjo7ysA3/2y+W4kWIrK6FAo4fGt2TgNw
	z8anKks3tmP+czo0H1ceENdB1JElY7tehokrVJ2ulzJT/xYO
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr492570985e9.35.1795785693896;
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm772362675e9.10.2026.11.27.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
 <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
Date: Fri, 27 Nov 2026 14:21:32 +0100
Message-Id: <179578569228.3130490.14256403264790878680.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=E4dLgfAPlyGRAwDDbFxbbsD6Cc9CC30EoXytcCxZdeQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmczXf6cy9W/3oi+bV7cZXnU8vLz/4zK0vWJ22ebHPE8
 1Rj933DjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEykdjrDX9la7iuLNjZrtM37
 zPl+mruZ18OzH1TXHuZwtM4/pKVmeoLhf2VL+Znd7z8cP9NrZe//sNuyqU+n/2fIGoVzx+ZwPDh
 Txg8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_052135_847116_61DBBF08 
X-CRM114-Status: GOOD (  23.96  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> >> -static const struct pll_params_table axg_pcie_pll_params_table[] = {
> >> -     {
> >> -             .m = 200,
> >> -             .n = 3,
> >> +/*
> >> + * A pre-divider value of 3 provides the best performance for
> >> + * the AXG PCIe PLL.
> >> + */
> > Again, define performance here. what does it mean ?
> 
> 
> To clarify what "performance" means in that comment:
> 
> Some target frequencies cannot be achieved with N=1, requiring a non 1 
> pre-divider.
> 
> N may not be 1 for Amlogic fixed PLLs and PCIe PLLs.
> 
> This AXG PCIe PLL is designed based on N=3 for optimal bandwidth.
> 
> 
> The AXG PCIe PLL rate is:
> 
> 24Mhz/3 * 200 /2/8 =100Mhz.
> 
> 
> I will update the comment:
> 
> /*
> 
>   * This AXG PCIe PLL needs pre-divider 3 to hit the target frequency 
> 100Mhz,
> 
>   * which also yields optimal bandwidth.
> 
>   */

All I'm seeing in your explanation is "ability" to reach a rate, nothing remotly
"performance" related. Either drop the word or explain what mean better.

> 
> >> +static const struct clk_div_table axg_pcie_prediv_div_table[] = {
> >> +     { .val = 3, .div = 3 },
> >> +     { /* sentinel */ }
> >> +};
> >> +
> >> +static struct clk_regmap axg_pcie_prediv = {
> >> +     .data = &(struct clk_regmap_div_data){
> >> +             .offset = HHI_PCIE_PLL_CNTL,
> >> +             .shift   = 9,
> >> +             .width   = 5,
> >> +             .table = axg_pcie_prediv_div_table,
> >> +             .flags = CLK_DIVIDER_INVALID_ZERO,
> >> +     },
> >> +     .hw.init = &(struct clk_init_data){
> >> +             .name = "pcie_prediv",
> >> +             .ops = &clk_regmap_divider_ops,
> >> +             .parent_data = &(const struct clk_parent_data) {
> >> +                     .fw_name = "xtal",
> >> +             },
> >> +             .num_parents = 1,
> >>        },
> >> +};
> >> +
> >> +static const struct pll_mult_table axg_pcie_pll_params_table[] = {
> >> +     PLL_MULT(200),
> >>        { /* sentinel */ },
> >>   };
> >>

[...]

> >>
> >> -static const struct pll_params_table sys_pll_params_table[] = {
> >> -     PLL_PARAMS(50, 1),
> >> -     PLL_PARAMS(51, 1),
> >> -     PLL_PARAMS(52, 1),
> >> -     PLL_PARAMS(53, 1),
> >> -     PLL_PARAMS(54, 1),
> >> -     PLL_PARAMS(55, 1),
> >> -     PLL_PARAMS(56, 1),
> >> -     PLL_PARAMS(57, 1),
> >> -     PLL_PARAMS(58, 1),
> >> -     PLL_PARAMS(59, 1),
> >> -     PLL_PARAMS(60, 1),
> >> -     PLL_PARAMS(61, 1),
> >> -     PLL_PARAMS(62, 1),
> >> -     PLL_PARAMS(63, 1),
> >> -     PLL_PARAMS(64, 1),
> >> -     PLL_PARAMS(65, 1),
> >> -     PLL_PARAMS(66, 1),
> >> -     PLL_PARAMS(67, 1),
> >> -     PLL_PARAMS(68, 1),
> >> -     PLL_PARAMS(84, 1),
> >> +static const struct pll_mult_table sys_pll_params_table[] = {
> >> +     PLL_MULT(50),
> >> +     PLL_MULT(51),
> >> +     PLL_MULT(52),
> >> +     PLL_MULT(53),
> >> +     PLL_MULT(54),
> >> +     PLL_MULT(55),
> >> +     PLL_MULT(56),
> >> +     PLL_MULT(57),
> >> +     PLL_MULT(58),
> >> +     PLL_MULT(59),
> >> +     PLL_MULT(60),
> >> +     PLL_MULT(61),
> >> +     PLL_MULT(62),
> >> +     PLL_MULT(63),
> >> +     PLL_MULT(64),
> >> +     PLL_MULT(65),
> >> +     PLL_MULT(66),
> >> +     PLL_MULT(67),
> >> +     PLL_MULT(68),
> >> +     PLL_MULT(84),
> >>        { /* sentinel */ },
> >>   };
> >>
> >> +static const struct clk_div_table meson8b_fixed_prediv_div_table[] = {
> >> +     { .val = 4, .div = 4 },
> > Previous table was showing a prediv of 1 ... here it jumps to 4 without
> > an explanation !
> >
> > Also, it is a RO clock, so what is the point ?
> 
> 
> This is similar to the AXG PCIe PLL case. The pre-divider is fixed at 4,
> which lets this fixed PLL output 2550MHz and gives optimal bandwidth.
> The table was used so the fixed PLL DCO rate can be calculated correctly.
> Without the table or `CLK_DIVIDER_ONE_BASED`, the divider would be 
> interpreted as 5,
> leading to wrong DCO rate calculation.

But you are hidding a fix in a rework then.

Your rework should keep the prediv as it was.
Then you can change explaining clearly why you are doing it, with a proper fixes tag.

-- 
Jerome


