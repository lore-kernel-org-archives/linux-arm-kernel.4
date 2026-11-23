Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE0606A692
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWLjIh5V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcZEF1Jt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MrIf/jjqPJWBF8I0O/v/o7wGWbgE4gV9gMxEsZiWqLw=; b=zWLjIh5VLJUyco
	V3AwjSWTy099PJIZ2CU9E5A7m7kGnR3fVvRgtwarL+RK1ZnQuZm+4pk/y+2DehXhYpWAtceYMKuWC
	bdoOrOaPZl84G6z5qP+rmrmCeFoemUOscPyJKItPI39Bn3Y56grZxuu/Swen6EAK9lPUo076dAE7e
	eKvSQ+K154xB5T7h4s544PgSvHLBLuT7dVTVZeUXthrcuv5u1U6d3eiRtediePCP56Ie1kok0AXCA
	prFWB16KTUgH76pkbwXqj0Tg3y/LB1NyN4OxOH+FPTbeWZpG1WOioWVtP7yTcg6q8v1C8cPm0Hh5Z
	LDyySRFYfpDm1PdV7sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP0z-00000002Wm6-12Hz;
	Mon, 23 Nov 2026 08:03:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP0r-00000002Wkt-0hJp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:02:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53487612B9;
	Mon, 23 Nov 2026 08:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3341F000C6;
	Mon, 23 Nov 2026 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420975;
	bh=MrIf/jjqPJWBF8I0O/v/o7wGWbgE4gV9gMxEsZiWqLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZcZEF1JtJ4DyIkiy6gEVbuy1Ruskmegc0nn/hJ1NEu1VXCnCAkVGsKaRad9+uv+2g
	 zpUx6IEuLYj0Cq4GGANjtZ3g14eIkjWLPBHN5vrUJP9PDTwy7fbXGD5yhMQux8Odpm
	 f113DnESpWMZczFYAPfc3FFlVE0t4597RQ1dukxV7QXCDZPlWEG6ctBgJuUuOe7Pcc
	 /y9Kk1jXHUqiSSaewoXJ1R9c/1BQVXvGy6CDical9fRSU0P2ZryTuGpVrAdp7rhqDi
	 y/hoVZ4CPGzJt1vL35U5Id6yL/06wWY9bnHLJW3aiVxzmkrN9N4bee1pxTiyxM7/kz
	 2WFtm8LGaHgxQ==
Message-ID: <1ed3be2f-2256-4e44-95ea-10dabae6ebe2@kernel.org>
Date: Mon, 23 Nov 2026 09:02:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 5/8] iio: adc: at91_adc: use local struct device
 pointer in probe
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-6-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-6-abdelnasserhussein11@gmail.com>
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
> Introduce a local struct device pointer in at91_adc_probe() and use it
> in place of &pdev->dev and &idev->dev throughout the function.
> 
> Also switch devm_iio_device_alloc() to use sizeof(*st) instead of
> spelling out the full private structure type.
> 
> This is a preparatory cleanup to reduce the diff noise of the upcoming
> conversion to device-managed resources.
> 
> As a result, messages previously logged against the IIO device are now
> printed using the platform device being probed.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts


