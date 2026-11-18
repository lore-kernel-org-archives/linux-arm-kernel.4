Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F9606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K0eXVZTQ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=aUNYbtb3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=UEg0TeVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=K0eXVZTQ1AbXMlsgOUnU8hBAAY
	Yrpra7cin4tOX4XTs0uB8BgEgfnKLH/DMfZWTd8YEI1/hmaOGez3hdBQWCwjuY5tan0lHVk15dqzt
	ANpZqEhmFKzbuFCd6kx2QtPiXDyVR2L4ypL9S4w2bgp7aCSYKx4kw/5VOvRMmNwrL4j7Co7AI0i78
	Vh5jHwWPOaGFL1rQa1DIn4EiiHmmkqRd1+oPEsFEflOra3/Q1rvfvTYn7EtejZceNfoOAh76YETtv
	1C6Yc+VzwnJVk7shMq4AxLkA5y4+WbDL3+7pR7VqvFjfOdpQiBm8AaWZ/ozNcSsfVtESE4gMVOJcu
	gpg0MFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTivZ-00000009d7n-3p6V;
	Wed, 18 Nov 2026 16:54:34 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuO-00000009cTt-2W9Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:36 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795020800;
	 b=m89D1UopWpbgTDwUrjnLTUQKc02puovR1NCZxKXveX0SqKH5btnzA8hmx8+eqiu2PfDTbUdJje
	  7b0ZUJK/tyty5eJqUU/YLRs17cKjcqa0LZxx2Goe0gVtUzlQfsO2N5yT0aS6MuF6rLWXdxtkje
	  BW7TeR8fw3gcfoulY+iXFtsS5ghRBlkINmbId3KnfdVjInFctqdLD1tZwhEeUha1QqXmAqVfkL
	  +BOr3zazgj/4UHKsUP/MQoeUww6FYbDYGBYiNdXZn9stW0FFP9uBBFwScpJ2Foui41mFS8yDpM
	  WUpkVkFyp8zADhYBojH6Ia8VjxdUgZqcN72cEDXPRvr/kg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795020800;
	bh=hq59j9MIUVaImvVcxyR40iCL7QyC1S8ejdHje+eHY8Q=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=oDVr21xpOUUfmHfW40Vljl5MYgRuCs5Kop9AvcK6h8PK0xqT2LbPILupheKiyemvdt3+YOgBlJ
	  zYh2ds8V4dpL8f6Xwi3c4NsQZq+jKha3HT+AyLjs1kYGv7O/9s2z/id/dFHfzaioAx5VfHTYBZ
	  LbuQMd+X6W5/j1ilH5nxRmyUoR12hRO4XR5YonJEbeNtnnBm4jmtk96YJRXtKKKd/UdeGzdOsS
	  6FqYSGqy+i9wad0kUiUqiJurmWbWlY+FYoV/qa0IRetFeW/zPc+9lc23P32FnvsYbhtDXahSzo
	  fvyUIkZbMXC4BTsuA0Li91TULc8T/4FpfYe2uGu1qEzw4Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=aUNYbtb3hNVqNXyM3adC3Rq543
	OD8Wq5tjaGDEEkgintz/U8pn+to53wPpQYd6TrBrLOVrpT7At4+dwA78OgTi1d7FnUHfLWH4NJxfj
	DRJN+Pit0sI0wwxFTwYLaqO2S7P+xGLJnp6YDLlOOwAld0CdTeT1UsgfTxM8Ye30GXuQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiuM-00000000x1b-0yLv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=UEg0TeVF31O2xVuW3Qw4fUKuWq
	22O0c+RoE43yXb2K1fcEGcj4yLs39qyWMdbnThi3UjcTjDy9fjjzecG0xypXBoVvkqR0gQywrnrpy
	7aRCBZeCKAMrhgnP2KZqp4EmLuTXsa4adOHWK4o1SFGw482Eo5u6z+Uo4965hkzS3Fmw=;
