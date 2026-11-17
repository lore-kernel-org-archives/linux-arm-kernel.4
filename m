Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7Jdb61y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=AS4tuIwT;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=oRU6ioQs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=Y7Jdb61y/hDLq+1beRctn/EMj6
	c/wd/bmGBgMOhN8AfNDVrE/TMAYpZkYPDUh3Ya4Sin99evvLgpM6zKcQttfsGM2i1RL1Hp9IopGC6
	KNbPEIaFnLZ1n9tEMVNMMYnhx9/FZWZzPaOvGjl+aJbbnPJLgY2BakuKVHNGJjaXJfH+4oNG/I4qD
	wYRx1674qtw3azqBWZYsQSx770JrbFWY57VUFA8874awwZZi5+67hcQX+3WdlN14zUEW98Z5dOw9z
	FFaFM0ogN0TPoG6XuhbC6CrOdKiQezONNAFxsqhScmqX67+8aTM1k7Oi1czAZ4LG5jXsllSmuOG8U
	qRgzZsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRr2-00000007FI0-2bHs;
	Tue, 17 Nov 2026 22:40:44 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRqz-00000007FHf-3JFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:40:43 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1794955241;
	 b=cg49KS0h7F+EHX9Uh6Su1ofVpCfYM/eluH47cnsY7cT61Q4WcFbxzg9MNNsgIlaETmfwUrEN8k
	  k5r2wjRCQq5vhYuMt8173o/cnqkrI2BAvoAAs+24rD0E+OtNdrsZMi0oWHsf8srQyam/fXWK6z
	  J5Ulu0/BINEoW1gLkHBXXdT46gRruANyvlXxfj7vSgx1ofRBJ2ttXB4K3Pem6B2w0xqCcUkgcn
	  JJf/uJsab9McBkZBfxt4/cEgDWeOpI/KWfVYCs4OljTCicOIH8nUWXHqFGCUjsGrr1ksPgbYVi
	  WFZgPIV+zgfuikY/PFZcgOK0ldL4F+DUzDwUxbgltDLVTg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1794955241;
	bh=Oj52gqXQzkstpHvNjVxr4EJNLgpIaRPOLoYHmJcIMiw=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=te54QxuDW0HXLEMpgjKLMGX1brfh7D3Gb3nIyLD8+N91uM2hzbF7IuUnexMfAlHtJ9xopr5AQg
	  oVFZ+6woGLzyloDliZcnqCnwvcBEw1EcMUtCmx20wt7+n+CB1YWeBbOkvAki4010IiuUSdeyYV
	  WWernBoTQoVz8YgsXvdtWtVErb0hmNPfo03b8PrGIjdmjky42JIALjDiXRljl8IwAqvyP8W/jf
	  L1g4psv1YUxOLJjr8+r7khK7OYY2QWSDIhclHho0bxyfVPeQFqNI+rawKNQyqmyO0HynB4g9fU
	  AFfzGurWFIW5yuUwNuJqOEv9yrZVS4b0dYPV5MzmR1W/Kw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=AS4tuIwTkC//PwXPFdblvumuXX
	9VuEZ/o9XpKGuC1RTOZsyVB0x0/X3CQ7gYsjbZbqy0m5HjO81JUtJ4PpJPhIfm/eDsd0CMijMe3e1
	fy0d5P2HpEnJNc/PRs425Y0lEOJjJD3Zldx5Sp4S398B1GDM7zteIoYMJsrLZV8Ox2bY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqx-000000016tO-1qxw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=oRU6ioQsb09tiiVkx3MrYnIBqp
	t8UJEbLDV53tq0tBoKw5jtuDw1Y9IKIignXaFAR7TfjnAV6IRpNbQ+0+hcCBL5aEs8kpVIp9bkKJr
	pV9jCCh48sBuVCYYqiesYPh1UQPAiOduUQl52mpRJtqWAvymeqaOtUfpJ4KYkZqkGQeo=;
