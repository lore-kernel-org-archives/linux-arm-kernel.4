Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iTYigYe6;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CzcrPZWJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eIdeECoH3KwXtJ/iYslgCA1a0PSh51Qhx+6wORXWgFM=; b=iTYigYe6hlfn/xrLE+tdzdmz+8
	xv2FMfRfz7L4luJnU+p0/cpe7QssEpoHfXHHCEPkkBkjV/50Z51H7WBoxGNtId5fQgjYkQ/p8CX/F
	/TzF4/szZkUvwyEnrG9bqUeqrpTWixdmJk4B35Ak5t+segFAXDmdFZE5Zx68AxhAQDedPDA1Yr/N5
	MNKueG9qJDnwmcdvXm4iEou294CohE4zBeVlDvgAW5CleAhG7hSCCExMIDoSj+L/0f+hrzDlS72cs
	7Ig9r4JOo0+NQG/6F1+iVG8fdn2ztg28nD/Tj56zynHT2BwrZezbG4RG6GylyI0xLOc0BNr0Tb1yl
	6MTnv+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkHM-00000009syr-05v6;
	Wed, 18 Nov 2026 18:21:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkHJ-00000009sy0-1uni
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF3D1477;
	Wed, 18 Nov 2026 10:21:01 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101EF3F673;
	Wed, 18 Nov 2026 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026064; bh=4P4WX07+JEXc1d0hl1AVcsLtuNqvMcFf6kS5fDV/nqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzcrPZWJmR0fBQgCFoEthQSA0GU639/ZdS1pvrgf2S0Ey1bqNGSXzu2VR0IkUSptE
	 YrxaFg+0xJzM5xxC6tQvh84+/Jbm6uGIRspJZnri1YYIo2HWWMffkZ9LAIS2SklQFq
	 WsbjGuwXKSogDW+KMdC9ivK/PeZoNtDyU1WKi9p8=
Date: Wed, 18 Nov 2026 18:21:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] arm64: cpufeature: Check the override in
 __read_sysreg_by_encoding()
Message-ID: <av3sjKa4g6-pRE-K@arm.com>
References: <20261113095701.2042858-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113095701.2042858-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102105_631463_A00E7DDC 
X-CRM114-Status: GOOD (  10.90  )
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

On Fri, Nov 13, 2026 at 09:57:01AM +0000, Fuad Tabba wrote:
> __read_sysreg_by_encoding() backs the capability checks a secondary
> runs before its cpuinfo is stored, and folds an ID register override
> into the value it reads without checking it against that CPU. A
> secondary whose field is below an override the boot CPU accepted
> passes verification and comes online without the feature.
> 
> Apply the override through arm64_ftr_reg_override(), as the cpuinfo
> store does, so that it only applies where it is safe against that CPU's
> value.
> 
> Fixes: b3341ae0efa2 ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/all/abwXl35xQ2ze1XwJ@arm.com/
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Patch looks fine but I don't think it's worth adding Fixes tag (or, if
we do, we shouldn't add cc stable; my commit hook does this
automatically).

I'd leave it for 7.5, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

