Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC30D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zUKUYRzB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSgXT4UZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6DuZj7rpCDJ4RLnqAO8W7jTcTFXU6SWSY1XFYNYKyWY=; b=zUKUYRzBJkEUt93xYa2oaFy0KJ
	XUR9W6MuhPARdz6X2CfZIZxNBWknw3xVNmctYqyYIxPEdT58c6QtTi0Oy8WeRcySXEt9Y+wgC7QMB
	sgOMJrDpQDeZthKASy2VIcvOHBGdBzsEidAtbU7qs+eK93sni9i+en39S8JHD7ooExzpwEO1w+Zkz
	lJ9qcqybPkm23/f86sGeu3VJUjum9gn7oKiROLeuXFpByxTggpZosJQpZsP7Q6mWIewbWTXbf+9qU
	Z3QS4JPa320yMHpJcRrkjXCIfc2EofhCogzXWJ9DKyuxH+jwU1jCSdGvngpCDjlDiRLFj/XfcHXvW
	Ts9pUmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz9N-0000000BVK9-3awj;
	Thu, 19 Nov 2026 10:13:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz97-0000000BVCz-2Ejz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:13:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 442ED44FF1;
	Thu, 19 Nov 2026 10:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653821F00930;
	Thu, 19 Nov 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083217;
	bh=6DuZj7rpCDJ4RLnqAO8W7jTcTFXU6SWSY1XFYNYKyWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSgXT4UZxO4V1tQsElmCQVnTzGLg/D1NFK8Ql8iz/O/dvvjAYKDsKPeHj4sK4Y0Cn
	 yRIq6V5QcOhzvt4hASgD+jNOqQs2GkRTh8+oLn3y55zJXIvfFjB1tI1crzzsO3AW9F
	 wkZ3Ze+me/QgQsFYS8Iq2V5VIp0R9xOLBop+IZZzPmqT1asxSgLVmC45VN/BfQ3LXP
	 mx24GzFkc3YClfRp4+74alZIFFeDew+fndyg3NTNBhuz1A9Kx88n95mLsqVZDIGnDr
	 CINZDCPkQTrM8eKXrD2xqOQxAm4pbIsETyowT2iAqnRCKzZ47B87I6BVcoPV/OWmbI
	 bh+E5gNG7r0bg==
Date: Thu, 19 Nov 2026 11:13:31 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
Message-ID: <av7Ly_iLyiOAXQUR@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
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

On Wed, Nov 18, 2026 at 05:35:43PM +0000, Sascha Bischoff wrote:
> Allocating an L2 device table makes its parent L1 DTE valid, but the
> single-device invalidation performed during device registration does
> not invalidate that L1 DTE. An ITS that cached the L1 DTE while it was
> invalid can therefore continue dropping events for DeviceIDs in its
> range.
> 
> Invalidate the L1 DTE and wait for completion immediately after
> publishing the new L2 table. This also covers a registration that
> subsequently fails, leaving the L2 table allocated and its parent L1
> DTE valid. Keep single-device invalidations for device registration
> and teardown when updating individual L2 DTEs.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 7fff2db9ae08e..a05417bdd3a19 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -365,17 +365,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
>  	return &l2_itt[l2_idx];
>  }
>  
> -static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> -				      struct gicv5_its_dev *its_dev)
> +static int __gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> +					u32 device_id, u8 event_id_bits, bool l1)
>  {
>  	u32 devicer;
>  	u64 didr;
>  
> -	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
> +	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, device_id);
>  	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
> -			     its_dev->itt_cfg.event_id_bits)	|
> -		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
> +			     event_id_bits)			|
> +		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, l1);
>  
>  	guard(raw_spinlock_irqsave)(&its->inv_lock);
>  
> @@ -385,6 +385,19 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>  	return gicv5_its_cache_sync(its);
>  }
>  
> +static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
> +				      struct gicv5_its_dev *its_dev)
> +{
> +	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
> +					    its_dev->itt_cfg.event_id_bits, false);
> +}
> +
> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
> +					 u32 device_id)
> +{
> +	return __gicv5_its_device_cache_inv(its, device_id, 0, true);

I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
let's explicitly say so).

> +}
> +
>  /*
>   * Allocate a level 2 device table entry, update L1 parent to reference it.
>   * Only used for 2-level device tables, and it is called on demand.
> @@ -424,7 +437,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
>  	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
>  
> -	return 0;
> +	/* Invalidate the cached L1 DTE before using the new L2 table. */

Nit: it is not a given that it is cached.

> +	return gicv5_its_device_l1_cache_inv(its, l1_index << l2_bits);

Nit: this l1/l2/deviceid bits/index dance is a bit clumsy (I mean, in
current code, without taking into account this patch) but we can rework it
in a follow-up patch to keep this one as simple as possible.

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  }
>  
>  static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,
> 
> -- 
> 2.34.1
> 

