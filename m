Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98FA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9FvpAcq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nKPa2GUu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QL67QE6ypnwqVZUieQLSAmYxM/GrcX0qjylvi7BSJVY=; b=S9FvpAcqG6rcYpKHQKO20r9siM
	TWamaGl7w3IyncEYTvB2ZgC6LGDKBwqg9Othw0OhQ0LSq8rVy5BKALOwjOwRjyIaN1hYcxDVPvJJe
	mN3B09CLiAYcrgGZ2Rh7p8LUTZTcYcUJtFpleFnnKyW3VrrSeMEKP0zC/RWDYzpji6qB0bZvSy6MH
	APFKQdQQ1hEXCZi1zxuo3QIymPYYDrXTA+odG+QCQtoDjgdyg7Im+iZPXycDoF7YfPzBhIrSxzj6r
	e7vLO5SiM3J1HwpUaHmdtiatMpasSXwvQ3kIR4Sq+apjSy0cwXtrRHPZYeto2xEZsYFzOxHDp1mtf
	OJ2hde2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPg9u-0000000Ehq8-2w8f;
	Sat, 07 Nov 2026 13:08:38 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPg9r-0000000Ehpg-0PCx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:08:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Wzg9psy46NQFtiN5fc9mojAh/zLqq0GdyPhCMFvIY0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794056911; v=1; x=1794661711;
 b=nKPa2GUuEJSWgO5viJ+kr68h9VuVHx0tvEJ+HeSISbCHh9JQZwyFvh0YKR4yroiJDy+s7N3v
 eEIj47k7UVaNI6hGzmIecyUNygk48JaXK7W4NJJcQ3/tvzuAMzYfnvkf32t9x3T9QgUgXoluIJz
 eV9BbYHtB0REK0++hGDFLfU8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bae0ebbbf597277d;
	Sat, 07 Nov 2026 13:08:31 +0000
X-Mizu-Trace-ID: bae0ebbbf597277d
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:08:18 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v7 4/7] iommu/arm-smmu-v3: Use a per-domain CD table
 for non-PASID streams
Message-ID: <au8iwj68zXO1us_8@fedora>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
 <20261030-smmu-shared-sid-ver7-2026-10-26-v7-4-961726ebd6ab@Example.Com>
 <auU/RARTx8dv5mAE@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auU/RARTx8dv5mAE@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_050835_590288_DEB94E80 
