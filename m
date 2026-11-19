Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F9606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ct3aMpqJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lia5Iomq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwmpfKbzBaA5litqwA08DZDKcW/oDAfDTawJvYW617E=; b=ct3aMpqJ/G97D4bLpGHmuFPCmU
	sJx7tnn/ctBVAur6gSmaWXoLDLgunejVvOP+CBr8lrqTfHMumh40oCS5PHCbaTNb11sZOeufGNM2k
	80Yqp6Gc0LfMp+rVfo9qQDFBELSsmMAooouTRIPIyrGmOla0T7YCv6J36ELIkiBNhj+qaeT0ZhdXy
	1/qjNRN60gRaZsUqyCVZq6vxIrZap49ub833BKlhsT+bHgL/ontyfZKjxBu5l/z4+VMJAC83fE0R5
	uOHgZwV/tIePbvLLyPBxbx9hMwKJ+JgjlR5bFT2Y7Mxv8199DkU2nzLgxoUOt0gr626jOTkoyHG5l
	3zswoofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzNR-0000000BYX4-2yhG;
	Thu, 19 Nov 2026 10:28:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzNQ-0000000BYWw-2dpp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:28:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39BF646053;
	Thu, 19 Nov 2026 10:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC0C1F000C5;
	Thu, 19 Nov 2026 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084104;
	bh=GwmpfKbzBaA5litqwA08DZDKcW/oDAfDTawJvYW617E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lia5IomqCBm/EgMjeJyuFpyAlPDD26vNSN2KNaqbKEAhqdPmb7hVt5zHU5O+ypSmT
	 Y4srfVW3sFmmvybA/YHfC6MjgyxwOKBMnG4R+PMggrYQLRziydg350kPsDIxjh0hIa
	 SGfg6DC+hXhui8asvYps3AgUii/REXnS6WdDQk6pdrWlb5jG7IugRB9dzSyhCd6Gln
	 A6gLW507UJlrAEXtaG37oHNe0pAEm2yedd5i3fbka+MDkebljcvAr/ploKnhtS2XB1
	 TqJlI9YZbfYGxfx9RxES8GvUEmlXI8coK/4ZSPQe+wfx7Y3ahQNAAZx4X6ivAzWBY9
	 1KR353gTNmHRw==
Date: Thu, 19 Nov 2026 11:28:19 +0100
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
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
Message-ID: <av7PQ4iniwWC9goF@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
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

On Wed, Nov 18, 2026 at 05:35:41PM +0000, Sascha Bischoff wrote:
> Device registration publishes a DTE pointing to the new ITT before
> invalidating the ITS device cache. If invalidation times out, clearing
> the DTE in memory does not guarantee that the ITS has discarded a
> cached reference to the ITT, and hence the hardware could still try
> and access the memory. Freeing the ITT on that path can therefore
> leave the ITS accessing memory that has been reallocated.
> 
> Device teardown has the same problem: it frees the ITT even when the
> invalidation issued after clearing the DTE fails to complete in the
> specified timeout.
> 
> Retain the ITT on either failure path. Continue returning the
> invalidation error, and free the ITT during teardown only after
> successful completion. This deliberately retains memory on hardware
> failure because a timeout does not cancel the operation or establish
> that cached references are gone.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index db13011ef6d93..cfa86aa68bf3c 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
>  
>  	ret = gicv5_its_device_cache_inv(its, its_dev);
>  	if (ret) {
> +		/* The ITS may still have a cached reference to the ITT. */
>  		its_write_table_entry(its, dte, 0);
> -		gicv5_its_free_itt(its_dev);
>  		return ret;
>  	}
>  
> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  	its_write_table_entry(its, dte, 0);
>  
>  	ret = gicv5_its_device_cache_inv(its, its_dev);
> -	gicv5_its_free_itt(its_dev);
> +	/* Only release the ITT once the ITS has discarded its references. */
> +	if (!ret)
> +		gicv5_its_free_itt(its_dev);

	if (ret)
		return ret;
	
	gicv5_its_free_itt(its_dev);

	return 0;

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  
>  	return ret;
>  }
> 
> -- 
> 2.34.1
> 

