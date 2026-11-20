Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B6606ABFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Q584FvA;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vzLzVcrk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nNheUa0aYoRrQSBs16Ly36vY+3Ibo/k8RtKCduo70eg=; b=4Q584FvAdxVTt+TYSjMy8c1uv1
	aCclLBkYm147iYRCZx6lgeGT0Qwm1r6OSyi3fEdUZETKUnDkfEvyswoPnz9JpZ2OZeTLAGd7YXz2I
	+5WP80MAxA0sjvGnXqrb7TQ2yKgxQWCtQEG3ucoxTZydGY1ifUBCXobPr78F3qJL/qhyf7Pkn5oMS
	TTowzTYCUDnNdGJVa2jJEddYUXEw3+Cq9KBKEIWNDba9QMHV8t9qqDKcLbyucNx/QjPT3yrr9smzo
	BoURq7NSb5242KSkIzHvRGZBy8C+OrrdL/Ytoaa29aT0dOQ0LHKVDPipO/9KsdYDoUKQuC59ofWfl
	Xhle0VVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP8e-0000000FCR3-449Q;
	Fri, 20 Nov 2026 13:58:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP8d-0000000FCQF-40AQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:58:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 439FF612ED;
	Fri, 20 Nov 2026 13:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E0D1F000F2;
	Fri, 20 Nov 2026 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795183130;
	bh=nNheUa0aYoRrQSBs16Ly36vY+3Ibo/k8RtKCduo70eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vzLzVcrkQkW8KqnstggvnCieEbDhso7NW8M2zqgheGDAxyV/1Usl/J+PoWc7iibdm
	 aVj/snRnvwIV/zSux9brN6ip4+7jVECm1D2Nv6gk034HXc10ujRQjs8PhDlH2OmJgz
	 vKfnMk2OIE5u6GUEy3tN2vVyYtx0cHjX/i6QFj8A=
Date: Fri, 20 Nov 2026 14:58:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: neal_liu@aspeedtech.com, joel@jms.id.au, andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, liuwb@xiaopeng.com
Subject: Re: [PATCH] usb: gadget: aspeed: clamp transfer length in RX
 completion handlers
Message-ID: <2026112035-syrup-universe-504f@gregkh>
References: <20260917103205.3049861-1-liuc63@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917103205.3049861-1-liuc63@xiaopeng.com>
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

On Thu, Sep 17, 2026 at 06:32:04PM +0800, Liu Chao wrote:
> ast_udc_ep0_out(), ast_udc_epn_handle() and ast_udc_epn_handle_desc()
> read the received byte count from hardware registers and add it to
> req->req.actual without clamping against the remaining buffer space
> (req->req.length - req->req.actual).
> 
> When actual reaches or exceeds length, the subsequent DMA has already
> written past the end of the request buffer.  Across multiple short
> packets the overrun grows with each completion.
> 
> A malicious or malfunctioning USB host can exploit this to trigger a
> heap buffer overflow in any gadget function (e.g. f_mass_storage,
> f_fs) layered on top of this UDC.

We trust the hardware here, so how can this happen?

