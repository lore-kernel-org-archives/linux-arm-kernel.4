Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xr1iiHxU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SgPicxBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=; b=Xr1iiHxU+RDBEo2QQsMjbuK3Aw
	nWjONY3l2/8f/N3GOtVvhN9/dXIxzKzZvPS/HaSKk6LkfgKS+KrvqWRSkXkoZr+uclcjGiVcEIBK1
	BCWwTg/gLBjMMoeUaNCgedWbu25j/62HlqMcEeE8qKAffhz/jf3sZ7wfWVpohx8V8HratiNkCGyPh
	NVrKTUDuy9bJOF67ZJalAOL0h6ittYyOiCoLwO0fVB2CgIJP+wDEcb5ZoDn2J57YtbWOBG3bdEUOo
	KRo35pYOvrX9HxeMbyuLZoCDdnZrPnnswWYK9MG6OGGV2Q5kOVWrHcEBmm9nqL6UI8Yip3lvYg4/s
	16eHKLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4Y-00000000bHQ-1tqL;
	Mon, 09 Nov 2026 12:02:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO4W-00000000bGr-0NAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:02:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so25945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794225718; x=1794830518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=;
        b=SgPicxBkI+fkyA/WMxJUQU8xWPMyqF1BjMxnI44L+MUtRX8442CiUgFzw9xgdz588X
         YdjO5O06yuhBv/p3tyoOUbYs1EXw6OkZ10+7/4xvVgCacnJ5fG4keNtMHpg7jGn4Oc2B
         dzjdNLpnhTocfBGvr6ebZU27u86IdcIBALDcViPrSStBvO3ZcRKylW6KGJJ/Sm9vl5h4
         wRuWyL7wDTUd7cDexEMQr0prGRBmnvJ7otVTtDFWJ06LMMQ+uO4t4hrGlx8rnk/c5Fhh
         qAIVBWvOiM7Uc/IYKNyR19TzzUVLL5DMwotUbwoDWewwIWkWvPfgz8nV1p63/hm2E5O8
         H6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225718; x=1794830518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szgQb0dY5ZnhzHxi0dDY7s5APqPVFKBR+bd+pkS5brY=;
        b=q9Rhex8zlV43xYmdVzqPh5BGhPYDRjKBtZj2Wow6ivmtTLLFtd+Y0jvuZ/ZpGMEAC+
         AxbooMlzWacfKQ1PfwU+qH7bPxJsIqRjlSlrSzVolmopeh1Q6KbdxMKORBXGnwrhSVov
         SOxQL5PiQWZv+Z+oTiGRKKnShOxnvos9H/tTqdkCwS6pHtwf6JWA7yRe7FJTJQAAaGVx
         vgBKCxfGyfOFEjTT7ke5SlSx9fRcfpKrYna+ZUjr7FO0Y2CdFI2N9K2LXyHMqp+E16pK
         8pYyMUt/QLwBnU+PF0phh8pMs4AG16EuY+PGj+oRgIZ9r9sORf5G/SNa5+R8rCjztLyG
         WOIA==
X-Gm-Message-State: APuU4Z+g58FRs3/4ywVgCo9eFZPgatw60x8OK0GKAhU7M5wJJpzxHpUs
	K3ySyY7JiVJT42dSmXlxl9mi7eUd9uoVRwtGDpavonY9aCNdZXT7p/kzcql8zGDf56680vLHfpn
	CgjtZaw==