Received: from [95.251.96.187] (port=64594 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiu4-00000000OYn-0kDy;
	Wed, 18 Nov 2026 16:53:00 +0000
Date: Wed, 18 Nov 2026 17:52:58 +0100
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
Message-ID: <av3XR-APUl0ENo_n@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
 <avzQI6R9LubGP7-d@bywater>
 <av3HVh5jlMsyaiq7@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av3HVh5jlMsyaiq7@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: a3685a3b1e6134b75f4d3e6790386cc4
X-AntiAbuse: ID - a3685a3b1e6134b75f4d3e6790386cc4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTiuM-00000000x1b-0yLv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085320_821781_064CD9C2 
X-CRM114-Status: GOOD (  47.91  )
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

On Wed, Nov 18, 2026 at 09:42:14AM -0600, Mathieu Poirier wrote:
> On Tue, Nov 17, 2026 at 11:18:03PM +0100, Francesco Valla wrote:
> > On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> > > On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > > > Depending on the driver originating them, data buffers used for virtio
> > > > communication can either:
> > > > 
> > > >   - already be allocated from the coherent memory area that is
> > > >     accessible by the remote processor; this is the case of
> > > >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> > > >   - be allocated from generic kmem, and thus not necessarily accessible
> > > >     directly by the remote processor.
> > > > 
> > > > In the second case, the DMA APIs can be exploited to obtain a
> > > > functional communication, since they will take care of cache maintenance
> > > > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > > > feature flag can be used for this purpose: with it set, the virtio
> > > > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > > > 
> > > > Bounce buffering will be transparently used in two cases:
> > > > 
> > > >   - if the buffer address supplied by the virtio driver is not suitable
> > > >     for DMA transfers, or
> > > >   - if the reserved memory associated to the vdev is a
> > > >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> > > >     and from this pool.
> > > > 
> > > > With this support in place, any kind of virtio device can be supported
> > > > through the remoteproc-virtio transport, at least from a data exchange
> > > > standpoint.
> > > > 
> > > > Note that remote processors behind an IOMMU need da == pa for the memory
> > > > region(s) the buffers are allocated from.
> > > 
> > > I'm not sure to understand the da == pa requirement - can you expand more on
> > > that?
> > > 
> > 
> > Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
> > it can integrate with this work is the main reason this is an RFC, as
> > stated in the cover letter, because I'm not sure I understand all of it.
> > See for example the dma-to-da conversion in [1] or the comment in [2].
> >
> 
> The remoteproc subsystem was written a _very_ long time ago and the context of
> some artefacts, such as [1] and [2], is long lost.
>  
> > That said: all the IOMMU setup that is done today by the remoteproc core
> > is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
> > device backing the virtio device). For that reason, the DMA subsystem
> > should not be able to know that setup even exists, in particular while
> > performing swiotlb operations. Hence, the requirement to have a 1:1
> > mapping between da (i.e., the address the device uses) and pa (the
> > physical memory map).
> 
> I would like to reserve the current remoteproc IOMMU design for handling legacy
> rproc-virtio devices, i.e rpmsg and serial, and only use the modern
> virtio/swiotlb API to handle authentic rproc-virtio devices.
>

Agreed. I'll come up with a proposal there. In the mean time I found a
multi-core system *with* an IOMMU that I can use for further testing in
that area.

> Based on what I see here [3], I think above sentence:
> 
> "Note that remote processors behind an IOMMU need da == pa for the memory..."
> 
> should be replaced with:
> 
> "Note that remote processors not behind an IOMMU need da == pa for the memory..."
> 
> [3]. https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L703 
> 
> > 
> > > > 
> > > > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > > > they are explicitly excluded.
> > > > 
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > > index f1b362158a9c..1496659ddff9 100644
> > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > > >  	 * All non-remoteproc-specific virtio devices are assumed to be
> > > >  	 * compliant with virtio specifications 1.x; there is no other method
> > > >  	 * to transmit this capability from the remote processor to the host.
> > > > +	 *
> > > > +	 * Virtio devices that are specific for remoteproc usage take care on
> > > > +	 * their own to allocate memory from the device's coherent pool; use
> > > > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> > > >  	 */
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > > > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	return features;
> > > >  }
> > > > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > > >  	features = vdev->features;
> > > >  
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > > > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	if (WARN_ON((u32)vdev->features != features))
> > > >  		return -EINVAL;
> > > > 
> > > > -- 
> > > > 2.56.0
> > > > 
> > > 
> > 
> > Thank you!
> > 
> > Reagrds,
> > Francesco
> > 
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461
> > 
>

Regards,
Francesco


