Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60002606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h6pEjsQy;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XUf4JWzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=; b=h6pEjsQyKdnAcE
	/Cs9P+65bjpFmK/t204v+dwbiuLJ4yJecwWyDBtgud9+/JPB1+C/r7M6rEfONaMjJ+4luYx2IxSqT
	4F4szaNEfmHJjIz1lRiu3/JsVaNFnAEQLJD5HX78iQPaCQ0skHZQt3j8kgkv/gIEvKwBPUBKZGhqu
	1nsOC4y0QmK/QreR8fn91/l85s8+k2AqsjQY1Wyy0mgZKM2oZ0nc54QTtW4RSt+PLVcGNxj1z5G7A
	4AbX60KNcT/7FHa7RqMu4HtWd2NeOP2c/uT+1BdTQuAALfzkayiABK+DCr1HOx+cJe/XwGfe9P0fS
	jJqfXSEk0nxIcmAFeX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxEl-0000000B9Dr-47ic;
	Thu, 19 Nov 2026 08:11:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxEi-0000000B9D4-22sN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:11:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so16685415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795075874; x=1795680674; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=XUf4JWzPKEWrTSrHPkv5rxCX/Y3yQnlG+w5omuSOEUsh9MI1mit3gV//D1Hs5qpZhI
         hj9USIoE1pAYQwGVZkfOtH1gGjxXzYmI+aOzUaKPyYTtIjKGPCnq8xo+8biYMlT0ckaB
         yFTPwikG8JVScjIzQNMiX2kj4NEbIz+M11EQbAdY3t4hNrHlOgpbK7tCV+rAVJPip+kN
         iputGHLmG0Fk8/vPLlr+TUVzqsnM4ydperySYp/paJpLSWofArKV1kMVDj1933ITc0aO
         tn6sCGEVJ1+b9fuGe/JOkIDAuItJylcUPUqftzos7ax3jUQzj7ZrTMhcYFHMzEJMp4uU
         u61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075874; x=1795680674;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=CJ+V2TkfvZhHUASJNiTcKGKpXi+A9C2dN+q4oAX2AADtQuoVhBLpOn13fPgfdxYUKK
         0ilAD/6pHpHYvawRR/SoDUl5vctYp9BJ+m9gFqUEJlDS2PPbWJfFlOoAp8KQn8HF4ZnG
         HyhfalCE8wBvRXdoG7i6ioW+ZJU0SrW3rxR/fsmNSqxDFCKu7zMSI4EsSvpQCJHfTd74
         hUu7IJADVMRTs0Az93dHYWMo/lb4ZMH3HdCMadu+3h/IF+m35gmztK7hsN12XUB9stPz
         DGkPK4M+/hpvqljPQGtqj+5y/W70gKRsGUf/4sclgtdTxE4OVDvFr/gH14YRjCCi4yoz
         uGDQ==
X-Forwarded-Encrypted: i=1; AL+hErHf4mt8JZgsigItGLoq+E0urz04Fniv9TBfvg1FS1HWg0lFt17Hs/QKizUF40K4j/NSxB6AKDqMNwOEFeazFc+W@lists.infradead.org
X-Gm-Message-State: APuU4Z98o3G5i5+sugtognk/r6XVwWnEIeAI1NXsIf9N8Ye8VtzlFoAO
	/mQDWTD7zDLck04rXSu5C3V5vRIsGw6Au/Jw3iRTDUzgI+FYVjMoCFXQ0ijfWdnWr0Zef6J+Wcg
	J/td0
X-Gm-Gg: AYBFou1FWHpsi5FR7MM5ddSLTaxmhJp/fAlBlk7USaURh4/rU8iDPi1LGl948T7OZ5z
	aPjtVXhwwD1HOMKjJRaid/e8sf58l96wbGnaqE1EpzEzczLf2LdCz21cckTbLZy97crqZL1GeFS
	D/R/Xji0yffopXlk8cNCQPGJHSp04Op5vhPoMLCP7qpVBN+a7GspymE5BwGSqj8vW8L/E5rZ0e6
	rHUBEkkuIcWbBnEHwwkiFGYmP9h0fEi8wpBAzeyV6udfRFfnefepKE5etl5o4shiR8xm2Axnmih
	vsqEndFqrtcmGiZOjdtu4Lb047MExWntjmmlCLFO/V3kcYm2awGxRlIjZ2FhlQ2L3Z0uESe4N+w
	2Bm+7V+yxTHT+38w+f3qpVlEjDhXzBPH6IkMO9gJLoKMRusR+pcBxd9iDymF08SwxJ415VK1P3R
	/E6OoEymGNxO/c6YFE4eAuD3xZsNvesWKIAQoablNzg7ptPCEv7ypHPYbp42GrvzFzSbXoB0w8t
	D3tfFCVgaNPFTKBvpbyDet/qw7lw5VrSMZP2T12qUathjIUAILmgazzptvWlr9vNrGSgxfmPp+y
	eByJ38ItLJ3CyYI2yz2IxRnfjHMDa67NI81JjChsaUMLewqlTDZVPKU0lXlgk7+Cm9uEsg==
