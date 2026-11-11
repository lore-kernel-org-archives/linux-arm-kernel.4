Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7E606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hajxMGpt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QxP9Jn87
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tXT3VLYjtA8pogy2vMiWc4L4U/Pmo90wtlWq1YzWIIM=; b=hajxMGptmGBuTn
	zUhKHTMuWh89oMX/zM/X2x3PIJ+U1Cty6eOHEhkhfQHzBaPylcMVe1u3FF8Wkdrf8CJlXxpsUmLU5
	KeAJJhwZt3qNZgatYdL/f5pxGuW2zIkRjSUol4/eDTOsrPO8hJVixq2oScCx3ZcJZ8cQ9u6Jj6VlE
	5sMiB0dMpoCV6Tj7afzjhbO1ixRuZ2wkqebAZtavPH7x2BnCZNq/snwbTEIZz51wgfC4qwxr12U9+
	kZij+vHtuZ4nuQELpT2K758lW/8WdJK71t9U/Xoc5gk54McY1wVizY/N32GrmNVZXYxPccUXTIxUk
	tqEovJ2yCPSiHz/jZIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR25Z-00000005ojc-2sOO;
	Wed, 11 Nov 2026 06:45:45 +0000
Received: from out-4.mta1.migadu.com ([95.215.58.4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR25W-00000005oj0-1o9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:45:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uQt+gZcqLg5yhdeDpbR8lZj610GLoqQ3N3quenEOm/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794379538; v=1; x=1794984338;
 b=QxP9Jn87cBQ5/a8iBRYv8HkYqmeMGqesF5eAT6wU0BWxXurqpZr9MgdXUrTFb1h6OeMCSwrE
 6WmarFkng+2Wp6uO8khuAxhxnJhsGDawp2muA6hiqHx3UYltWd0Y6Xeyd+cFlQll/9kpgqOEayi
 Zv/zN0G6ZQhBr1eyId36BH2s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 83ebb53e35329805;
	Wed, 11 Nov 2026 06:45:30 +0000
X-Mizu-Trace-ID: 83ebb53e35329805
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
Date: Wed, 11 Nov 2026 14:45:12 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-Id: <08C72590-E44F-4DF3-B1DE-E7CAC0A43CAD@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com>
 <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
 <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_224542_610435_BAF10385 
X-CRM114-Status: GOOD (  20.96  )
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



> On Nov 11, 2026, at 05:50, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Fri, Nov 6, 2026 at 11:02=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
>>> architecture lacks support. This serves only to avoid confusion for
>>> users.
>>>=20
>>> arm64 support for HVO is conditional on certain hardware features =
being
>>> enabled for all online CPUs. By the time hugetlb_vmemmap_init() =
runs,
>>> all secondary CPUs will have started, and the system feature set =
will
>>> have stabilized, including HVO-through-BBM, which
>>> arch_hugetlb_vmemmap_optimization_supported() checks for.
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> mm/hugetlb_vmemmap.c | 15 +++++++++++++++
>>> 1 file changed, 15 insertions(+)
>>>=20
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 8596a462fee6..817ce39d4cf3 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
>>>      /* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct =
pages */
>>>      BUILD_BUG_ON(__NR_USED_SUBPAGE > =
HUGETLB_VMEMMAP_RESERVE_PAGES);
>>>=20
>>> +     /*
>>> +      * Architectures that need to probe CPU support for HVO have =
done
>>> +      * such probing now. =
arch_hugetlb_vmemmap_optimization_supported()
>>> +      * will return the correct value.
>>> +      */
>>> +     if (!arch_hugetlb_vmemmap_optimization_supported()) {
>>=20
>> I'm wondering if we could put this architectural check into =
hugetlb_vmemmap_optimizable(),
>>=20
>>=20
>>> +             if (vmemmap_optimize_enabled)
>>> +                     pr_info("vmemmap optimization not supported by =
hardware\n");
>>=20
>> then, we do not need those code. If the current kernel does not =
support HVO,
>> then the sysctl does not exist. It's already a common case when the =
size of
>> struct page is not power of two. If users really want to know whether =
HVO
>> is enabled, they can check via this sysctl file. Therefore, we don't =
need to
>> print a log line.
>=20
> Yeah, I can put arch_hugetlb_vmemmap_optimization_supported() into
> hugetlb_vmemmap_optimizable(), that will make the diffs slightly
> smaller. And yeah I can remove the print. I put it there mostly
> because it can be confusing. A command line that gets you HVO on one
> arm64 host might not give you HVO on another arm64 host, and the print
> would give a user a clue as to why.

We already have the log to indicate that, like:

	pr_info("%d KiB vmemmap can be freed for a %s page\n",
		hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);

We will see **0 KiB** can be freed when hardware does not support HVO.

Thanks.



