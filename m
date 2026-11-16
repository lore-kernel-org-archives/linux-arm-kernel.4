Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iY65xp82;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+HlchmX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y3cXUCELq15P2CTKae/QhO/9W7btvBg5d30bXL8PhNo=; b=iY65xp82y8ibty
	JwTzitBwGISOfUBylK7VgaB1q9n3aKC5SFU51LHMg3aEU+4FUV1oeJKht6WWmb5z23++5MsOZ7lgU
	DkryoBpnthQKAT3xzRW3w2EOGxY2BMAg1IB/OsluE/KmUbNhF63VfmAoZbth2mXX0ipcgjDOqNsZM
	8J4atFfsuUmknQXc6rN9qc/yEdb6QadbpA1by1txauusMoVIiLRjkDt9ZLjvtyKT81QzHSaBLY4D/
	ntG005Rz0HQXwpSOl7za+sDpU//9z2Xf18rglBxj9GTc0f4R2BEdhS289pIwat9+thrSNj8dxJLKI
	kwIrk595rfsjzYyEqQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu6C-00000001zGw-1ka2;
	Mon, 16 Nov 2026 10:38:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu69-00000001zGL-3zJW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:38:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFD41476;
	Mon, 16 Nov 2026 02:38:02 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A5483F632;
	Mon, 16 Nov 2026 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794825485; bh=9Ge9cT4Atk9nVv3V3kgsxcn8Q1tixZ6sqlMWxn8Yeww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+HlchmX/WMspbnBZX6i/dj9EA8VkiPFPsT5uAbBys0HKikGnZwXk7aZab6yKb5kM
	 64gp6umbkKw5vb5mXHq/kro9HkF9OekpaSoGDPN/gZKjsmOEDmWtUMyVd8r5hTBZxw
	 0+dmK4RruOgEFsB28HBPRvltQgwmJUCKUIjK5ecM=
Message-ID: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
Date: Mon, 16 Nov 2026 10:38:00 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
To: Ashok Raj <ashok.raj@oss.qualcomm.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_023806_075274_5EA48C63 
X-CRM114-Status: GOOD (  21.42  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ashok,

On 11/14/26 23:49, Ashok Raj wrote:
> request_nmi() currently models NMIs as per-CPU sources. This does not
> represent a globally routed NMI source with an affinity-capable irqchip,
> which needs to be rerouted when its target CPU is offlined.
> 
> This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
> for such a source. It remains excluded from normal IRQ balancing, but the
> generic startup and CPU-hotplug paths may select an online target. The
> second patch fixes the related /proc/interrupts display: NMI-safe flow
> handling updates the per-CPU counters rather than irq_desc::tot_count.
> 
> Patch 1: Add the migratable-NMI registration mode, validate that it is
> used only through request_nmi() with an affinity-capable non-per-CPU
> irqchip, and add IRQ KUnit coverage for registration and CPU-offline
> migration.
> 
> Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
> kstat_irqs_desc().
> 
> Testing:
>   - ARM64 changed-object builds with WERROR=1
>   - ARM64 !SMP changed-object build
>   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
>     validation and CPU-offline migration
>   - local downstream GHES delivery and migration validation for the intended
>     consumer topology (not part of this series)
> 
> Base and dependencies:
> 
> This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
> [1]. It depends on that series' GIC NMI support and is therefore not directly
> applicable to mainline or linux-next as posted. This RFC is for design
> feedback; it will need rebasing onto the upstream form of those prerequisites
> before submission.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
> 

I'm not an expert in this area, but based on what I've learned so far,
NMI being per-CPU like makes life much easier ;)

IIUC, one of the main problems with a shared NMI (as opposed to a
per-CPU) is handling shared state. Consider:

CPU0                       CPU1                       CPU2

---------------------------------------------------------------------------

<NMI>
handling started
                           set NMI affinity to CPU2
                                                      <NMI>
                                                      handling started
mutate shared state
                                                      mutate shared state
handling finished
                                                      handling finished

IOW, the same NMI handler could execute concurrently on two CPUs,
potentially corrupting shared state. Once again more than happy to
be corrected if I missed something :)

Cheers
Vladimir

> A separate GHES Type-4 series is the intended first consumer and is not
> included here.
> 
> Feedback is particularly welcome on the IRQF_NMI_MIGRATABLE API and its
> placement in the generic IRQ API, as well as the NMI accounting presentation
> in /proc/interrupts.
> 
> Ashok Raj (2):
>   genirq: Add migratable NMI registration mode
>   genirq/proc: Show NMI interrupt counts in /proc/interrupts
> 
>  include/linux/interrupt.h |   2 +
>  kernel/irq/irq_test.c     | 141 +++++++++++++++++++++++++++++++++++++-
>  kernel/irq/manage.c       |  33 +++++++--
>  kernel/irq/proc.c         |   7 +-
>  4 files changed, 172 insertions(+), 11 deletions(-)
> 
> 
> --
> 2.43.0
> 


