Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZPnyvYyl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Vo+gMKG2;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=J/o/wHZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=; b=ZPnyvYylSbT3fGBfciQXQgWKeG
	vcGi00ZQbP0fBx07UDTl9MA5Jyw+3aXZAI1DoALw1JbM30bfttCzoa672rRNyEsW79ApQLyGSOsDp
	Zjd1pUoVgUEQ3DbS2xPDvQYFyKzbktyKlevOABHOMzBG5OdG1l+0aw4hEuTRLoMmUYnlKPXFsFP8+
	84+TE8XdtjOhNSidI+nettC/uOSkC0yqXHhoK8sqv89wbsizgnjQIrhHVozstU0kXuoGkCx8//J/2
	jgbW1CxT2ZqXtrDE12ZCgHegk8A29l5Z+/NetLf+4kAfjeVn/DnbEjSLDniKU6hzn0OtZkB4H6ogF
	n0FmuZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRVd-00000007D9W-3SeG;
	Tue, 17 Nov 2026 22:18:37 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRVa-00000007D8e-1auI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:18:36 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1794953914;
	 b=RvHqQnVq1hM92tneguHuvPkiVsL2bxFr0vGhYzVEQzzj6kJQDvDBhnGHmy8BN4W2cgNIkgwb1n
	  F1P3uTjVtkX+N7mHbO7m39DYHf93j7Aty0P22sqoDUZWSYbX92Vnow5ml2evoYPBfzXafu7bnc
	  hbiOEvEH3s2mXTrrxJR6z9QLY4AvfUykqnJ4a3v/zCh0fN9T5o+qtn8MOlK/maL4UvSYG4R/rI
	  MwlacJJ/tq2A8UqhiliiWAeKNytE2yEYR+shVwHy7/9fobo4DC7YvOYfWn3Eu67O7UfbWYXzBq
	  0jl+ZYGThaXoNuazqohjW9vDeH9Nq6quUAPIbefpEbUvhg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1794953914;
	bh=lLTugMaSzlCBSdBDH2IIIB/bAhkr/et1oe9MmxV/meo=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=E0S1Q5EtlF/P7Q0D1iTETQ8rJoGlggyko8UErxctgvq0BJWBdaY6OC9WSqPgFInjPESH6rT8QC
	  /+0l9G7/GnWHfS/t/UUC4d+4ktyfOFU/+LvZMimu/S30deRDRNEA7iYqMHy7svp075FvwO5gB1
	  0nHPHKWEkrfg4lwmj8phI4sHI2yopE4KDgkYE4Lz+WTQbH+fC6NtIuvqoHJw/xyG2UJON2fZGM
	  fWszYzIpFpYAr3Q3i5bLmpg9SqcDKwVprxZbU7JEb8URVO8EXoWdtZ5ehQOqS1LAJBZ5/tqsVW
	  TrnamOGwk1BgFWbbvRDV7pf4y7uJsckqnF9eTWyQimjdoQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=; b=Vo+gMKG2A2xTqtDPqVUfQosm+c
	grt/rB+f5HPzlTPEGQAoyCc//jQ+qUGK4Ene7utYCeHRN7nDGIC89iQAvEb4CpMUS4yP/G13fiKcs
	ExIiqCUBsS9d/ojB6xFNz2YWnQsIYiygrEiXGRVORWxmaqDPxkydCWPFPULrX3eLpj10=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRVT-00000000rgO-1Ucf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=; b=J/o/wHZMlZNHzlGj2v3qrP9lrF
	VBTkUAvJ0gtM++9cWsX0Yubj11+RtRGUwDNRkoZHjCrkf1RuoAIyHmo6uSXc/Cfe32dTtxBQLppcN
	BD5OKrVRmK2m4pzECQ/oF6ps0YLJ81c0iz7XtJHKuY1T70AbxRwXbjm+kE+TAWDyHMhs=;
Received: from [95.251.96.187] (port=64319 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRV7-000000005TO-1T4G;
	Tue, 17 Nov 2026 22:18:05 +0000
Date: Tue, 17 Nov 2026 23:18:03 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avzQI6R9LubGP7-d@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avs6XQpoQmY_MNYx@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6e207b9c5ddbe3b3866f722d50468f4c
X-AntiAbuse: ID - 6e207b9c5ddbe3b3866f722d50468f4c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRVT-00000000rgO-1Ucf-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_141834_647931_D4B4CA16 
X-CRM114-Status: GOOD (  37.15  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > Depending on the driver originating them, data buffers used for virtio
> > communication can either:
> > 
> >   - already be allocated from the coherent memory area that is
> >     accessible by the remote processor; this is the case of
> >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> >   - be allocated from generic kmem, and thus not necessarily accessible
> >     directly by the remote processor.
> > 
> > In the second case, the DMA APIs can be exploited to obtain a
> > functional communication, since they will take care of cache maintenance
> > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > feature flag can be used for this purpose: with it set, the virtio
> > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > 
> > Bounce buffering will be transparently used in two cases:
> > 
> >   - if the buffer address supplied by the virtio driver is not suitable
> >     for DMA transfers, or
> >   - if the reserved memory associated to the vdev is a
> >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> >     and from this pool.
> > 
> > With this support in place, any kind of virtio device can be supported
> > through the remoteproc-virtio transport, at least from a data exchange
> > standpoint.
> > 
> > Note that remote processors behind an IOMMU need da == pa for the memory
> > region(s) the buffers are allocated from.
> 
> I'm not sure to understand the da == pa requirement - can you expand more on
> that?
> 

Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
it can integrate with this work is the main reason this is an RFC, as
stated in the cover letter, because I'm not sure I understand all of it.
See for example the dma-to-da conversion in [1] or the comment in [2].

That said: all the IOMMU setup that is done today by the remoteproc core
is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
device backing the virtio device). For that reason, the DMA subsystem
should not be able to know that setup even exists, in particular while
performing swiotlb operations. Hence, the requirement to have a 1:1
mapping between da (i.e., the address the device uses) and pa (the
physical memory map).

> > 
> > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > they are explicitly excluded.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index f1b362158a9c..1496659ddff9 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> >  	 * All non-remoteproc-specific virtio devices are assumed to be
> >  	 * compliant with virtio specifications 1.x; there is no other method
> >  	 * to transmit this capability from the remote processor to the host.
> > +	 *
> > +	 * Virtio devices that are specific for remoteproc usage take care on
> > +	 * their own to allocate memory from the device's coherent pool; use
> > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> >  	 */
> >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> >  
> >  	return features;
> >  }
> > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> >  	features = vdev->features;
> >  
> >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> >  
> >  	if (WARN_ON((u32)vdev->features != features))
> >  		return -EINVAL;
> > 
> > -- 
> > 2.56.0
> > 
> 

Thank you!

Reagrds,
Francesco

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461


