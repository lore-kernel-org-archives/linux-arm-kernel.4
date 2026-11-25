Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ALpe6Zys;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xdkIyMXz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2VfJ6bjv4e27WAuru/P4AIutJffL5p589T07LBcmHCU=; b=ALpe6ZysWnug+4
	nGWdbuXJxhETOMqJ12lulJbuy0Svx3ViCJs2kv3IyVRy+j25jtS4NnvuRLP09U/rLnVij3K3ltfR/
	SdSHo+tdi54xawKVIi9YI7vKf1KjRiYzxpPJxRuwDzttlcaKJxVGyEgrXjsaoUXfYFBeCy35rnS7N
	2b2JkXFWEtsZQJXb6bDqD0mtYnDL/wEi/eXbrl6C2q8jXnqLciFkyZ8eKQoRsmSDyGgtgDyz9B5RZ
	s8y0Rk7xpVh3vK5PJuJYPtay04aop0nq3HHxok5uzavmvtNVf7NBNddNo1TfMGLjxPztD7xCWAJid
	9KC1zZ+DzYqpzl5KeGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cO-00000009MYK-374C;
	Wed, 25 Nov 2026 09:48:48 +0000
Received: from out-1.mta1.migadu.com ([2001:41d0:203:375::1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cJ-00000009MXn-0OnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:48:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2VfJ6bjv4e27WAuru/P4AIutJffL5p589T07LBcmHCU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795600120; v=1; x=1796204920;
 b=xdkIyMXzAD+2GKgttya0QgKXIDHXTAqb/1cV4Mu1pch3DIrX5nVIHqOF8EGiGFYzg5Rr62DQ
 5rSH9gAO1pRAekElGxgtSAEov2yJlHGLo3HwVTfTqlblenxGDi+6GqJuBWF/pcmCUWYK2beK0c3
 92sZc9UsgJ3mVtavJ69vV2pc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f807f146e8e08fa1;
	Wed, 25 Nov 2026 09:48:40 +0000
X-Mizu-Trace-ID: f807f146e8e08fa1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
Date: Wed, 25 Nov 2026 17:48:21 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5747F7E9-14A1-4CBA-BA2B-BDB8A3CC26E9@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com>
 <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
 <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
 <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
 <CADrL8HXQShKvEu_6KVq0wZXbPjWMcR73yZ38iuePxPRZMDjXmg@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_014844_228078_79929C2D 
X-CRM114-Status: GOOD (  15.37  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Nov 25, 2026, at 00:29, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Mon, Nov 23, 2026 at 9:29=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>> index bc1353f03b08..ab33df268955 100644
>>>>> --- a/include/linux/pgtable.h
>>>>> +++ b/include/linux/pgtable.h
>>>>> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct =
*mm, unsigned long addr,
>>>>> #endif
>>>>> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, =
pte, 1)
>>>>>=20
>>>>> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>>>=20
>>>> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and =
RISC-V do not need define
>>>> this macro in their ptable.h.
>>>=20
>>> You're basically asking to make this opt-out instead of opt-in, =
right?
>>=20
>> Yes, exactly.
>>=20
>>>=20
>>> I like making the different architectures explicitly opt in to the
>>> generic implementation; it forces any new architecture to decide if
>>> the generic implementation is correct for them. But I don't feel
>>> strongly.
>>=20
>> We already have an opt-in config: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
>> It already forces new architectures to pay attention to it.
>=20
> Right, but that opt-in is different. Requiring architectures to
> manually specify ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE forces them
> to think about whether or not they need their own population routine.
> But yeah, I guess we can just assume that any new architecture
> implementing HVO should have already checked that. Okay.

Don't worry. I'm planning to rewrite the HVO documentation with a =
dedicated
chapter that tells architecture guys which hardware features must be =
supported
and what adaptations are needed when enabling this feature, so there =
won't be
any issues.

Thanks,
Muchun

>=20
>>> I'll switch it to opt-out in v4 unless you or someone else tells me =
otherwise.
>=20
> So I'll stick with this; I'll switch it to opt-out.
>=20
> Thanks, Muchun!


