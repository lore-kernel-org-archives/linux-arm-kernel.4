Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC74606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QlvzV936;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZuzruOWF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YyZt9yeuVbjoTHrdgaNjjeu1ZmN+pS2ygE4HBH0Goy0=; b=QlvzV936CHj/HDFr88A23NIIRH
	uDWyGNtYFkYz0TMXqK3ZDDciiuYwSU3ib0vzshsqwOBXBeVUZUc9hcBNr3rpXPvRdBvVZUSL8NFmW
	WlYH0ItO4zp8L0viALQTWc0+393chKRMSOj26v5M9Uq7owtayOQK51BmDRCJ6UZPVmU5W1jf9VoMf
	xNm5sktsG3xtoXcQkkCFO8McHH8KibDV6tjaviLY4nQ/W56y+Egmu4EzClAIoMRUMleD7Alz26v6G
	jqkbSvGNYKObQTN/iF6mhX20sZ2ufG0qjkSNOsZPyDDQRrZvfKzWYkIlUESlcbAdrY0jS/709kXFx
	PPxPhWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQU-0000000FEOm-0Z9O;
	Fri, 20 Nov 2026 14:17:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPQF-0000000FEN4-1UaO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:17:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CE1262C7F;
	Fri, 20 Nov 2026 14:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124EE1F000D3;
	Fri, 20 Nov 2026 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184221;
	bh=YyZt9yeuVbjoTHrdgaNjjeu1ZmN+pS2ygE4HBH0Goy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuzruOWF80XSzJ7eqQZ68ZC5rcmBTm3c7tbhdwQwGkQoJlf2qK1cLA84TwpyJjE0n
	 unktLYF/oVF4GWEzrn6MLKYZYPFy1rkA29GonMKk4st+i+VMT98IrTvAWvnz19OZPh
	 txe2B5cXtcFTCqJdVoLfUwiBB1ggegWkahmktHXk=
Date: Fri, 20 Nov 2026 15:16:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neill Kapron <nkapron@google.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: gadget: pxa25x_udc: Support combined PXA and IXP4xx
 builds
Message-ID: <2026112047-identical-dry-6296@gregkh>
References: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>
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

On Tue, Nov 17, 2026 at 11:47:25AM +0100, Linus Walleij wrote:
> Allowing little-endian IXP4xx kernels makes it possible to enable both
> ARCH_IXP4XX and ARCH_PXA. The shared UDC driver still assumes that these
> platforms are mutually exclusive: it defines UDCCS_IO_ROF twice and stops
> the build with "Can't configure both IXP and PXA".
> 
> Select the controller quirks using the running CPU rather than the kernel
> configuration. Match both XScale CPU families and their supported
> revisions, and remember whether the controller belongs to IXP4xx. Use that
> flag to select the existing isochronous receive overflow bit and to keep
> the EP0 status workaround specific to PXA.
> 
> Remove the IXP4xx clock API overrides so that PXA clock control still
> works in a combined kernel. Leave the clock NULL on IXP4xx, which has no
> software-controlled UDC clock, and rely on the clock API's NULL handling.
> 
> Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611082010.e3nJgvr4-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Fix the build failure when PXA and IXP4xx are enabled together by
> selecting CPU quirks at runtime.
> 
> I guess I caused this problem by allowing for little endian IXP4xx.
> 
> Assisted by LLM.

Does not apply to the usb-testing branch at all :(