X-Gm-Gg: AYBFou0pAuOUGWW1f5KFdb1zBozkvUy9E6BUxJH63X7pC+pL1nXYFG+7wMKLsAlTkEd
	kRQ3a6rKlRznkGyzDEvK0UrZBhSMzcGctjtMF4JaAnVG7RSe3Qx5lD44k09EtvdsRCBaPjdLeBx
	ICai8rA6R98nuG6CGSqW2kAr9B+J5mKLjzx27ZRX2zIOrn6E6RhRYqH9He/yHe9iE7mgdcVbS3N
	5qU+i7O91ZrNwkv3R4e+H82VJ72kUXiFxYFQDrffBftHKkVIG+R+8CD1D/7Corcw8IgYU2mUNsu
	+2PJilNavtwbdUIZgKgDpR3yIGDVeJwZ3xbEvzT0xYJXBheaYB69yaZbZTqJt4hC51GgOnNHqIM
	FFQ+X6HteJw0JKtt60r8T/SxWiMWE03MhRLscHNkvVnrkC6aMiVcqrj78+Rgq+VBRYwNWJc7Z6k
	bBbN4e6sR6HfVk8bs301uf6vrWeb3Bg5teWNp/nFvmKBt8LUXjtXpQESMOyIhFrqjJFRVUrZzHl
	zhtQ4S/+Eb4naVrlED9DBkZMumyUOUs//NE8hnHUXJt4mD45CIXIChFCrp6vZbG0i+32aMMJPRK
	XRgNUQ+rxutQSmWVkhHBbrBSqs5feTBXZ49Q132cw6O9EqF5aYcPCLNG80scDberZzvz5A==
X-Received: by 2002:a05:600c:c055:b0:4a2:bd1:a80a with SMTP id 5b1f17b1804b1-4b811e398ffmr1476265e9.2.1794225717416;
        Mon, 09 Nov 2026 04:01:57 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967003fefbsm5468334f8f.13.2026.11.09.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:01:55 -0800 (PST)
Date: Mon, 9 Nov 2026 12:01:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 17/25] iommu/arm-smmu-v3-kvm: Shadow stream table
Message-ID: <avG2LCJVZIyhWQSG@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-18-smostafa@google.com>
 <au4uTxliZFv12Bqn@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4uTxliZFv12Bqn@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_040200_203525_2EB59048 
X-CRM114-Status: GOOD (  21.88  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:45:19AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:48PM +0000, Mostafa Saleh wrote:
> > @@ -538,6 +655,7 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  
> >  		if (is_write) {
> >  			bool last_cmdq_en = is_cmdq_enabled(smmu);
> > +			bool last_smmu_en = is_smmu_enabled(smmu);
> 
> It'd read better with smmu_was_enabled and smmu_is_enabled.
> 

Sure, will update them.

> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > index 3903ae358555..31ab7a0335a8 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -27,6 +27,12 @@
> >   * @cmdq_host:		Host view of the CMDQ, only q_base, base_dma and llq used
> >   * @cmdq_max_shift:	Max shift for the CMDQ probed from HW
> >   * @cr0:		Last value of CR0
> > + * @host_ste_cfg:	Host stream table config
> > + * @host_ste_base:	Host stream table base
> > + * @strtab_cfg:		Stream table config as seen by HW
> > + * @strtab_dma:		Physical address of the shadow stream table
> > + * @strtab_size:	Size of the shadow stream table
> > + *
> >   * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
> >   * before de-privilege, the rest by the hypervisor driver.
> >   */
> > @@ -50,6 +56,11 @@ struct hyp_arm_smmu_v3_device {
> >  	struct arm_smmu_queue	cmdq_host;
> >  	u32			cmdq_max_shift;
> >  	u32			cr0;
> > +	dma_addr_t		strtab_dma;
> > +	size_t			strtab_size;
> > +	u64			host_ste_cfg;
> > +	u64			host_ste_base;
> > +	struct arm_smmu_strtab_cfg strtab_cfg;
> 
> The order is different here than the kdocs.
> 
> Also, it might be cleaner to group host/shadow/hw stuff separately:
> 
> struct hyp_arm_smmu_v3_device {
> 	...
> 	struct hyp_arm_smmu_v3_device_host host;
> 	struct hyp_arm_smmu_v3_device_shadow shadow;
> 	struct hyp_arm_smmu_v3_device_hw hw;
> 	// Or
> 	struct {
> 		...
> 	} shadow;
> 	struct {
> 		...
> 	} host;
> 	struct {
> 		...
> 	} hw;
> 	...
> };

That looks better, thanks! I will try it in the next version.

Thanks,
Mostafa

> 
> Nicolin

