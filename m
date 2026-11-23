Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB70606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=woLH4fmM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0eJ0Gge
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9MO+FscP0oLuSA6HQ1IcEy1QVZX1vKoTYNCXPCvUOQw=; b=woLH4fmM/StnXk
	QHXlTebAxZF0lfuHPDyhnvGY9JHiKYneV4CZ389yamj5ZeDyMHv0ZUCcMgZlcOf0BaCEKCE1et9R3
	vJPfJn8NtJBRQm14u4bAJOYxsv7bcHXlg4zeKYQofuBv0bkHK9KRsQKs86SYoaPhFWlyXN+hVYwm2
	2wZKqCtUQrKFJy9kFSxiPH3K1kxhxVPgbj4Z10HQARwZqPkrEAbxFtLAFyG4Pw5jNIMGXLiWynZ8k
	04gARZy9WSc2fqpLqMDTthFffZfnrrv7NOTShz++cnITQGzFifzoZ08zPizOgW3x3/jW60iR9qCA2
	obuCWyfcj/NZiDNqgANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP0N-00000002Wec-2P2k;
	Mon, 23 Nov 2026 08:02:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP0M-00000002WeQ-1nyF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:02:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C31BA4429C;
	Mon, 23 Nov 2026 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37F01F000D0;
	Mon, 23 Nov 2026 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420944;
	bh=9MO+FscP0oLuSA6HQ1IcEy1QVZX1vKoTYNCXPCvUOQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=c0eJ0GgezLjfSBiuvX+K/2pdMbAnzKg7QxaZcK8XLFDDRu19ri0tLhDrzQyDl1g73
	 On690aa1xcMhTJifi+zykOBWdp440jat40bkrqD94/djB2t87EPBTkPDQjhjuws50V
	 iYut90gqtgBh+mB5/isPqw/KLsMRL5XCreGaQJit9nyn0CfbOXa/uiP0VUyqGss0Yd
	 gUxD9BFRICQHpvE14uipfccpBBkSsKoWyrGamSYiY2rsk2oZK9cn8ioBZcz5avJbBr
	 yNcdNefKr3Bd/pzfzRwNJw+ibY/WuVWLdofOOOPoBvhvDjEGVarm1roz8a0BTnk81/
	 4SqkW6XKlVg8A==
Message-ID: <ec05443a-a61a-4eb1-947a-c044faf9206c@kernel.org>
Date: Mon, 23 Nov 2026 09:02:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to device_property_*()
 APIs
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
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
> Use the firmware-agnostic device_property_*() helpers instead of the
> OF-specific property readers, so the driver does not depend on a device
> node being available in probe.
> 
> Update at91_adc_probe_dt_ts() to take a struct device and read its
> properties through device_property_read_u32() as well.  Since the helper
> no longer uses DT-specific APIs, rename it from at91_adc_probe_dt_ts() to
> at91_adc_probe_ts().  This removes the need for a struct device_node
> pointer in at91_adc_probe(); as a result, at91_adc_probe_ts() now logs
> against dev (&pdev->dev) instead of &idev->dev.
> 
> Drop the " in the DT" suffix from the missing property messages to match
> the firmware-agnostic property APIs.
> 
> With no OF APIs or struct device_node left in the file, drop the
> <linux/of.h> include and add <linux/mod_devicetable.h> for struct
> of_device_id.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/iio/adc/at91_adc.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 2a378540837d..b6e6fa77c782 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -15,8 +15,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

Remove this, The corresponding device table is pulled from platform_device.h.

-- 
Kind regards,
Joshua Crofts


