Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPk3UgTo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIQsVqy7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=; b=jPk3UgToaYS+tTugA8XpAfb+RR
	YfNvtV1qeCsUtA1a0EVggbiKvjBDrscbG/bBod6iQBvsKlOkL0FC8A3JdbSJNuAzEmjtjnlLiwzUj
	NbflJM2pznpDQklegvbhd/+OJK6WjoaszpbTbNzCacj+UT+a2puiT2WmYdckU+7iEil4Xi7k9S1pC
	ciGbE/XLQYpulBfIO/TKH2/O1a4P65fAHAphntaLhokhVb7/BDNEJQWslEHuUd3cz2Nk8Lk9HE+ve
	ZjE+5JObfx0uJx4D3eqp/G/nJ156AfjWNYClOW67QbdKXOaBx9VrCR0LnDBk9go1O73v0cpBDvObZ
	J5wcHsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOab-0000000GweV-2GHk;
	Sun, 15 Nov 2026 00:59:25 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOaY-0000000GwdI-2aSe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 00:59:24 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-37071c0f42aso3341525eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 16:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704361; x=1795309161; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=IIQsVqy7ezbIhv59mZFjJlKzsA9+Wk2vK15WZ6RPfTBYcN2cmvzRV8sdvByTKEy8uU
         +gFW3EHm9bayLUHiinEr03VmOxAfMTQ5tirlMZQBuOO51xIVfhaWf9xlBhbItETAJmpx
         xfFEkgeBeVqv1wlSrv7UbbXpXapqv3Q6ENCIlxkKvFcknscRueix0crZ0TvfgwTbFQO4
         lWsMqqIub9r84w8XzyzLK0jGNPCao1m/LuXB2vXIQaCaHJ4cDM+Hi3VgZGCz6jEnm8G3
         LjZdyKnnnCfmtyJw7mKy3RE5IU3tJ6DwbYQO8VMvonVbJSnq2NLgGSD6FBFcoqn7uXGi
         Iurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704361; x=1795309161;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=HICCrCslVHPrb8UEd6GXkemccsCIxCcvpcVvdEPh3MLQm6t+rJDq2GY8YXUVdf6ApU
         IWL7NB5knYe84oYSpeZ66vV8JpREgQceS9gPKVLEAUOnRcK9y1yLclXVjM+MEnnTD01C
         huuc7Aos4NXpZ5EcspCchj7pA/BGIdOiWJBAFNbbCZOyfHIZehKcJ4li8CI2PPVnjTOA
         1C+ShRtMgMtMY/obup1s8rf++Ma4sVfK1CKE+T9wcZevMqpp6pqGE4MxpwGXjC+GPQ4o
         9MGoiFyFGPF0Pi6LxqmL3D7rZqf48ngT1ZmusMPZE+v43oNdUcCRs4ZOTWYgyXXV+kPu
         mczA==
X-Forwarded-Encrypted: i=1; AL+hErHa9EL+fJRiAfGZDhcqCwRC+DoBJa98W8wbN9jZutFKFMnjh0+QeiJ0vEThvvvhub2TR3LYU3pAte6QGQJ16am0@lists.infradead.org
X-Gm-Message-State: APuU4Z8rPZYsWNZnBbm3qsqu1ejECawjrH77p7Cu2OOl27hoYWN0rrb2
	f13ymProSM39n/n+YZRk1pLjJA0u9TJFUhPon6xZKK3Hb63T4ShZKQkjyga3wtAxDQM=
