Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AW+cK2r9;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cSwkaxbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DhKo/mTgQNmy1TND9VoDhX7AEkKALreB7zrtq8JXWBs=; b=AW+cK2r9Chzvip
	WA3SlbQPtRAC7sqC7/b9GJIsTNo52Bt7ld3rIgkI4ujE1w268Qpgx+4zCstugvwuzGoIckAq/DAzK
	qPvS8yhwNdYSGIlX8P+lT+MqH/Mf8WL5VcRgVJwolFaEJdGEomaqydydhkeiulqYzTHYe35AwCE1M
	eHisg1J3quKzWZgQvm6mbytA3siPJWQP3v6jNYsLv6VM8zLSV3FmprBcZyNZzFtPULyqJ/1C8UQpm
	4Op6LaOo2i7XYYDhOuFnMUCdg+xTaqYGMR5OKw5EL9eBuR4sJi5MPdK+Wms9G0W6AfhIf6P1KTDZN
	l0wHyhBCko3G5ZDCRAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPl3-00000002beq-3vUG;
	Mon, 23 Nov 2026 08:50:44 +0000
Received: from out-252.mta1.migadu.com ([2001:41d0:203:375::fc] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPkt-00000002bdt-0RYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:50:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m1gC05qoAzSqrKBZhxUCZhwdUcmJIoFGJPSk6HfoVlg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423829; v=1; x=1796028629;
 b=cSwkaxbh5DVvP/naXezyZSus9ZCtsU/OAwx2o6XrtHsEU6TYe3fiTgQvY6qIebdliYXqEyyQ
 rZcbD/RauSm8LF8XysO4NM+NVAJi+5oA64H7WFmowcxQNMD+FcAYNrWKpsJ68yvXhgWVdmkbJyK
 ZoJBP6GmFKToI6m1iXBmvkp8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4f7084d3f2b6a81c;
	Mon, 23 Nov 2026 08:50:26 +0000
X-Mizu-Trace-ID: 4f7084d3f2b6a81c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-9-jthoughton@google.com>
Date: Mon, 23 Nov 2026 16:50:09 +0800
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
Message-Id: <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005033_239920_D51CBE13 
X-CRM114-Status: GOOD (  28.32  )
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



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Architectures that select
> CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
> system at boot depending on whether HVO is enabled, e.g. arm64 may
> require all CPUs to support hardware access flag updates only if HVO =
is
> enabled.
>=20
> Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
> declared before <asm/hugetlb.h> is included, so that it can also be =
used
> from inline helpers there.
>=20
> It only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> (and the sysctl, when writable), not whether the architecture supports
> HVO.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/linux/hugetlb.h |  9 +++++++++
> mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
> 2 files changed, 27 insertions(+)
>=20
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 0d5414392d87..b2a6441bcd84 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -22,6 +22,15 @@ struct node;
>=20
> void free_huge_folio(struct folio *folio);
>=20
> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> +bool hugetlb_vmemmap_optimize_enabled(void);
> +#else
> +static inline bool hugetlb_vmemmap_optimize_enabled(void)
> +{
> +	return false;
> +}
> +#endif
> +
> #ifdef CONFIG_HUGETLB_PAGE
>=20
> #include <linux/pagemap.h>
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 142f2975846b..fb6da64bd80d 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -452,6 +452,24 @@ static int __init =
hugetlb_vmemmap_optimize_param(char *buf)
> }
> early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
>=20
> +/**
> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> + *
> + * This only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the =
architecture
> + * supports HVO (see arch_support_vmemmap_remap()).
> + *
> + * The value is final once early parameters have been parsed only if =
the
> + * architecture selects =
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
> + * otherwise it may change at any time through the sysctl.
> + *
> + * Return: true if HVO is enabled.
> + */

I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.

Its name suggests that it reports whether HVO is actually enabled and
usable, but it only returns the policy bit set by Kconfig, the command
line, or the sysctl. It may return true even when
arch_support_vmemmap_remap() is false. This is particularly confusing
because arm64 calls it while determining the capability on which
arch_support_vmemmap_remap() itself depends. Therefore, the helper
really reports whether HVO was requested, rather than whether it is
enabled.

Could we keep vmemmap_optimize_enabled private and let arm64 retain
the boot-time setting locally instead? For example, arm64 can use a
private hvo_enabled_at_boot variable with a
core_param(hugetlb_free_vmemmap, ...) registration. The system
capability is evaluated after core parameters have been parsed, and
arm64 makes the HVO sysctl read-only, so the value remains stable for
system capability and late CPU verification.

What do you think?

+static bool hvo_enabled_at_boot __ro_after_init =3D
+       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
+core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
+
 static bool has_bbm_through_af(const struct arm64_cpu_capabilities =
*caps, int scope)
 {
        /* The kernel only enables HW AF updates with =
CONFIG_ARM64_HW_AFDBM. */
@@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct =
arm64_cpu_capabilities *caps, int sc
         * BBM-through-AF is only needed for HVO. If HVO is not in use, =
don't
         * penalize systems with mismatched support.
         */
-       if (!hugetlb_vmemmap_optimize_enabled()) {
+       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
+           !hvo_enabled_at_boot) {
                /* Only valid if HVO cannot be enabled later via the =
sysctl. */
                =
BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_R=
O));
                return false;

Thanks,
Muchun

> +bool hugetlb_vmemmap_optimize_enabled(void)
> +{
> +	return READ_ONCE(vmemmap_optimize_enabled);
> +}
> +
> static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
> 					   struct folio *folio, unsigned =
long flags)
> {
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20


