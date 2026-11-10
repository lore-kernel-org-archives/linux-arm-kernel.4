Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A33606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vcOGuFe/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p58dnF06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=; b=vcOGuFe/GOpdG25ReP20apF65s
	AfEhA4in/mS48QvSzKBOc36GsjSlKRPbGCiug/T+/La8Sh8CeKTFrAB/4DfKQAPlEfO6MWUHg4gaO
	DQB07rMwFEN8alkWMtpYAaGOW7qC/Bc/7ht9VBi7BdC3jSjQNgifjDr1BFGjY1S9fPqvfzkuYysfF
	3QvCdVBaByUzUqFvir8CMktIMshKYAFug8A5Mr9TvSHKc4QIG83M7esUnV9cgf35Fh/j6OT7DNXFH
	/uDvL73URI6f7XvUzSPgU90/2H8H7mqgRqIYDY4yf1uykbj1v1WQoLmKNBZd46Xye2b9p/Orld+bV
	ItGrZfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnIw-00000004IK1-0hCu;
	Tue, 10 Nov 2026 14:58:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnIs-00000004IJ1-0r5L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:58:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a018493d57so44925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794322707; x=1794927507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=;
        b=p58dnF06+HJ8zeDL0regfn0dwUpy6gI3mMXNBtNFWA7nw9E8bo8uSlWQD0+Kanhjn8
         EDzgvdPMtyrrJZA0AUpSAQrOtuvMDX2q64QJ+mQkruLxF4QFuEa+6iRtlHLj6HHBz1f2
         tm6RctxLmMBEiAxfY4p8Y7K6KBMJUR4+N3ZLoL6vuhvDJVcreJxp0HP5pBCJZERf5hTp
         NiBxhqxaf7hNeECggfnM6hPYuvd85IXPx/cxa4DjTc+XAZ9h75gTNZnmwMUYrCHw+Pa7
         YycqZasiv430lKEFfRxJNaNR8zO/xVjGk1ynwnpS2mGFL+kKKEaAHC6e21cB/JTpQlg/
         l+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322707; x=1794927507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilFrMbP1l4Dqble5vGUZCzOuHvz/JIBo8vMR2z18T1Y=;
        b=OSkTPO79iHJnlS1Hf+p/XOF9yh8jXfdC9jQyeAe3Digo+w64WOfSVQtzRk21lkIkXr
         GHHQeHSnprOVowwUj3PSoBSZl2ByxXyLSFdE8LlmmT6f8cK/vJLfnWYx0wnuz/4c4+30
         NeIZJD2wqLFWKwpsZ/3NXFClQICZ2iydjoC/nxnU95NRDLAWQSYq7b/WnTCrsxi7UPIB
         N2dR8Dg8SbXdQII0Wrj/IZs3ixmHBILo8mYPrRYdoE7gI/UwHN1RWdezk2guZbvkE3za
         m1ly+aBF0SGlrVkXMYvtgn0ThL26+TMBfJ6upkvDiuoquHK1krSwBFuRwBj/4iBhtNgM
         ncjw==
X-Forwarded-Encrypted: i=1; AL+hErGIDFRQ14ELQaTNnE2IUjnaG9+oQLr+StCkNFSQMTwuGfHNG6i5VASb2unUF7bxdk3WKd+WElO4/Z0EmxC9OpYj@lists.infradead.org
X-Gm-Message-State: APuU4Z+O1q9MM22spJyPNOdwfInsJ7fjFJpT3FKL5kbCPW/JJ16/cvIl
	y7mcGyEokr6RdJ4eGx2ZExOqWG62QZHXhr5iDWcExG1vjuuPnLEmZYHFMdbA+tI0Ag==
X-Gm-Gg: AYBFou2mn9665Io5VE6R7NFn5RmdKwqeUphZtIbrqHnd6dImnvyBhkOvLVB0je3PJ3X
	RHdS2Rq0bAPA9G/JgQGSA9uAyE7ZvOA8owda/aWsML3wCL8ML8KXM+1h2AmtHMfGdVse8ps7cfP
	Ri7YpHWGWV7q5qkkkgMqV2DvtMSzAMesdUn+mYy9xfjzvvLQeL64kxKqsme3FP1CeUVxJsxNez0
	L4EAC9RcBEzWF0mHjiYOU+EsmZtQWeBJF8ieDk5+BL9B0N/sv3YwkS+mu3m+MiXGTeqAtx+bmOC
	94YuPy3HIr2vT0oIgWCnNxm6bVeRapEQdvBQPUq8EEzrs3eattywn03BVGN9gp7gUcnC9cGYKT4
	VvKiAFew1Mi7d5iAq3Wiap6EfODPVWxgYypKxu4zGrgfaYVm4wp/KEp/e4xUr9/y6e2gWwlKHrX
	uUSJjNHaih9ib88mJgzc7boYRtKelbkDQiTBl09sZb1ttNgVT0oAcqt+tJVMPcUXsmwtF6LCbuy
	jCtnTq/vPPdGq3NT7tx64O0/EkbUnlHFTi34bmqmxv0R2RvrjlNxR43APg4rzA4gmBn4X93bsad
	wQLEgK6slOawVmctO8ne/ymRHtOd0HhU0jvjO3my7nmrQDgR6KicOSn4kPiQw2XWYzUqrHY=
