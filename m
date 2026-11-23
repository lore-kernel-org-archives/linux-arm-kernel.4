Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cGovQPfK;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KaHQYa3j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4cbec6c+ppo8fwshTZKR1fXrJKjbe5WIyXh3pcA7EKE=; b=cGovQPfKjyjU/7OzSx4F79BXdL
	GahuSDYLjGCtRcqv1bH4pR9fH+R2q1huw5PaNU3QvIQbxYqWQ5W3JE6ODQXljaPrl2ERJm+YN0TtH
	xz4Ycz6+3uOqVrkauhszBEppAAi0q+BOeoYVwI5HYlFq+sIGK4Z7rY+6/9CRLLZHuGWZrGqAB6CDk
	LYnSTs6qMbnp4HC7oXFZUDvhB4zQJLZmQkXQX8m/P3cNHLsijCoBCyaeGtT4C53HMYplgHvcXVmtU
	GYXmjrZiL6fm/qZDKLWSH5ez6azuuL3/LYxKMlFwXQo7SlpIWt05DSOB6t40fIYFHuuXciYVa37NO
	I9NWPKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQe5-00000002oXe-1bbu;
	Mon, 23 Nov 2026 09:47:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQe0-00000002oVQ-2CX3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:47:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso35786715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795427246; x=1796032046; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cbec6c+ppo8fwshTZKR1fXrJKjbe5WIyXh3pcA7EKE=;
        b=KaHQYa3jc9x6dTschQj5G1t1iXBhvCKJABv9fivGzKEXLrxrUhYJ4011Gqop9P4O3l
         RoP/NNZ7U692tRx/NPeOCNkl+B3Lx9yXQrTFbzguoYMbmEY6sb8VJjmSqxGyML+a0qU2
         d6sn8AoT5GxjdCAEHstarJL9j/HGkg1rV9kVltbJrERXhwOs4m8x14o5wb8k+LD4Xsoe
         6VdWWWmlmIbX9xIVMINHOFDVl3h3+YgD5Tnr90ZnR4obEbdPJU+EJkX77CHtMcjyVrxn
         cqeSj6ZmgnogvDXkOxeXfRPIZZC8rXwK+7G9avBeMATl1z+mj0ymluWtP0TNSFtI+0F7
         pbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427246; x=1796032046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4cbec6c+ppo8fwshTZKR1fXrJKjbe5WIyXh3pcA7EKE=;
        b=tK3CnyRjLxA30YzWAKKot4dKDm5qSehq4GCD8vh+wygjcMQC0QqJ6b2PLVvqN02j99
         kKvSrDXGPAUTvjjBEtKgm5FLNNt36aTgF6vhviPwNWlKb6Dmo7hM1FiWF6EwGL+m4D9o
         prHVHEviyaMA7106EdhbkysOvBms6Ipn2e4SEQkaQMrrx1t67Cc3AWzqn1D6WBM+tJq+
         /mnH4sLlaaHlmrFTyS/Y+S2bAQlJXAp8ZA0oQXyNsu4xSIZ9FjzBpWEQlPh6GVeHdZfE
         POu02bftcx6foBnPlwy2RawT4GqBLjm0Cb2tk0YKC/jffdOtuUIdQW4wJGikZdQjQ14y
         VFvA==
X-Gm-Message-State: APuU4Z+rZ0os3Q9x+ZKRN3Ir7MAFyf9TxDZqigirkbz3HpAjpt8FYdv/
	OQ5wOH4VWxy3FQ4m4OIWUoV3+V7rj6SoT3z3B/UvDNOI+6zNxHZmp2gQPkjJHu8xaA==
X-Gm-Gg: AZFdTZe6oknn28Tw+XoYuQcfu3WgZ0VgYlnSzUvTEqRqNbQHojOSj8NPacqx+0Vv03q
	Z0bn4NzIGSDDYKtn+MssTItcoQRwvI41eir1hdkh4qG0jJCeRPm6TUW2kH+fRYEesKBpIZeUOPU
	ZFc7/T8snj4XFtiAFudAmYte07BTRa0pqli+DbkUePjvklHiIe+UfPAf8p2KsTpFcG/TCj099pf
	9QG8Auh+vOXbm6mJH1FaRJhgDiSCHeIP7AZdeod0e6Y+nBht1Ky1NEMupDNnXdFWU5TZ4E3qqiT
	uJdzjvnNVMw5mk2dapOjirSB5eeGyuUwL46nAiXAZ3paf/epPCvumHr1L0Wlq7y8pqCpQUHidBz
	vB+JnrfGygL+VNJhlvxtWf54rRhzRjFnq2RifGrzt5w4o9wwZZArJ/rs9/HM/R/3fM5VaAUph8f
	2RoO82mc55R2bGct7zwh/ac1ADatjjms2XibH8NHNzs/BRZfmBzW6wkEykIVZC1X64wts6PwGqU
	/FCKoqAA9qNgM4LGTFSF+oEPyH+wVYklLjEIPtxMTy0Znm+ibulHcv0NdF8BgjUegurmWvJOMZa
	fW+S1oS6T/Kli/o02K8eTogJ963YawoUiciHSMK1Wq2RwDGC+4/xeC6Jbg0=
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr213726495e9.7.1795427245214;
        Mon, 23 Nov 2026 01:47:25 -0800 (PST)
