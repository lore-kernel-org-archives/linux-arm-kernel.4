Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1553606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxXv4Wra;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFpISNQY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=; b=FxXv4WraQxpRgpWJauc44ZPsNE
	r2HkszdnDbQviMZQoAsEENpJvwYoPIVd5hBDyQGzlU/cOo5JvxrvBzby7ixQhl6IUVAcLGICZeCdU
	MBMZuLtg6kaAM/roVW/JPWq65f1/GQmgNAUbdjSu1YFBUzVh/PMlND+DAG4lPG7tQKT4ma6MKxR5I
	rtf9l3rVbsv7DwsFqHE4sB2SAwlD7KmcaWgSS8nFsPmbPCqKpbn4xXTV4sKuB6N0Vy9GjtMSmJTax
	pz3N01v8SAc9PDqYZ+EWyB7ybf5gWdLUKG15bT8+o04S9CffE3mNRU97yYsYGDelL7DljCO9bZs2d
	4BJLSjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSObR-0000000Gwvg-0PwS;
	Sun, 15 Nov 2026 01:00:17 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSObO-0000000Gwun-3kPy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:00:16 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-37d424f1ae8so504231eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704414; x=1795309214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=VFpISNQYxb3mtmrvNaAeGsEjR/w0J67+sKQ9bj21EacLxgsLlELnvwEL9B+k8dHh2h
         vDp6RRPmJM3SxsfQX/IDdx9Nt4DS/lLxMd9jDBHCWAGKooFPFWOqeSJTggY6h4NwOPZt
         JNeHl6ti2EoWjDX2WLhejAgZT+NVVgnfAR8KrWXArdSQGxwPzz4S5uUuMl0GSTd1aXvS
         +oj13CWbi7OrwKAPun36/OH72oL5rXunUrboxIf7rnDNdBNmLE3ZjJ4jCXDycMTMDNnf
         jVXd6ZdjuNmrslmVgMAo+iHDwDva9wjQI/+Keyuqs+ul7XPICfUewCVQyOV/wkoBj9Cf
         qNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704414; x=1795309214;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=tGGINdj5OGQMaKwtIZ+XILYDPeL6r5Lt6AG9+A7DH4KdfEAiknrKrlsuLl8QXfjuce
         /O2OzKN2dcQtufLs/jZ79e2+MMRaFSl7X6aUhDHNVVFTHES2zBvoJeNBJNFp+fn9EbL1
         +A9dd9vqkdUrdzhxu4QrkKwV8CBoPOCOsq9atvOwjv9T4y9lYisP3gRwiyGmQAjH2UPi
         6CQb76GlDB7tC6xats8novjvz6MfueqmxIe5fsKk/JTlR9MEXpfVwhr+L2fMhz9DnnmM
         4vmQLrOPC+gQ9rLU/I+Q6zDZncpM75/dZ4rh7TeX7yEHqAicSobl6Ig9aTU3gK5s8tBx
         yTcA==
X-Forwarded-Encrypted: i=1; AL+hErHhBn6ufNIR88iquofa0iAR7LGUQApiPmVWYitPDaRc8Hd5qwoaVDM3MZ+Jk4Mle/clB7pNn8tRoTcosp1+MLpS@lists.infradead.org
X-Gm-Message-State: APuU4Z/yIrhoMc3AZNfBvvW9602PN+JSkeQUe3UwY/FbZ/oC07opkZWd
	UDkYWBDSEthXR3xXInlu8YN2NG3XU9yqgJhDYPeuQzB61QVU4KbGuU/b
X-Gm-Gg: AYBFou2XBQaNMoprDlG7W90zVAcXyK2SCpKIAB1KBCvM+Rf6feBg+6jQldAYouRJsY3
	fYRmKDCKawfhuqzlJ/LTktd3BikZOI69H/sHBEphRMsWR2zcc9fqdGBu3dfle/AmpxgnKlgAjVi
	4YGP0OGWfv/5Q/x9uNblKSx4BFHE58+/9HTbhPM1VKlW1J1iXC0OMqgjn+f7ejt4lhkxIInNZ9U
	UlDQ+8u3v6WW4CiWf1FzeXybKc9nBe49aqwVNAGd0FU3n+RBxooRvkPpTrTeN0Hs7esa7Uqx99S
	rPXb0wyAmJbcKyJ/WzHU3RVoYtYyiZ97+a0boShiq4Z/uRdk6MV0vrFnRtVncLt3Rj/T1uBRQtP
	NaG4hx1Rm7bWWoKtm+UQERYmB3q3WHBW098Eb9w3EEndwl5NuG/K4e/qiayXufr0MWcbo4k0WMx
	+at3brWaqya+zjucuMBQEAdy6/lLp0gJkZggkrSTJe7idsxhW/IYRK1wn2QWQPi+sf/QhT7tuo3
	FsCcI3EfavAydhTrTHRjUXrUr0eTKya2kiITxy7GRwSAMis6s8/+V8jlZCxBS4YAAZlRD4xXUIo
	TT15sy37scfNX7Z8lPRFKioNpIKrd2a+1FQFD4Ku29LxKu7g1wCn1TE1SJKu7iOus1M=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr9267695eec.25.1794704413837;
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm26895445eec.19.2026.11.14.17.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Message-ID: <c0b9ed82-3e30-4f53-809e-e7f35b0296d7@gmail.com>
Date: Sun, 15 Nov 2026 10:00:08 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] PM / devfreq: rockchip-dfi: add RK3576 support
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
 <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_170014_941524_26D816A3 
X-CRM114-Status: GOOD (  16.83  )
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
> Add RK3576 support to the DFI driver exposing the same functionality
> as found on previous chips. This uses the RK3588 init for getting the
> DRAM type info from the GRF registers. In contrast to RK3588 it uses
> a newer DDRMON controller IP, though (version 0x40).
> 
> Co-developed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 8ba97af78e3d..a895e566b4b9 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -858,6 +858,10 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3576_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
> +};
> +
>  static const char * const rk3588_clk_names[] = {
>  	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
>  	"pclk_ddr_mon_ch3",
> @@ -887,6 +891,18 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.reg_access = 0x2c,
>  };
>  
> +static const struct rockchip_dfi_variant rk3576_variant = {
> +	.init = rk3588_dfi_init,
> +	.stride = 0x10000,
> +	.max_channels = 2,
> +	.clk_names = rk3576_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3576_clk_names),
> +	.reg_write_access = 0x28,
> +	.reg_read_access = 0x2c,
> +	.reg_access = 0x34,
> +	.reg_clock_cycles = 0x30,
> +};
> +
>  static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
> @@ -903,6 +919,7 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  static const struct of_device_id rockchip_dfi_id_match[] = {
>  	{ .compatible = "rockchip,rk3399-dfi", .data = &rk3399_variant },
>  	{ .compatible = "rockchip,rk3568-dfi", .data = &rk3568_variant },
> +	{ .compatible = "rockchip,rk3576-dfi", .data = &rk3576_variant },
>  	{ .compatible = "rockchip,rk3588-dfi", .data = &rk3588_variant },
>  	{ },
>  };
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

