Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130CA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JNupH0gQ;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HqLJrqJB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=; b=JNupH0gQykw98mG1oqaq94+GLM
	qKRidtIaWgewhdxi8Rda1Azns619GfVdU/BMlabaNmzHxFA6kGsRSBFH9UWgkuu4CGgl/9PJ+mrZN
	V+PVMCEPpafJEUE6TUSzgo/ilMZCcvyrzY9T1Pz1LvpaOy6Fl7RaEI2xGDWcZJDqXWOyPJYxXHzuL
	czQTh/WSpoP9JedCFXm19UGRCeJIHN0fNcNf86h1Lv/z/dI7pePPFMw/W/q+RhBPoSm4k1o0f1m+X
	iCpBjYHRlqeX1zH5+QFLwpc70UsvK2/UeTK1Mq1NsAPQ9FF/hc6ZVDDHz584GwfGsMhA1n73ZkMEH
	/fiRfcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhz-0000000CmZn-0zQa;
	Fri, 13 Nov 2026 12:48:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhr-0000000CmXb-3Wez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:48:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so445818f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794574117; x=1795178917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=HqLJrqJBNDkKUlnT8DFqfzkzik3N521uaGPbsPQLlzWFtnS2fyo7h8aWwSauszt7S0
         mfIgXPJonLJzcu5JikF5zsVJWdjc4xu9EyKKC9MqeJMKyv6bixb6DlJIER2OwV4qlfDR
         ET3MXfeROrxl3J7i2FdATlfc5Z41ha8SeXEXcgjgmWQnz4NuXsKVfdpGQ5HKrUsogvTZ
         yOu65KPJDcTKu1kJ9t6HA9uO3d76Nm/58ldk6L6AlcgczsO2AYk/ZXCVCjBskiSALRyh
         V4AjrDAmFEmhvvtIirnlEmtWoYNMBaHpGO/UxgzjnzMauVhJUIx570QnKvwHaEqUBYr0
         j64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574117; x=1795178917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=MznrG6aQOtjqE4ZQeMQa4mj4U1uvdyqmv6zX4/nH4booylfW6RNSPINeDUMpxc01e2
         Vad7bP8lDSH/g/QUdLcv+5ZIPH7y4OapGBNVbOS2qCI4WO9wGw5+sJkIHo6tkPzz+m9u
         coJAlqkZ6cfn4TrtbRaeC0xtMmSIZYfYzh/nGDgVB81VseahU1twekTeLqXokik6GSku
         5HL5bdwgUj3NyxxTRqZnjKDA14dCbjcAXAGSN5FuV8cuFxG1tHTkQYmZQ938oZq1WQLW
         bSzwo9xpCDB4mcQzZqJdxCXJLAR+YsoAVHfkIGGvQ5u59V7QDhiUE030sXkniQnMokaO
         OcuQ==
X-Forwarded-Encrypted: i=1; AL+hErGnAoMeFngx67uU6hHJG26M+l8ktOmricYdpX6eEtwvRgmhfTnXLN5sqOmeqbW1baqEPJG6q+5or3/CiDJbc2mm@lists.infradead.org
X-Gm-Message-State: APuU4Z9eLwUBS5wc2LFBF+COvI1aY4ZJ3pmyxJ/PdhPHjdky+iUrH0mB
	WAm55+VyxT6KS6i8jjVB5V1gZjeWv64esgkQANtVb/bBsXve4mDUDbodhVXq7UbcwOo=
X-Gm-Gg: AYBFou3DzJMr91/cQTJJZ/j4M4nCE8clVSwWTagUsI4zMVppQrJTC80LIPlFRDwLidJ
	ephxBoebiK/izimwyUZ62jjm0gydQ3GpVzf+xbVqUDqz4ypNYjJvNBlR9xnfb61Nps2bugaXA7v
	lNvIqHDT07g4vTCA19BgmDWS44YVMBV7SyFTWOaT4l0ub0DTHJZqkckWWkL/h6BffyC7Okd9UE/
	7TWcnYmIPL1RQ9+QIeZ3SA5Id29ijYarTTH1lvGNUGUi7skULcQ4vatk9ibDZ8RCx6zcZR8HsG+
	0RGn2ZstdAuuhMaiRjaL/jAthwqkKeRg1NH8UxlxLvujzj5JWP5+J42hMvernDR1bV5gaP+O7gT
	PoyWuLEBYdPdH8YNcj0uYcehRExmvzjo2JiZrmcinof2otzshjeSXtXADQDLK0wEgQ/ri3plcUJ
	irJKUBA0PWufps+06nATCNZPVDvRLwhESYNuXdYAvRGCQPDbDxbLfS3GLpF8yrVjnphjb2DId5G
	J9kA+UJDFbuSziQRySeF3DKMH+N2xkpqhRPsTqHuwGa4SjMji6gmcvb42gU7gYYmJ6hxOq8ktbK
	6mV8G7gURyf1r0gM4xrDwruBUaal
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr4648801f8f.42.1794574117479;
        Fri, 13 Nov 2026 04:48:37 -0800 (PST)
Received: from localhost ([82.145.117.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4643230f8f.27.2026.11.13.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:48:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 13 Nov 2026 13:52:34 +0100
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avcIEnCThuTHeWVv@apocalypse>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
 <20261113053221.3131068-2-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113053221.3131068-2-wangxiaolei01@kaihong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_044844_212081_62F98A91 
X-CRM114-Status: GOOD (  22.43  )
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
> The FSEL field is a 1-based function number: 0 means GPIO, 1..n_funcs
> map to funcs[0..n_funcs - 1], and n_funcs + 1 and above are rejected.
> brcmstb_pinctrl_fsel_get() indexes funcs[] with the raw value instead
> of subtracting one, so readbacks are shifted by one slot: value 8
> indexes funcs[8], past the array end, while 0 is reported as funcs[0]
> instead of GPIO. The setter programs the mux correctly, so only the
> debugfs readback is affected.
> 
> Map 0 and out-of-range values back to GPIO, warn on the latter, and
> index funcs[] with fsel - 1. Tested on Raspberry Pi 5 with KASAN: the
> "alt8" readback no longer splats, and field 0 reports GPIO.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!
Andrea

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

