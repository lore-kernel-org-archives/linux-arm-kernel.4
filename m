Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RY5MWKAS;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=p4Oi7dQ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b8v+t+OSB4EchFvCdH8uiX9uT/Ot90vpwiBcqriqClE=; b=RY5MWKASOweV5mm1/ueGr5zpyQ
	NHjCRczEBSBYVkVhMDrALiZz7i4EvZlEln+n5uMBZnp1Lb+bYzsdIVh9d4VSH+dQddtN2981sHvxG
	IWVujFsCI63QRrNmjpw6qnA1VENjtq2FkCYooc+4Lftf4Q+ik/Tj289OA+GMPMMd/FPzUgxLodqng
	j/get+uJaRF0BiYQj6c8qkQ/4eHptMMTps0zp6xDGgcmWxWkBjZGoRdW+I2NTig1QkqPgY8ZzMMkB
	TV1sSWkqZcPbIcaIk+snh6jWK/oeJ1/glJ2yrNES3htWVnxnNz4wMD/k+MWWMeH+yCx881RQ9KHNu
	llepOngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPUz-0000000FEtg-108u;
	Fri, 20 Nov 2026 14:21:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPUy-0000000FEtY-18qM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 710DD62023;
	Fri, 20 Nov 2026 14:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C92A1F000C4;
	Fri, 20 Nov 2026 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184514;
	bh=b8v+t+OSB4EchFvCdH8uiX9uT/Ot90vpwiBcqriqClE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p4Oi7dQ4PiwYFyPdNXEMk2OPBSY+ONAvQblcEfI+aCStepVgr7a6JzeK7TNaDc+Mx
	 1ZteiylYz+HchFxQrS12M5gQg6jXcDgnlwR6LMsUvjEdwa1qvDjFagfdHIBK13j9pF
	 kgIPNOXogrLZSSOLCo8oiMUn2uSTHZbVbsx1RdAk=
Date: Fri, 20 Nov 2026 15:21:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hyunjung Ko <hj351016@gmail.com>
Cc: Neill Kapron <nkapron@google.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Roland Stigge <stigge@antcom.de>, Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: lpc32xx_udc: drain the pullup work on
 removal
Message-ID: <2026112036-strategic-deviation-bf21@gregkh>
References: <20261110114351.2524921-1-hj351016@gmail.com>
 <20261110120243.2540098-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110120243.2540098-1-hj351016@gmail.com>
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

On Tue, Nov 10, 2026 at 09:02:43PM +0900, Hyunjung Ko wrote:
> isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
> isp1301 i2c pull-up access from process context. The work handler
> (pullup_work) dereferences udc and touches the isp1301 i2c client.
> 
> udc is allocated with devm_kmemdup(), so devres frees it after
> lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which
> queues pullup_job to clear the D+ pull-up -- but never drains it, so the
> work can run after udc has been freed (and the isp1301 client put),
> dereferencing freed memory -- a use-after-free.
> 
> Flush pullup_job in lpc32xx_udc_remove() after the final pullup(udc, 0).
> flush_work() (rather than cancel_work_sync()) lets the queued pull-up
> disable actually complete before the udc and its isp1301 client are
> released, so the transceiver is left with D+ deasserted.
> 
> Found by static analysis; not runtime-reproduced (needs LPC32xx USB
> gadget hardware with the isp1301 transceiver).
> 
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
> v2: flush_work() instead of cancel_work_sync(), so the pull-up disable
>     queued by pullup(udc, 0) completes rather than being dropped
>     (OTG1_DP_PULLUP would otherwise stay asserted after unbind) -- per
>     Sashiko review of v1.
> 
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> index 94355d3d930f..b98faf5b71e5 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -3187,6 +3187,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
>  	udc_disable(udc);
>  	pullup(udc, 0);
> 
> +	/*
> +	 * pullup(udc, 0) queues pullup_job to clear the D+ pull-up over i2c;
> +	 * flush it so that disable completes and no work can run after the
> +	 * devm-allocated udc (and its isp1301 i2c client) are released.
> +	 */

This comment makes no sense to me, sorry.  WHy is it needed at all?

