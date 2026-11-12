Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99997606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVAJdDwR;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NoktrjZ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=; b=JVAJdDwRMmQvcu9UAKaDhgeaTj
	87FD31Wo4opm85M3cBf/c19TNo1bKrCGheKBazz+MAWiAMWv5HPV3BamP9p0iOgLGyd5FWkUQeIoJ
	h8Jh65Mk8TC5MxHowNpIKNqAFQkn9P2SLgApW5n/osquFsi0ZRGtBzy2crD42nnaiuRdFlpb/ahoi
	Tn/kuaE8XSDjhNBHwaOoBIzWTOZaM/g0FgMc4JOUJxUwrl0jqi3Dk+MbmaTJoxyIsSGb8rWytZN9+
	/6EPVaBcGSHH+LSS4isCRd3YGe1OEXPA7lbzohhy69jnGx34tkooMb6alallFnHlPxj/PczgxTP83
	xI8qugaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTjH-00000009pqN-21sH;
	Thu, 12 Nov 2026 12:16:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTjA-00000009po4-1a3m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:16:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso40104115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485786; x=1795090586; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=NoktrjZ89KpHkDR2Ao2FIS5uR89m3A9rIi+1U8I6k+92h115ZrNp934RgJ6bbwwgIw
         gWc+X4GLIH8Zb5vD84DclVqI/TZ63s7/ck4M86MWj0fi8Bjy0vM/jspNhSvwa0XpJuCF
         QdN2IUhgRpfheTAAUjL2eq5Y6gpTqhq0VY81Q/op6pH4udjF8zQpl/r7WdVlU9BSGItl
         2GJVv+p27MmO247UOjAn6Mk1xeUVYIXoQf5TzPTP4VdgO5UZfcVEJ1f4dkk1fU848j7d
         9Lx2sPcTj3irRWYbbhBzbbFOu1kkLiIUENH6GIwFVlVm12zhb1MXZrsEc6OSzzk2AELq
         K3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485786; x=1795090586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=xZgbc7g0xZF/5Kh4qEo6V7TY/dy1uRmj7UyjdjZxvrUUubQPmADU6ti4UeNYeZtc4M
         BbKO4rjaHlF8X0b5BRVVSPePn2qwXwoKWxnDz8IAsdM/+Q5V+EPrv8bdoYFnT7E5+uls
         wi9AYmTww1oVHpaWwTwEDzgbWVw+ygYid1hly6wWCQsb4qIx9bOKZg+Tfmp8ZyjPDVme
         TNegKnMPYN73uwdpRO/0/Tvh9Z716YjWLGud5ah4jFYa63n5ioQQ5jP2t3Q912bt9PfZ
         uJRUYxCQ9JouSGm+OYjPoYQ7eDKhgCtPrRwiQvttBzA9FcyYPnsUr7Eo25qUIwie57ws
         AQ9Q==
X-Forwarded-Encrypted: i=1; AL+hErGOmUnFSR66wE8bYnW5CkCy+IjsSFIJ6ryaXudjWyCs6MWqONDCYuvV4Oqy+TE3IZGofVNjNJyXxtmqcpFh90x1@lists.infradead.org
X-Gm-Message-State: APuU4Z9wfJvCKCIbrNTY8RnQa0ssMa0RWEJOJEYT82bnENqWyAz0Z0V2
	LVtd/6giADkEey8gBq5GCeBXiE6MuK/w6Zq/owWw58rYRgYPMk2We7uX6oCt1lEqp/w=
X-Gm-Gg: AYBFou0iCkIxKkeGWxPg+tYooa1IKEV8G5fT928TP+D8P6Yp0omHCiqrMRZNY+t7dyb
	j1iRHY2xndSsz7dPYzXewRiGMwmW797jqDKDVMqzWSye0lYynRkk8OILn6+tn0ljI5gKYGfdMUN
	oNWJL3hE1Cy4/LRhfWulmiFScyHWhUZRpduMNaOxDNwwI0w8IDVk+9q1JUkB6HiPKVg7AVY1Jry
	TX/jdTpjm6Duo8PIBoLKS9pzxK31U87Fm3pPr8xf7CZFW/EHc+0RpnI3f03LnfSCLlzSrWTIx84
	buEQALB/ri7ybDC831CTa1xhy+gJR9HjOgpuNYoh7ISXoTeqN1W+YrvRqpTsZhECPYtuptBmAZ2
	b2PLYp73lYAK9xoM7JG5a63SGgy0vrxpQHUksMkyBaGjXzlCS3uS/dtvZF1G8RqTXzRTWJW+Wj4
	iLTHnLNsWP2HczAlcCvk33X8+pk1ln6SWpmZFPcDOEvCX/bVXS1PzS2VvfYp6CVr9EwvTDUKl8g
	uqkIfQD0Vi0hZxCRntPt5DVCfBARH0d+F3JvLSkebzQB0G7gMvHmOpluZdLzQFQtk591WUYx47Q
	lgs6IkDqOEEOYvwP0gOex6JvPTpq
X-Received: by 2002:a05:600c:4504:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ba09375b67mr98996565e9.14.1794485786500;
        Thu, 12 Nov 2026 04:16:26 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm70743175e9.12.2026.11.12.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:25 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:20:23 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
Message-ID: <avWvB1MV3BMAnJaO@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041628_570010_91F0D45B 
X-CRM114-Status: GOOD (  19.37  )
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
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index 2b942ca7196b..e81c5b295a05 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -180,26 +180,13 @@ static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  	seq_printf(s, "function %s", fname);
>  }
>  
> -static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -				     struct pinctrl_map *maps,
> -				     unsigned int num_maps)
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
>  static const struct pinctrl_ops brcmstb_pctl_ops = {
>  	.get_groups_count = brcmstb_pctl_get_groups_count,
>  	.get_group_name = brcmstb_pctl_get_group_name,
>  	.get_group_pins = brcmstb_pctl_get_group_pins,
>  	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
>  	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
> -	.dt_free_map = brcmstb_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
> -- 
> 2.34.1
> 

