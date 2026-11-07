Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A36606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnxM9mVA;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I3yQwc+n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SNyW7L7svCZC+4vm04JJa3Y3COX/LWxh617gbF6SI0E=; b=bnxM9mVAOa4BBd
	XBlm6B45fqYl/Ka/kCzpY1TXqgEVlnVMYcYOjavZ56M6NdKcqsWIBLqHKYl+jvsO7ctWgyVz+EHae
	hNIn44afcqk7A6fn/oRhcWVUKqooxBGLvXMqyuTLOnG3hFDCUhJHKWFzDOqsWJdU1pcjXnAjupqnA
	fA1vPgvYnmiePbRTnRhEi+hPx95faC8qTEgUkNYkOo8EH+6d+P1DIdM6HHDlyNKUlZyXLKOBdftaR
	U0H0g/Wy/cCLu4PSWpvXvnZBX/BTqCAD6ImdwxQjm5gTeWa/qVOGAEZUXXVx3S0DxgLJrU/K4djJh
	FZSMEwEHRg08e3qOeClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaRQ-0000000EIXs-12Mq;
	Sat, 07 Nov 2026 07:02:20 +0000
Received: from out-111.mta1.migadu.com ([2001:41d0:203:375::6f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaRN-0000000EIXS-12Ok
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 07:02:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1eU8LB4FiA31cEPkSs3z/GNpYbcTIlce7/3o/u8t5mo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794034934; v=1; x=1794639734;
 b=I3yQwc+nnr9dZ9rJHoIeeQfQUjIaGc2f/SLqKrFxDV2I480KdIkDlwFLnBpoNmKhbVN3fUXJ
 61MUGbXwbuS+9RE94YjhsGLI1nsOE0EUWlJkqkywRE5Q624MjkvGo6fGlaAjtrHSpshsbklTY2m
 LIEKSxp9znNWy0ITPbV6NfYw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 89d1383c0cbcfc28;
	Sat, 07 Nov 2026 07:02:14 +0000
X-Mizu-Trace-ID: 89d1383c0cbcfc28
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-8-jthoughton@google.com>
Date: Sat, 7 Nov 2026 15:01:47 +0800
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
Message-Id: <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_230217_494005_E4916411 
X-CRM114-Status: GOOD (  23.18  )
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



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
> architecture lacks support. This serves only to avoid confusion for
> users.
>=20
> arm64 support for HVO is conditional on certain hardware features =
being
> enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
> all secondary CPUs will have started, and the system feature set will
> have stabilized, including HVO-through-BBM, which
> arch_hugetlb_vmemmap_optimization_supported() checks for.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb_vmemmap.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 8596a462fee6..817ce39d4cf3 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
> 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct =
pages */
> 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
>=20
> +	/*
> +	 * Architectures that need to probe CPU support for HVO have =
done
> +	 * such probing now. =
arch_hugetlb_vmemmap_optimization_supported()
> +	 * will return the correct value.
> +	 */
> +	if (!arch_hugetlb_vmemmap_optimization_supported()) {

I'm wondering if we could put this architectural check into =
hugetlb_vmemmap_optimizable(),


> +		if (vmemmap_optimize_enabled)
> +			pr_info("vmemmap optimization not supported by =
hardware\n");

then, we do not need those code. If the current kernel does not support =
HVO,
then the sysctl does not exist. It's already a common case when the size =
of
struct page is not power of two. If users really want to know whether =
HVO
is enabled, they can check via this sysctl file. Therefore, we don't =
need to
print a log line.

Thanks,
Muchun

> +		/*
> +		 * Return early to avoid setting up the hugetlb vmemmap
> +		 * sysctls; HVO is not usable.
> +		 */
> +		return 0;
> +	}
> +
> 	for_each_hstate(h) {
> 		if (hugetlb_vmemmap_optimizable(h)) {
> 			register_sysctl_init("vm", =
hugetlb_vmemmap_sysctls);
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


