Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C28606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aW39qRzH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cg39Y1PP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fC/o+690xFeOhJ+JzH2oTAd50LQEela7FysgUirDDyA=; b=aW39qRzHDVkR46fD1Rz2BPgcwA
	0jLDfm+mbJ02woARbfQJ1ba+USbpVHqSdjGq1trJVINoFMzNr0BixPmM4yQj/oElaw4VoxN85PYGC
	GMiZrtBo3YtKuqpIT/KdLiKuIyVndXrF5Ddute7cls/em8nvgqf/j1RrJ1PpkZJg2iAQs8qOrFI6i
	r9XiKn0XkQUczX5aTXqetTmFRdZsDUMI1ha1ufDuDcAzEEY46HBeNgiK9cIEgAC7nGqSkDLfYRkDj
	RBL5BcjVZn2pC5Xx2vzoZqVPs2qaYP7IZkfJxqVLAJRYgGUd1rNkmpYkcdqfkLnyny22pDowF6NU2
	gteGnbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUD-00000009zDH-1fVg;
	Wed, 18 Nov 2026 18:34:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUA-00000009zBc-3Yzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:34:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC4F41477;
	Wed, 18 Nov 2026 10:34:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B70B03F673;
	Wed, 18 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026861; bh=kBSVpK/I6ZvTB+IUP/Q/dHuUXEBOX2XmmHx+zAaFCGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cg39Y1PPXXlPTRSKeG6vjlS0SjRFTWEWM9L1/er6+cIGa6i9BBQBJCryc7+WHgEBc
	 dYsHVvtXrwHwf6prdOskWy+j5x2jyyj8+gzyW2TKcEWYyIzdwRKrRTRV/o4nNE3V9i
	 fZTVrd3kK0/U4JIi0n8f6ZLENJpyA8cJ2r2h64xg=
Date: Wed, 18 Nov 2026 18:34:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] arm64: cpufeature: Enable BBML3 on Cortex-A320,
 A520 and A720
Message-ID: <av3vqbBHGheAY06A@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-7-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113145022.2592454-7-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103422_943901_30890BDA 
X-CRM114-Status: GOOD (  11.82  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 02:50:20PM +0000, Ryan Roberts wrote:
> Cortex-A320, Cortex-A520 and Cortex-A720 advertise BBML2 and are known
> not to raise conflict aborts for mapping-granularity changes. They can
> therefore use the BBML3 semantics, but their MIDRs are missing from the
> allow list.
> 
> Commit a7ac60414475 ("arm64: cpufeature: Extend bbml2_noabort support
> list") named A520(AE) and A720(AE), but added only the AE MIDRs. The
> non-AE CPUs have distinct MIDRs and need their own entries. Cortex-A320
> can now be identified using its new MIDR definition.
> 
> Add all revisions of these three CPUs to the allow list. The reviewed
> SDENs identify no BBML3 exclusion erratum for them.
> 
> Cortex-A510 remains excluded because it can raise conflict aborts.
> 
> Link: https://support.arm.com/documentation/SDEN-2877630/0000?lang=en&rev=0000-06
> Link: https://support.arm.com/documentation/SDEN-2444153/0000?lang=en&rev=0000-12
> Link: https://support.arm.com/documentation/SDEN-2439421/0000?lang=en&rev=0000-17
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

