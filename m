Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A7606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a36kS+2+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRtauu45
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=; b=a36kS+2+GhraLR
	6SwohtEXlhWawQRfg0Hs3RT3/hkpq+s71QAgBNl2VUCOGdr6PPY19Vyw6BHLxBLuR9QQ7BxuVwqjl
	Aw+9kKwB76v7uVLwMDAjUyF6IRN4BhhUUNzKRgRZvEvE0D7IswV21b1TApHFFdEVCebYHxDVQwGlL
	FfWI8RMqF3ncMPVLMwlngSskKNs7L0ITf9SoOPuCBGaqRHym/kBdMLAAd5fxwSfplEdVYZi8nqcTq
	WEwB5H5we8QYflCLRgfdVG2a9IgR3UPowJRa0MBQ2sSuDEZM4XFoAuMrvkdgsyZu0uIONi8TWvGQR
	3iWZ8z4O4CAF5NrZMx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxFD-0000000EHU1-1ZAG;
	Fri, 13 Nov 2026 19:47:31 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEz-0000000EHRf-3d51
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:47:19 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36dbde64409so2086679eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=JRtauu45qPeVQO8sxGEI3ZxIfWV+SnuMj1jwL1uwRkzOLebu/rbCtOVG1bSWWyYGnA
         g7RJPSa9c22Dp2MUOF7jcQ1/u+iPwY/wPaSiPvao/+qfNFd2xSU9JqVSLWIqpj8NY1qt
         f8gU9hnvAt+V/tJM/H75CTGCxWFVuov80LMu5++k8S/lqRtexJt4zr28vl4serpUklqv
         ffsQ8nluLfhRcARmi0roF1z451LdtDd9kJxDgnT0NiNTJuIAjy2o8MYtu4i5MXRZ5XC/
         GVRRztaKvfuNiP6446Fm1MnH8iANLGoKE18rYavUEqyI94yEVzD65eW3tWGvaXM0B8CJ
         uWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=iJPBzOfhKKxnBG9a8FpbrxriGZwBrqkSiRYCZthWo5x/vkCZY2EZt4MOhoCiN633+W
         jaINLnaFJIJKlMjsm1+3s4xoNFcZFWNWvmcBU9O/+pVa7zCzaJWREXET5R+5/8i1Yb5z
         lrgBtUV6I0lPlky83D1oIu5tszXjpV2DReZzfJBC4URylbYoa8iEw6A6pH7Mx7hrwRPY
         l4mQr1ujE2ZkUCoRxQ+gGxQiFB/62Aj2Rg8StlGxyvDBEwuNvcnesOvKT+vh18+N5dJH
         IvBV7Np64ZMxrWf79dpXkmlXyzdop3zh67j7IOyjIVz6QrGd/vgI24OoXPwUCc2zqA3C
         Z6EQ==
X-Forwarded-Encrypted: i=1; AL+hErHdIfb63NReFYaFvWV1PVWYmwASQDRj9370UHMujhSjT/s6ny813TXpRY3llyDjZvpK7/yduDL7CY1HkaN2dSIo@lists.infradead.org
X-Gm-Message-State: APuU4Z8VBU7zxZmBtpDV1tDdIF8daqHg3aifADuoJw6Jpy9UBrs27n7g
	1vJ15vtjwPQ8O0kGPpJItyuTNPajSDzpGvTWz6CbnAAasshOSBKLvmb1
X-Gm-Gg: AYBFou29CamFAUN5wUERnniTnu53zi++p+mnWFhpPj9KhFiCORyXcgKSMitSOdtJ7l+
	VGXxz0xOECNBaNgc756ErNX+8Sc7T4FlJ/HbigF1kqL3v4fD2zgDmgwhDHgnWewzIruv8PvUlg5
	C8LttxtGlozGCJnx6OCF/fO/pOjEROWkPEOo16/37+fTLzEDmY9Ov8eOtqrTMAxwLUswBl0ZzpQ
	2Lccbu8cfa/x6/KGqeVyiZDs/DgG0XG+sF6wukh2tEN6IF+UvtIrnMWHA+BvSzg4uslRxsh432z
	2Tn+EIeDqF/c14qpCH2GZvdXEvYpmRXhVVVLzd58BgARZRU8dh1rf18elEQeRecaCPiZFsbqZXv
	0mseSGyis0tDT2iTW43oiIEqXsQ/6Rovpv3gJyg7dOIx0HiEDaKTjkkUUwQ3FVyuPGdoByGu4vf
	/NUrujsyB8fZ3RLjVLZ5xQwj0zgA/p4gTf/0sLeKvbGQHq9byIvwcx8RerJiuQaGRROi/iOwvMl
	GcNuO/jkH6J8lkEM8FYepOPzTxhvhBzmHZmQGJE8Q2l6/JBJhrKbV7bgo/WfyzeISHz2NRj+jik
	qiisdMNewfLczdVRT0RGWKS74FH3QwE+xY+LhCQe5xCM8so2u2GleEGqcd4b3BmUHw==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114717_964630_3E75C63B 
X-CRM114-Status: GOOD (  16.18  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks


