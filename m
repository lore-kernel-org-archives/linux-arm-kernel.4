Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB062606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z6mTsjVF;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+NO5IDK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kE/eguf/QJRyrFge017AwYGh9sg5CwoSTKIxiAunsZ8=; b=z6mTsjVFl07NQB7LbMuSsViCep
	OeypXWXm5c8xwoXiTzUrHtTiOq+DD80M8t3d5iGWcJl8wyZ1Wp88qQsdPN312N6mdBdZ5zfW+7I0u
	9BP1AMQkp/NKUPftGhzi8Ds0sibirUpfVoQdQN819RbdxBu1NG1JAzaHV7A/rwFezhjt+2PzdHhNA
	Unzpfo1q7Y86FVKgKvIyNSWp0dV2e0oT03RXdfnfKUjBS21J0LkDfM9QUH8SSnTwxDuOXFWn0bDAa
	1Nk4VlQ+TcHrztvZOmqYOS9GDD2ohGWtG61S95bXp4UmFvdskJ91tyQPpe+h9Ra9ITHkdNqzlzTey
	/vJQNmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqfD-0000000FB8w-3taM;
	Fri, 27 Nov 2026 07:46:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqel-0000000FAub-0ETG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:46:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so50670345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795765564; x=1796370364; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE/eguf/QJRyrFge017AwYGh9sg5CwoSTKIxiAunsZ8=;
        b=p+NO5IDKJo1TYWg3pXjCGHbTE/73rU4DMmxSHoWUqnWIwKd/7w04rh346O8FPTmI15
         KQthHPDzqLZtuyqG1+yZO6I/Ylxqgp/qKluvPWGDrVvyCUKgaPFf6KXyIHzAnRMS45Ii
         TCVGX2idj0XqJvKvKRDbsy8nse67VtiA60eyaDNtCZOndIBG92j7gIA6aiJyUiHE60/Y
         1ysBMg9Q+CyA0SSXetYmp2SJHSjlk0JdaKylpDnL6Iya9VVbGCwGppi0W3vETSxw4g9F
         TRPiWABwabhgWnXoGQkVVRwB1Nf2nZpHzV0PfStqm8oU38PQT0pe5wa/C6ZMKjO653bv
         x5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765564; x=1796370364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kE/eguf/QJRyrFge017AwYGh9sg5CwoSTKIxiAunsZ8=;
        b=IPK399FiHaGXcOqIKdxxh3qn6a5X0WTy5u+MlnFH2bfZ+pSufoAG4ci7G7+6y+13So
         TxX84bYtuVYNFs0ddhe14agSqdUOGuIy7pSlDBG6ph+aMJ4uPmSPRnPc2ofyg/SaMDVQ
         sQWSwOw8Fexn4elOicp0GakxsRyS0ow4AqlzBgcQRRvHIaYtYyLmSGspM7bVS21Y0TVj
         Db604cRKjB0rSzV6Kqgj6pv8rlNpbnA4vPxKZ+sH0PepA8KxKY4dloUMXG0pdvD7qHC1
         b5UD03/+tUIq63OnphTRRr9vB2wsYLuBryuEmHtrP4YBN5Q/TJrlxMVu0qEsK6NEmX1g
         0b+w==
X-Gm-Message-State: APuU4Z8uwLzXLku+oyf7CosL7FQ6HEKWYcLTV7ezyqaCGdpNwAJ4Lrlk
	E0d6cYNQOOheHjnQe2/Ax5uKvEBygH6/vM3MQpXuOUEfJAzGyE2DseKicZVeif/OCg==
X-Gm-Gg: AZFdTZcgGp20a2NpyjgxWg5kkJ3AsgZvw+29ug6ZckqLqRzkWYzj/TVskiBE12rli6m
	Y1Haqn4wK43EBZ+m4mho6cJT+ysDcSBaFze0UzSCLwbECJsgNjrW122ATshEQKcTHsgwvrYhSlp
	v4o/k/9MdzSmRsDPp2ipiWd0NbpwLm0sV6WHSIygbpI0mmH0JG+FCtfJ6YOBmp9lDByKEOf5Ft8
	PTKDLSH5ZNmjSwGkHQcfCUkfTmBtZMkIrKbvE+OhgiEVU7tas/KN/0x0wAUtXZePReCvWDtx21J
	xm1J7FtN6OVTLfARrkEhamcQA5E+zDSxD5QWLb5USK3N2a8OeuK6sLAIqEThzf3QuqV5ZZ3MhXM
	3mwfoFrRREafoMpV/2jV+K58oa/vhpOgg2HLsZCXlRsR31N46iX4t+NDEkbaOJ5gnEkMqDNfvHd
	koIwD5JjnId4LQN1heAoyF1dY+Xc6dDyoZLIHU48ZUZ0FpVLiIb5TvQXLgTF/Jy6yhNfF5XuSnz
	Albr2QFKro2Zuiujeic0SnZ67snFG9/0KfdYZ88Ryi6l0NBDTwt20M7b+aWjDb+SSV6GnrVE8Gy
	SkVPdsx1Xhy+Zv14ddrTtnlcTtLon+570k7FpUNinNXYBUfVEgUsaIVEmibt
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr504941065e9.34.1795765563326;
        Thu, 26 Nov 2026 23:46:03 -0800 (PST)
Received: from google.com (30.0.77.34.bc.googleusercontent.com. [34.77.0.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm643712045e9.6.2026.11.26.23.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:46:02 -0800 (PST)
Date: Fri, 27 Nov 2026 07:45:59 +0000
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
Message-ID: <awk1N98I7daqXHPC@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
 <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
 <akuieSDlbYdHnkCV@google.com>
 <aku8zidRtXPe_Rle@kernel.org>
 <awQLqYbrrgwUycxP@google.com>
 <awgbKPpwipkwkXPY@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awgbKPpwipkwkXPY@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234607_162937_B2882D68 
X-CRM114-Status: GOOD (  34.93  )
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

On Thu, Nov 26, 2026 at 01:42:32PM +0200, Mike Rapoport wrote:
>Hi Adrian,
>
>On Mon, Nov 23, 2026 at 09:47:21AM +0000, Adrian Barnaś wrote:
>> On Mon, Jul 06, 2026 at 05:33:50PM +0300, Mike Rapoport wrote:
>> > >                                                                             I
>> > > see that x86 has a lock that wraps entire process of updating attributes
>> > > (including spliting and collapsing pages):
>> > > ```
>> > > spin_lock(&cpa_lock);
>> > > ret = __change_page_attr(cpa, primary);
>> > > spin_unlock(&cpa_lock);                                            ```
>> > > As I understand it makes it safe already.
>> > > However, on ARM64 there is a split lock (which works fine for spliting) but
>> > > for collapsing at least on my implementation it is not sufficient as
>> > > Ryan pointed out.
>> >
>> > I think the lock should be at set_memory level so that set_memory callers
>> > shouldn't care about the differences in arch implementations.
>
>For callers to stop caring about the differences in arch implementation we
>need this:
>
>https://lore.kernel.org/linux-mm/20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org/
>
>> I have recently got back to the topic, and I have one thing to clarify.
>>
>> Currently the collapsing mechanism that is backing execmem cache, following
>> execmem_restore_rox() description
>>
>> ```
>>   * Restores read-only-execute permissions on a range [@ptr, @ptr + @size)
>>   * after it was temporarily remapped as writable. Relies on architecture
>>   * implementation of set_memory_rox() to restore mapping using large pages.
>>
>> ```
>> is driven entirely by the architecture code. It has drawbacks, that could be
>> addresed by passing some of the responsibility to memory owner,
>> execmem rox cache in this case.
>>
>> Arch code at no point is aware if the piece of memory it makes RW/RO, is
>> ment to be collapsed. Every permission change can cause entire block
>> to be collapsable so we need to try collapse on every run. We can probably
>> make RCU-like mechanism to batch those events but still there is a lot
>> of pointless runs just to find out we can't collapse or collapse of memory
>> block that already have split operation waiting for lock release.
>>
>> I was wondering if it would be acceptable to create a try_collapse operation
>> in set_memory api that would tell the arch code "I will probably not touch
>> this anymore for a while, you can collapse if you want". And call it after
>> predifined delay from last execmem_cache_restore_rox call.
>
>What do you mean by "last execmem_restore_rox"?
>How execmem would now that an execmem_restore_rox() is the last one?
>

That was a bit of a shorthand on my part. What I actually meant was
scheduling a delayed work and select a reasonable delay that will 
oportunisticaly trigger after batch module load.

>> From execmem side it can be based on the same delayed work mechanism that
>> execmem_cache_free is using.
>>
>> I have a PoC locally but it is mostly vibecoded and I have already
>> discovered some bugs in it. But conceptualy it worked. After a batch load
>> of modules it collapsed all execmem cache blocks in both direct map and
>> vmalloc in a single run.
>>
>> Before I craft a proper patch set I want to ask if it is in any way
>> acceptable approach?
>
>I believe we could drive the collapse from the callers rather than from the
>architecture code.
>
>Other options could be to make the collapses wait until there is no other
>set_memory operations in flight or run a kthread that would collapse
>everything it could.
>
>But before optimizing collapse I think we should close the technical debt
>of having 7 different page table walkers implementing set_memory APIs.
>
>-- 
>Sincerely yours,
>Mike.

Thanks,
Adrian.

