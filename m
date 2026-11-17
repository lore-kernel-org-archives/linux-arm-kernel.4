Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A224606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UcvcdBXK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=LiBo1spm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=VA70hAVg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=; b=UcvcdBXKRiWBWbm3DkwZAlM/Ks
	U78i10nn6kwRH/Rwep0h7mj94tN7/APf0+Suqy2/dEo5+f3ZTlpjXUk+bwWHin6ADm+KQwbiTl8Cc
	pQDX5A2z5UwNKqcPegaYhS1U1ofsqfJb1jGldI+42wlERnxFC2vPU1PkzboV0pOT9VJL6YEuItZJ6
	9ce6Ttm+8p/R02Tr3v3CkeFl54lGEKHuV/RcYPb25rWgPdR8BUoViNc9gaRiRuSAC//GSFo8dOXVT
	19ySF9Wq0s24aYvMOfoGgN7Z63tt6CFGKf3UWvSOL9MoQtdlTM0qk8j9Iyp2doinZOyIg1OSEO+8l
	8X1X8Plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRgA-00000007EHq-3ob1;
	Tue, 17 Nov 2026 22:29:30 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRg7-00000007EH5-2i38
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:29:29 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794954567;
	 b=F1PTQm2/OJPBYA57aSRN2WcRNciXbXVtoMjvdmV71n0oXz7fFMjnv3wLc2/5Dz8St4/X8sSnbB
	  YPLFJ75VQ2V+U3SiMD0Drh/ZlUP3gAEG0T51vYDVic4wymdTcdeVjbayuRs/5DG2J2wfPa4Ed7
	  qVJPV0U0Vd4LwRdHwstHBtfWTOoY8OBwGlejSRoWwF/gUR9CQB3i6nPCSwHIqNpqux0HasG693
	  j5ItwaCA0EY5jrMQ8D6tulQD+AIFZflGUX8ZlH7TcEsvD6MJ4yimLrtmHiyS887zvXDjf8BdTF
	  b9a0VRT5QJTDJS782uLuvLhJQNn3v2heUy7VIUrYhULO7A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794954567;
	bh=JybEQ1XC8V8D+6CWInMVitgFg0nkFA+o6+XWova7CQA=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=A2fN0xgnQxJOTka1JszGcLIuZyERgYO52zmH7UwuXOIZyFSFOyiqT+LtW4mqCrC5IFoO11yPXc
	  ZXnim/bTImVGd7jNYD/fyc8zL2lyyQkX4sCKh3U3Di6LcioQQbz193Fj+jawiFcdn9HUx1M6I5
	  b54KpGjtrsDpTQZDeTrtZJmppdO2wbWpczkhwwhvF9ZPTq3Fd1e2rW+1sfGPKkioeprf64X7ms
	  aQuB12LLGYjIWo9+hay8xR8QhAvNrQMP5d6qJoYa/Ns+i8YPmCoTn/ME1hMY3GNXGtv5QzXrK1
	  JnaBfTK81Xdf5sMJ9Nu7Qq2KN3u1USjxMRGT/nXD1HKKRQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=; b=LiBo1spmh5RM1ER/PyFIZ93eR/
	ZsSd/6qiirBNrBq7smcn0cCgKaXJBtm3dQ5q0r4AMy94QT4BWGXVskhMzbbuye2cwMVQ6kuQD9Fy3
	uyjMifXHFHAPakAK2eVwMleoygNJ8r2dbNgHcI7MPtqQJEi5HasvgkPtKtz1cSr+PAjk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRg5-00000001ln8-0urg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=; b=VA70hAVgqtYloKsRwVllfLXOwA
	P4dA0J0hgPnRLPyImKO5uAy2wC81NSBYenoFjE8FseR4eeE3Mil6F4Ou+plu2FqJ2cZft7NeGCS2P
	0hYHipDjZ7hxyronma3HA+Bc9u6IWJUS5VEVSGmGwvkaA1eYOL3dV/NJfOi+hC4xGcEE=;
