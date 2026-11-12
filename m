Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A660A3822
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFchru9a;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vmzj/Kff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=220ugqDuyQyPHtA/XrNCqAcUUimFC+lFQ4mNPAn6NRA=; b=YFchru9aebjLS9
	fuP0sb6xowqWFEdRdQ9Mfz6XN2ySjIe+K1dTZPgth0d2xf85nBT7D+SaFKC6GCAWd+UW2lE94sSmG
	iSiRBKmN+2HZ7umt323BNpJPMjTfIJl0NLFlwKdAg/RREohDZyaJcY1pUQJXdrLUKvHMX6u1kCUPS
	jI+U9eeRUoXAWOHZkYH+DU3DpyRBBPJRELThFVt6oyxQH4PhK05BcMPmuHAgZwFOLil86llVcX7fm
	FbZZEcjqL0td/NwpRQQwmwfzbQG9/JiZiP9ZtqipTOZiHnYa3CVVgXuip0YVjwxcRwQiCAmHXijuY
	+1ywpymRyUPhzHk+YJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRJQ-00000009PLv-1JK4;
	Thu, 12 Nov 2026 09:41:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRJL-00000009PL0-1Wl1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:41:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09344153B;
	Thu, 12 Nov 2026 01:41:35 -0800 (PST)
Received: from [10.0.129.47] (e122027.cambridge.arm.com [10.0.129.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C443D3F632;
	Thu, 12 Nov 2026 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794476498; bh=wsUciV+efeTQCIVGRFWUTHzo6OWjjig7oVL2Hlvu3Do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vmzj/KffMUnSTgxJ9oWy92AHHsu+KlvSL1PYaGD6G5XriiSu8w8KE7KGTzZaTN6U5
	 CER5uSOeYHgUJTU2rmyJyLEMApaNv/fSaEtfVj0gBCjwmC88P/COYdfHvGwPi1GTMG
	 BNkhuxNjxLgDR3CtZUwX6xR3qq/K74GnFMcPcVQY=
Message-ID: <a25321ce-7593-4c75-a529-e19c273638ef@arm.com>
Date: Thu, 12 Nov 2026 09:41:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] KVM: arm64: CCA: Prepare Realm memory management
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261111145758.217946-1-steven.price@arm.com>
 <avV-P2_fOkFWQVnM@FCCLS0092175.localdomain>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <avV-P2_fOkFWQVnM@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_014140_355076_79CBDE5A 
X-CRM114-Status: GOOD (  17.70  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 09:08, Kohei Enju wrote:
> Hi Steve,

Hi Kohei,

> On 11/11 14:57, Steven Price wrote:
>> This series adds the memory management plumbing for CCA, building on the
>> basic RMM support [1]. Thank you to those who reviewed v1 - I'm
>> attempted to address all the comments.
>>
>> The patches introduce internal Realm VM state and RMI feature checks,
>> prepare Realm stage-2 setup and teardown, and provide RTT mapping and
>> invalidation helpers. Realm memslots are restricted to the lower half
>> of the IPA space because the protected and shared halves alias each
>> other. The final patch connects the helpers to KVM's stage-2 MMU
>> operations.
>>
>> This is the memory management portion of the larger Realm host series.
>> Realm descriptor creation, REC entry and exit, activation, and the new
>> uAPI follow in the integration stack. This series alone does not enable
>> Realm creation.
>>
>> As before there's an integration branch[2] that includes the realm
>> creation, REC entry/exit etc building on top of this series. I've also
>> pushed a git branch[3] of just this series.
>>
>> Changes since v1:
>> - Add a guest_memfd prerequisite patch that checks whether the backing
>>   file supports mmap when preparing an arm64 memslot.
>> - Combine the RMI availability and feature checks into one patch, and
>>   move Realm vCPU feature restrictions to the integration stack.
>> - Correct Realm IPA sizing and RTT teardown, including teardown before
>>   activation, RTT accounting, and handling of missing or folded RTTs.
>> - Rework RTT mapping to respect IPA and physical alignment, handle
>>   partial RMI progress, and retry interrupted operations.
>> - Preserve private mappings when a Realm guest_memfd memslot deletion is
>>   rejected, and tighten Realm fault handling and stage-2 destruction.
>>
>> [1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
>> [2] https://gitlab.arm.com/linux-arm/linux-cca
>>     branch: cca-host-mm/v2/integration
>> [3] https://gitlab.arm.com/linux-arm/linux-cca
>>     branch: cca-host-mm/v2/mm
>>
>> Steven Price (7):
>>   KVM: arm64: CCA: Reserve the RMM mode
>>   KVM: arm64: guest_memfd: Check mmap support when preparing memslot
>>   KVM: arm64: CCA: Check RMI support and features at init
>>   KVM: arm64: CCA: Add basic infrastructure for creating a realm
>>   KVM: arm64: CCA: Tear down RTTs
>>   KVM: arm64: CCA: Add Realm RTT mapping and invalidation helpers
>>   KVM: arm64: CCA: Support runtime faulting of memory
>>
>> Suzuki K Poulose (5):
>>   KVM: arm64: CCA: Introduce Realms
>>   KVM: arm64: Handle attributes in stage2_unmap_range
>>   KVM: Allow architectures to reject memslot changes before invalidation
>>   KVM: arm64: CCA: Prevent memslot modifications after Realm creation
>>   KVM: arm64: CCA: Add Realm stage-2 MMU operations
> 
> I've tested the integration branch [2] including this series on our
> hardware using the QEMU-VMM proposed in:
>   https://lore.kernel.org/qemu-devel/20261002202026.1204110-1-mathieu.poirier@linaro.org/
> 
> The Realm guest VM (32 vCPUs, 16 GiB RAM) booted successfully. To
> exercise the guest with a more realistic workload, I also performed a
> full Linux kernel build, which completed successfully.

Awesome - thank you very much for testing.

> A Tested-by tag might not be carried over to the next revision, if any,
> but anyway, for this series:
> 
> Tested-by: Kohei Enju <enju.kohei@fujitsu.com>

Thanks,
Steve


