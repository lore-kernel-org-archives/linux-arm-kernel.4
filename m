Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4182606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RBuBAH5n;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UNtIDXRn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Oe5tXB2jftoFJ092Hy5Qi6HgkiNB7NYIPiHV7mzfpLQ=; b=RBuBAH5n7Ma3X6A8VkaNd89Dg2
	/SwjUFr1qzJJBETS7w5kXXjLerCqrtyN+ozUzU25ie0KX1bnalX3K4BHLPQKPEV+2hVvBNYLHrr+y
	fu+p1gd8Sw86z2MKA4aTrjjfGxY+ojhl43cZi7ZQQuAsIw0wmXUxM6Sx3M+K6CofpLMfffw3rKjkp
	KZslpckPGvB+kl+kRgj/8enwr+SLLvoecWntYfkevFUGAab0kSxi1cRVNqH3sYr1xUCCX+bvnVuSt
	ErUsJZv2fgEWPcSHiqjN19j5Abr3PHoRAZCsXo+MZyy1PO200DCPgMR+jjNEnBwH+EGKDdLPLHnNY
	mOy/zmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgFv-0000000EiCn-2Qlr;
	Sat, 07 Nov 2026 13:14:51 +0000
Received: from out-65.mta1.migadu.com ([2001:41d0:203:375::41] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgFs-0000000EiBb-0U2q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:14:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6r+u5+/t9rmLKRKE+pLYilMAZFIRYxNtrYJN5SugYMs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794057284; v=1; x=1794662084;
 b=UNtIDXRnCqeIFejYU1k3WYN5kkpS36B6or3E06/TyDfoj7t/Vjjef07tfOLtWQO26ulMmEwS
 nMD246QwcGOBox8nnaw1x8kdDR4E2IUV9HhuRIH9giDb8A613EtF1/wNn7Qsww9B/BUIS/THcAn
 KTOb7GsEM7N1M3O3otL4zRM8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 55edf2a64f55ee4f;
	Sat, 07 Nov 2026 13:14:44 +0000
X-Mizu-Trace-ID: 55edf2a64f55ee4f
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:14:34 +0800
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
Subject: Re: [PATCH RFC v7 7/7] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <au8kOjsfkFhs1ye7@fedora>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
 <20261030-smmu-shared-sid-ver7-2026-10-26-v7-7-961726ebd6ab@Example.Com>
 <aujbMKormSlNQMOm@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aujbMKormSlNQMOm@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_051448_295991_6DBC1228 
X-CRM114-Status: GOOD (  13.96  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 10:49:20AM -0800, Nicolin Chen wrote:
>On Fri, Oct 30, 2026 at 08:09:39PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> With the per-domain CD table, every non-PASID sharer of a SID builds the
>> same normal-domain STE: same S1ContextPtr, S1DSS and S1CDMAX. Disable
>> stall and ATS for shared SIDs as well, so the remaining STE fields are
>> common too, and let any sharer program the STE. This also handles the
>> case where one device's driver attaches before the stream owner's driver:
>> the first attach now installs a valid STE instead of leaving the boot or
>> firmware STE in place.
>> 
>> A release or blocked attach must not abort a shared STE while other
>> sharers remain, otherwise it would break their ongoing DMA. Skip those
>> writes while the SID is shared; the last master (no longer shared) still
>> tears the STE down. This also means removing one device from a shared
>> group no longer leaves the survivors aborted.
>> 
>> Fault events on shared SIDs cannot be attributed to a specific master,
>> so arm_smmu_find_master() returns NULL when the stream's shared_masters
>> list is non-empty.
>> 
>> Disable SVA, PASID, vSMMU nesting, ATS and IOPF/stall for shared-SID
>> masters since all of them require an unambiguous SID-to-device mapping.
>> Reject sharing at insert_master() time if either master has stall enabled,
>> or if the existing master has PASID or ATS enabled.
>> 
>> Introduce arm_smmu_master_stall_enabled() to describe the policy actually
>> programmed into the hardware: a master stalls only if it asked for it and
>> its StreamID is not shared.
>
>Why do we need this? A stall_enabled master shouldn't share its
>SID in the first place.
>
>> Add arm_smmu_is_shared_sid() as an inline helper in arm-smmu-v3.h so that
>
>Use arm_smmu_master_shares_sid or arm_smmu_master_has_shared_sid.
>
>> arm-smmu-v3-sva.c and arm-smmu-v3-iommufd.c can use it without repeating
>> the list_empty() pattern.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
>Please check sashiko findings; all seems valid.
>
>https://sashiko.dev/#/patchset/20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab%40Example.Com

Yeah. I checked them every time. Seems the patchset will be bloating again.

Thanks
Peng

>
>Nicolin
>

