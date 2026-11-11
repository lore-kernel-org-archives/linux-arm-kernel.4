Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPJRFrLH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTEeUGJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QoXDFOU7PGq6/Dzt88XHi/3F/xg2sHOoOolhNnfS460=; b=nPJRFrLHnsx/hA
	rf5ZXRQjqWNKKGx2ImNMmmsiaOiPjj8mCztNg4vwGu9fcD7dLf+0+KxXnbXIVbqjDeFoCjXqyrWIO
	XMMvMqAvzWHq7kGjkpRd1r3d81ZFfqKEheFTHZxSetM1QxjK/3PjicyiCMjssks+aUxOoJbu7afV5
	WCZNVaS7za3rCTx646ga5+UPrX/5btJxbyUkMUVp1n77AreuQxHSfGSarBjdKuLMSzXjwJlm1+NAQ
	r2bojTNQYACRMQhVVli6m0gEn0qhL4hfOYrnI4c26/XC1Z1gUel9usVaDC2qqwDI1ZAL9Ah3D4Zke
	mPeCx05AmCwpGIUpoxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6J6-00000006SIX-2Rus;
	Wed, 11 Nov 2026 11:16:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6J5-00000006SIH-2NBX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:15:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 171134171B;
	Wed, 11 Nov 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=90.182.112.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794395759;
	b=Nt4RQpfM+ga5ySPSLPhX8s4KJZ9JyaBK+cNWLNtqS8aktUuzmPDCNswqpWoskHLFPSby
	 9YYw5lyy/qSz35Pa/k/PZpWFDGJLhc/CQhPgKnEwQ7Rw72tiL0uKgdg6cIeClOVRQ19SJ
	 tE+nPznfngfPfJc+6MM6e34Z/9JAAsa1WugEUHfLAT9oLigFospTZn9JwX0fpZIQsWDUz
	 NyINYxb5v804Lf5ZMJjic3e8sWZ2hDrTk+XHAsH1A+n4OOUiDNIVt5Y/lp9rZT0jYtkv5
	 lFbL0UIE6K3vn6aAHYfwIIPAZV+g1DIkyyz8enWSMdOsEJ8ueLtYavIBidwGCQ8nqEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395759;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QoXDFOU7PGq6/Dzt88XHi/3F/xg2sHOoOolhNnfS460=;
	b=btRh8RyrT5QwhD/rew/oHOjv1rOTCqxtUZrfi/sY2ChKGHE1fumB0kWUjr6uJLM9kW0O
	 UVZZ7mm0yDOeTnYOXYSQzHU15tJqGC0RBHQBAswWdQ8oNEXXm5LlKgShRbBsNS7kgnWP8
	 wLK6EQYBgLYfvrWJx54kFwm6yINFlbkBQdga4Ca9KK6JmJU2GKhZISjrc/k2IoEvqRonO
	 sgu6vxtZKuiT4BvUx3Cecqk1ZmSm+zFAym1ZBo4GDAfxqXSMgSlhmcjJZFj4y2Tl6fuVR
	 vDFVnJnjwIr2eRnrqfdoN1Y5U3W9lfxpmYEleL7LmnkDHRM31ujrr+ASO+Fk7A8KvDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=90.182.112.124
Received: from localhost (90-182-112-124.rcp.o2.cz [90.182.112.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id CF7B81F00A05;
	Wed, 11 Nov 2026 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395758;
	bh=QoXDFOU7PGq6/Dzt88XHi/3F/xg2sHOoOolhNnfS460=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iTEeUGJdOjUraFXVuwGYomD+0WPcN9oCwQXFYR3BcTo8GLm2UhM18ixcAJs9hGVhj
	 E6eih64WxTR0GT3BbnRuVxQqK5jeflsoNlSgEFLUfUQ4Mz9LkttDxiLpl93GipaIhx
	 u/SKOQJyTvx1Nw+OCrPRdDS0XkrnPCMh4CaMNKSEiqecBaVVvVGTB7EzA58A9hzK0l
	 28VVrntWalbt6/ChLT/kZPm1o548/Cj14wsrmj9imkAkZi7UafJ4kerczc79SNB4OQ
	 tj9WL68Bb3m9cx6FxkbCDSgYeORNq48QxDtiCjfd72S4QkXOjX22L0HVCoFB5BAxbl
	 VgqZbKk8NySsw==
Date: Wed, 11 Nov 2026 12:15:44 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL
 pointer deref
Message-ID: <20261111121544.00006c23@kernel.org>
In-Reply-To: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
References: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 12:13:45 +0200
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> If 'atmel,adc-use-external-triggers' is not set in the device tree,
> at91_adc_trigger_init() leaves the external trigger slots in st->trig
> as NULL. The error paths and remove function unconditionally called
> iio_trigger_unregister() and iio_trigger_free() on them, causing a
> NULL pointer dereference.
> 
> Instead of just checking for NULL, refactor the driver to use the
> device-managed (devm_*) API for registration and allocation. This
> modernizes the code, eliminates the need for manual cleanup functions
> (at91_adc_trigger_remove, at91_adc_buffer_remove, at91_ts_unregister,
> and at91_adc_remove), and inherently fixes the NULL pointer dereference
> since the core handles the cleanup of properly allocated triggers.
> 
> As part of this simplification, the remaining trigger initialization
> logic has been inlined into at91_adc_probe().
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
> v3:
>  - Addressed review comments from Andy Shevchenko:
>    - Removed the redundant dev_err() after devm_input_allocate_device().
>    - Declared a local 'struct device *dev = &pdev->dev' and used it in
>      at91_adc_probe().
>    - Declared the loop iterator inside the for-loop.
> 
> v2:
>  - Dropped the simple NULL check approach.
>  - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
>  - Removed manual cleanup functions and error paths entirely.
>  - Inlined remaining trigger initialization into probe().
> 
>  drivers/iio/adc/at91_adc.c | 185 +++++++++++--------------------------
>  1 file changed, 52 insertions(+), 133 deletions(-)

I'm not sure if this is an adequate fix. I'd imagine there would be two patches,
one that just adds the simple null check so it can be backported and this patch
that will go upstream.

The commit that introduces the bug is 14 years old, so it doesn't make sense to
me to backport an entire devm_* conversion.

Jonathan, Andy, what do you think?

-- 
Kind regards,
Joshua Crofts