Received: from google.com (30.0.77.34.bc.googleusercontent.com. [34.77.0.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm483566095e9.11.2026.11.23.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:47:24 -0800 (PST)
Date: Mon, 23 Nov 2026 09:47:21 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the
 linear map
Message-ID: <awQLqYbrrgwUycxP@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
 <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
 <akuieSDlbYdHnkCV@google.com>
 <aku8zidRtXPe_Rle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aku8zidRtXPe_Rle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014730_461021_8CA5C675 
X-CRM114-Status: GOOD (  36.50  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Jul 06, 2026 at 05:33:50PM +0300, Mike Rapoport wrote:
>On Mon, Jul 06, 2026 at 12:41:29PM +0000, Adrian Barnaś wrote:
>> Hi Mike,
>>
>> On Fri, Jun 19, 2026 at 02:40:40PM +0100, Ryan Roberts wrote:
>>
>> > I don't think this is safe in general. Let's say we have a 2M region split into
>> > 512 x 4K PTEs. It's possible that the first 1M is one object and the second 1M
>> > is another object. Different CPUs could set_memory_*() on those 2 objects
>> > concurrently. If one of them then calls this function, we could end up
>> > collapsing the whole 2M while the other is trying to modify the PTEs and they
>> > will race.
>> >
>> > Note that splitting _is_ safe (and protected by this lock) because you'd have 2
>> > objects backed by the same PMD, so they would both have to split before
>> > modifying the PTEs.
>> >
>> > I think you'd need to ensure mutual exclusion at a higher level if doing this;
>> > probably execmem is the place that can ensure that no objects within a 2M region
>> > are racily trying to modify their permissions?
>> >
>> > Thanks,
>> > Ryan
>>
>> I wonder what do you think about enforcing mutual exclusion for permission
>> changes to the ROX_CACHE block as Ryan sugest?
>>
>> Would it be appropriate to add locks (over `&execmem_cache.mutex`) to
>> `execmem_force_rw` and `execmem_restore_rox`?
>>                                                                             I
>> see that x86 has a lock that wraps entire process of updating attributes
>> (including spliting and collapsing pages):
>> ```
>> spin_lock(&cpa_lock);
>> ret = __change_page_attr(cpa, primary);
>> spin_unlock(&cpa_lock);                                            ```
>> As I understand it makes it safe already.
>> However, on ARM64 there is a split lock (which works fine for spliting) but
>> for collapsing at least on my implementation it is not sufficient as
>> Ryan pointed out.
>
>I think the lock should be at set_memory level so that set_memory callers
>shouldn't care about the differences in arch implementations.
>
>I also suspect that the lockless page table walk in update_range_prot()
>isn't safe today.
>
>> Best regards
>> Adrian
>
>-- 
>Sincerely yours,
>Mike.

Hi Mike

I have recently got back to the topic, and I have one thing to clarify.

Currently the collapsing mechanism that is backing execmem cache, 
following execmem_restore_rox() description

```
   * Restores read-only-execute permissions on a range [@ptr, @ptr + @size)
   * after it was temporarily remapped as writable. Relies on architecture
   * implementation of set_memory_rox() to restore mapping using large pages.

```
is driven entirely by the architecture code. It has drawbacks, that could 
be addresed by passing some of the responsibility to memory owner,
execmem rox cache in this case.

Arch code at no point is aware if the piece of memory it makes RW/RO, 
is ment to be collapsed. Every permission change can cause entire block
to be collapsable so we need to try collapse on every run. We can probably
make RCU-like mechanism to batch those events but still there is a lot
of pointless runs just to find out we can't collapse or collapse of memory
block that already have split operation waiting for lock release.

I was wondering if it would be acceptable to create a try_collapse operation
in set_memory api that would tell the arch code "I will probably not touch
this anymore for a while, you can collapse if you want". And call it 
after predifined delay from last execmem_cache_restore_rox call.

 From execmem side it can be based on the same delayed work mechanism that 
execmem_cache_free is using. 

I have a PoC locally but it is mostly vibecoded and I have already 
discovered some bugs in it. But conceptualy it worked. After a batch load
of modules it collapsed all execmem cache blocks in both direct map and 
vmalloc in a single run. 

Before I craft a proper patch set I want to ask if it is in any way
acceptable approach? 

Best regards
Adrian

