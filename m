Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7BB606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HPyzDlIY;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NRToHVYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LxcUDiNfgVZlLBkTJZ/peRaTOqYje0NP16TBE+dlTFE=; b=HPyzDlIYBLwNECBrFv4CqYopnP
	ZwPxkz0b8BVh93XyRk+fySz/tnM7ctf32bXZG8eUUnqEIIMqTrRgaTjqUWAs755u+5LIKq1z+ui8v
	jyhQzj0uBFHXU71P+SMtPVUg2aV5ae13ncc4Kt567vKOA6VZNK0Q5QptSdWAe1zH2IzJvO/Yl/q/g
	ZNoXKJ+/BmKikkA9WB6/CTkg5msvY1UEAEt2gvmfv1SaMj6jpCqkzWJjPCoyetvo7+G/MAOS5kkAX
	0mYwnsz2/9DkhBWHHHu1v2OSVWgSsjFOye2e6y7u/9RSJSfL/rgwXwLaz7zUdFnlv82wFAZVxPprL
	mgluN2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPM3-0000000FDkh-3wak;
	Fri, 20 Nov 2026 14:12:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPM2-0000000FDkb-3sd5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:12:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A11A041398;
	Fri, 20 Nov 2026 14:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E891F000C4;
	Fri, 20 Nov 2026 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795183962;
	bh=LxcUDiNfgVZlLBkTJZ/peRaTOqYje0NP16TBE+dlTFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NRToHVYuKubrqs6oyN6rHACRIwpKh6wnwDL2+Qa/1vbZJZ7ISv0BWR4v7vFzB1bY/
	 LPj4A6Ujfp/PxTK5fY2TPj0sYUBbmeFkrNVGfcELWta8CRd//OL2ADuERhUjYX3Yhj
	 Jbr5UYHz91Rhi6/GiJb8bxBZZ9Kyz3UDcGUFdI2E=
Date: Fri, 20 Nov 2026 15:12:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, liuwb@xiaopeng.com
Subject: Re: [PATCH] usb: gadget: udc-xilinx: clamp bytes_to_rx in
 xudc_ep0_out()
Message-ID: <2026112022-babied-unplowed-3ede@gregkh>
References: <20260917123111.3757737-1-liuc63@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917123111.3757737-1-liuc63@xiaopeng.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 17, 2026 at 08:31:11PM +0800, Liu Chao wrote:
> xudc_ep0_out() reads the received byte count from a hardware register
> and adds it to req->usb_req.actual without checking whether it exceeds
> the remaining buffer space (req->usb_req.length - req->usb_req.actual).
> The same unclamped count is then passed to memcpy_toio(), which can
> write past the end of the request buffer.
> 
> A malicious USB host can send more data than the gadget function
> expects on a control OUT transfer, triggering a heap buffer overflow.
> 
> Note that Haofeng Li's recent patch for the non-EP0 path
> (xudc_read_fifo) explicitly excludes EP0, so this code path was not
> covered by that fix.
> 
> Clamp bytes_to_rx to the remaining buffer space before accumulating it.
> 
> Fixes: 1f7b0c6d8e34 ("usb: gadget: udc-xilinx: Add Software data structures and APIs for xilinx udc")

Don't make up git ids.  You did this for many of your patches, I've
dropped them all now.

greg k-h

