Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41742606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QzSsUicB;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SS6Ga6s8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=; b=QzSsUicBgYni0SJiK3zAi6vhN+
	eKzqsKYegg91Mi/cu0a05eRJRhQkl+R9vUFxiGNXt8VksBkLcsSeIg5zBjZBDVwF9dgvHiZB/SFwG
	zklQwND0UXnDc1EYXR/ExqVzoFYeIXHCEy2ma52hEOCJgsXYII9FhLKHZU2yvdWswMI/vmtFdN/bt
	Mq5khM1DlSYEBR2wGfKRYhDscYPjNyq3nCtrITIoQanU9Tq/E01Kx9siiRdv2dEXctjHG+X3qc/1A
	OKTDxuc2oZW5xa67ldGl7GOuMUCeb+j01+l79SVOzs1IkpM6GrLpRYSKsH6DPF6AEWCzGM9mS1Mpm
	coiXuTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTfF-00000009pHC-3OEx;
	Thu, 12 Nov 2026 12:12:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTfC-00000009pFv-1xkZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:12:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490f38e9688so688188f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485540; x=1795090340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=SS6Ga6s8CWFxhitdbaHUFuTieUi6jWvccqDKW54t5HiixzsRaGaE2WZGsYH5pL34g4
         x0Btm7XtLQu8fiLdkUbTPRcKmaybhNkqmHyg8tPLC1XVmy15zGYjUjNZslnM202X1EGW
         QF5aglZBXIgVN80yA1wAL6QYnFGTeYCtVl8fJ8852DM2BU3f5yAoYjiuAbzmDOQzHQ0X
         vmE7jTaj+EPzvqRpIZFNfI7pB6/nBLaf4cUkVZ/eAjlVolhSu3mlNQQCjXRyJUmwjjBy
         645PuiK7VIZGMxwYE5aGUF7F3UIMTtfNPa0tdmsSJYyO+6Y0Wz+7S316hZvsedN5a71r
         3GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485540; x=1795090340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=wDH3VRl8rXI4mSBbYNedoRVFImniVse8o/QlD1nEAZQNE1oe/iT9A2aIX/4mTVwn8l
         buwLarpTM0AmS4NqLleld/3u9d6Q6K2agfbGx/GBWJ6DSvf9SMqp1m6Mw/3SMT1yW4SU
         WE8oWkciPzIZJnw14c8RZi6WlYzzYknuF6sG3Ri8MGcfrvqFPJLE6sfw/tG1asok9EoJ
         T7hrRAZDBaRS+h8b/00s/Dn7IKgSUksTSKgIEnyRQkOZS5pKcxlO1F5UIrBEGQ02z06Z
         lxTDDwoAcoYGd/QVj8RBsVB7srV+A8S3njrxs5y2k7Rkba9AMutqLJbspC7ebPvgDhGm
         6LLQ==
X-Forwarded-Encrypted: i=1; AL+hErFmuJckL77cH1q6mH4LdqYZTaM0MjjzhmcM8d0jKpd5VixhShSWS2esOTDyiU4yMPYPncVzEa5ofVieO4ZHZl8A@lists.infradead.org
X-Gm-Message-State: APuU4Z/jj59TfN9gprDtE1W6yMC6i96yBpYrvaoR7YyIt6i/o0k2PvwX
	J+iacf9bAk00Y2SC588eNwSNNol/jRXOzoyz6DZXATadFDOp1AEVfyvgmqhqEFHnc3E=
X-Gm-Gg: AYBFou2U+GC8gwmaSzoB+JGa1J99PIE/qctH+LX5fC22HNJfSF6zvNHLp52RX657H9I
	MdCQNfY8V3vHNT+u5QC1Z6cXany8gNMVk5vJuYVv9r8TgTgOtcWavU8b4I11GeUvGqXJqh8OdBw
	cTULA0j+gMZFgqK1+drH6ff5beE2hgjepFKNDDJtxGQixhiKVo98BN4z56sz/KwUH9gpXwCaH4S
	XhVITJzxp2X1+AqnYu7+Tu6s7Iwsaijz/Xkv0H75OwYQkdidp1iVfUtwPdO+blyOl1wq0PG7NNg
	18cO+aoAa6Sn+et4nz9uTO9TNxT5k7BKsz6uA3JirDpwUkp9qvC8Y5waX14ohGlJIkxeYytOdYx
	NylnR1gpfPW2E4z3cim8iu3xro2E5Ry+nr4WHubHdLcKyjTKxN9fylyeXlxEkeatxi5/Pc9RROJ
	ifsrs7UZdULWGiWdIqx3KwV3CXEPu1PM5HUEbgcFP0m74MrReLx0duPzjmgolil9x6I20ViMBSX
	iVvbgKSrxjtVX/lXvrhICMKFoY9E5qLxkvsQrq1fZGtJZdLEmLQFOXtOQikhVt5EYoPu77eNkBd
	bZBVvspcXCyo3b/+Xd1aoi+Hvx7G