X-CRM114-Status: GOOD (  26.27  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 06:07:16PM -0700, Nicolin Chen wrote:
>On Fri, Oct 30, 2026 at 08:09:36PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> The CD describes the domain context, so non-PASID devices attached to the
>> same S1 domain do not need private copies of it. Store a CD table in
>> struct arm_smmu_domain and make non-PASID streams point their STE at that
>> table.
>
>> @@ -3044,6 +3055,9 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
>>  		mutex_lock(&arm_smmu_asid_lock);
>>  		xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
>>  		mutex_unlock(&arm_smmu_asid_lock);
>> +
>> +		if (arm_smmu_cdtab_allocated(&smmu_domain->cd_table))
>> +			arm_smmu_free_domain_cd_tables(smmu_domain);
>
>Same comments as previous: fold arm_smmu_cdtab_allocated in.
>
>> @@ -3854,11 +3879,27 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>>  		return -EINVAL;
>>  
>>  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>> -		cdptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
>> +		/*
>> +		 * Non-PASID devices use the domain's shared CD table. The
>> +		 * private table is needed for substreams (PASID), for
>> +		 * ATS-always-on (S1DSS), and for the stall model: CD.S is a
>> +		 * per-CD property and cannot be shared by devices that
>> +		 * terminate faults.
>> +		 */
>> +		if (master->ats_always_on ||
>> +		    master->stall_enabled ||
>
>For readability, let's add a helper:
>
>static bool arm_smmu_master_needs_private_cdtab(struct arm_smmu_master *master)
>{
>	/* Reason 1 */
>	if (master->ats_always_on)
>		return true;
>	/* Reason 2 */
>	if (master->stall_enabled)
>		return true;
>	return false;
>}
>
>> @@ -3978,10 +4022,17 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
>>  	    sid_domain->type != IOMMU_DOMAIN_BLOCKED)
>>  		return -EINVAL;
>>  
>> +	first = !arm_smmu_ssids_in_use(&master->cd_table);
>>  	cdptr = arm_smmu_alloc_cd_ptr(master, pasid);
>>  	if (!cdptr)
>>  		return -ENOMEM;
>>  
>> +	if (first) {
>> +		cd0ptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
>> +		if (!cd0ptr)
>> +			return -ENOMEM;
>> +	}
>
>Maybe allocate cd0ptr in arm_smmu_alloc_cd_tables()?
>
>We can also have a helper to share with arm_smmu_alloc_cd_ptr().
>
>static int arm_smmu_alloc_cd_ptr_l2(struct arm_smmu_master *master, u32 ssid)
>{
>	[...]
>	*l2ptr = dma_alloc_coherent(master->smmu->dev, sizeof(**l2ptr),
>				    &l2ptr_dma, GFP_KERNEL);
>	if (!*l2ptr)
>		return -ENOMEM;
>
>	arm_smmu_write_cd_l1_desc(&cd_table->l2.l1tab[idx], l2ptr_dma);
>	return 0;
>}
>
>> @@ -3997,8 +4048,39 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
>>  	cd->data[0] |= cpu_to_le64(
>>  		FIELD_PREP(CTXDESC_CD_0_ASID, smmu_domain->cd.asid));
>>  
>> +	/*
>> +	 * The private CD table is taking over the STE now. Make sure its
>> +	 * default substream matches the RID domain before the STE points at
>> +	 * it, since non-PASID traffic follows CD[0].
>> +	 */
>> +	if (first) {
>> +		if ((sid_domain->type & __IOMMU_DOMAIN_PAGING) &&
>> +		    to_smmu_domain(sid_domain)->stage == ARM_SMMU_DOMAIN_S1) {
>> +			struct arm_smmu_cd cd0;
>> +
>> +			arm_smmu_make_s1_cd(&cd0, master,
>> +					    to_smmu_domain(sid_domain));
>> +			arm_smmu_write_cd_entry(master, IOMMU_NO_PASID,
>> +						cd0ptr, &cd0);
>> +		} else if (sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
>> +			   sid_domain->type == IOMMU_DOMAIN_BLOCKED) {
>> +			arm_smmu_clear_cd(master, IOMMU_NO_PASID);
>> +		} else {
>> +			WARN_ON(1);
>> +		}
>> +	}
>> +
>>  	arm_smmu_write_cd_entry(master, pasid, cdptr, cd);
>> -	arm_smmu_update_ste(master, sid_domain, state.ats_enabled);
>> +
>> +	/*
>> +	 * A repeat PASID attach leaves the STE on the private table with the
>> +	 * same S1DSS/EATS. Only the first attach (or an ATS change) needs to
>> +	 * rewrite it; arm_smmu_write_ste() would otherwise issue a redundant
>> +	 * CMD_PREFETCH_CFG for every stream.
>> +	 */
>> +	if (first || !master->cd_table.in_ste ||
>> +	    master->ste_ats_enabled != state.ats_enabled)
>> +		arm_smmu_update_ste(master, sid_domain, state.ats_enabled);
>
>master->cd_table.in_ste could be set when STE walks master's CD
>table. Then, you don't need to check "first". And move the guard
>back into arm_smmu_update_ste.
>
>> @@ -4017,35 +4099,48 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
>>  		.old_domain = old_domain,
>>  		.ssid = pasid,
>>  	};
>> +	int ret = 0;
>>  
>>  	mutex_lock(&arm_smmu_asid_lock);
>>  	arm_smmu_attach_prepare_invs(&state, NULL);
>> +	/*
>> +	 * Unlink the PASID from the domain before invalidating its CD.
>> +	 * arm_smmu_mm_release() walks this list with only devices_lock held
>> +	 * and writes a valid, faulting CD; unlinking first prevents it from
>> +	 * resurrecting used_ssids after the last PASID is detached.
>> +	 */
>> +	state.old_master_domain = arm_smmu_remove_master_domain(
>> +		master, &smmu_domain->domain, pasid);
>>  	arm_smmu_clear_cd(master, pasid);
>
>Sashiko pointed out that it needs devices_lock here.
>
>>  	/*
>> -	 * When the last user of the CD table goes away downgrade the STE back
>> -	 * to a non-cd_table one, by re-attaching its sid_domain.
>> +	 * When the last user of the CD table goes away, switch the STE back to
>> +	 * the domain's shared CD table (S1) or to the native bypass/abort STE
>> +	 * (identity/blocked), by re-attaching its sid_domain. The private CD
>> +	 * table is kept allocated for reuse and freed when the device goes
>> +	 * away.
>>  	 */
>>  	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
>>  		struct iommu_domain *sid_domain =
>>  			iommu_driver_get_domain_for_dev(master->dev);
>>  		bool ats_always_on = master->ats_always_on &&
>>  				     sid_domain->type != IOMMU_DOMAIN_BLOCKED;
>> -		bool downgrade = sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
>> -				 sid_domain->type == IOMMU_DOMAIN_BLOCKED;
>> +		bool s1 = (sid_domain->type & __IOMMU_DOMAIN_PAGING) &&
>> +			  to_smmu_domain(sid_domain)->stage ==
>> +				  ARM_SMMU_DOMAIN_S1;
>>  
>> -		if (!ats_always_on && downgrade)
>> -			sid_domain->ops->attach_dev(sid_domain, dev,
>> -						    sid_domain);
>> +		if (!ats_always_on &&
>> +		    (s1 || sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
>> +		     sid_domain->type == IOMMU_DOMAIN_BLOCKED))
>> +			ret = sid_domain->ops->attach_dev(sid_domain, dev,
>> +							  sid_domain);
>
>This covers almost all the possible domain types here. So, just
>drop that downgrade, and it should cover the other cases:
>
>		if (!ats_always_on)

Thanks, I agree the reachable set here is only S1/identity/blocked, and the
outer condition is effectively !ats_always_on. The separate downgrade
check is gone in v8.

However, I don't think we can fold the inner check into a single
attach_dev() call for all cases. For an S1 RID domain this is a PASID
teardown path, and arm_smmu_attach_dev() -> arm_smmu_attach_prepare() can
allocate with GFP_KERNEL and return -ENOMEM. The IOMMU core requires
set_dev_pasid() not to fail here, so that would trip the WARN_ON() in
iommu_remove_dev_pasid(). It also flushes the RID ATC unnecessarily.

So v8 keeps the outer !ats_always_on gate, but handles S1 directly:

if (!ats_always_on) {
        if (S1 RID domain) {
                /*
                 * Switch the STE directly to sid_domain->cd_table.
                 * Skip this for stalling masters, which must stay on
                 * their private CD table.
                 */
        } else {
                /* identity/blocked: use attach_dev() */
        }
}

The private CD table is kept allocated for reuse and freed at device
release. This keeps the teardown non-failing while still using the
!ats_always_on condition you suggested.

Or I may miss something.

Thanks
Peng
>
>Nicolin
>

