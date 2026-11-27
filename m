Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o7YKN8yZ;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=E8BjU7e2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZaVGpE5VmWrwPSDV7cQyUHvfKsQON/q80mEPDwZU8v8=; b=o7YKN8yZ0QmWew
	OBeX3cMiOLOLpGCtbPtafoXYcBRQFy7m1LRG00nonWeAqmgP4qBVa84ZVR8no3Km9wJXA1s0LN8hE
	Swa1NoCC2vNTA1C3nWD15MMZ2W/TSArFLYG7LhmqbG/+pXxwU6PALUitq5dOCTVczXP1b25gmJLHz
	Nfu+ck/Mx5K0y4O19jDBHbQZpwfgmpYemg13bLUjPD/hLyqyij/77mScnXQSYzbHyWoDO97pyOhDP
	OVSxOfZwfjwIHOuc2CpttvXXDwGf0RSPlrRsmjuvV0uvJNfoqNrvdKZt+cHpdyxURrLrloMk5Cfj9
	1voJMSvZIPfhEAXjY4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5P-0000000FnCT-1RU8;
	Fri, 27 Nov 2026 11:25:52 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5M-0000000FnBL-1HG3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:25:50 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 254B74C986;
	Fri, 27 Nov 2026 22:25:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaVGpE5VmWrwPSDV7cQyUHvfKsQON/q80mEPDwZU8v8=;
	b=E8BjU7e21tO1gh0l95+WWiphxme7u7Ozzl35EgUPbZL1yDTvJy/bpNWhthIMqpkYO7DCOq
	oPeGv+2U+gi6rIX9fFgp8QdILaf2I7HmFgyT8PAE4/iLh+C1sDCPQpahntPFxDpmA+vZkb
	VBBAnYpyBqEHZ8V4tMutppS+HCcFJQ9BP7PdcSURhL57551AY6pZtBF39tMzd0FEiTHhOP
	jgRSUwtls8mosVVge6drIQvFT4ycdaw3T8w3PrFXqYgT8TyvlqTCMJBobkkP1zWyVaFy9A
	OFFfFs+knjUx4lWu8DKKMCKJ4xGptXdJhSoPsh+7xogeTp9IxUkwhde6Cb3ZDg==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Fri, 27 Nov 2026 22:25:42 +1100
Message-ID: <20261127112542.2584153-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-2-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-2-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_032548_501594_30F35001 
X-CRM114-Status: GOOD (  23.39  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 21:50:46 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> prepare_function_table() numbers the IRQ banks from PA, even when PA
> has none. The static drivers number only the banks that have IRQs, and
> use irq_bank_map when the IRQ registers do not start at bank 0.
>
> Do the same here, and give the A523 and A733, whose IRQ registers
> start at PB, the map they need. Apply the map to the A733 register
> layout too, which so far ignored it. This also fixes PK on both, which
> was numbered 10 and written past the end of irq_array.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
>  4 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> index 001bd42afa3e..f71a229926f5 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
>  
> -static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
> +static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
>  
>  static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65..3ebe926a1bc6 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
>  
> +static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
> +
>  static struct sunxi_pinctrl_desc a733_pinctrl_data = {
> -	.irq_banks = 10,
> +	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
> +	.irq_bank_map = a733_irq_bank_map,
>  	.irq_read_needs_mux = true,
>  	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 8bcd566593ae..1577897a0299 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  	 * The extra functions will be filled in later.
>  	 */
>  	irq_bank = 0;
> -	last_bank = 0;
> +	last_bank = -1;
>  	for (i = 0; i < npins; i++) {
>  		struct sunxi_desc_pin *pin = &pins[i];
>  		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>  		func[1].muxval = 1;
>  
>  		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (last_bank >= 0 && bank > last_bank)
>  				irq_bank++;
>  			func[lastfunc].muxval = irq_mux;
>  			func[lastfunc].irqbank = irq_bank;
>  			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>  			func[lastfunc].name = "irq";
> -		}
> -
> -		if (bank > last_bank)
>  			last_bank = bank;
> +		}
>  
>  		pin->functions = func;
>  
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 7c2f29e75519..09ebf67767c0 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
>  
>  static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
>  {
> +	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
> +
>  	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
> -		return pctl->bank_offset + bank * pctl->bank_mem_size +
> +		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
>  		       A733_IRQ_REGS_OFFSET;
>  
> -	return IRQ_REGS_OFFSET +
> -	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> +	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
>  }
>  
>  static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
> -- 
> 2.52.1
>

Tested on Xunlong OrangePi 4 Pro (Allwinner A733):
- Both pinctrl controllers (2000000.pinctrl and 7025000.pinctrl) probe.
- MMC0 card-detect GPIO on PF6 works ("Got CD GPIO").

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org> # OrangePi 4 Pro

