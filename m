Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9zDc29z;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T53BQ4oa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=; b=c9zDc29z7B0O0AOor0Z/dHk8fu
	iyiL9+l8AzzeOVBkJetzfDaED0hr+X3U6XaZTVfZgtexL0TIZRYx4oqJs+H3nkqIFNEwzoLryUAKN
	v3GhgzwL7CnTuBNuHwWmosujbou/PiWffsyYr6DANbbcXNe+B4TCocu22kPcZMWE1C+rCSJlvuNnp
	NB1gjDmDNiMXr9R3b1PHyeOntvS5okEqrijIeU3S8yYmiBI7QRTfuDDDfr7kSR+r80kgUaYJAdbZn
	EgSViI/xxlQu1WyPkFVoudwmw4n5AahlsselKahanXC8/t7EyiEj3XFVTv3Llgc+slOiOm+K/zMa4
	fQy03vOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTir-00000009pkJ-3pnp;
	Thu, 12 Nov 2026 12:16:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTil-00000009pik-2LrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:16:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so4565929a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485761; x=1795090561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=T53BQ4oa8/djfeeHNTUcT63xfe9dnLEHR17X7ClinlGrOO5xWFmOYHFO0YO43T80Io
         cIMzIQDPlM62NMOPkgUPzcm5zzMP1oMnuxdrEVQAaqJxLPdeCcBGVBaRxx9YidL+dxES
         vuKrqWnvygQT8Hiz+5UHVwYkQrRnxbX4o0Kdx/YyMEwBvDFASR4BpqipkyPFUksYx19K
         QE2IV7rfUfpfuEQ0DOBojQf19fM3CQhWfaFow/3s39ePRXMzp7MilWa0oHdUg2XNwNZW
         yRZs/HIY+SHaaBi61AjfBKX+Va2R+6wJJ0NKpk5VBeizMDT5S/VOTISjyQLbK1AKznid
         JLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485761; x=1795090561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=vsQfav6/22g4lM/pQrDS2CeD4Xm5calEPHN+AX7bTNn+LF2Kg1x6QXUg0MYeGoUh3Y
         mMYgJRIGNnmhrrRcuKI4VJ3hz8mf3LD75meniHTjY9nQsiSJGgIVI03JIBys4Uk63Mqy
         lHky7GAFrNksS8Nejifn3Esgg/DOrLUKEv0TrbVwn3r5GnYH8G3IK7MFBlqoRVDGDFCm
         Z7ul4iDZYwEtq9EiFaZWUWINf+r6Qc1iPdWxxDEtl0XXq5MNNg6YBawUwx0HRAcVIRet
         O1pm8VRWO3jGDSJg0LrOxd+V3IpiIf1b/M9n605xDFyLAByXETqmZTnIw3yp7oVekInx
         F1uA==
X-Forwarded-Encrypted: i=1; AL+hErF0ZSInIgo18LYkEuoT1sOu1eXqt8+VcgcZJid8nNW3ukr8euDxgAwXQPOjqb+kGylCVOr8X0/smKO1kuDNu8ls@lists.infradead.org
X-Gm-Message-State: APuU4Z9DKGHpwylzknlzObemFdlpH/Qp2saXNRuFNMdzsQ3JDZ1zkOVr
	bOVasVNqnsJ578W/hMAidY2vp3Y/PSAWBXtYIyI+M+B/NdMBLvmxiFniOyy8f7E4MWs=
X-Gm-Gg: AYBFou3UsDmkxxG8hHeLjKVb5y/K2Wqn4jIL0LmNxCy+/lgT+PkMumRgqsCZ/g53huv
	eoxHhWdmNgZYdEIr4fCxUBtIHg/OnQOBDFdsqA7yUErq5nj0po0Bl1jwU4DwQFlp/qwzZPRnuEG
	0jDXpmPWOEu3nK2R6TmlIKf1BoYn3QtnlZfuhWBQUIGnJG6vtWMFCenzKAlUjBzJR1h/pXrHDnX
	BmTKESE91lkbH9KTFVGSQcUXIF3D4a1FL1j61aQ30goenZmpbPr026Msxbp6km2+67EnXKNY2Yd
	gG8Ufv8pQUP3m8Ubramc90PsatskdqNNO7prHVl7YnYZTBuAT1kLPqnj/dEvsPFaXsmFQpgjEq4
	lU0+msV9HVdvVkIaEH97WT2blDU0r0ROaQWab04wPYrHKhq/LnXc7v53SzIc4nKPfBn1YF9bmft
	hbBuN90a/y9XOLlkiM4dyzj3jemMDu2vWGkddzRPrSqxIyfcwoLxh7K4Eb1jsot+1esDoCgMOnu
	OyyETaihmUXiW3VKADCJz6gCEaBJxUtGV/VOr4ZaAbzjxBP8OmeVr73z9CPeu/lXccSSL/okSMH
	eQYfImsDwhZy6GK6Z/tNgqCqS+wRm1/4t6PG79y+VicMA2VkBQ==
X-Received: by 2002:a05:6402:84c:b0:6b5:867c:879c with SMTP id 4fb4d7f45d1cf-6b77780e6d0mr4095632a12.35.1794485761603;
        Thu, 12 Nov 2026 04:16:01 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm16127012f8f.25.2026.11.12.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:19:57 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
Message-ID: <avWu7T8_dutAW8ro@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041603_851009_E4334571 
X-CRM114-Status: GOOD (  19.45  )
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
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 725e880ae086..69a92cd7bfe0 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -760,18 +760,6 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  		irq, irq_type_names[pc->irq_type[offset]]);
>  }
>  
> -static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -		struct pinctrl_map *maps, unsigned num_maps)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_maps; i++)
> -		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
> -			kfree(maps[i].data.configs.configs);
> -
> -	kfree(maps);
> -}
> -
>  static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
>  		struct device_node *np, u32 pin, u32 fnum,
>  		struct pinctrl_map **maps)
> @@ -916,7 +904,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	return 0;
>  
>  out:
> -	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
> +	pinconf_generic_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
>  	return err;
>  }
>  
> @@ -926,7 +914,7 @@ static const struct pinctrl_ops bcm2835_pctl_ops = {
>  	.get_group_pins = bcm2835_pctl_get_group_pins,
>  	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
>  	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
> -	.dt_free_map = bcm2835_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int bcm2835_pmx_free(struct pinctrl_dev *pctldev,
> -- 
> 2.34.1
> 