Received: from [95.251.96.187] (port=60017 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqa-00000000IA1-2MtI;
	Tue, 17 Nov 2026 22:40:16 +0000
Date: Tue, 17 Nov 2026 23:40:14 +0100
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avzVSG5rvoN0Z9OF@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
 <avyPa5rSx9rhf9yO@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyPa5rSx9rhf9yO@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 73d9419318b82d1262b647309af2ad37
X-AntiAbuse: ID - 73d9419318b82d1262b647309af2ad37
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRqx-000000016tO-1qxw-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_144041_995599_42F9FFED 
X-CRM114-Status: GOOD (  46.16  )
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

On Tue, Nov 17, 2026 at 11:31:23AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> > Expand the section on virtio support over remoteproc with details on
> > memory allocation setup and constraints.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 98 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> > index c117b060e76c..4b42ed582fb4 100644
> > --- a/Documentation/staging/remoteproc.rst
> > +++ b/Documentation/staging/remoteproc.rst
> > @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
> >  of any type (a single remote processor can also easily support several
> >  rpmsg virtio devices this way, if desired).
> >  
> > +Memory carveouts
> > +----------------
> > +
> > +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> > +the resource table, the remoteproc framework will search for memory carveouts
> > +for:
> > +
> > +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> > +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> > +
> > +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> > +resources inside the resource table and/or supplied by the remoteproc driver
> > +and will be indexed by their name.
> 
> The remoteproce driver doesn't supply carvouts, it gets them from the device
> tree.
>

Right. I'll rephrase this statement.

> > +If a carveout with the same name is provided through both means, the one
> > +supplied by the remote processor should be marked as dynamically allocable,
> > +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> > +
> 
> Right, as per my comment in the previous patch, carveouts at the virtio level
> should be distinct from those declared at the remote processor level.  Hopefully
> this will keep the remoteproc core simple and make it easy to differentiate
> between code paths that handle legacy and authentic rproc-virtio devices.
>

This statement is not related to carveout at virtio level - or at least
isn't in my mind, I'll try to explain a bit better.

Nowadays, even before this patch set, is possible to declare a carveout
(say: vdev0buffer) both inside the processor's resource table *and* in
devicetree. The remoteproc framework will take care to associate them,
but this will work only if the resource table uses FW_RSC_ADDR_ANY for
the da field (see [1]).

> > +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> > +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> > +either from the first ``restricted-dma-pool`` region associated to the virtio
> > +device's parent (i.e., the remote processor device), if present, or the global
> > +DMA pool.
> > +
> > +.. WARNING::
> > +
> > +    This fallback mechanism can result in a vring being allocated using a
> > +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> > +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> > +    memory regions should be specified inside the virtio device's devicetree
> > +    nodes and not attached to the parent remote processor.
> > +
> > +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> > +use the memory region declared by the virtio device's own devicetree node (see
> > +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> > +Otherwise, it will try to replace it with the first memory region (of any type)
> > +associated to the virtio device's parent (i.e., the remote processor device);
> > +if no such memory region is present, it will be replaced with the global DMA
> > +pool.
> > +
> > +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> > +device's devicetree node are present, the carveout takes precedence and the
> > +memory region is ignored.
> > +
> > +Declaring the memory region inside the virtio device's devicetree node is the
> > +preferred method for ``restricted-dma-pool`` regions, since listing them among
> > +the memory regions of the remote processor device would make the first of them
> > +the (forced) bounce buffer for the remote processor device itself as well.
> > +
> > +Buffer allocation
> > +-----------------
> > +
> > +There are different kinds of buffer allocation scenarios:
> > +
> > +* if the remote processor can access the whole DMA memory area of the host, no
> > +  special arrangement needs to be performed, since either the drivers (in case
> > +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> > +  virtio device type) will take care of any necessary translation;
> > +* if the remote processor has limited access to the host memory space, for
> > +  example because of a different addressing scheme or for memory isolation
> > +  constraints, the memory reserved for buffer allocation shall be selected
> > +  depending on the virtio device type:
> > +
> > +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> > +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> > +    should be preferred, since it allows zero-copy message transmission between
> > +    the host and the remote processor;
> > +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> > +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> > +    such devices need bounce buffering to work correctly.
> > +
> > +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> > +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> > +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> > +virtio device. The virtio device inherits the DMA mask and the DMA range map
> > +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> > +the remote processor device, and is never attached to an IOMMU: these DMA
> > +addresses are therefore host physical addresses, translated only through the
> > +DMA range map. The remote processor must be able to access the buffers at
> > +these addresses.
> > +
> > +.. WARNING::
> > +
> > +    For remote processors that access memory through an IOMMU managed by the
> > +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> > +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> > +    of the resource table, at the device addresses they specify; no mapping is
> > +    created for the buffers of the virtio devices. Such remote processors are
> > +    supported only if all the memory that can hold virtio buffers (e.g., the
> > +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> > +    with its device address equal to its physical address, for example through
> > +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> > +    translation applied by the remote processor that is not described by the
> > +    DMA range map of the remote processor device.
> > +
> > +Allocation of virtio devices
> > +----------------------------
> > +
> >  Of course, RSC_VDEV resource entries are only good enough for static
> >  allocation of virtio devices. Dynamic allocations will also be made possible
> >  using the rpmsg bus (similar to how we already do dynamic allocations of
> > -rpmsg channels; read more about it in rpmsg.txt).
> > +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> > 
> > -- 
> > 2.56.0
> > 
>

Thank you!

Regards,
Francesco

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L856


