Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A16606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PvYGD5sO;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=txk2FobC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4KYuo7FdU68DsPajG3eePVYny09UrQMaX1Lx+TuzLaY=; b=PvYGD5sO2+5ZZX0whp4XVJLdum
	f/K/DZcQ8nGynXdkF95mvwMb8DDg1imYXJIL2qALV4NLOWwOm/sQ7sxrIbML9EaCLuPMZSkCQytVa
	y19oDL4d+c7K6soKGyWjlI1GvBSeg/VnQHsrc7bBUfcoxYg0QbzXzrjqbZYrRMitH5XPRuN8AXMn2
	sEOlT4dr2XLffR5ZV2Eb7q+l3ie+RVOj58kzXf0PbNIKY9SuIGrg/5so1RjP3BFZqfOMz7WfTYULw
	1ECK2nLk/phQfQ3NDJvb5erRDKCUjsLZ5tSNz7oBfE8FmpHq3DBSairSBed7Ap/NIjyLTL7oiCtcQ
	uxJpZj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPWd-0000000FF79-3C5v;
	Fri, 20 Nov 2026 14:23:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPWb-0000000FF6o-3Jde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BDA161E61;
	Fri, 20 Nov 2026 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A37D1F000D8;
	Fri, 20 Nov 2026 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184616;
	bh=4KYuo7FdU68DsPajG3eePVYny09UrQMaX1Lx+TuzLaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=txk2FobCLE0AC67/e5/J/x9/WWzKuRMeZa4PN2EvMYHVv7Fwoag55XJKa/gLEXXi6
	 UxCpDQ/lhXxJlUApt2jZMm7lIxok4FC7GS8Yk4ReGdsEFECDOYbJk5JzI3PEj/lom6
	 OEnFcZKYctT7T66Q73nYfLaCA5C1P0m7TvMZaa6E=
Date: Fri, 20 Nov 2026 15:23:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: linux-usb@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Johan Hovold <johan@kernel.org>, Roland Stigge <stigge@antcom.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guanglei Zhu <zhugl3@xiaopeng.com>
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: handle interrupts with an
 empty queue
Message-ID: <2026112017-curfew-neuter-44d7@gregkh>
References: <20261109121035.34561-1-fangxy@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109121035.34561-1-fangxy@xiaopeng.com>
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

On Mon, Nov 09, 2026 at 08:10:35PM +0800, Fang Xieyan wrote:
> A request can be dequeued after a DMA transfer has completed and filled
> both endpoint buffers, while the delayed endpoint or DMA interrupt is
> still pending.  lpc32xx_ep_dequeue() removes the request from ep->queue
> and gives it back via done() without clearing the pending endpoint or
> DMA interrupt status.
> 
> When the interrupt handler then runs with an empty queue,
> list_entry(ep->queue.next, ...) derives an invalid request pointer from
> the list head; list_entry() does not return NULL.  Passing that pointer
> to done() in udc_handle_eps(), or dereferencing req->dd_desc_ptr in
> udc_handle_dma_ep(), results in invalid memory accesses and can crash
> the kernel.
> 
> Check whether the request queue is empty before touching the request in
> both handlers.  In udc_handle_eps(), do this before sending the deferred
> ZLP and disable the endpoint interrupt when there is nothing to
> complete.  In udc_handle_dma_ep(), still disable the DMA channel and
> clear the pending EOT/NDDRT (and SYSERR) interrupt status so the
> interrupt does not keep firing, without dereferencing the missing
> request.
> 
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
> ---
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> index 044c31869cfb..67b0d6f73e43 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -1945,6 +1945,13 @@ static void udc_handle_eps(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
>  	/* Get endpoint status */
>  	epstatus = udc_clearep_getsts(udc, ep->hwep_num);
>  
> +	/* If there isn't a request waiting, something went wrong */
> +	if (list_empty(&ep->queue)) {
> +		ep->req_pending = 0;
> +		uda_disable_hwepint(udc, ep->hwep_num);
> +		return;
> +	}
> +
>  	/*
>  	 * This should never happen, but protect against writing to the
>  	 * buffer when full.
> @@ -1958,7 +1965,6 @@ static void udc_handle_eps(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
>  	} else
>  		return;
>  
> -	/* If there isn't a request waiting, something went wrong */
>  	req = list_entry(ep->queue.next, struct lpc32xx_request, queue);
>  
>  	done(ep, req, 0);
> @@ -1985,6 +1991,23 @@ static void udc_handle_dma_ep(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
>  	ep->totalints++;
>  #endif
>  
> +	if (list_empty(&ep->queue)) {
> +		u32 mask = 1U << ep->hwep_num;
> +
> +		ep->req_pending = 0;
> +		ep_err(ep, "DMA interrupt on no req!\n");

Why spam the kernel log for something like this?

And how was this tested?

thanks,

greg k-h

