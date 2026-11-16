Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4771606AB68
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ChZBM/vs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z+eSypcy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YujtF9aG5FJtZ1fqhFraeDow6hmwqE3ooTREx9HW1QQ=; b=ChZBM/vsXSqL1n
	IKLDubnlkYwQqkvX6dn/dI6hSLiqwk5azEMwiC4UQYXnsTQ6r20BPB++PMo23kzjyFaip9DIaW9HT
	BtwOJO6dEzFbChiEqTKntrTLl8OelWoJrFe9EjElorR3uICvTTYMCYPk4vBREV2eY5oy899tYqFQ9
	BfHNxtof7/hNIqLFIg4X8HAZw/Ye7F6BV9ens3d7hfFEqAFVyvzuxxGxS3/5NJqkQuG07jmnPt1Jw
	amxrd0w6SqYmMKQWygsqJVjYllkB5YTX8DHM5N7c8o8vdo1XKaY5zQ9HUvXm5t/2GN794HqDBB0Zt
	ngayT35R0/zKnBM0C8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSueb-000000028L0-3cIE;
	Mon, 16 Nov 2026 11:13:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSueZ-000000028KT-2tzG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:13:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 204451713;
	Mon, 16 Nov 2026 03:13:35 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7643F632;
	Mon, 16 Nov 2026 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794827618; bh=aQUXlrLmvLA3/9J6e20mDqf2MdnG5musjaN7p70UOk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z+eSypcy8fNRkVainTE6LqR1+ogDNwY6a5fVhPAHNZrjtwDKa2x+PGD88IsZlhlTc
	 TO8sTnBMyTb/ujZzwOBZB+VofsKDHilkaEZ0sE/agL1JB7ZOYMRsxprEUHr9zYJf7B
	 BGH12vWH3xRs6fGloUxxxS3Qpo7ZIGCQnnWKhI88=
Message-ID: <9a2fab79-8266-4e23-b718-c9d7e128c5c0@arm.com>
Date: Mon, 16 Nov 2026 11:13:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mostafa Saleh <smostafa@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261116110549.1863653-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_031340_078241_1A748B74 
X-CRM114-Status: GOOD (  22.59  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 11:05, Fuad Tabba wrote:
> From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
> 
> On pKVM, set_memory_decrypted() shares pages with the host in place and
> without cache maintenance. The atomic pool, dma-direct and dynamic
> SWIOTLB pools zero their memory only after sharing it, so unless the
> page allocator has zeroed it, the host can read whatever the guest last
> left in it. Zeroing first isn't enough on its own, as the zeroes may not
> have been written back to memory, and a host that maps the pages
> Non-cacheable then reads the old contents.
> 
> Zero the range and clean it to the PoC before sharing it, so that no
> caller can hand the host stale data.
> 
> Fixes: ebc59b120c588 ("drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls")
> Fixes: e62decaf98e7c ("arm64/coco: Add pKVM as a CC platform")
> Link: https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> [fuad: take the pKVM hunk of v10 patch 2 as a standalone fix, add the clean to the PoC]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
> 
> Notes:
>      This is the pKVM hunk of patch 2 of Aneesh's v10 [1] plus a clean to
>      the PoC, taken on its own because it fixes a bug that has exposed
>      guest memory to the host since v6.12.
>      
>      Based on Linux 7.4-rc3 (aebb727447640).
>      
>      [1] https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> 
>   drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index 26fe9c3f22e36..81d1cd24a2eff 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -9,10 +9,12 @@
>   
>   #include <linux/arm-smccc.h>
>   #include <linux/array_size.h>
> +#include <linux/cacheflush.h>
>   #include <linux/io.h>
>   #include <linux/mem_encrypt.h>
>   #include <linux/mm.h>
>   #include <linux/pgtable.h>
> +#include <linux/string.h>
>   
>   #include <asm/hypervisor.h>
>   
> @@ -61,6 +63,15 @@ static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
>   
>   static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
>   {
> +	size_t size = numpages * PAGE_SIZE;
> +
> +	/*
> +	 * The host can read the pages as soon as they are shared, possibly
> +	 * through a Non-cacheable mapping. No caller relies on their contents.
> +	 */
> +	memset((void *)addr, 0, size);
> +	dcache_clean_poc(addr, addr + size);
> +
>   	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
>   				  addr, numpages);
>   }
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3


