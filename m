Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D28E60A380F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3MATX7mY;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=V0JuNsqt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BvvMubdD0ab9qXTzvi78Wzx6n/mu2aOjNES6c6xFfUo=; b=3MATX7mYBh6jgY
	8z4bKMTkvzlVC0bjgL1aPCKxBr23iHTHxOHak+E6fWpa769OVXEwrQ+/tYbYBAEF+Lf2D0Rc98k1P
	GeAOp4k0bODopTUoVRJQDgaPVjN3xOoq9Dghg03nOZ0xcWEzbFAjIvTJfFp2CyeCyFL8EH4FD06YQ
	SNuNaCTiZIYAElf3B87DoFSQd59lc5Kf0SyVHrScgnGPYivL8GaDV6nBX1VA+rLwehYy46LNZLrxd
	YHkCJdGYO4aCATHxEtD9nUTHGp9MOPnhX7xPq6XQSJvPhnWOlkIuwD2gy6fDOy75jl/FtFOzPwFu5
	I+5/502bn0a1o+4kEncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhyG-00000003E91-2MMm;
	Tue, 10 Nov 2026 09:16:52 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhyD-00000003E6q-07Qd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:16:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BvvMubdD0ab9qXTzvi78Wzx6n/mu2aOjNES6c6xFfUo=;
	b=V0JuNsqtcvHvWZar8RQGhcZaYErUdAWqJ1nV312WRgaycNnJ1zsFEq4gL5SRY2frvA0hfpC1l
	+o01tk/z0saf3sDH7onJDGrLuaaZUu7YfpRbV38fFrR23kuY4Ztb4i1hCOOJLP9hHD2sNLbaSku
	cALfpikEjxvECDHlXpMIiVM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jP1HL05wvz1K96b;
	Tue, 10 Nov 2026 17:16:30 +0800 (CST)
Received: from kwepemk300003.china.huawei.com (unknown [7.202.195.93])
	by mail.maildlp.com (Postfix) with ESMTPS id A668140561;
	Tue, 10 Nov 2026 17:16:38 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 kwepemk300003.china.huawei.com (7.202.195.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 10 Nov 2026 17:16:37 +0800
Message-ID: <3a66ba8f-96dd-4215-8c4d-0cc3c286375a@huawei.com>
Date: Tue, 10 Nov 2026 17:16:36 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
To: Muchun Song <muchun.song@linux.dev>, James Houghton
	<jthoughton@google.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu
 Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, David
 Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Nanyong
 Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, Frank van der
 Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-14-jthoughton@google.com>
 <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk300003.china.huawei.com (7.202.195.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_011649_417115_D77269C9 
X-CRM114-Status: GOOD (  15.35  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/7/2026 2:45 PM, Muchun Song wrote:
> 
> 
>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
>>
>> Support HVO if HW AF and BBML3 are supported. These are the required
>> features for the vmemmap to be modified in place.
>>
>> On arm64 systems that do not have the required hardware features to
>> support HVO, the HVO sysctl will not appear, and any attempts to enable
>> HVO (either via the command line or via
>> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y) will have no effect.
>>
>> Signed-off-by: James Houghton <jthoughton@google.com>
>> ---
>> arch/arm64/Kconfig               | 2 ++
>> arch/arm64/include/asm/hugetlb.h | 7 +++++++
>> mm/hugetlb_vmemmap.c             | 4 ++++
>> 3 files changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b51d23a62c92..e4c87487bc7f 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -92,7 +92,9 @@ config ARM64
>> 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>> 	select ARCH_WANT_FRAME_POINTERS
>> 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>> +	select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
>> 	select ARCH_WANT_LD_ORPHAN_WARN
>> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> 
> Because vmemmap optimization depends on compound_info_has_mask(), before
> enabling HVO on arm64, its vmemmap start address needs to be aligned to
> MAX_FOLIO_VMEMMAP_ALIGN. Therefore, a prerequisite patch is required.
> 

Agreed, we tried to enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP[1] on ARM64.
If the alignment is not performed, a warning will be triggered with
DEBUG_VM, see sparse_init(). The same issue applies to 
ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.


[1] enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..649244e55c4b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -94,6 +94,7 @@ config ARM64
         select ARCH_WANT_FRAME_POINTERS
         select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || 
(ARM64_16K_PAGES && !ARM64_VA_BITS_36)
         select ARCH_WANT_LD_ORPHAN_WARN
+       select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
         select ARCH_WANTS_EXECMEM_LATE
         select ARCH_WANTS_NO_INSTR
         select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 4e7682dfe366..6808529873a9 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -91,11 +91,9 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
   * has a direct correspondence, and needs to appear sufficiently aligned
   * in the virtual address space.
   */
-#if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
-#define ARM64_MEMSTART_ALIGN   (1UL << SECTION_SIZE_BITS)
-#else
-#define ARM64_MEMSTART_ALIGN   (1UL << ARM64_MEMSTART_SHIFT)
-#endif
+#define ARM64_MEMSTART_ALIGN                                          \
+       max_t(u64, 1UL << max(SECTION_SIZE_BITS, ARM64_MEMSTART_SHIFT),	\
+               PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page)))


