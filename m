Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9264606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cc6Q+LTS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gxFYgeqM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjY4VMD6ur+YRo7kgQD4h9llvSvso8DB1Z7wgH/PMD0=; b=cc6Q+LTSe1Dpmg
	d4S9/FVy0vchBe4WRq2Gi+uMf5ZNPGU34lGN3uowBx7HM0DN0lxBsmUu8OyWxQ2Jl8IDkEv3WIyZ0
	VmSm4fwIpzEB5nw4vVQpQtgs1sEHvbwUJvV+K1zLj9kx2ofh/g0gqwM+Oa/G0VAgj7SVusF4sGhD2
	HPeijrGitb5V19w+tryNlUBGXylErHDi5TyOJV5guSIKX1EZCJFG8MfdI7AJVlSU7UfeWzdAjjqfM
	tXBd4pwBu4W+WJKnjNMha2rG4Nx4aCVnxO79AAcsO/YAmfUr3hAwtxZkzfD4cLjXH14YM3/KYukSQ
	+7Gk6bz3Ilrr/O/aiAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYBv-0000000D6cd-17Hk;
	Thu, 26 Nov 2026 12:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYBs-0000000D6cG-175Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 430FE1C2B;
	Thu, 26 Nov 2026 04:03:00 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 477EB3F632;
	Thu, 26 Nov 2026 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795694583; bh=wDze3qxmOarI0bATetDdRV05lJwHBeC8KZ+rhYNobCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gxFYgeqMsEQCEYXUnpXyvqF3H5CqESiwrz1XbWaMwrXgkYEkwx6q2vf42m9fJidEf
	 zhzN3l0m//JFQ+vACJEA/pAJXjxlz9mItF/RTVvIpxypGdMNgWEnvgpBGZeMv0ZuBo
	 gW97HbZ7ITAkpXb+YYF/3hgVxAKbNiOMqumd3qP8=
Message-ID: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
Date: Thu, 26 Nov 2026 12:02:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: Drop unused parameter from
 sunxi_grp_config_reg()
To: Alastair D'Silva <alastair@d-silva.org>, Linus Walleij
 <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261126104954.441427-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261126104954.441427-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_040304_844032_F9A76F10 
X-CRM114-Status: GOOD (  14.86  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/26/26 11:49, Alastair D'Silva wrote:
> sunxi_grp_config_reg() takes a pctl parameter that is never used.
> Drop it to match the original signature.

Ah yeah, looks like a development artefact. It's indeed not needed, so 
changing it back to where it was makes complete sense.

> Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> Assisted-by: LLM
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index bf4ec4665e2b..d30a562315aa 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
>   		else
>   			val = 0xD; /* 3.3V */
>   
> -		reg = readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> +		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
>   		reg &= ~IO_BIAS_MASK;
> -		writel(reg | val, pctl->membase +
> -		       sunxi_grp_config_reg(pctl, pin));
> +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
>   		return 0;
>   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
>   		inverted = true;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 7c2f29e75519..3060cef3705d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
>   	return irq_num * IRQ_STATUS_IRQ_BITS;
>   }
>   
> -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pctl,
> -				       u16 pin)
> +static inline u32 sunxi_grp_config_reg(u16 pin)
>   {
>   	u8 bank = pin / PINS_PER_BANK;
>   