X-Gm-Gg: AYBFou2qNQ0Lur1RAh+huB9pNTXHIzZFAlREB5iJ8crrwv9BuvBDWLdiBE39kCqarLq
	G1skoMkIuXUegF+u7RbaCu20D2kkY7KonK6ha9joT4PDiNlojzf/qT6Ffz0UrSn5RsVfRvTHb3H
	B65q9dQk4GcqVoseG60mvOEqNJYcDBMqkWmxw5DAIPHnu5ezjyZenWqrqTNKzFDE8Aax6X6/0zV
	Jm5uYQfPN6qTHb3gLXjr7BHE2KLSwSZ73DC9g3y2ObFrMfzJBTDb0NHaCaO1U2Pv25Ni65vvveZ
	aHNy2uVaJqPurcfHRSJxGFwvU/Bpr3LfA/0wjZQ3OFeTlADZreVHvLHo6PmvoVgmgfSP7dFUa1I
	Fpa606y80lQu2WmAlElzkBLCSeQkk2Q1Vwl42E+o5mcIwfsI2zPOnHzdGVf/c17ZscGBjPYE27/
	HTYkMTwtUrp8N52yngJq0BQf1ahqpTXCVDBuoRjE889nyGicRpMrgkQy2U2Ph/e7TXzF5vQNcI5
	qOzKa1p+eenkTMliazZj1NCqFQopFPFDilcQklWB5557pLstM6Y5ezkqMPBsy3Al5l5YGHGQoqG
	R+pCRbcSeVhIFUhr+42tS1Q4S7rkdHKrWobChSQnTB89Zz5/CeA/8INAGTZj+xA33NZiDvp4yj3
	bfqxSDqb3L1I3
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr9538114eec.22.1794704361510;
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm20244703eec.0.2026.11.14.16.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Message-ID: <0a8c0d90-9d80-4688-83b3-faf6bf04ca06@gmail.com>
Date: Sun, 15 Nov 2026 09:59:16 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] PM / devfreq: rockchip-dfi: move register offsets
 to variant struct
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
 <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_165922_665519_54505013 
X-CRM114-Status: GOOD (  20.62  )
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
> DDRMON in version 0x40 (found in RK3576) has two control registers,
> which moves the register addresses. Move the register offsets from the
> defines to the varaint struct to ease supporting the newer version.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 380361a231a2..8490219f61be 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,12 +42,6 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
>  
> -#define DDRMON_CH0_WR_NUM		0x20
> -#define DDRMON_CH0_RD_NUM		0x24
> -#define DDRMON_CH0_COUNT_NUM		0x28
> -#define DDRMON_CH0_DFI_ACCESS_NUM	0x2c
> -#define DDRMON_CH1_COUNT_NUM		0x3c
> -#define DDRMON_CH1_DFI_ACCESS_NUM	0x40
>  
>  #define PERF_EVENT_CYCLES		0x0
>  #define PERF_EVENT_READ_BYTES		0x1
> @@ -128,6 +122,10 @@ struct rockchip_dfi {
>   * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
>   *                   DT binding for this variant didn't require clocks in the
>   *                   past, so that the driver remains compatible with old DTs.
> + * @reg_write_access: register offset for writes access
> + * @reg_read_access: register offset for read access
> + * @reg_access: register offset for read/write access
> + * @reg_clock_cycles: register offset for clock cycles
>   */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
> @@ -137,6 +135,10 @@ struct rockchip_dfi_variant {
>  	const char * const *clk_names;
>  	unsigned int num_clks;
>  	bool clocks_optional;
> +	u8 reg_write_access;
> +	u8 reg_read_access;
> +	u8 reg_access;
> +	u8 reg_clock_cycles;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -275,13 +277,13 @@ static void rockchip_dfi_read_counters(struct rockchip_dfi *dfi, struct dmc_coun
>  		if (!(dfi->channel_mask & BIT(i)))
>  			continue;
>  		res->c[i].read_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_RD_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_read_access + i * dfi->variant->stride);
>  		res->c[i].write_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_WR_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_write_access + i * dfi->variant->stride);
>  		res->c[i].access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_DFI_ACCESS_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_access + i * dfi->variant->stride);
>  		res->c[i].clock_cycles = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_COUNT_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_clock_cycles + i * dfi->variant->stride);
>  	}
>  }
>  
> @@ -829,6 +831,10 @@ static const struct rockchip_dfi_variant rk3399_variant = {
>  	.max_channels = 2,
>  	.clk_names = rk3399_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3399_clk_names),
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3568_variant = {
> @@ -836,6 +842,10 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.stride = 0x0,
>  	.ctrl_single = true,
>  	.max_channels = 1,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3588_variant = {
> @@ -845,6 +855,10 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.clk_names = rk3588_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3588_clk_names),
>  	.clocks_optional = true,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>	

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

