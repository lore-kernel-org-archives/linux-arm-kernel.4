Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC81606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1el66V4D;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pkO3cxgd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uDIyL8csS0OafYWL+DTmNWGdhbsOuiWOQJkObodqJlE=; b=1el66V4DrPZjyq
	b751ATKljTwdHtTL5DW+Z0tEw/k1sGEgO9iMgn1qX21bGkQ4ipBfO/gqCvhT/K/YgDz3CXhwlO+/L
	f4Us1P6lq1EvlVwww6b0MjQaxsEzJJARaw4MBXC++jRxmRd9ersCo3BD5y1CcrPJrULeeXTFs6etp
	S4r23DSKHWD5+sYF7Y/JrUk0tr5IZDuWFmykBHuASKnqip9GeemKDydoAlL3aq3TW5pqXCa4YMyOq
	e60Pn74rPizpQF4gJIJdeQXIvragzZ8boIfKrW1duVw1FplXCHa3lWyj2NL6K9S4ujGOsEiBccD3Q
	u/GTjPVkRQa1WIXEojlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRQ1-00000002yqP-2ura;
	Mon, 23 Nov 2026 10:37:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRPp-00000002yld-2Iz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:36:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F0A143D;
	Mon, 23 Nov 2026 02:36:49 -0800 (PST)
Received: from [10.57.91.245] (unknown [10.57.91.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25D723F632;
	Mon, 23 Nov 2026 02:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430212; bh=zxMgJ0Zod2wpdsyWepEtw4oVnjAoyPgBY3VWNAhnP7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pkO3cxgdC1Ma9566c7PDIZgUyDTw/GTPNKPYUHG2BR63OXTEzzEQs+CraFnUg2myV
	 5AIDh+wbSitzPRL3+3WA0saItk2Mgsq01o/7l++5BdhZ2n1FKd8uE58qHfkf3GUHTD
	 ozS0U8gq/7uNSrzNX6QhEEhYJr4uc0eTMD/zGtko=
Message-ID: <5b0a26ee-30b0-4a79-9cca-9848dc9d65c5@arm.com>
Date: Mon, 23 Nov 2026 10:36:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a
 fixmap entry
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
 <20261120121638.194154-4-fuad.tabba@linux.dev>
 <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
 <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023653_892699_91682F3E 
X-CRM114-Status: GOOD (  18.84  )
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

On 23/11/2026 07:35, Fuad Tabba wrote:
> Hi Ryan,
> 
> On Sat, 21 Nov 2026 11:01:49 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
> [...]
>>> kernel then warns about a spurious translation fault. When kgdb stops a
>>> CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
>>> fault the same way, and fail.
>>>
>>> Emit the barriers directly in __set_fixmap().
>>>
>>> Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")
>>
>> My memory might be betraying me, but I think this change went in before BBML3
>> (BBML2_NOABORT)? In which case, the bug is only exposed by the latter series?
> 
> It did, and the set_swapper_pgd() path is only exposed by the later
> series. The tag is for the kgdb path, which doesn't depend on BBML3.
> When kgdb is entered from a breakpoint in process context,
> in_interrupt() is false, so in lazy MMU mode the barriers for its
> FIX_TEXT_POKE0 mapping are still deferred.

ACK

> 
> [...]
>>> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> [...]
>>> @@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
>>>          ptep = fixmap_pte(addr);
>>>
>>>          if (pgprot_val(flags)) {
>>> -                __set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>>> +                /* The slot must be usable on return, even in lazy MMU mode. */
>>> +                __set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>>> +                emit_pte_barriers();
>>
>> I wonder if it would be clearer to wrap __set_ptes():
>>
>> lazy_mmu_mode_pause()
>> __set_ptes()
>> lazy_mmu_mode_resume()
> 
> That would work. However, there's the stable backport. 6.18 has the
> bug, but lazy_mmu_mode_pause() was added in 7.0, so 6.18.y would need
> its own patch. This patch applies to 6.18 unchanged.
> 
> I'm happy with either, or with a followup patch in the same series.

I'd personally prefer to use pause/resume since it's makes it very clear what's
going on and avoids the layer violation. Perhaps your approach as the back
portable one, then pause/resume as follow up (along with ptep_try_set() tidy
up)? Others might think differently though...

Regardless:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
> Cheers,
> /fuad


