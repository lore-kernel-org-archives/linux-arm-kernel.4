Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC1B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vIU0Sb7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olhmTTFX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=; b=1vIU0Sb7TekOPTsbAi3DSOaCPC
	TxdJor10oyYXBJfQweGvT2tLgxvUSyEF5gIVpCMvvq2NYRpB2C0mGo6xhnY6AtyoPDU1BaBRZdi6S
	S4GdQy/zaVau3ypcE9gIGq/pDIZS8vaz6ofEy0xjwvP4USd2+F9qoHnXnjxXPg2YLWfq9UNOn0Jqe
	tAYmZJA1kdMOIfKcR8jEATxQnM5IV0xrpT0CDTxX2KumE1amo8qgeo+51w9XY82E/yxrHuOxt4Y8b
	qMTm0Xv62ZhgHffriitfIQdp/QhKj6rC9aeR9ICuQrsfU7jEsgE5dKLpbQRYzEAbtxQ5v+9jjK1Sr
	QjLhKkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHPL-0000000GVwq-2c2k;
	Sat, 14 Nov 2026 17:19:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHPJ-0000000GVwI-09Nr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 17:19:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15251675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676754; x=1795281554; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=olhmTTFXZCakO2qKn7w6Nkvds5VOG0TAqvVYUCG9rmf1aAjR6K7AUDy4Lt+Dlx35lc
         R0BR59lhrdlDgirQyXHhSTC1YYbNW3vZfvyM4AA3Ihjy5OfJLQW/DIhHLvw9ZIi3I2Hg
         9jtIpdCP5RIyxowgy3Kxndn50bnLcaiMli+d5f4ods6U6IIxgGH6fivqXwiJKhy7xfgp
         6k0Ao4OpaHXSPAGAupNHP/FLlh8cU08Mw4OiLMnsx2gZQ0DfCjmfBDhmk7vKB5TYvY2N
         tZHdyKQtu4sEhEUp6UUVilzG56azWFeaW95bmVxAG/0oLNFMGju4/g4PT5P3vrP528v7
         usmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676754; x=1795281554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=Ki5yODK0Y/BR6a9TD8Sl5wUrKM1GhJrLOTIi0Mhe2NuWQ5Ad/NIxlunXuSKGFXyR1t
         ETtXxrsGQcH2zzt965OwnrtYia3SYyn6muHCmoGWbosMHlE4FeKXW9pfG5BDDD8sIEZE
         HBKc2jTkGWAmRmXcGJ0+NMhHvW44CjLiCn/BvdqbAV492e6VOQa3lxsu3WaSqjJYXL4A
         aebBTc+5Fl+1QGq0oMfAIH6DG0vyJXhfK5GJeuOKkHgVUBXyGHzB3UB6t4lye7vfgbFF
         AFPCy1My5K9dQ4RSiRpqi/sxB3hVgAlPOmrUTTRhCapMcUoPAfMgxpSOemMC5ERob49T
         nEWw==
X-Forwarded-Encrypted: i=1; AL+hErF3y54ntHeaoGX+akAiSKkZu+N7of5LNkfbPhkN0YL1XOjuF3MvNOqydpi5o/Jzf73ginw1tGoE3IjCRL36OKNQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/MJSyRkRTg/MQEs7XXrfkJ8jg9P8laqfqExC444Ro3q0Wfa3qm
	W2raDNyAXv6njQqbNN5hx0SXVHXle+7E3r/gDRhI55sAoh9jBy5/XxiS
X-Gm-Gg: AYBFou35zIpYswk5ZdXIt/+g9eGWehCNBPexQ4uFgjnayVFrdHy5u6BTi2QGnftXB7Z
	sIJ275GHw6L/u3QHjb8BAlNNxN0S83aPdGXmQ+lY5ouM/lOxzCFiTKSXjZIms3HTGmd2pMiE7B5
	EDTFUC2CYbd96pdVdAAgQZ0Mxh+PiKPMyVJJPT48bNcxB15H07BVkHQhvFqRv1vlS0BYwaqxvS7
	3SdLfyXuSRn7cU6DRV16E/h5iT6XhHzVAuelLRoDz+ZmdDgHq2xOSFgpWWdFtIyyVyD3s+Mg+Lo
	QiMtvEo26If1hTnUID0VKxwAhsdK4iSGqDPU7Y9x46tQogya1EIIxE2ubl81hFuhF54Gut/0K5n
	bi47z02nyjb82+44k0/12gWxAGA9SHfAHE2yyOW54QMe7gFGksWOU7vB2EPGP0Pm0S7L+Sletgl
	RCjU5xgfpQRL3HBFNJL3BiwrqHn19iyaOt+jeVV/jrqq9BiX6GwnvDQTibTMufj16EcTEKc309B
	F5zJfzLifTPwpmuAePe4Gzfao1jf93FeX/R5APy/1Zu8pVo3G6KePTTbaS3Ckro4xk41/z39Mdu
	PvKHMn1ClZxA2IuEIDYyXVMtzsMGnq6+MyafZCJ+fzn6R26Fg4YDeflr2BmLm8vRpnCbkLCDlFw
	XspD5uePlRzAXf0ODMgtyYAulZYNlgIiw+BbjNbiLLP/0SPCMdGnAl2wpZ0kOhepqFr5Na9Nk/J
	tTm+eh6wtFBMmjLoNz4Sk+ClWrdZ/9fmSAx4kVYUegaHZTOQcXnrlVrQhdYn2J+NBu2/Rrwp6HL
	RSjPrzhkQnxNwHfM87KGzsD5w==
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr132258135e9.30.1794676754290;
        Sat, 14 Nov 2026 09:19:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm20031827f8f.7.2026.11.14.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:19:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] iio: adc: sun20i-gpadc: Use
 devm_reset_control_get_exclusive_deasserted() in sun20i_gpadc_probe()
Date: Sat, 14 Nov 2026 18:19:12 +0100
Message-ID: <lGotwwBTRaeZcOCAphaQBQ@gmail.com>
In-Reply-To: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
References: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_091917_097504_0DCD3FC9 
X-CRM114-Status: GOOD (  17.37  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne sobota, 14. november 2026 ob 18:08:10 Srednjeevropski standardni =C4=8D=
as je Markus Elfring napisal(a):
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:55:16 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index baa7661db13b..070d061572c6 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -157,13 +157,6 @@ static const struct iio_info sun20i_gpadc_iio_info =
=3D {
>  	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
>  };
> =20
> -static void sun20i_gpadc_reset_assert(void *data)
> -{
> -	struct reset_control *rst =3D data;
> -
> -	reset_control_assert(rst);
> -}
> -
>  static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
>  	.type =3D IIO_VOLTAGE,
>  	.indexed =3D 1,
> @@ -225,17 +218,10 @@ static int sun20i_gpadc_probe(struct platform_devic=
e *pdev)
>  	if (ret =3D=3D 0)
>  		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
> =20
> -	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
>  	if (IS_ERR(rst))
> -		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n=
");
> -
> -	ret =3D reset_control_deassert(rst);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> -
> -	ret =3D devm_add_action_or_reset(dev, sun20i_gpadc_reset_assert, rst);
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to get and deassert reset\n");
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>=20





