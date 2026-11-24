Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E9D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KojiOYDJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oTmmbHXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=52AOWqR9iMrDuAzfPPxARFOq4ANhhTpjk+r/H5n7QCs=; b=KojiOYDJGy51jpGzZwNhBt63Lj
	sjoLTsrKeXXvQ5cRip2D11twgJ1b6kO6VUCh4L7FMcm7L7xA/bo5b3gzGJ0fz2IP00eue4L16ahHo
	N5wbyYK3QeYP/o0TikCUHlubkC99+ENCBJGnM8AX8WR752dcec5JJCTm60EC9BbDXRBnEApHl1aVc
	CY9FzMi+rjev2B64LliGZ45o8VZ1Ebz/HKdoCckpENfm9EpgEocWnJvuhCZ6n8O2UtAAUy5ub1TAQ
	O187Ux7vxxziDxWIPu9nlHLN9+GZ4gk9xRqdbNgwU39P8q1hd5LtnygFYtFlc9WVp2Zs7eWE4Bfsp
	C4F5wPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZW-00000006KFh-3hQL;
	Tue, 24 Nov 2026 11:20:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZ3-00000006KA9-3O0B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:19:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54FB5497;
	Tue, 24 Nov 2026 03:19:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34CB63F882;
	Tue, 24 Nov 2026 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519195; bh=jNf++x9/Q1VkngX1TH6ZhRMeNG1gijaFcYP6roGSwpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTmmbHXgOg9cZ7LmnCfmlcZV5uxlPC2yh2ehMVkDJzY+t4Kj73YNzlu31NnARsXIH
	 GefjXTHtK/vvM3rCPD9AGNGowHiKxt0DtZhCN3HLXWw3+DudGkj/U3cwMpvrlIYeAw
	 0z/N9kprHBqyInhxQ47zWDOjHiyhBdwI3FrXASA4=
Date: Tue, 24 Nov 2026 11:19:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
Message-ID: <awVy1ybf70OgllXN@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com>
 <av3neu-9VTv8RgeY@arm.com>
 <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_031957_928574_E315241F 
X-CRM114-Status: GOOD (  28.00  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 09:08:05AM +0000, Ryan Roberts wrote:
> On 18/11/2026 17:59, Catalin Marinas wrote:
> > On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
> >> Several CPUs implementing the BBML3 no-abort semantics advertise only
> >> BBML2, but cannot safely use those semantics because of hardware errata.
> >> Omitting their MIDRs from the allow list hides the reason for the
> >> exclusion and makes the relevant workarounds difficult to track.
> >>
> >> Add a default-enabled Kconfig option for each of the following errata,
> >> and include the affected CPUs in the BBML3 allow list only when the
> >> corresponding workaround is disabled:
> >>
> >>   3043240  Cortex-X925
> >>   3043263  Cortex-X4
> >>   3053180  Neoverse-V3 and Neoverse-V3AE
> >>   3683289  C1-Ultra and C1-Premium
> >>   3696239  Cortex-X3
> >>   3696242  Neoverse-V2
> >>   3696244  Cortex-A710 and Cortex-X2
> >>   3696250  Neoverse-N2
> >>   3696285  Neoverse-V1
> >>   4196850  C2-Ultra
> > 
> > I'm not sure what the benefit of this is. These CPUs are not listed in
> > the BBML3 capable list anyway, so the patch adds them but gated by a
> > Kconfig option, default y. Is it only an elaborate way to tell people
> > why we couldn't enable BBML3 support for them? Maybe the documentation
> > part is sufficient.
> 
> I'm just trying to make it very clear why certain CPUs are not in the list. With
> the exception of A510, in general, Arm-designed CPUs that advertise BBML2 are
> also BBML3 compliant and should therefore be in this list. But some of the CPUs
> have BBML2 errata which prevent them from being in the list.
> 
> The information is all very scattered internally, and I've personally had to do
> the exercise 3 times now, of figuring out which CPUs are excluded from the list
> because they haven't been added yet vs which are excluded because of an erratum.
> 
> Perhaps it would be simpler just to create a file in Documentation/arch/arm64 to
> track this and add a comment next to the midr list referring to it? I don't mind
> how we do it, but I do think it's valuable to capture the info somehow.

I agree it's worth recording. I'd just put a comment above
supports_bbml3_list[] listing the excluded CPUs with their erratum
numbers and keep the N/A entries in silicon-errata.rst (as you did in
patches 1 and 2). The errata is the same, live-lock, so you might as
well include that in the comment.

The Kconfig options don't add much. These CPUs have never been in the
list, so the only thing =n does is enable BBML3 on hardware with an open
erratum.

-- 
Catalin

