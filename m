Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xeWmZbE0;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i5/zaV0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=; b=xeWmZbE0luRaHINiA09X9bk2Hn
	PF8hUQh/DC7TNZnKuRhutyGRnnC9rq+Ww0xDalx2rMz3EtpCYsYMQtpuK74b5RdhTeLUis2Ju+zrp
	M5B1/tF8mcBB6WlFiYCyU6LnWo8TO0pVEcUIzM2IKK9SltC4waJDE7+UWmiiyG5Ojbx/aKTlGxNN2
	+ONVLuGs4Kcif2Isb6QvSxY78QgJCYoyIQRiTMusrSDdZsI7XmbK3gywo+zybCUBvHtmz8oJXqP7q
	dDT7L3LgdrvwbHICMn2UMTSWtYJbTdbjley+RQEpBWiX9LDW5btnrk3R+9ftm/bLhMq5JCJJYIMeB
	Xw+C9O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi00-00000009NLk-1pNB;
	Wed, 18 Nov 2026 15:55:04 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThzx-00000009NKV-0lee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:55:03 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1886258a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795017299; x=1795622099; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=i5/zaV0nlV2YFXGxkmXWekmQlcTiqBl5M+68box9JJme7oUFRxTpjvEB9ZVPKX/j2s
         qLm38XYM7TAKwyiALaY0h2t/BlKX2i9M1+XhmkWki2N5yACfDg0jYBd2JGwUk2wlKpBk
         L5wcdsPoEycnisbJpj/Rc3RgxiLiqeuapnj257buv0dhDvNih/hThWTcurCEcrxby2T6
         AsEewuDO88JOjNpmEy1fU6B2Auw6H3jvTZwxBVf061Jfadvm+Gv0RSvAZ7NNgizhq4PA
         7lxguUzhVO26KIsWFsbKZEFAYFNPJxIuyR2S3bXKB6wusWz9Q786N7qXGQMaCI/1JeoF
         ICig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017299; x=1795622099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=mxBzY8XiysAPTiwLnCrk7BdMBk3s/qz1hIe36EYn3J/sKqbOQvnK4Lgx9P9/x8INU8
         2sY4t5D4yhOLPVUOkXvaqsW4seDUx8KnhXvHS30TSwJ8eBXTZQ+4Za7Ll+WT3k3nwnUb
         XpoOB+PJkU6M0PB5AMAYlNXSq9dcoEOYVvY36Dvuf5lAK61PVzrOFD9K7KOkerQKTfQQ
         52iMqq/5B/HMEfJ+3QmObRopSD3gnGOltv29xIPVwl67O1/ma2IuVN9Dl8ORTC5v2LvY
         5AXLI/hu8CsST4CsNF9hr39HxEWDel4ujMUi/zgwT6WvAfJ3bEyNZkRkbBwKB0s60akg
         UzqA==
X-Forwarded-Encrypted: i=1; AL+hErEnGvsmEkf50judBbmdBQrz/dBAcobpnjtK7SGDopHnu7MkmlqP4p4e8UuyqpBD6g8JYGotJI+Uvp//1LGQQYi3@lists.infradead.org
X-Gm-Message-State: APuU4Z9h9LhwaaDMQwK8dRjo+aTzIXhhPPOwunHo/wJTxSGXVl04w2j4
	ZbqOQ6fkhZbnWy+2sd7VhVGzzISK0dSoL19ZqbRUifqb/RLG+mRSwhTDxc/GDWj2aKo=
