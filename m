Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D599606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuJARnN5;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=ixZVp3kS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s27wvHS07SuwEnoAPuKZTYMrrXbi2Voqx1f7y+dH6O0=; b=NuJARnN5bt1IpJqbR+cc4JYa/L
	CZ917yWMDoplqlrXzUtsarnju3E923hzr+x85OZNnKiTwb0XoYySL2x5Ehs9cf/ROA7Vkx2NJwSQA
	lqA+2tG9vEOIDBKRG87V5ZvmaVFk8cdw8QzFJWCLt0WgkefEW4EIHU9wxtZY68Yqezq4ehkCNeAS9
	OhvdaJY2RZM7J3HdzSsBvj/rJgX5cZZF7uzWoauxtWFS00O8J1cN7AMVAuk/gokwTyP4NlItXAUiX
	xPeWnUCl4ZH3/4dq9ljwptrDB/fxJyE69SGPNEZmxVocatatQNjsPqY8mSzlzwJJC13VfjIpqp8Bb
	pXj0mr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQn9-00000009IVH-1XdB;
	Thu, 12 Nov 2026 09:08:23 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQn4-00000009ITO-3KTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794474499; x=1826010499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Tx2kYwYrf5VVNfDHDCGqna3I8YOzDbxeRSc934oNm0=;
  b=ixZVp3kSvwYSn/pUBxQ99m0yeuW423l/ayAO3ygbS10hpUM36+sB8FVn
   4+Ymyeoi5dtSZPMENHX8T+tsrx7RCaZwCGVVJzeh80Xrbp/VYBM5ewOm8
   YCBozjmDYQtOHnZjnRM36zE5Da8RT2R1xwUSoR/MuK3G/Etzx/lSAnVCr
   JAK8Lj4QX1pC31rtj2ThchrTTlmZedt5aKnAyGz5hLUKOYF9LJu7rBSg8
   1Hrim2ttSu2d7aWbDDeDG528XxQB0A6XYnFZhIm/bbVBtFw6MzQyd/xZu
   YvZQk1ZRGiFhRYxStCU4BNjjzcCc6YSgXtEu6KHZAxIKgEXzwr261TM0V
   Q==;
X-CSE-ConnectionGUID: qgT3Yg74RsefMX1j0qkRYQ==
X-CSE-MsgGUID: 7SR7dbeZTxqoHPR53h0lJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="249096633"
X-IronPort-AV: E=Sophos;i="6.27,209,1786978800"; 
   d="scan'208";a="249096633"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 18:08:17 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B52B61C02E0C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:08:16 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 659F98D65C4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:08:16 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.86.149])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id 706EA405EFB;
	Thu, 12 Nov 2026 09:08:07 +0000 (UTC)
Date: Thu, 12 Nov 2026 18:08:06 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 00/12] KVM: arm64: CCA: Prepare Realm memory management
Message-ID: <avV-P2_fOkFWQVnM@FCCLS0092175.localdomain>
References: <20261111145758.217946-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111145758.217946-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_010819_329191_C8B825DD 
X-CRM114-Status: GOOD (  20.23  )
X-Spam-Score: -4.4 (----)
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

Hi Steve,

On 11/11 14:57, Steven Price wrote:
> This series adds the memory management plumbing for CCA, building on the
> basic RMM support [1]. Thank you to those who reviewed v1 - I'm
> attempted to address all the comments.
> 
> The patches introduce internal Realm VM state and RMI feature checks,
> prepare Realm stage-2 setup and teardown, and provide RTT mapping and
> invalidation helpers. Realm memslots are restricted to the lower half
> of the IPA space because the protected and shared halves alias each
> other. The final patch connects the helpers to KVM's stage-2 MMU
> operations.
> 
> This is the memory management portion of the larger Realm host series.
> Realm descriptor creation, REC entry and exit, activation, and the new
> uAPI follow in the integration stack. This series alone does not enable
> Realm creation.
> 
> As before there's an integration branch[2] that includes the realm
> creation, REC entry/exit etc building on top of this series. I've also
> pushed a git branch[3] of just this series.
> 
> Changes since v1:
> - Add a guest_memfd prerequisite patch that checks whether the backing
>   file supports mmap when preparing an arm64 memslot.
> - Combine the RMI availability and feature checks into one patch, and
>   move Realm vCPU feature restrictions to the integration stack.
> - Correct Realm IPA sizing and RTT teardown, including teardown before
>   activation, RTT accounting, and handling of missing or folded RTTs.
> - Rework RTT mapping to respect IPA and physical alignment, handle
>   partial RMI progress, and retry interrupted operations.
> - Preserve private mappings when a Realm guest_memfd memslot deletion is
>   rejected, and tighten Realm fault handling and stage-2 destruction.
> 
> [1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
> [2] https://gitlab.arm.com/linux-arm/linux-cca
>     branch: cca-host-mm/v2/integration
> [3] https://gitlab.arm.com/linux-arm/linux-cca
>     branch: cca-host-mm/v2/mm
> 
> Steven Price (7):
>   KVM: arm64: CCA: Reserve the RMM mode
>   KVM: arm64: guest_memfd: Check mmap support when preparing memslot
>   KVM: arm64: CCA: Check RMI support and features at init
>   KVM: arm64: CCA: Add basic infrastructure for creating a realm
>   KVM: arm64: CCA: Tear down RTTs
>   KVM: arm64: CCA: Add Realm RTT mapping and invalidation helpers
>   KVM: arm64: CCA: Support runtime faulting of memory
> 
> Suzuki K Poulose (5):
>   KVM: arm64: CCA: Introduce Realms
>   KVM: arm64: Handle attributes in stage2_unmap_range
>   KVM: Allow architectures to reject memslot changes before invalidation
>   KVM: arm64: CCA: Prevent memslot modifications after Realm creation
>   KVM: arm64: CCA: Add Realm stage-2 MMU operations

I've tested the integration branch [2] including this series on our
hardware using the QEMU-VMM proposed in:
  https://lore.kernel.org/qemu-devel/20261002202026.1204110-1-mathieu.poirier@linaro.org/

The Realm guest VM (32 vCPUs, 16 GiB RAM) booted successfully. To
exercise the guest with a more realistic workload, I also performed a
full Linux kernel build, which completed successfully.

A Tested-by tag might not be carried over to the next revision, if any,
but anyway, for this series:

Tested-by: Kohei Enju <enju.kohei@fujitsu.com>

Thanks,
Kohei

