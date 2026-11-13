Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E3606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zDexWOIM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZN1+KxA8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c0zXVTsrbk174LmaYrVUL39Szcf/bPuLxQyvLhm2Mqw=; b=zDexWOIMAQoxSKuXFtkHdkCFbW
	PdpMN4Ivh7DbYO2+Au4egalui69f+Vdaq1xCgX37/nhYMtXQJwUX8IKhUf72+pz26X26uChPmmlM4
	JZen4io59s3M1TV2EsD7AeywaGBuVxi0v9Ih7X4MFz7nMy1Ak/WGz+feqMv8wOiRcgi+ZCbyUpEL7
	MIAYumUQjAABa8/f9PiW5H9mV1IZcfWdQsKjFWsxDItjWi0buAnoQFeq+BwnkfQuGlVwvt7wTSW6u
	G/V4jFZshJU3t3SHKT8P7SmoJ55xLKn2j8ByYOOtfI+7c1wzDnXawSu5XgAF71jETsTXuOEi2mpbK
	Q7a+sUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc1-0000000DE74-0Qem;
	Fri, 13 Nov 2026 14:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsby-0000000DE4v-47sF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31CE9339;
	Fri, 13 Nov 2026 06:50:35 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB8C3F673;
	Fri, 13 Nov 2026 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581438; bh=6ecGdQ4eT5YT+gG7gKfOdhj7cI+gAnAbiG7t+YQUvIg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZN1+KxA868nGCeUJJ8j+cH9sszhajb4K3C6R4fAebiU6e7qjWSLAwUJ8NMjBcP/GP
	 qiB9Z6rK2XUMsac/YTcEj6+WGjz/vnjA2w56A6DVpRZ8ueLdWVHimuyqe/W6xxrcO9
	 JKRSK0SmaOnL2BBhFj4lecjsHMel9oqIc54xHKts=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] arm64: BBML3 errata workarounds and cleanup
Date: Fri, 13 Nov 2026 14:50:14 +0000
Message-ID: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065043_186213_66B15CC9 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi All,

This series updates the BBML3 allow list following a review of Arm CPU errata
and implementation support.

The first two patches remove Neoverse-V3/AE and Cortex-X4: their latest SDENs
show that revisions previously treated as unaffected still suffer from
BBM-related livelock errata. These patches are intended for stable backporting.

The remaining patches introduce default-enabled Kconfig options to track 10
BBML3 errata, and enable BBML3 for Cortex-A320, A520 and A720. The result is
much more explicit about what CPUs are supported and what CPUs have errata
preventing them from being opted-in.

Applies on top of v7.4-rc2.

Thanks,
Ryan

Ryan Roberts (6):
  arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
  arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list
  arm64: cputype: Add Cortex-A320 definitions
  arm64: cputype: Add C2-Ultra definitions
  arm64: cpufeature: Track BBML3 exclusions with erratum options
  arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720

 Documentation/arch/arm64/silicon-errata.rst |  26 +++-
 arch/arm64/Kconfig                          | 163 ++++++++++++++++++++
 arch/arm64/include/asm/cputype.h            |   4 +
 arch/arm64/kernel/cpufeature.c              |  43 +++++-
 4 files changed, 230 insertions(+), 6 deletions(-)

--
2.43.0


