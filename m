Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175FE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 00:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nXYWViFq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ajglaoly
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=; b=nXYWViFqb4e4B/n40opjF5syWL
	SB1qjophevj7CTiEGdIsDG+ahzxG2Cs/EgKWmm1Ky69DX2CXlGXd9ZITCuU9zc35uvS1zL3XGmBDg
	EL5DhSc43VIcyETu9SNRmVAl2jG6lY8lQPUk3xypiwXB/VQfBARtZaRJFUKpvnkmIMrAiijHaHKip
	Fz24Q1Z563CytVNjybHk38P4wmlfCGXi5tws69pyYKSpAnyi9UEpDMTmNCmYxZQQz89Z85pUz8oTi
	nEPzQ7g6fxLqhgY6Zx6Fmapb9irWXkO0mnKIXhVgGdk1wBpDwq21QplUe4CHbbrgHNE7FkzNLmLcM
	XJ43iVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOay-0000000GwmL-3zJd;
	Sun, 15 Nov 2026 00:59:48 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOav-0000000Gwko-2G8R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 00:59:47 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33fb4680717so6515604eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704385; x=1795309185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=;
        b=ajglaolyuVUZT2li9tjKeqas/SYAuvxP6Ca/YX1F8qKlvnulIAlumT0IZ+iGHdxZLY
         WfcQPef94iIpAVtQjz+ACVj+D+nbO8rrttQ4vr7y3Wj9duj8q4AuuJTPv1D1y9MfvZ6t
         ssVZKfES+sjNmEZnZouQjlxsmw/zy8b12O4JEQrffq6Vkzkx0Gju8pkaMMBa8nqyUyzx
         x0jgH3qsmPz5wT7iQU2GIwz1SPAWTymYlnuXV8Yj34ZxOmhSyYQNUCgBOOM1aisXwUQ7
         ojgT4OXTGyJXyOrYVsLAiH3AKd079gnhJX4Ye6e7Z5TgWMqy0wJCBRT87WA0m2X4cuX7
         N8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704385; x=1795309185;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4Ti/c1K26HZ8SQG/WnnVKgfJOZ1KY26CoYAHnXmIG8=;
        b=Al57Yl0lYph6mXGDsaDB3jyx7QxJakFz+n1hZ8xYvqWzKJ0DF/Kxg2VngNiRP+4DP9
         /yr0NkX0xp3I+hiUsenFNB17hlVBikbSuQJBIbGrq1nD+AG4nr88cjK76oT2AJT7KslL
         y1dF9NQ5sm0fquSt5c8t0GuUJS/vqoT5XTA7BwqXnVs4lt4TAXdbjO1GL9nQZSWHMUnO
         7e8wFgnGnaYNC5eHf9Ampye8audu86P2wCCWhjgniOzfXT/ozVcdsUOaTOeF40uFqGnt
         vYqSqNUOtBViIuXe7MnaTzijEJzr992QnWH/HHBWwy4KWWVWGoIyPI+Sjm1zQsHwG+JM
         CmUg==
X-Forwarded-Encrypted: i=1; AL+hErEjbaNL7YqAAs8aAj4Ol/Hn0tqEShrX85bvmCqIkFq5gXtsjwyGCNqvqwPyWx2zBC4Syca85cBuUIeT7uIJiq8L@lists.infradead.org
X-Gm-Message-State: APuU4Z9kfMle8pRpNjpiwnLBFAQO6EGk+S3ChdUXb66nMD6F0/yI1qVu
	ynklP4u5qN/h/XS3UYF3jXw//mEF4Ckzu5us8k9Rmwqy+RkSzY1g+04X
X-Gm-Gg: AYBFou2POl50Dv6kHWX75HEHCxMKhrUYP8rYycJJTX85jQebYQgxghzbbMJ3SQJGjLT
	WQ4PKbUgZ6a6TDS0tkELLU4fYFotgeTxs9pBZLhoIiQWJJNWCy4dkNujYnocwHBLHgugP2rnjFw
	RIKap6EEOGpErbjGPS6/FiCiCJ1Blv1reW9kloxPv4NwmNCHoqK3AYL4qgy46HDoCvDVKAOrKGV
	1P4ukfu7wzVIn3gXl1OuOrXOCLdbASJ7JKrAd4g4GmAmfTOwrf1l0MxGx4j1dwfk3I9YhAggGAx
	CjYo7CIZMSZqPoSK2vIwdRuf2AU78qfdr1pP6RJjQJ0StwA7tiis/TlwLm8G1Es6PHqS+io4WhN
	+8AVumDhboYovjHCPPXc24NVACExmcYtcbzhf5NQLYX6dsfNQNm/aC67n0hSDFeuqqLLFjZL4P2
	0J1jmsZAMD+uQLcFBo80vNGdvt3+W3wvS0gEQBu1zPD/vYiKij55H3juab0Kn//MCn/mM4EXxzz
	8HYy6DoyB8yUodAaUgdbf/gKlN9wvvvEvYtzau6pTX3yXiosba0KloOuYIlLMOe4lFo+Sd1thrE
	cc/2vFj8GNG4YFTElsGy8fkQ595CsOvYVuYkayKHOejq9FuW4HaeQ05QzI5Rs7UgS2U=