X-Gm-Gg: AYBFou0nS4EWLP9iXP2GLlYF7QTSh6z4575hA9gdPXsA6VCsVtUwy32gDxQDp7W499n
	k1gJz5kdjDCCoL/kyD44/0v+ik8FN+hP1hm9zek8Z3tlkOouGCnLhSoKk/NKl1BdTKayEsSGZ1Z
	0QE/7rQxw9SZH6Bg4wDCx/5jvA4iIgdZ0GPIMyEV2FRlBluYEf197pCdYqmLZff3H5AyoiXYG3E
	Icd4qbOCAgRzftb6BhLefcr90foU4MQuvjoURHwza50DhcqWqNieXyiDiG49ILl14l6gphnpxqW
	hKIFGy9i5Bibm3fVY1sGzllajAcDw9EBMe+MAbD70qt0/uEmS5umag9FrEdDq0/ZDejRxPAKnL3
	VkY3X8tpsigBDVUWm/RAbGTv38/eRJp3yegfa/ktisl70euNvZXWERSn03/+56E2X49vFWyC4KN
	eC/gILZhicTeokKGfA8+crJI1h/blb1ycKEwR+E1vOLmoHg9+75Y1EA5IUT1xoxywHtF0koAWlD
	2PyAqHwzBp/Y1Xd0UTkGpJq/M2eu8H5bAG51OG3zAOHayTM4NWGtkrLIbCdQbhb5Lv7BkuTzYTj
	J/9Ns9o0YEfPeJRSJGwVBSfyVYCA6jlp
X-Received: by 2002:a17:906:c14e:b0:c50:a7ff:f880 with SMTP id a640c23a62f3a-c510e28dfcamr310805266b.34.1795017299066;
        Wed, 18 Nov 2026 07:54:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9f37:bd39:7f19:3b3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc1a2sm20902066b.5.2026.11.18.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:54:58 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <av3KSXqeGyazaMR9@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
 <avzS1DiNGmL1Pqmn@bywater>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avzS1DiNGmL1Pqmn@bywater>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_075501_814234_5DDABFC1 