X-Received: by 2002:a05:600c:4301:b0:4b6:24ca:8848 with SMTP id 5b1f17b1804b1-4ba02bdf97bmr587755e9.11.1794322705998;
        Tue, 10 Nov 2026 06:58:25 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm70632855e9.14.2026.11.10.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:58:25 -0800 (PST)
Date: Tue, 10 Nov 2026 14:58:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: xuheng@cs.columbia.edu
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table
 descriptor
Message-ID: <avMxDbv6JE0dg93E@google.com>
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065830_301008_36EA312F 
X-CRM114-Status: GOOD (  31.56  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 09:36:54PM +0000, Xuheng Li via B4 Relay wrote:
> From: Xuheng Li <xuheng@cs.columbia.edu>
> 
> arm_smmu_init_l2_strtab() allocates a level-2 stream table when the first
> master in its range is added, and makes the level-1 descriptor valid. It
> issues no invalidation, and the attach that follows sends only the leaf
> form of CMD_CFGI_STE.
> 
> IHI 0070 5.1.1 requires the non-leaf form of CMD_CFGI_STE when an L1STD
> changes, including when an inactive descriptor with Span == 0 becomes
> active. An SMMU that cached the inactive descriptor can keep terminating
> the master's transactions as if its StreamID were invalid.
> 

Looking at the spec it says:
	An STE or L1STD that is successfully fetched might be cached by the
	SMMU in any state, therefore any modification, commissioning or
	decommissioning of an STE must be followed by a CMD_CFGI_STE command.

Which checks out. However, I am curious why this was not seen for
over 10 years with the current behaviour as I doubt any existing
implementation will do negative caching. Is that something that was
observed or found by inspection?

Interestingly, that is not the case for L1CD:
	/* An invalid L1CD can be cached */
	arm_smmu_sync_cd(master, ssid, false);

> Issue a non-leaf CMD_CFGI_STE after writing the descriptor. The RMR path
> runs before the stream table is programmed into the SMMU, and
> arm_smmu_device_reset() then issues CMD_CFGI_ALL, so it needs none.
> 
> Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")

With the few nits below:
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47..f61cc6d86 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2030,7 +2030,8 @@ static void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
>  	}
>  }
>  
> -static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
> +static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +				   bool live)
>  {
>  	dma_addr_t l2ptr_dma;
>  	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> @@ -2053,6 +2054,14 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  				   ARRAY_SIZE((*l2table)->stes));
>  	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
>  				      l2ptr_dma);
> +
> +	/*
> +	 * The SMMU may have cached the old, invalid L1 descriptor. Making it
> +	 * valid needs the non-leaf form of CMD_CFGI_STE (IHI 0070 5.1.1).
> +	 */

A similar comment to the CD case is enough.

> +	if (live)
> +		arm_smmu_cmdq_issue_cmd_with_sync(smmu,
> +						  arm_smmu_make_cmd_cfgi_ste(sid, false));
>  	return 0;
>  }
>  
> @@ -4261,7 +4270,8 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  	return sid < smmu->strtab_cfg.linear.num_ents;
>  }
>  
> -static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
> +static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid,
> +				    bool live)
>  {
>  	/* Check the SIDs are in range of the SMMU and our stream table */
>  	if (!arm_smmu_sid_in_range(smmu, sid))
> @@ -4269,7 +4279,7 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
>  
>  	/* Ensure l2 strtab is initialised */
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
> -		return arm_smmu_init_l2_strtab(smmu, sid);
> +		return arm_smmu_init_l2_strtab(smmu, sid, live);
>  
>  	return 0;
>  }
> @@ -4333,7 +4343,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  		struct rb_node *existing;
>  		u32 sid = new_stream->id;
>  
> -		ret = arm_smmu_init_sid_strtab(smmu, sid);
> +		ret = arm_smmu_init_sid_strtab(smmu, sid, true);
>  		if (ret)
>  			break;
>  
> @@ -5713,7 +5723,8 @@ static void arm_smmu_rmr_install_bypass_ste(struct arm_smmu_device *smmu)
>  
>  		rmr = container_of(e, struct iommu_iort_rmr_data, rr);
>  		for (i = 0; i < rmr->num_sids; i++) {
> -			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i]);
> +			/* The stream table is not programmed into the SMMU yet */

I don't think this comment is adding anything, there is another one a
couple of line below.

> +			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i], false);
>  			if (ret) {
>  				dev_err(smmu->dev, "RMR SID(0x%x) bypass failed\n",
>  					rmr->sids[i]);
> 
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> change-id: 20261109-smmu-l1std-cfgi-c194b2aafea4
> 
> Best regards,
> -- 
> Xuheng Li <xuheng@cs.columbia.edu>
> 
> 

