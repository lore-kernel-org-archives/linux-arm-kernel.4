Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SdyAnmL4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dP6TNAUX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=; b=SdyAnmL4Ll95E9B3WAL8QINDyR
	9GiLL11ZCNWYSRYiTO5Rsi7aRH4X3rmIexfSwSt61OcJJzG4I+m3uSlLar5DCjwLZlTX+A/ctZ6iY
	UK8L09CfNxT6h329i7II/oFMB5M9snq6U7oDMjXoQKn7hjUyX1TqDWaUe2C7DnM36Ey9zOp/BIER3
	BwQwWWhl4Z31yuVN8+niww579dTmnDGi+J/h0uODtzz84FaQW9A0gdPJjOZF+HAK9si+NfpjQFpZk
	3Ichyjh5AcFtlE0CkZubV2Mn2i74k1j2DnIutAFjUFpwgGKrq7qPfxjysbxrrriuVcHWnl2lOQFu6
	5fsJeWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoDn-00000004SeO-0zDo;
	Tue, 10 Nov 2026 15:57:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoDl-00000004SdK-2L3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:57:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23638455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326235; x=1794931035; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=dP6TNAUXrXaLdtZZ3q8PYc0Ue6JYWZ7UJs8LIC6XCko5f1Pe/XZPXR9qSByh+YS+cM
         DsR03216k075U4/Nus87q7m0t0CXGsgCOKnDPOVmrxPj35IilCDx8j72Bt1XfXHBMIoF
         AC9eJwZpbExd7ie7oQilL83GJDPqGJEExdITaZW5by5Fyq4lF70GUjxSQkE2zlKwXDik
         sJJmb8hnNQnV40gIyYrUD9nsrWz10EZMWtQELqMxxRU43QxqCo2eM6nSNITHtSQGim4L
         mMX1z5EsltPQmWUmMh09NZlAY6d4aFkbH/ZjrdgIe99I/9W22S2uipPvpAIYcKI8ad1h
         M5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326235; x=1794931035;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=VCcN+vYvWHIbThsQJXcWMaxWG9AcSPEFCrGvr7nV8bjPVFtW05g280jmuRoNbj0ler
         QUhh50phmUK9x8QD+M4nBbhCTI++qXgu5qBHiyspG3jRd6vuzHd/bveUx79Q+6fZXxms
         D4MFh0hwSRMY4YCBkECa7kiKXZLyRGmBn/Z9pDYEroUC1GuQQIcqXUDLLm/IX0rUjpN9
         ppo9eKmWYWPtcQ+jXRgnAmUgTLS8TEuYTGZA9AYoQ/sHvGJFMlhak+0gis2nWF/KtL5o
         tZOeTGifKbFVqhOO9qhVYq12pArpIYlDFqRtQ7t5fj2yNTB5rIVqzyvxOk0ssArWhEYI
         MyTg==
X-Forwarded-Encrypted: i=1; AL+hErHUnLDe4W5iMVpzuVllLxyDmgrJlGXsia17jS0cIBSREF6ceSifHfTh7Y/EqguJV2Taeu/2xK/QN8McjC1MiMSB@lists.infradead.org
X-Gm-Message-State: APuU4Z/37XnUey4jRFKh51d/v5hu8uTw4Hcsxutlz/v19tU64vvVhbF9
	rNr2mnByKe1JY1jz2SW71QzuU+zn0OusK+4PYdN+nRnNVyYkhMtgVD2V
X-Gm-Gg: AYBFou1QbqxgCYtncAaUTYj7WMYSmJUPxVOrLrcrNtMVQfltFr5WFDDE5xRWsgPoisC
	9WAQJStcgpFGnYkEFU31x+Kh5tfwkJyyfLMSRPVVsvIht+AMqkLKldzIzdXw5sgI/+u5oMSw2re
	z00eM2RmsaEgCwXP0+B94Ptg5+gAKNuX/z0kPiuDBmjTimzjlt++FQGGteB/lD32hrz42rl4zf0
	RlKVGYIOz2T2Uq6N1bT+iX5ttUKKkFAu/fl5XLzQ6vOZvIlQyOdyVJcjLD3a99uqvn2k5nQFnB1
	c/Wfp+4vfW+lo1Q0fwdlU0jkmQsLKBdhmqDjIT5AQ8xG5NFanDI+r42EyYDfPjCVZYaTH/3Kdk4
	EcPOKB9eNdNTx4r78NYTwzCW19F5RKcapj3okC40ZaKa5VSOQHAOyJoq4xz10cEnfCl/zYKqi1D
	lm469RGX8vkUkOKkLC+56R1yQXuknmYq0WAjgYqeMhO/xWKowLlrVgDi3sWid7v/nhkoYgr70kt
	eimChxsnnuTlGiEqW0ySYPw0p5vMjqfovHinaz4/a6jYCnxvDoWmVHvWM9exx0MA9N5rBEaYjgP
	z8NeCCaHl94SecdTfasoMwuTw+lsi2nH+5j4IJSvccDrTxPkaXXnlsQ0L/EbKkl8dCfMgY1k22+
	KauQVydQlH5u5SmLekB0KnUx030kGXMIqvyYPo1UKp+J0eKzwhiP9Jy6QDT0BSt085iO3Fmv5x1
	yh605sx1RomFdptcyl4B4MkKv3XccK7KNA+XLCRbAs2Fop//p84H3YTpUICz1kKzfpHYtlGIOcE
	Mnu6wQNIhaXaKM4ZalA8XyGZb37N4YDcbOZpGzag7Y+M5G/CDdVTPvpErsN8f4=
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr57287525e9.4.1794326235267;
        Tue, 10 Nov 2026 07:57:15 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm56975655e9.3.2026.11.10.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:57:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and
 divider
Date: Tue, 10 Nov 2026 16:57:13 +0100
Message-ID: <jHidiYvvSNm_NWg1iHXN0A@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_075717_622576_AECC70D3 
X-CRM114-Status: GOOD (  21.13  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 10. november 2026 ob 07:03:00 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
> EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
> and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
> gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
> for a clock that runs at 25 MHz, and the clock tree does not show that
> the PHY clock depends on pll-periph0 rather than on the AHB3 bus.
>=20
> Model it like the D1 driver does: a gate with a fixed /24 pre-divider
> below pll-periph0. The register writes do not change, only the parent
> and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
> 25000000 with pll-periph0 (600 MHz) as its parent.
>=20
> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fa..d2625fec651a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", =
nand_spi_parents, 0x944,
>  static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0=
);
> =20
> -static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
> -		      BIT(31) | BIT(30), 0);
> +/*
> + * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
> + * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
> + */
> +static const struct clk_hw *emac_25m_parents[] =3D {
> +	&pll_periph0_clk.common.hw
> +};
> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
> +				      emac_25m_parents, 0x970,
> +				      BIT(31) | BIT(30), 24, 0);
> =20
>  static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0),=
 0);
>  static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1),=
 0);
>=20
>=20





