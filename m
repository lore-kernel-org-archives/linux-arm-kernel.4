Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B96606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iq9/HM/z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhWPwhW2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=; b=Iq9/HM/zMPiglkcbWRtJzQfCD/
	1L50Fawx64Tc/lhDph+uB3WLMNL0K5mM7/5qUTao8fqldKO6L9cKE1WGgexDfcQqkvFyMa/YXHF4k
	QQoVINBgwCIP8ubPYEsmTYJpX43LFJY6yWitwhgoGaR3jV7JeRIoSxhrsr1lIz0y8Wzqi8Wm8y47I
	NhzI6djuWki3vh9Buc+WkkGlTqt7VWy6t5lGpr+Ug/q3uAjpORK5QVZT8S0XhLgOz0N/scB5PjQOJ
	IP2sueEIqZQ3hhuRc8NFy5ypYl+XiglIxKKJwu2rKsW3Vc+ZZBcE16mh4VXxYyu403XWGBgywZY/C
	IhHnl4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ5Y-0000000DHOk-0q7q;
	Thu, 26 Nov 2026 13:00:36 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ5V-0000000DHNR-0O1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:00:34 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso3592907a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698032; x=1796302832; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=NhWPwhW2pc1GhJvgBUI5MYDa5DfIZLTSAiutesfhLdT4oaOB1AG70TP/bKXzU4Snks
         sudjwcS3Nbg9dhtiuzmqV0Fz6ztDsX69HjJbqvpOzCT9doAFXCQyauWzCW2qFrz4ZEDP
         +D7SCTYXOfupM42l5rQIUY3k4hW1PsxJcWJddWThjpDlGRzM8zPzBCihlkTuBWn+RXHa
         79e8zprN5mHnE1QBASADGNEu5NdLorXnFybthd7fjAnhwJP2kVFR4r7YxFHvKTu1p6Ib
         BC40AQHxU0BElSug16B1Uq6nRZzfqW4yLJs9I34ADxzGFAOzV0r4Li6Q36BtB7AXzuaV
         RUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698032; x=1796302832;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db7swx/z5fRcWKIKhx/36FX+1LnzR+96h9IjzqTpdvs=;
        b=IG1XSrFFXsnBn3k8uoIyBfliVW2E55h6TOk3eIcjZKs1WLgU/LppDM2xRhb6PfqD8V
         kOcUhOXHg1ykK8Xag3zO3Rg1d5CudrkFaaOVKOWRI3Cq18tA4344cu4qDtXjoWhTGMm1
         7VBSiMiGcrGrs77dZY1urq8+7UCZ4cXwjob3Q/JPlhEdEln5ySyKv2HHej5YfCG/IszW
         BTA4rujLE+WNOhcASVUv2x6OSVjFtez8vhgoxom+RsmTa6FjI6HNfeh8h3fIFH2hmXyi
         mOzWYATNJGjyT+9HQJdxaN3DyuBSViSafsmMEH+FH1zp0/VxHAuAeCJWoriagCpkbCRU
         80+Q==
X-Forwarded-Encrypted: i=1; AL+hErHa685tDnNaOBhiUiw4wU+iszLUQCuWkXdn3nKYk9AgSMjett2TxqNRvBJR929cl/LdIJBprymaGCpzanpQxfd3@lists.infradead.org
X-Gm-Message-State: APuU4Z/co5LdVUi0oW5O3BgYtO0kIi4DdGmOkahA5XAr4kZ/E8qJT0sH
	ZKiRIcI0TlURMlLWFTPF4wNAGx8cPyv6wvxPXPi2As0xSfpbV/+MU52N
X-Gm-Gg: AZFdTZd71jB5ei2TW6yklJ3Jnt3d7J1cA7K89lj68Qc7TVnRtpevYX96oPCttmKEtOw
	pZbgD9DabJ4lyjnWk9KqYKVxcKXjIoapTN3TGeZHL+rBLHlhasV1a0axodxoN+dlNd7mOu/kogU
	dD7RhRc5EQI14mW8fvvxwVQSjGPeDVBJJYYbLtzwtv0saXzUagefGUensD3zIz4sXFD31m0aG/O
	2OiwIUAbmebCxMGkYrcoKPVnuaUETIoIRJfYDC+OQHIHpbN4AYNADdzegpqsM1ZGcycfYqYLOQH
	W+UMWtAXCzhZ+AeGpa88bRTnKspAPMIWEAyJNLdaJu85lh/vQ35Twgtv63wkHoieAxToezHDluM
	A6CGpFuoctyvK4n7MTCMHeB/LIoO6OdnnW+o2tE7SuPeat/kpWtS12xQ7PVohbFkjucOdHv5H18
	MWQC08ZizTODuLCii1UkPdNKZ68D1kWd9/DjEKuny9mVfyuGDSyNpCBqPi4yjDoxjZRmkK6iBK9
	pdNH8qcEFjDX+Ci3hKIjMuhf33z9Z08xWk7qqQu1YImHzIVh8ICulTpSZRTmxNB/EWaQBTcbvxo
	SIjIq9PQmzQGODZcknwPpVC4UGhW24cqykcHioPzgOtYxTpJmgkd
X-Received: by 2002:a17:90b:2cce:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b41c9759cbmr21021163a91.54.1795698031561;
        Thu, 26 Nov 2026 05:00:31 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm17077789a91.14.2026.11.26.05.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:00:30 -0800 (PST)
Message-ID: <772ec0ea-da77-42e3-a281-8b8b7f364bf9@gmail.com>
Date: Thu, 26 Nov 2026 22:00:25 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
 <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050033_143685_B0FC6148 
X-CRM114-Status: GOOD (  31.36  )
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

Hi,

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
> they weren't modelled before.
> 
> However, they are now correctly modelled, so the driver should use them
> when possible.
> 
> Instead of unconditionally getting them for this SoC, add a new variant
> member that specifies whether the driver should let missing clocks
> slide. This is needed because we want old device trees to keep
> functioning, as otherwise we'd be introducing a breaking change for
> literally no functional difference here.
> 
> Fill out a clock name list for this variant as well, and hand it to it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 2b9d9b26b11a..c51d7eeec394 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
>  
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function
> + * @stride: address offset between the DDRMON per-channel instances
> + * @ctrl_single: whether only one DDRMON instance monitors multiple channels
> + * @max_channels: maximum number of memory channels for this SoC
> + * @clk_names: pointer to a constant array of constant clock name strings
> + * @num_clks: the number of elements in the @clk_names array
> + * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
> + *                   DT binding for this variant didn't require clocks in the
> + *                   past, so that the driver remains compatible with old DTs.
> + */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
>  	int stride;
> @@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
>  	unsigned int max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> +	bool clocks_optional;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -806,6 +819,11 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3588_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
> +	"pclk_ddr_mon_ch3",
> +};

For proper operation of this patch, the following patch should be applied.
The following patch is applied to other git?

https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

> +
>  static const struct rockchip_dfi_variant rk3399_variant = {
>  	.init = rk3399_dfi_init,
>  	.stride = 0x14,
> @@ -826,6 +844,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
>  	.max_channels = 4,
> +	.clk_names = rk3588_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3588_clk_names),
> +	.clocks_optional = true,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> @@ -885,8 +906,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
>  		for (i = 0; i < dfi->variant->num_clks; i++)
>  			dfi->clocks[i].id = dfi->variant->clk_names[i];
>  
> -		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> -					dfi->clocks);
> +		if (dfi->variant->clocks_optional)
> +			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
> +							 dfi->clocks);
> +		else
> +			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
> +						dfi->clocks);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to get clocks\n");
>  	}
> 


-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