Received: from [95.251.96.187] (port=59373 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRfj-00000000BT1-2mJ9;
	Tue, 17 Nov 2026 22:29:03 +0000
Date: Tue, 17 Nov 2026 23:29:01 +0100
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
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <avzS1DiNGmL1Pqmn@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyAtmxdbfEBbZ87@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 18da87c2958d76bdeb6f50109be26f14
X-AntiAbuse: ID - 18da87c2958d76bdeb6f50109be26f14
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRg5-00000001ln8-0urg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_142927_886095_EB329EB2 
X-CRM114-Status: GOOD (  42.85  )
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

On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > The virtio subsystem already supports a fwnode describing a vdev; search
> > for a specific node during vdev registration and supply it to the
> > rproc-virtio platform device that is being registered.
> > 
> > A memory-region specified inside that node is also used for the virtio
> > device if a carveout was not supplied for it through the parent device's
> > node.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> >  2 files changed, 85 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index c946ecd980a5..e833853ae7f6 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >  	if (rvdev)
> >  		list_del(&rvdev->node);
> >  }
> > +
> > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > +{
> > +	struct fwnode_handle *group, *child;
> > +	u32 reg;
> > +	int ret;
> > +
> > +	group = device_get_named_child_node(dev, "virtio");
> > +	if (!fwnode_device_is_available(group)) {
> > +		fwnode_handle_put(group);
> > +		return NULL;
> > +	}
> > +
> > +	fwnode_for_each_available_child_node(group, child) {
> > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > +		if (ret)
> > +			continue;
> > +
> > +		if (idx == reg)
> > +			break;
> > +	}
> > +
> > +	fwnode_handle_put(group);
> > +
> > +	return child;
> > +}
> > +
> >  /**
> >   * rproc_handle_vdev() - handle a vdev fw resource
> >   * @rproc: the remote processor
> > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	struct device *dev = &rproc->dev;
> >  	size_t rsc_size;
> >  	struct rproc_vdev_data rvdev_data;
> > +	struct platform_device_info pdev_info = {
> > +		.parent = dev,
> > +		.name = "rproc-virtio",
> > +		.id = PLATFORM_DEVID_AUTO,
> > +		.data = &rvdev_data,
> > +		.size_data = sizeof(rvdev_data),
> > +	};
> >  	struct platform_device *pdev;
> > +	struct fwnode_handle *fwnode;
> > +	int ret = 0;
> >  
> >  	/* make sure resource isn't truncated */
> >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	rvdev_data.rsc_offset = offset;
> >  	rvdev_data.rsc = rsc;
> >  
> > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > +	pdev_info.fwnode = fwnode;
> > +
> >  	/*
> >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> >  	 * as device id, then we get duplication in sysfs, so need to use
> >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> >  	 */
> > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > -					     sizeof(rvdev_data));
> > +	pdev = platform_device_register_full(&pdev_info);
> >  	if (IS_ERR(pdev)) {
> >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > -		return PTR_ERR(pdev);
> > +		ret = PTR_ERR(pdev);
> >  	}
> >  
> > -	return 0;
> > +	fwnode_handle_put(fwnode);
> > +
> > +	return ret;
> >  }
> >
> >  /**
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index 1496659ddff9..950d65480be5 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -13,10 +13,12 @@
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/export.h>
> > +#include <linux/of.h>
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/rsc_table.h>
> > +#include <linux/swiotlb.h>
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_config.h>
> >  #include <linux/virtio_ids.h>
> > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> >  	put_device(&rvdev->pdev->dev);
> >  }
> >  
> > +/*
> > + * Attach the memory region declared inside the vdev's own devicetree node.
> > + *
> > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > + * platform device is probed, but it is released together with the virtio
> > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > + * when the remote processor is restarted during a crash recovery.
> > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > + */
> > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > +{
> > +	if (is_swiotlb_for_alloc(dev))
> > +		return 0;
> > +
> > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > +}
> > +
> >  /**
> >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> >   * @rvdev: the remote vdev
> > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  	struct device *dev = &rvdev->pdev->dev;
> >  	struct virtio_device *vdev;
> >  	struct rproc_mem_entry *mem;
> > +	bool has_mem_region;
> >  	int ret;
> >  
> >  	if (rproc->ops->kick == NULL) {
> > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  		return -EINVAL;
> >  	}
> >  
> > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > +
> >  	/* Try to find dedicated vdev buffer carveout */
> >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> >  	if (mem) {
> >  		phys_addr_t pa;
> >  
> > +		if (has_mem_region) {
> > +			/*
> > +			 * The carveout takes precedence: drop the region that
> > +			 * of_dma_configure() might have attached at probe time.
> 
> I don't understand this part - why would someone configure vdevXbuffer with the
> same name at the rproc and rproc-virtio level?  This should be an error.
>

The carveout might come from the remote processor's resource table. I
was unsure on how to treat it (warning or error) - if you advise for
the second I'll go that route.

> > +			 */
> > +			dev_warn(dev,
> > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > +				 rvdev->index);
> > +			of_reserved_mem_device_release(dev);
> 
> Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> or virtio core?  
> 
The of_dma_configure() call that is part of the platform DMA
configuration automatically associates to the device the first
restricted-dma-pool node referenced by memory-region; see [1].

This is actually beneficial to the proposed solution, but current
implementation requires this step to avoid leaking the association (this
will be required also in case of error, because of_dma_configure() is
called during the probe).

> > +		}
> > +
> >  		if (mem->of_resm_idx != -1) {
> >  			struct device_node *np = rproc->dev.parent->of_node;
> >  
> > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  				return ret;
> >  			}
> >  		}
> > +	} else if (has_mem_region) {
> > +		/* Use the memory region declared in the vdev's own node */
> > +		ret = rproc_virtio_init_vdev_mem(dev);
> > +		if (ret) {
> > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > +				ret);
> > +			return ret;
> > +		}
> 
> Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> devices is very confusing.  I think there is value in splitting them, even if it
> entails some code duplication.
> 

Ok, I'll split them for V3.

> Thanks,
> Mathieu
> 
> >  	} else {
> >  		struct device_node *np = rproc->dev.parent->of_node;
> >  
> > 
> > -- 
> > 2.56.0
> > 
>

Thank you!

Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/of/device.c#L35


