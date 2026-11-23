Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EFZy5ogk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Px6+xaXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ab6ctNUxy/r8HI+PwIkKiBoMEAZF/vt5bRcy1+d28P0=; b=EFZy5ogkUwBBuz
	LNEg+SQbZm7rErR2kWyU6FM9FQmhj/TDnbq99M2on01TF0AkB8zUs4fUKrpOlgBluJ2YnTlD5LK4J
	+dAOwmQEDyPARH+EZs8hwzjWzeaL1Ng37TG1bpVTBfXqhorqik6Z3M5hiq+5kzjBRGC1zUUd0anY4
	e8s8CXNsejD8jR05D6LBcrv8Pd+ZTVRrbjCGW1vxvGdHq2qoJtxHuGNrAtpz4pJzujEzDTkqYFRXx
	9L7Bj3tM6zcPhZlDEBb6DiBzYLaTEGF/qFVdIzjPqu23BX8519HDCW6eL7hzdoWbVozb/c/FIUkJ2
	XhX2R9rSxt2pY0N+PMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtG-00000002VJV-2Hcq;
	Mon, 23 Nov 2026 07:55:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOrd-00000002V40-1kTT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E359643431;
	Mon, 23 Nov 2026 07:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229BA1F000C0;
	Mon, 23 Nov 2026 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420404;
	bh=ab6ctNUxy/r8HI+PwIkKiBoMEAZF/vt5bRcy1+d28P0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Px6+xaXRsHJU5ZXlOFnGCSK83P5pfENBGk170LtbRnRSDSgh27d2DrRV1JdUpy9b/
	 D70aXSBSjzMTe4+OvY6+6OYaz2KvNqdYu5Y3r/BahbWh/zKk6iAGh5HBb86E9VBmvB
	 2z9UbO9QKzIXy8ZBMnX1vNn9Z74onu8S0+ldT7lCZHYVcGXTTq09uCDj3vWR1VE80y
	 tiBn2Rem6BtLF/oLAcDoz3uxY8lGEQO4gKmSytnZJTLT00vNfxUlNJJyGGUHr83EPU
	 lVC6fAYLLmLkMPZHsOhATVX7EgK2reYw7ferfBYiBDLcnsulZLWxYDjFtsHYuIzSvt
	 jP6+I15pVQh8Q==
Message-ID: <e4535b3b-aa2a-4f77-a13f-bd0f856c9aa4@kernel.org>
Date: Mon, 23 Nov 2026 08:53:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/8] iio: adc: at91_adc: skip unpopulated triggers on
 teardown
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-2-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-2-abdelnasserhussein11@gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-Nov-26 8:00, Abdelnasser Hussein wrote:
> The driver keeps an array of triggers and leaves the slots for external
> triggers unpopulated (NULL) when the "atmel,adc-use-external-triggers"
> property is not set.  Both the error rollback path in
> at91_adc_trigger_init() and at91_adc_trigger_remove() walk the whole
> array and call iio_trigger_unregister() and iio_trigger_free() on every
> entry, including the empty ones, which dereferences NULL.
> 
> Skip unpopulated trigger slots in both loops.
> 
> Make a minimal fix to simplify backporting. Moving over to device managed
> cleanup will shortly remove this code.
> 
> Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts


