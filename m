Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7AA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NKflSvdN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HJFjtV1d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wde9udkd5zQ9CLQ7aWUsNIZCwjF2DEOdelZVAWlC9I4=; b=NKflSvdNAPgnwR
	40DRmQb7S0znVBQjjODQYde+sLePpAGK3dMJ/nEcZTcIJXQOAEgBYAPfEst6FrB9axMFX9cOsGHlW
	HhnWdTpj1Jw/i5A1jzhWk0AvxwaBj/a5u8tAuhgyuucrKe1LxOby4+bMw6Q3E4uD30f/FF0yvdF+i
	kWBAOZWRwQZrpnm2mfMB7iTfb8a6ay/CXwVSpFjus9uTBc2/A5zuAmEEvJ0TShRTvABNRBJ9az817
	CWq8eGw7SCLJ7OlY2of6bZha+RAS+tmrx5kEZokShO/jyZ0kQUhjFqbvn0XvsSS20W+IO8UVauDIM
	ArKcLjA1cjGzhBIAynWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOLA-0000000BnwX-3nFr;
	Thu, 26 Nov 2026 01:32:00 +0000
Received: from out-135.mta0.migadu.com ([2001:41d0:1004:224b::87] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOL7-0000000BnwC-0xZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:31:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bBmr2JO5Sg+M7romhELnWXSnHAmxM4rIPKq9RYfx+nY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795656714; v=1; x=1796261514;
 b=HJFjtV1dTYydkzGEtv/b2Sr+dk9hFl8SG3iK5Z9j1eeEe15YaPQaPaMm8TG4dxqOHB2HdHPI
 Bnw/nM7PCPB/oObULZvFtxfVoeEqwa+39mgndLuf2WgNsmDTezN/PCUPdJyPQOlNsNRbia0Xkr0
 voSglgB1vqTsssuY7epghzSY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1454f8f9569628e6;
	Thu, 26 Nov 2026 01:31:54 +0000
X-Mizu-Trace-ID: 1454f8f9569628e6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not
 pre-HVOed
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
Date: Thu, 26 Nov 2026 09:31:37 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
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
Message-Id: <82B8672D-CB14-4765-A541-67D574382F86@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com>
 <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
 <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
 <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
 <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_173157_420752_D0B2FA14 
X-CRM114-Status: GOOD (  25.06  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Nov 26, 2026, at 00:09, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Nov 25, 2026 at 4:37=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 25, 2026, at 00:58, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>>>=20
>>>>> Boot-time gigantic folios are expected to be pre-HVOed through the
>>>>> section-based vmemmap optimization, so the bulk optimization pass =
for
>>>>> bootmem folios was dropped.
>>>>>=20
>>>>> However, arch_support_vmemmap_remap() may not yet
>>>>> return true when bootmem folios are allocated (e.g. on arm64, =
where
>>>>> support depends on a system-wide CPU capability), while it does =
return
>>>>> true by the time the bootmem folios are gathered. Such =
architectures
>>>>> disable the section-based vmemmap optimization in their vmemmap
>>>>> population path (see section_vmemmap_optimization_disable()), so =
the
>>>>> folios are not pre-HVOed and would never be optimized.
>>>>=20
>>>> Yeah, when I removed support for this part of the code, I figured =
you
>>>> might add a new patch in the future to add support back. It is =
fine.
>>>>=20
>>>>>=20
>>>>> Optimize such folios when gathering bootmem folios. Their tail =
struct
>>>>> pages have all been initialized by memmap_init_compound_page(),
>>>>> as they were not pre-HVOed. Pre-HVOed folios are skipped by
>>>>> vmemmap_should_optimize_folio().
>>>>>=20
>>>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>>>> ---
>>>>> mm/hugetlb.c | 11 +++++++++++
>>>>> 1 file changed, 11 insertions(+)
>>>>>=20
>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>> index 72839e98f998..8756c0206922 100644
>>>>> --- a/mm/hugetlb.c
>>>>> +++ b/mm/hugetlb.c
>>>>> @@ -3325,6 +3325,17 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
>>>>>     unsigned long flags;
>>>>>     struct folio *folio, *tmp_f;
>>>>>=20
>>>>> +     /*
>>>>> +      * Bootmem folios are normally pre-HVOed through the =
section-based
>>>>> +      * vmemmap optimization. However, an architecture that can =
only
>>>>> +      * determine whether it supports HVO after bootmem =
allocation disables
>>>>> +      * the section-based optimization (see
>>>>> +      * section_vmemmap_optimization_disable()), in which case =
the folios
>>>>> +      * were not pre-HVOed and must be optimized now. Pre-HVOed =
folios are
>>>>> +      * skipped.
>>>>> +      */
>>>>=20
>>>> I'd like to condense these comments to something like:
>>>>=20
>>>> /*
>>>> * Some architectures do not support section-based vmemmap =
optimization,
>>>> * so their bootmem folios should be optimized here with folio-based
>>>> * optimization.
>>>> */
>>>=20
>>> Applied in v4, thanks!
>>>=20
>>> Also just so you don't miss it, would appreciate your thoughts on my
>>> reply to Sashiko's comments on this patch[1]. Let me know if you =
would
>>> like me to do something different.
>>=20
>> I think the diff below might be a bit simpler. You might think that =
when
>> HVO is turned off, it could still cause some unnecessary TLB flushes. =
You
>> don't need to worry about that, because I've added a global guard to =
make
>> sure it doesn't happen. Take a look here [1].
>>=20
>> [1] =
https://lore.kernel.org/all/20261124110530.3004071-3-songmuchun@bytedance.=
com/
>>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index b2c14f4f99b7..69a7d4ca8b1b 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3345,6 +3345,7 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>        LIST_HEAD(folio_list);
>>        struct huge_bootmem_page *m, *tm;
>>        struct hstate *h =3D NULL, *prev_h =3D NULL;
>> +       unsigned long vmemmap_unoptimized =3D 0;
>>=20
>>        list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
>>                struct page *page =3D virt_to_page(m);
>> @@ -3368,6 +3369,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>=20
>>                if =
(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
>>                        folio_set_hugetlb_vmemmap_optimized(folio);
>> +               else
>> +                       vmemmap_unoptimized++;
>>                section_set_compound_order_range(pfn, nr_pages, 0);
>>=20
>>                list_add(&folio->lru, &folio_list);
>> @@ -3387,6 +3390,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>                cond_resched();
>>        }
>>=20
>> +       if (vmemmap_unoptimized)
>> +               hugetlb_vmemmap_optimize_folios(h, &folio_list);
>=20
> This hunk needs to also be added to the `h !=3D prev_h` piece inside =
of
> the loop, otherwise we could miss optimizing folios for some hstates.

Oh, you are right.

>=20
> I prefer the early return that I've re-applied. It's a lot more

LGTM.

Thanks,
Muchun

> straightforward for me. Let me know if you really want me to switch it
> with your suggestion.
>=20
> Thanks for all the feedback, Muchun! I really appreciate it.
>=20
>>        prep_and_add_bootmem_folios(h, &folio_list);
>> }



