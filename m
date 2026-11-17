Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B282606A89A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UbMP36yN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JrhUs/dN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K8c9i2c9pA77ON1bwB34pN+TouNHlVdKNHMldunC6Ho=; b=UbMP36yNtm+U1u
	osNhhNjooE/Tw8AZ/LDrNBq27DTRDsdH1xO3pK2IGbK6hqKBhQWju4h/ipmU5O5Vknanl8XoVix/g
	OYdIqUQAtHJ1bIdsreRlPjbGNV3u59NfQOFau1pgZ6SgcmKy4kuXnmXQ53ELN3m18wq7Rt/JEI86N
	hE80dgbZKpMnjt3loBkec+moluWBvGZxzrCdSL3CNsq04fwAed397GnKjZQb7lHC5pGEe83SmB2xn
	N6uoxTSucBgi3+Vl/kjIoZcFdbLLV/S59TTg6R4SefyUcwF4gWAH2JowwbQOe9Di4gGiEBQ0NcEwV
	NvQDar+2O/TtkTGySL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMtE-00000006X7J-2YFc;
	Tue, 17 Nov 2026 17:22:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMtB-00000006X68-3tsO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:22:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C281A00;
	Tue, 17 Nov 2026 09:22:33 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AAE3F632;
	Tue, 17 Nov 2026 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794936156; bh=jCf/7a/YsnLbBlVT2TCDpR5Rx5MDswY+TpQ4UF++u2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JrhUs/dNEIiQrr+/fgwKCnNl6TD35vdP16BsU/ZIFqsA/KLgpTVbHKprOfL+6wMok
	 H/uYWKOGIDQNUILCf/caFLrLO3Q5XIqFEFcPcQyeDiMc5+uv0k4Gz2CyXPaUQtIt5Z
	 y6oTZAuRVjiWbda/dmaY3wYF6OGb9v+JzHIhEJ90=
Message-ID: <76d4d8ee-801d-426f-bda9-2ed8b9a074e0@arm.com>
Date: Tue, 17 Nov 2026 18:22:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ
 lines
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Pablo Mazzini <pmazzini@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092238_012480_7F1364F0 
X-CRM114-Status: GOOD (  23.11  )
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

On 11/10/26 14:01, Vinicius Pedrosa wrote:
> The A733 description sets irq_read_needs_mux.

ouch, I missed that, sorry about that. I removed that even explicitly 
from the A523 ...

> When a GPIO used as an
> interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
> input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
> interrupt function is 14, so after the first read the pin is left on
> function 6 and its interrupt no longer fires.
> 
> On my board this breaks microSD card detection: the PF6
> card-detect line is read at probe, and after that neither removal nor
> insertion of the card is noticed.
> 
> The A733 data register reports the pin level while the pin is muxed
> to the interrupt function, so the switch is not needed. The A523 and
> D1 descriptions do not set this flag either. Drop it.
> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
> Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
> applied: before this change PF6 read back function 6 and card removal
> and insertion were not seen; with it PF6 stays on function 14 and one
> removal/insertion cycle was detected.
> 
>   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..456d9170c2a2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>   
>   static struct sunxi_pinctrl_desc a733_pinctrl_data = {
>   	.irq_banks = 10,
> -	.irq_read_needs_mux = true,
>   	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>   };
>   