X-Received: by 2002:a05:600c:6095:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb7da03b45mr88477785e9.10.1795075874056;
        Thu, 19 Nov 2026 00:11:14 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm21511305e9.6.2026.11.19.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:11:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
 <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
Date: Thu, 19 Nov 2026 09:11:12 +0100
Message-Id: <179507587229.639563.16969059581009770947.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3952; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=S/MfAZNg1Wj0rP92aDgSVxBVGdkD8yDNkTKcT4QFMoE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFn/1iu8i1iwfEKNoRkvi4zy/bIXjwRtU6/s8V0fuO3VT
 TWRBxHXO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjAR7z8M/2t8bt7abX4m7O3v
 3dPPaMWWVe2yjevLrM38W560U2uPUTzDP7Pci74zz3e+mZJ1qb+nmYnXff7OG779u5Xu/7N/fv3
 3eT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001116_569040_2E8B8584 
X-CRM114-Status: GOOD (  36.33  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 19:51 +0100, Carlo Caione wrote:
> On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > > 
> > > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > > firmware and the init sequences set them up.
> > > 
> > > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +
> 
> [...]
> > > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> > 
> > Not sure what this imply ?
> 
> It means that each of the five bits enables one divider, while the
> datasheet only documents the five bits as a single field. I'll reword
> the comment to say that.
> 
> > > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > > +
> > > +static const struct pll_mult_range s7_pll_mult_range = {
> > > +	.min = 134,
> > > +	.max = 265,
> > > +};
> > > +
> > > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > > +};
> > > +
> > > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > > +	.mult = 1,
> > > +	.div = 2,
> > > +	.hw.init = &(struct clk_init_data) {
> > > +		.name = "gp0_pll_div0p5",
> > > +		.ops = &clk_fixed_factor_ops,
> > > +		.parent_data = &(const struct clk_parent_data) {
> > > +			.fw_name = "gp0",
> > > +		},
> > > +		.num_parents = 1,
> > > +	},
> > 
> > Is it the good old predivider here ? Shouldn't it be modelled with
> > a read-only divider rather that a fixed factor ? just in case whatever
> > came before did not leave things as we first expected ?
> > 
> > Applies to the other PLL instances
> 
> Nope, not the good old provider, this is separate from N: N is in CTRL0
> and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.
>

Humm, still looks very much like it ...

> Now, it was indeed a read-only divider in an earlier (messier and
> unpublished) version. The problem was that with a cold PLL it could
> cache the power-on setting (/1) at registration, then the VCO init
> sequence would enable /2 without updating that cached parent rate
> basically breaking both rate reporting and set_rate. The fixed factor
> avoids this mismatch when Linux initializes the PLL.
>

If the divider is part of the VCO init (which I'm not a fan of),
this makes sense but it needs a comment near the fixed factor to
explain how this works on the HW, that you are setting this up
with the VCO init() otherwise it looks like there is an actual fixed
divider in front of the VCO no matter what.

> After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
> assumption is that an already-running GP0 has div0p5 enabled. That
> matches the firmware I tested, but the driver does not check it.
>

If a PLL is going to use NOINIT_ENABLED, then a RO divider is the
required approach because you no longer control the init.

To get the rate right, we could play a little trick but it would need
a BIG FAT WARNING comment.

Register VCO first - basically re-order the IDs. .init() runs if the PLL is
disabled or if it does not have NOINIT_ENABLED. At this point you know the
predivider is set and the VCO orphaned. Then register the RO divider with
NOCACHE, it should pick up its correct rate.

It is a bit fragile but safer and more correct that the fixed_factor
approach IMO.

-- 
Jerome