X-CRM114-Status: GOOD (  50.88  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:29:01PM +0100, Francesco Valla wrote:
> On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> > On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > > The virtio subsystem already supports a fwnode describing a vdev; search
> > > for a specific node during vdev registration and supply it to the
> > > rproc-virtio platform device that is being registered.
> > > 
> > > A memory-region specified inside that node is also used for the virtio
> > > device if a carveout was not supplied for it through the parent device's
> > > node.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> > >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> > >  2 files changed, 85 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index c946ecd980a5..e833853ae7f6 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > >  	if (rvdev)
> > >  		list_del(&rvdev->node);
> > >  }
> > > +
> > > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > > +{
> > > +	struct fwnode_handle *group, *child;
> > > +	u32 reg;
> > > +	int ret;
> > > +
> > > +	group = device_get_named_child_node(dev, "virtio");
> > > +	if (!fwnode_device_is_available(group)) {
> > > +		fwnode_handle_put(group);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	fwnode_for_each_available_child_node(group, child) {
> > > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		if (idx == reg)
> > > +			break;
> > > +	}
> > > +
> > > +	fwnode_handle_put(group);
> > > +
> > > +	return child;
> > > +}
> > > +
> > >  /**
> > >   * rproc_handle_vdev() - handle a vdev fw resource
> > >   * @rproc: the remote processor
> > > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	struct device *dev = &rproc->dev;
> > >  	size_t rsc_size;
> > >  	struct rproc_vdev_data rvdev_data;
> > > +	struct platform_device_info pdev_info = {
> > > +		.parent = dev,
> > > +		.name = "rproc-virtio",
> > > +		.id = PLATFORM_DEVID_AUTO,
> > > +		.data = &rvdev_data,
> > > +		.size_data = sizeof(rvdev_data),
> > > +	};
> > >  	struct platform_device *pdev;
> > > +	struct fwnode_handle *fwnode;
> > > +	int ret = 0;
> > >  
> > >  	/* make sure resource isn't truncated */
> > >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	rvdev_data.rsc_offset = offset;
> > >  	rvdev_data.rsc = rsc;
> > >  
> > > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > > +	pdev_info.fwnode = fwnode;
> > > +
> > >  	/*
> > >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> > >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> > >  	 * as device id, then we get duplication in sysfs, so need to use
> > >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> > >  	 */
> > > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > -					     sizeof(rvdev_data));
> > > +	pdev = platform_device_register_full(&pdev_info);
> > >  	if (IS_ERR(pdev)) {
> > >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > > -		return PTR_ERR(pdev);
> > > +		ret = PTR_ERR(pdev);
> > >  	}
> > >  
> > > -	return 0;
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  /**
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 1496659ddff9..950d65480be5 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -13,10 +13,12 @@
> > >  #include <linux/dma-map-ops.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/export.h>
> > > +#include <linux/of.h>
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/remoteproc.h>
> > >  #include <linux/rsc_table.h>
> > > +#include <linux/swiotlb.h>
> > >  #include <linux/virtio.h>
> > >  #include <linux/virtio_config.h>
> > >  #include <linux/virtio_ids.h>
> > > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> > >  	put_device(&rvdev->pdev->dev);
> > >  }
> > >  
> > > +/*
> > > + * Attach the memory region declared inside the vdev's own devicetree node.
> > > + *
> > > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > > + * platform device is probed, but it is released together with the virtio
> > > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > > + * when the remote processor is restarted during a crash recovery.
> > > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > > + */
> > > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > > +{
> > > +	if (is_swiotlb_for_alloc(dev))
> > > +		return 0;
> > > +
> > > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > > +}
> > > +
> > >  /**
> > >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> > >   * @rvdev: the remote vdev
> > > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  	struct device *dev = &rvdev->pdev->dev;
> > >  	struct virtio_device *vdev;
> > >  	struct rproc_mem_entry *mem;
> > > +	bool has_mem_region;
> > >  	int ret;
> > >  
> > >  	if (rproc->ops->kick == NULL) {
> > > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > > +
> > >  	/* Try to find dedicated vdev buffer carveout */
> > >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > >  	if (mem) {
> > >  		phys_addr_t pa;
> > >  
> > > +		if (has_mem_region) {
> > > +			/*
> > > +			 * The carveout takes precedence: drop the region that
> > > +			 * of_dma_configure() might have attached at probe time.
> > 
> > I don't understand this part - why would someone configure vdevXbuffer with the
> > same name at the rproc and rproc-virtio level?  This should be an error.
> >
> 
> The carveout might come from the remote processor's resource table. I
> was unsure on how to treat it (warning or error) - if you advise for
> the second I'll go that route.
> 

Ok, so this is also related to my for patch [5/11], i.e handling of authentic
rproc-virtio device should follow modern practices.   

> > > +			 */
> > > +			dev_warn(dev,
> > > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > > +				 rvdev->index);
> > > +			of_reserved_mem_device_release(dev);
> > 
> > Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> > or virtio core?  
> > 
> The of_dma_configure() call that is part of the platform DMA
> configuration automatically associates to the device the first
> restricted-dma-pool node referenced by memory-region; see [1].
> 
> This is actually beneficial to the proposed solution, but current
> implementation requires this step to avoid leaking the association (this
> will be required also in case of error, because of_dma_configure() is
> called during the probe).
> 

Ok

> > > +		}
> > > +
> > >  		if (mem->of_resm_idx != -1) {
> > >  			struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  				return ret;
> > >  			}
> > >  		}
> > > +	} else if (has_mem_region) {
> > > +		/* Use the memory region declared in the vdev's own node */
> > > +		ret = rproc_virtio_init_vdev_mem(dev);
> > > +		if (ret) {
> > > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > > +				ret);
> > > +			return ret;
> > > +		}
> > 
> > Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> > devices is very confusing.  I think there is value in splitting them, even if it
> > entails some code duplication.
> > 
> 
> Ok, I'll split them for V3.
> 

Please move forward on that.  Since it will introduce a fair amount of churn, I
will simply stop reviewing the current set and wait for V3.  You can remove the
"RFC" tag, we are well past that now.


> > Thanks,
> > Mathieu
> > 
> > >  	} else {
> > >  		struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > 
> > > -- 
> > > 2.56.0
> > > 
> >
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/of/device.c#L35
> 

