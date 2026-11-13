Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D81606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RmWBX6lv;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Yf56Eb1u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=; b=RmWBX6lvP/ZVmnFBJ4jtx009Gv
	zRI61gxWMX94eF2JtUSkahDNs2pUIUGbcuRbElxHHzEMW2cSK8a8ytw3FUMuw9O7te7P0ZZM8JnyU
	wpNuNMXN3MpYTlc8zAJH3pZO/nHbSVg7KcLyh/UY0gitVdxbdOA9DE/3nWFVnh4O2lKfGbdHeWgPn
	oBurLOHLfbYYq2PzKsh3uJi2wCb5SrZM85AS6BRp5B75+lCpEUmiCeA3/1/Lsjz/kHJGDBb6gGDVL
	BHgu6VpTdxw6bA2oOkj4s9ND6PrrTFWoU1tWJ1QVoFg71kNHSZpP0mURxKChhMyPjnA55vmUBGALI
	hFjlZHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqiY-0000000Cmkp-2KHo;
	Fri, 13 Nov 2026 12:49:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqiU-0000000CmiR-0Ufd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:49:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4768785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794574156; x=1795178956; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=;
        b=Yf56Eb1uWOfr+sy8frMpUGqSu0X1moqn98bfr2Ii9whzqwXxoP4BnvI/ULm5wOTJcd
         5z4vwOhSFUCcPEqbqKlAeZm9SCconPnz9U8YHJLWLo/pkav0geNwch5/nEOTKZPP8hlb
         aV6z/j8iX/aZQ1JqKCM8S5/JdAjKGKhVkC4QdHX42cry9EXtlM8MxqitWb/OgznzxowB
         48XL8SPolCvu7BV0ntwzqUA6c8nfUA6CbsGiUbL/KvCmJsBx1s29bDq8eLnfuzcKFkcd
         QiWLoRjO7/h/kUHmqFIQixHCVm8xed5lXVkbQws/H5cHNqkI/Wa3P9Fvwq2AtTVnmoGG
         cY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574156; x=1795178956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=;
        b=W7JQ1VwKzbiMHcYGUZFrHYHXDHLoZq78WFL3EhWGT8n3Uy5cqlNUcUQhKyx9i/BIDd
         onBy7li1V4kEpnmEYLW+q4RMjbH0MKwCAobv6IsGubEk9x10lILCP7P56RO/RjOgiI1h
         NM7n1TDsMEVop+yQVsheQcnij82EwtiPcbLRpNVyaaO4Kpvb+roIEkGZKUBNBPxE0tAw
         e0c5bkMoMr5i6D4WdL5Qw3JkLXV37FGoyAn6PNa8YEGEB8+wQwdjvQEvt1Y6Lp2HyXHj
         od66zopIJVpV3npSIninnrQ5TVazo0wkdwR4TubjT+XprcSKWr5OiUDI828JzPvfdiv8
         PZlQ==
X-Forwarded-Encrypted: i=1; AL+hErFWboRXmb17QTjJ+XQHe+ifAlEsRl2MCvaPSccWNApAhavaFvMPz3sL+ESv3rLupj4u5ztbcZIbPSRumMjuRET8@lists.infradead.org
X-Gm-Message-State: APuU4Z9COI+Z4vUGMDkHSYc1luZDiKPz44I4cmB+La+UeFun/b7QTBfg
	XB6hyrMGNtvaqYxLlbMl7kjJBYZmbZGYQKM7sqjVvMorCzru1UKrDVGmPUiPLkixDpI=
