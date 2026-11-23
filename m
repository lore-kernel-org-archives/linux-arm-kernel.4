Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHLfqOa8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RAzeYCjm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IfBYhQEgKpwaPrKRintjbxeYpbMzHP46mzrr0D1B6ac=; b=UHLfqOa88erhbL
	amQPtUQThK/sQoyFigpal+ItGXnR4WPNVAQafqD3fgg5NnIJmG+CPuySQC/VVj9HavvHq3HPsfbHu
	/hphson0IOVFUtFn4irYwjJr7PUwEZFLowgRR1MZQsCBziYf/4FTgaT2AmbbGoFXMC9SOXUwTflBo
	WB/7HkKW8DRr/Strl4my3R3HlFF7ubcjOxxzrPKrebiW2XBvoxL/eoRfZgZhcfqb0+5H/sA9Rs4lU
	Tcp8KMl0voF36+auYLP+jSv87WWoiPbJQjTGqDwul7HanBPvHdxoRSlnOp7kCbtIAW+AJ+8FojAdO
	ISVXx7xW79isz1bwxjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTmS-00000003Whz-3eUZ;
	Mon, 23 Nov 2026 13:08:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTmQ-00000003WhJ-1cgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:08:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 041DB143D;
	Mon, 23 Nov 2026 05:08:16 -0800 (PST)
Received: from [10.57.63.68] (unknown [10.57.63.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C85D3F882;
	Mon, 23 Nov 2026 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795439298; bh=ahbRbR3XjEmixrc6o49AmVmSn0rHTdwpUMW55Mj3SNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RAzeYCjm5E+gUtL5lb7UpxDnCX1FDHV9QzvHeAhnVBMMc4A34OhQSsb1Byidwllvi
	 eeR7C6LtSyysuwvcbX7IrqyzPH9RR2HJ53UVmYDzsmdbmRtc47Sjq6DZJc7laoCzQW
	 8WG/BtCbDWFd7soSi6D8/0naxl2XkH1J/ZTyHv8c=
Message-ID: <f543aea2-3a21-44ce-bb44-c84bd66b0a76@arm.com>
Date: Mon, 23 Nov 2026 14:08:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a
 fixmap entry
To: Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
 <20261120121638.194154-4-fuad.tabba@linux.dev>
 <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
 <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
 <5b0a26ee-30b0-4a79-9cca-9848dc9d65c5@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <5b0a26ee-30b0-4a79-9cca-9848dc9d65c5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_050822_528842_1D5D585A 
X-CRM114-Status: GOOD (  15.27  )
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

On 23/11/2026 11:36, Ryan Roberts wrote:
>>
>>>> @@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
>>>>          ptep = fixmap_pte(addr);
>>>>
>>>>          if (pgprot_val(flags)) {
>>>> -                __set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>>>> +                /* The slot must be usable on return, even in lazy MMU mode. */
>>>> +                __set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>>>> +                emit_pte_barriers();
>>> I wonder if it would be clearer to wrap __set_ptes():
>>>
>>> lazy_mmu_mode_pause()
>>> __set_ptes()
>>> lazy_mmu_mode_resume()
>> That would work. However, there's the stable backport. 6.18 has the
>> bug, but lazy_mmu_mode_pause() was added in 7.0, so 6.18.y would need
>> its own patch. This patch applies to 6.18 unchanged.
>>
>> I'm happy with either, or with a followup patch in the same series.
> I'd personally prefer to use pause/resume since it's makes it very clear what's
> going on and avoids the layer violation. Perhaps your approach as the back
> portable one, then pause/resume as follow up (along with ptep_try_set() tidy
> up)? Others might think differently though...

Using pause/resume does work, but it is a bigger hammer than necessary.
If other features make use of lazy MMU mode, then we may end up paying
extra cost by leaving/re-entering the mode.

For instance, with page table hardening [1], using the pause/resume
approach means 4 extra ISBs:
- 1 when pause() leaves lazy MMU mode: restoring default kpkeys context
- 2 in __set_pte(): switching to page table update kpkeys context, and
then back to default
- 1 when resume() enters lazy MMU mode: entering page table update
kpkeys context

An explicit __set_pte_nosync() + emit_pte_barriers() achieves exactly
what we're after (immediately visible PTE update) and doesn't disrupt
lazy MMU mode - we don't unnecessarily set TIF_LAZY_MMU_PENDING. 

An alternative approach that addresses your point about layer violation
is to call arch_flush_lazy_mmu_mode() and leave the __set_pte() call
unchanged. This is slightly slower as we still end up setting/clearing
the TIF flag in that case. Not sure this is worth it - ultimately we
have to be mindful of what lazy MMU mode is doing to ensure this code is
correct. I'm happy with the current approach.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

[1] https://lore.kernel.org/r/20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com

