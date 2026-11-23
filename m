Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22408606A6B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zJ/jOGV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYK7nhDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t2W2owkpBCVo5YvfxGBxlpKmBfU+hvS/9sxrZ7gmr0E=; b=0zJ/jOGVnMl64F
	gfCDVHSzHpeCz9loyZ1pLfjY3Drjz+2RYMJsapklfaXg3JXsfov/gje4TpgDWE21Zv7B+0RhWjw2j
	I7q/21RZZJmlDiiHCRkELI8yIWWyV06xirXsmSnfdn07gUK41m/EVACEIy3zIdP2rkSyCQTgtYshs
	SaR9xKNAufgP44GF1Y1+0vXMQwodAJDSmmWG2plvAYV5RNVz7erdTLZA8b2WUpY8Ey5AJVsvclRNl
	9gh1k90xlDp0ranEnbIqvpYUSX0W/5TknKTCxigZGelcRCo9GI6L3GT03Eri9quTAKsNx5dtOOmIC
	qB8N9hj93Po1g8fsvPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqd-00000002UdT-0ggy;
	Mon, 23 Nov 2026 07:52:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqc-00000002Ud2-0vvE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 968A361E31;
	Mon, 23 Nov 2026 07:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3E81F000D0;
	Mon, 23 Nov 2026 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420341;
	bh=t2W2owkpBCVo5YvfxGBxlpKmBfU+hvS/9sxrZ7gmr0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OYK7nhDJyR2sfniYIuNJQEdZ8tFw2Iw1+xfuBPM2fon4u7rjzNkpgesrKA2varJbK
	 m2ZHcO34jiQ0Y5X1GH3TwFggKcd3MQS7Eovrz/NT4aB/yRwwsOGm9TuGHV9zE9dPeY
	 uedCkwI6rSQhvu9CWJ+19Ma3OIP6B41UE1TYFWMgbS4NVfFTGtcgplVkcfCQR9Fi2Y
	 W9041bG0H8soB+DLBqDDW/7iKYuZ0WdGxsN62Q0lHSHmv35c/EPSotPp2XTq+YWwRk
	 qvIeC8TfXBqWlnOpD8BUBRJmo1Ke25tRJOyPMl6YXGQoesG0lwKxxP7oz3PhFJS9DT
	 QtspXWfunuo/g==
Message-ID: <2b4e18ec-a403-4f96-bdda-8165bdc917c5@kernel.org>
Date: Mon, 23 Nov 2026 08:52:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/8] iio: adc: at91_adc: switch to
 device_get_match_data()
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-4-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-4-abdelnasserhussein11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23-Nov-26 8:00, Abdelnasser Hussein wrote:
> Use the firmware-agnostic device_get_match_data() instead of the
> OF-specific of_device_get_match_data() to retrieve the device
> capabilities.
> 
> Check the returned pointer so that probing a device without matching
> capabilities fails cleanly instead of dereferencing NULL later on.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/iio/adc/at91_adc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 76000486b17a..2a378540837d 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/wait.h>
> @@ -1002,7 +1003,9 @@ static int at91_adc_probe(struct platform_device *pdev)
>  
>  	st = iio_priv(idev);
>  
> -	st->caps = of_device_get_match_data(&pdev->dev);
> +	st->caps = device_get_match_data(&pdev->dev);
> +	if (!st->caps)
> +		return -ENODEV;
-ENODATA is better.

-- 
Kind regards,
Joshua Crofts


