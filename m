Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3fmLYQr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EUSlFVk1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4MKFbkxC3o9ap8WbY2v8opmAiDT98EVFbNmAsPwQeDQ=; b=x3fmLYQriTvPR1
	ybSrkFX2iAZ6Zpl1smFdjUVBem7wniz2OFAAD2AD6ryySc6K7HK9MRWBOpRw+HEnZZNSVUnhz/4hk
	FNEn00LuGWqBx5Ok1DBrgDONd5pdvVITHYDaNjMMXoS4iwp9BWNnuO62DY3Up0PF6joaieI8+YDNF
	b3aMJCBK/qkDafpHaoZUJJusoeDak7K6MqDPdBzWXIqvLpCu5E++Pb0nl7aj0RTjxRb2ixKcJWKHK
	Q/pawq/W/XOSf5oEFFNgc6Y3XerF3B64pKbrQRrUHfuwahzNEntOJRbjmJde0wbhtIAJkDds3UvR5
	81WBH1etMmj6T/c/A4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKlI-0000000BO68-1Kiz;
	Wed, 25 Nov 2026 21:42:44 +0000
Received: from out-132.mta1.migadu.com ([95.215.58.132] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKlD-0000000BO53-0xfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:42:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MXfyCZanVHHCByeJQ6CMCayWNQ7e8Mkpkpks7k/5FEA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795642953; v=1; x=1796247753;
 b=EUSlFVk11/jFZQCE60eM5UFcEs/hiJpL9I7fHfA16wnKSXYeu4Hnr3U+p2gUt6hxjgRSiltd
 0MJ6ZKVXVeC72xthTTl/WEPhEg67LGzkqXA1IE2P8L2Wwhc5/hJ9W0Z73KmZiTwcPmAcAmMlM1Z
 KNV2GZXUnYkwyi0H2mmJ1T1M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 77a1ac44524ef322;
	Wed, 25 Nov 2026 21:42:33 +0000
X-Mizu-Trace-ID: 77a1ac44524ef322
X-Migadu-Flow: FLOW_OUT
Message-ID: <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev>
Date: Wed, 25 Nov 2026 21:42:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
To: Leonardo Bras <leo.bras@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, maz@kernel.org, oupton@kernel.org,
 fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com,
 rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <awcXhk885lqDRAHy@LeoBrasDK> <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
 <awcoCklLOKeuXPhh@LeoBrasDK>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <awcoCklLOKeuXPhh@LeoBrasDK>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_134240_316280_FFC5F77F 
X-CRM114-Status: GOOD (  37.51  )
X-Spam-Score: -2.8 (--)
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 25/11/2026 10:25, Leonardo Bras wrote:
> On Wed, Nov 25, 2026 at 05:55:29PM +0000, Usama Arif wrote:
>>
>>
>> On 25/11/2026 09:14, Leonardo Bras wrote:
>>> On Tue, Nov 24, 2026 at 07:28:42AM -0800, Usama Arif wrote:
>>>> When a stage-2 fault may need new page tables, KVM first tops up the
>>>> vCPU's page cache: if it holds fewer pages than the fault might need, it
>>>> is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
>>>> 40. Unused pages stay in the cache until the vCPU is destroyed.
>>>>
>>>> With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
>>>> used. Stage-2 has at most three levels and the root is preallocated, so
>>>> a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
>>>> As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
>>>> table pages to map all of its memory, while its four vCPU caches get
>>>> filled with 160.
>>>>
>>>> On a production host with 64 KiB pages running 101 VMs with four vCPUs
>>>> each, the caches were still 86% full. The memory used:
>>>>
>>>>                         before      after
>>>>   per-vCPU capacity     2.5 MB     512 KB
>>>>   all 404 vCPUs         869 MB     <= 202 MB
>>>>
>>>> Let's lower the capacity to 8 with 64 KiB pages, In the production
>>>> usecase above, it frees at least 667 MB. That still covers the two-page
>>>> minimum and leaves room for several table allocations per refill. 4 KB
>>>> and 16 KB pages keep 40.
>>>>
>>>> The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
>>>> but it is topped up before every page it maps, so 8 is sufficient there
>>>> as well. The pKVM hypervisor memcache and the eager split cache don't
>>>> use this capacity.
>>>>
>>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>>>> ---
>>>>  arch/arm64/include/asm/kvm_types.h | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
>>>> index 9a126b9e2d7c99..28568da9ea4a7b 100644
>>>> --- a/arch/arm64/include/asm/kvm_types.h
>>>> +++ b/arch/arm64/include/asm/kvm_types.h
>>>> @@ -2,7 +2,12 @@
>>>>  #ifndef _ASM_ARM64_KVM_TYPES_H
>>>>  #define _ASM_ARM64_KVM_TYPES_H
>>>>  
>>>> +/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
>>>> +#ifdef CONFIG_ARM64_64K_PAGES
>>>> +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
>>>> +#else
>>>>  #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
>>>> +#endif
>>>>  
>>>>  #endif /* _ASM_ARM64_KVM_TYPES_H */
>>>>  
>>>> -- 
>>>> 2.53.1-Meta
>>>>
>>>
>>> Hi Usama,
>>>
>>
>> Hello Leonardo,
>>
>>> Have you tried to reproduce this issue in v7.4-rc1 or newer?
>>
>> Yes. The patch is against kvmarm/next (v7.4-rc3), which includes
>> Lorenzo's pre-fault series, and I A/B tested it there.
>>
>> On unpatched v7.4-rc3 with 64 KiB pages, a VM whose 16 vCPUs each fault
>> in one page needs a single stage-2 table page, yet the vCPU caches hold
>> 640 pages (40 MiB). With the patch they hold 127 pages.
>>
>>>
>>> IIUC Lorenzo Stoakes introduced a change that would cause the memcache to 
>>> skip topup if the cache contains a minimum of ~4 pages, so it can possibly 
>>> improve that issue.
>>
>> I don't think that part is new. __kvm_mmu_topup_memory_cache() has
>> returned early when mc->nobjs >= min since commit 6926f95accee ("KVM:
>> Move x86's MMU memory cache helpers to common KVM code"). Lorenzo's
>> commit d27acc152c62 ("KVM: arm64: Size the stage-2 memcache from the
>> fault MMU") takes min from s2fd->mmu instead of vcpu->arch.hw_mmu. For a
>> guest abort that is the same MMU, so nothing changes here.
>>
>> With 64 KiB pages, min is kvm_mmu_cache_min_pages(), which is at most 2.
>>
>>>
>>> Although I can see that when it's below that minimum it fills the whole 
>>> capacity (40) of the cache.
>>>
>>
>> Right, and that is the problem. Skipping the top-up avoids refilling
>> the cache, but nothing ever drains it. A vCPU's first fault fills its
>> cache to 40. Each last-level table covers 512 MiB, so a guest needs very
>> few table pages, and most vCPUs never drop below min. The remaining
>> pages stay allocated until the vCPU is destroyed, which is why the
>> production caches were still 86% full.
>>
>> The patch keeps the early return and only lowers how far a refill goes.
> 
> Right,
> 
> I took a look in the cache workings, and it does not seem to receive freed 
> pages back in. It gets filled by topup and used by map, so IIUC it is used 
> only to avoid failing an allocation during the mapping walk.
> 
> Maybe it could be the case to simplify this cache to have the capacity 
> about the same as the minimum (since it always topup before mapping) and 
> avoid the waste altogether.
> 
> Maymbe having something like this should be enough?
>  
> #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE (KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL)
> 

That sounds good to me. I tested and it works (and releases even more memory :))

I had to move #defines around to make it work, the current patch sits
like below. If this seems acceptable, I can send it as v2 for review.


From 9b044379f470625adb031a0ee7529e054d9ec219 Mon Sep 17 00:00:00 2001
From: Usama Arif <usama.arif@linux.dev>
Date: Wed, 25 Nov 2026 12:55:15 -0800
Subject: [PATCH] KVM: arm64: Shrink the stage-2 memcache to the page-table
 depth

When a stage-2 fault may need new page tables, KVM first tops up the
vCPU's memcache: if it holds fewer pages than the fault might need, it
is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
40. Pages never return to the cache, and unused ones stay there until
the vCPU is destroyed.

The cache only has to cover a single map: every fault that can allocate
tables tops it up first, and a map allocates at most one table per
level below the preallocated root (kvm_mmu_cache_min_pages()). That is
at most three pages with 4 KiB and 16 KiB pages, and two with 64 KiB
pages.

With 64 KiB pages, the 40-page cache is 2.5 MiB per vCPU. As every
last-level table covers 512 MiB, an 8 GiB guest needs just 17 table
pages to map all of its memory, while its four vCPU caches get filled
with 160. On a production host with 64 KiB pages running 101 VMs with
four vCPUs each, the caches were still 86% full. The memory used:

                        before      after
  per-vCPU capacity     2.5 MiB     256 KiB
  all 404 vCPUs         869 MiB     <= 101 MiB

Let's size the cache to KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL,
which is 4 pages and covers the deepest walk with one page to spare. On
the host above, it frees at least 768 MiB. Refills get more frequent,
but no more than four pages per vCPU ever sit unused. With 4 KiB pages,
the cache shrinks from 160 KiB to 16 KiB per vCPU.

Move the two level definitions to asm/kvm_types.h, so that the generic
top-up code in kvm_main.c can see them. kvm_pgtable.h still gets them
through linux/kvm_types.h.

The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
but it is topped up before every page it maps. The pKVM hypervisor
memcache and the eager split cache don't use this capacity.

Suggested-by: Leonardo Bras <leo.bras@arm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h | 3 ---
 arch/arm64/include/asm/kvm_types.h   | 7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index eda440354a55ec..691e2eb63939f5 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -19,9 +19,6 @@
 
 struct kvm_s2_mmu;
 
-#define KVM_PGTABLE_FIRST_LEVEL		-1
-#define KVM_PGTABLE_LAST_LEVEL		3
-
 /*
  * The largest supported block sizes for KVM (no 52-bit PA support):
  *  - 4K (level 1):	1GB
diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c99..5b61285d317e28 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -2,7 +2,12 @@
 #ifndef _ASM_ARM64_KVM_TYPES_H
 #define _ASM_ARM64_KVM_TYPES_H
 
-#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
+#define KVM_PGTABLE_FIRST_LEVEL		-1
+#define KVM_PGTABLE_LAST_LEVEL		3
+
+/* One page per level below the root covers kvm_mmu_cache_min_pages(). */
+#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE	\
+	(KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL)
 
 #endif /* _ASM_ARM64_KVM_TYPES_H */
 
-- 
2.53.1-Meta



> Thanks!
> Leo