X-Received: by 2002:a05:6000:491c:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49aff96ab56mr4685821f8f.20.1794485540040;
        Thu, 12 Nov 2026 04:12:20 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm15040172f8f.6.2026.11.12.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:12:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:16:16 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avWuED_RGlEdGH-9@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041222_545629_E8E59265 
X-CRM114-Status: GOOD (  41.78  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> register and uses it directly as an index into
> pc->pin_funcs[pin].funcs[]:
> 
>         fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
>         func = pc->pin_funcs[pin].funcs[fsel];
> 
> That is not how the register field is encoded. The setter,
> brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
> number, while funcs[] is a 0-based array of eight entries.
> 
> Every readback is consequently shifted by one slot, and a field value of
> 8 -- which the setter accepts, being the eighth and last alternate
> function -- indexes funcs[8], one element past the end of the array.
> 
> This is reachable from userspace without supplying any invalid input:
> 
>         # echo "gpio45 alt8" > .../pinmux-select
>         # cat .../pins
> 
> The write is an ordinary mux request that fsel_set() accepts; the read
> that follows goes through pinctrl_pins_show() ->
> brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> Raspberry Pi 5:
> 
>         BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
>         Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
>         The buggy address belongs to the variable:
>          __compound_literal.62+0x8/0x40
> 
> A field value of 0 has the same root cause in a milder form: it is
> reported as funcs[0] instead of GPIO. The mux itself is programmed
> correctly in both cases, so this affects the debugfs readback and KASAN
> rather than the hardware configuration.
> 
> Handle 0 and out-of-range values explicitly, and index funcs[] with
> fsel - 1, so that the getter uses the same numbering as the setter and
> the index can no longer go past funcs[n_funcs - 1]. The existing
> fallback for func__ placeholder entries is kept:
> 
>         if (!fsel)
>                 return pc->func_gpio;
> 
>         if (fsel > pc->pin_funcs[pin].n_funcs) {
>                 dev_warn(pc->dev,
> 			 "invalid fsel %d for pin %u\n", fsel, pin);
>                 return pc->func_gpio;
>         }
> 
>         func = pc->pin_funcs[pin].funcs[fsel - 1];

Non-blocking nit-pick: I think that pasting the code in the comment is
too verbose, especially when the same code consists in the entire patch
body here below. A succint explanation by words would be more than enough.

> 
> Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> the splat above. After the fix the same sequence reports
> "function spi_m" with no warning and no splat, and a register field
> value of 0 reports "gpio". The register is restored to 0 afterwards.

Since you're at it, would you mind fixing the SGPIO AON related OOB access too?
Please take a look at bcm2712_[cd]0_aon_gpio_pin_regs struct: they both have
a bunch of AON_SGPIO_REGS macro describing pins at the end of the struct. That
macro puts them at [(n) + 32] in the struct so there's a hole between 'normal'
gpios and SGPIO ones.
Accessing bcm2712_[cd]0_aon_gpio_pin_funcs struct via this +32 offset as the
'pin' index in pc->pin_funcs[pin].funcs[] will result in OOB access. KASAN should
report that if you 'cat pins' in aon pin controller.

One way would be to refactor the code in order to avoid this hole, but I
won't pretend this.
The other way is just add the missing SGPIO entries in bcm2712_[cd]0_aon_gpio_pin_funcs
(mind the +32 offset, a new macro is probably needed).
You can find the functions for SGPIO pins declared in downstream driver, see file
drivers/pinctrl/bcm/pinctrl-bcm2712.c from rpi-6.12.y branch (later branches
already have the upstream driver which is missing the SGPIO functions entirely).
I've posted here the relevant data copied from downstream for your convenience,
please rearrange accordingly:

static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
};

static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
};

In case you don't want to fix this, you will still have a Reviewed-by from me,
and I'll take care of uploading the fix in a subsequent patch.

Many thanks,
Andrea

> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index f46b27155c3c..2b942ca7196b 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
>  
>  	val = readl(pc->base + BIT_TO_REG(bit));
>  	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
> -	func = pc->pin_funcs[pin].funcs[fsel];
> +
> +	if (!fsel)
> +		return pc->func_gpio;
> +
> +	if (fsel > pc->pin_funcs[pin].n_funcs) {
> +		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
> +		return pc->func_gpio;
> +	}
> +
> +	func = pc->pin_funcs[pin].funcs[fsel - 1];
>  
>  	if (func >= pc->func_count)
>  		func = fsel;
> -- 
> 2.34.1
> 