X-Received: by 2002:a05:7300:e9c8:20b0:36d:a466:9d0b with SMTP id 5a478bee46e88-37966a5c202mr7670296eec.19.1794704384537;
        Sat, 14 Nov 2026 16:59:44 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35687984eec.21.2026.11.14.16.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:59:44 -0800 (PST)
Message-ID: <03c0c33e-9619-4641-92bd-ffd0459f11db@gmail.com>
Date: Sun, 15 Nov 2026 09:59:39 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] PM / devfreq: rockchip-dfi: prepare support for v4
 DDRMON
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-6-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-6-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_165945_576462_86375A67 
X-CRM114-Status: GOOD (  28.56  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> Add support for the new control register layout found for DDRMON
> controllers having version 0x40. This prepares the driver for
> adding RK3576 support.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 85 ++++++++++++++++++++++++++----------
>  1 file changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 8490219f61be..8ba97af78e3d 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,6 +42,19 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
>  
> +#define DDRMON_CTRL0	0x04
> +#define DDRMON_CTRL0_EXT_TRIGGER_EN		BIT(6)
> +#define DDRMON_CTRL0_DDR4			BIT(5)
> +#define DDRMON_CTRL0_LPDDR4			BIT(4)
> +#define DDRMON_CTRL0_HARDWARE_EN		BIT(3)
> +#define DDRMON_CTRL0_LPDDR23			BIT(2)
> +#define DDRMON_CTRL0_SOFTWARE_EN		BIT(1)
> +#define DDRMON_CTRL0_TIMER_CNT_EN		BIT(0)
> +#define DDRMON_CTRL0_HOT_RANK			GENMASK(8, 7)
> +
> +#define DDRMON_CTRL1	0x08
> +#define DDRMON_CTRL1_LPDDR5			BIT(0)
> +#define DDRMON_CTRL1_LP5_BANK_MODE_MASK		GENMASK(2, 1)
>  
>  #define PERF_EVENT_CYCLES		0x0
>  #define PERF_EVENT_READ_BYTES		0x1
> @@ -143,8 +156,6 @@ struct rockchip_dfi_variant {
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  {
> -	u32 ddrmon_ver;
> -
>  	switch (dfi->ddr_type) {
>  	case ROCKCHIP_DDRTYPE_LPDDR2:
>  	case ROCKCHIP_DDRTYPE_LPDDR3:
> @@ -159,26 +170,43 @@ static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 0);
>  		break;
>  	case ROCKCHIP_DDRTYPE_LPDDR5:
> -		ddrmon_ver = readl_relaxed(dfi->regs);
> -		if (ddrmon_ver < 0x40) {
> -			*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 1) |
> -				FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> -						dfi->lp5_bank_mode);
> -			break;
> -		}
> -
> -		/*
> -		 * As it is unknown whether the unpleasant special case
> -		 * behaviour used by the vendor kernel is needed for any
> -		 * shipping hardware, ask users to report if they have
> -		 * some of that hardware.
> -		 */
> -		dev_err(&dfi->edev->dev,
> -			"unsupported DDRMON version 0x%04X, please let linux-rockchip know!\n",
> -			ddrmon_ver);
> +		*ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LPDDR5, 1) |
> +			FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> +					dfi->lp5_bank_mode);
> +		break;
> +	default:
> +		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
> +			dfi->ddr_type);
>  		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rockchip_dfi_v4_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl0, u32 *ctrl1)
> +{
> +	switch (dfi->ddr_type) {
> +	case ROCKCHIP_DDRTYPE_LPDDR2:
> +	case ROCKCHIP_DDRTYPE_LPDDR3:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR4:
> +	case ROCKCHIP_DDRTYPE_LPDDR4X:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 1);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 0);
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR5:
> +		*ctrl0 = FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
> +		*ctrl1 = FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 1) |
> +			 FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
> +					dfi->lp5_bank_mode);
> +		break;
>  	default:
>  		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
>  			dfi->ddr_type);
> @@ -188,11 +216,12 @@ static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
>  	return 0;
>  }
>  
> +
>  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  {
>  	void __iomem *dfi_regs = dfi->regs;
> +	u32 ctrl, ctrl1, ddrmon_ver;
>  	int i, ret = 0;
> -	u32 ctrl;
>  
>  	mutex_lock(&dfi->mutex);
>  
> @@ -207,10 +236,16 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  		goto out;
>  	}
>  
> -	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
> +	ddrmon_ver = readl_relaxed(dfi->regs);
> +	if (ddrmon_ver < 0x40)
> +		ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
> +	else
> +		ret = rockchip_dfi_v4_ddrtype_to_ctrl(dfi, &ctrl, &ctrl1);
> +
>  	if (ret)
>  		goto out;
>  
> +
>  	for (i = 0; i < dfi->variant->max_channels; i++) {
>  
>  		if (!(dfi->channel_mask & BIT(i)))
> @@ -225,6 +260,10 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  		writel_relaxed(ctrl, dfi_regs + i * dfi->variant->stride +
>  			       DDRMON_CTRL);
>  
> +		if (ddrmon_ver >= 0x40)
> +			writel_relaxed(ctrl1, dfi_regs + i * dfi->variant->stride +
> +				       DDRMON_CTRL1);
> +
>  		/* enable count, use software mode */
>  		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 1),
>  			       dfi_regs + i * dfi->variant->stride + DDRMON_CTRL);
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