X-Gm-Gg: AYBFou3IYqXGJqw3cNd37kTBN5CfH4gZjzMHXk7wZ6zSndCrbxUuaTYIUO22IqZTJxj
	IHjEA1wYM/pnIgzY55jv2VtMx3Mm0qs9+E43rTWUlo7WlgC7mPPxvZCu/qAAu5ki0t0s2Fu8vkM
	QIL6+T4bel/7RUifQCT8ACbmBasdt5H08OWKgdkHTM2Zu+8XtMwhgTCkn52Q0T1PlbSVoSojvDI
	8Lry8egINPI/EZs+8s8m5eTzAhIKY3YpF0zQWJP7XkEyrI8ZkI4KE7ySRyqXVQcvPVQv0juhcdR
	ZsqIvUnFiSmC7I5lulNiC2vpp4o1vefMQMUJIHb8JAY7FEirvS7C0zqf0oPIMqKo8TGTTVwi0yn
	w9zwrwyrF8PDmZQ0vuxlYRKp8X4kpTAnq4PC2I19oB86Ly2LW57qrnFU/3I+YcFJtEAOKmeDFqp
	6jipyqC2H6ez8N0BcX6LW1sTUNhn5EHxRmNW+1kT+AIHu1EH3vFxuHgo8JBEnMK1RwqTad9W2Ca
	BhR9DEcyoqNTaNgMhsbmnN/D0XAE6AHoNC5Y+z//EHVQ1I3++xIGjhQc/W2uL35W5b5mb3NtRYF
	66sjycAaWiiZZW7/t1jQr71oNjV7
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr52848935e9.13.1794574156179;
        Fri, 13 Nov 2026 04:49:16 -0800 (PST)
Received: from localhost ([82.145.117.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm4122315f8f.53.2026.11.13.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:49:15 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 13 Nov 2026 13:53:13 +0100
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: bcm: Add missing SGPIO entries to the
 BCM2712 AON tables
Message-ID: <avcIOTzDFrI3rGZY@apocalypse>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
 <20261113053221.3131068-5-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113053221.3131068-5-wangxiaolei01@kaihong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_044918_185134_F2D6333F 
X-CRM114-Status: GOOD (  22.61  )
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

On 05:32 Fri 13 Nov     , Xiaolei Wang wrote:
> The BCM2712 AON controller describes six SGPIO pins as pin 32..37, but
> the AON function tables stop at the last normal GPIO: pin 16 for C0 and
> pin 14 for D0. Both are indexed by pin number, so dumping the pin list
> walks past the end of the table:
> 
>   A=/sys/kernel/debug/pinctrl/107d510700.pinctrl-aon-pinctrl-bcm2712
>   cat $A/pins
> 
> pinctrl_pins_show() hands desc->pins[i].number to pin_dbg_show(), so the
> list jumps from the last GPIO pin to pin 32, where a valid mux bit makes
> brcmstb_pinctrl_fsel_get() evaluate pin_funcs[32].funcs[] outside the
> array. The set path walks the same table for any DT node that assigns a
> function to aon_sgpio0..5.
> 
> Add the entries as pin 32..37 to match pin_regs[] and pins[]. The values
> are from the downstream driver (rpi-6.12.y), which keeps separate C0 and
> D0 tables; they differ on the HDMI1 and PMIC pins, where D0 selects
> vc_i2c0 and vc_i2c3 while C0 uses vc_i2c4 and vc_i2c5. The empty indices
> in between are harmless, their mux bit is zero.
> 
> Tested on a Raspberry Pi 5 (C0): "cat $A/pins" triggers a KASAN
> global-out-of-bounds report in brcmstb_pctl_pin_dbg_show() with the
> driver as-is. The D0 table is not runtime tested.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

Thanks for fixing this!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> index 752b78e2c0d8..1720c220cf3e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> @@ -510,6 +510,12 @@ static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
>  	BRCMSTB_PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
>  	BRCMSTB_PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk, _),
>  	BRCMSTB_PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0, _),
> +	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
> +	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
> +	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
> +	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
>  };
>  
>  static const struct brcmstb_pin_funcs bcm2712_c0_gpio_pin_funcs[] = {
> @@ -585,6 +591,12 @@ static const struct brcmstb_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] = {
>  	BRCMSTB_PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3, _),
>  	BRCMSTB_PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _),
>  	BRCMSTB_PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3),
> +	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
> +	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
> +	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
>  };
>  
>  static const struct brcmstb_pin_funcs bcm2712_d0_gpio_pin_funcs[] = {
> -- 
> 2.34.1
> 

