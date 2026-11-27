Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A519F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eu8ODU3y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UHM3L31O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7MMwI/XCkhgLv3I5D7Ma6X4mMZvRgbur9YdCd/NKkOc=; b=Eu8ODU3yMr2CKuhCmhA6ZtABru
	o6uaBqrqhgv4w83Fumw9W9k15famOlTvJ6vbgYu/l8bxac+sFuA7YxgHoftKjdO8RrZ5GGW9JyXYm
	dNf2jLiDQfh7liK/gfNlTvcs5pSgH8pMNyCnPgQtgPA90gD8DUgdQH0xThXvn7kMJlHobOkXwn1bF
	ouz+QYJA76HRuFbUd+t0wRtCVio4ppr/Xcrb4Va0MAMHM2L7Ldesk6G5Z4fFb8O7BXPD23Aukgaiy
	T+O4QJArsh4fczRi7mj6eFpm/0Z6Umuj0VeTSWVrI7HkmAHVETAeGjrb8HQAX01UG1VFC9hGCSq9P
	QacrbOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWztK-0000000HIWt-0riF;
	Fri, 27 Nov 2026 17:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWztE-0000000HITO-1ueu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:37:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E06691575;
	Fri, 27 Nov 2026 09:37:34 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F130E3F632;
	Fri, 27 Nov 2026 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795801057; bh=63lXCFqBy4wBOMOzrOjKvAUbnj6KjvHekb4a9IjA5Hc=;
	h=Date:From:To:Cc:Subject:From;
	b=UHM3L31Ol+s7FRr42tI18ChYfnXjIq/fQOEK1utcLPBNTC2jh5mP4XksVgHnQP56S
	 gUsdqfO+gyLSheT8ft7F4HPXxmuWtiivbVjGe7aCQdGy1NVvfD2oepVDHflpTl5A8f
	 pAL3H2p5IkIB9H/gj8m6P3yH7j6xS0g0qVCebXe0=
Date: Fri, 27 Nov 2026 17:37:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc5
Message-ID: <awm_2b5a-TzetyOj@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_093740_544725_2C7F738F 
X-CRM114-Status: UNSURE (   8.74  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Please pull the arm64 fixes below. Mostly missing barriers and
break-before-make in kernel page table updates (fixmap, early ID map,
KPTI) plus a livepatch fix for late PLT writes to read-only module text.

Thanks.

The following changes since commit a041bdbe1f3a8efa8a527a89c84d3771232b4942:

  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h (2026-11-19 00:10:15 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 18817028301de963a3a25f6d7d652d1d3b79f570:

  arm64: fixmap: fix missing break-before-make in __set_fixmap() (2026-11-26 11:08:46 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix missing barriers and break-before-make in kernel page table
   updates: ISBs after mapping the FDT in the initial ID map and after
   remapping the KPTI page-table slot; non-deferred barriers for fixmap
   entries in lazy MMU mode; break-before-make when overwriting a
   valid fixmap entry

 - Route late (livepatch) PLT and ADRP veneer writes through the
   text-poke API as the module's .plt section is read-only by then

----------------------------------------------------------------
Fuad Tabba (3):
      arm64: pi: Add an ISB after mapping the FDT in the initial ID map
      arm64: mm: Add an ISB after remapping the KPTI page-table slot
      arm64: mm: Don't defer the barriers when installing a fixmap entry

Rui Qi (1):
      arm64: module: Use text-poke for late PLT/veneer emission

Yadong Qi (1):
      arm64: fixmap: fix missing break-before-make in __set_fixmap()

 arch/arm64/include/asm/module.h   |  3 ++
 arch/arm64/kernel/module-plts.c   | 23 +++++++++++----
 arch/arm64/kernel/module.c        | 59 ++++++++++++++++++++++++++++-----------
 arch/arm64/kernel/pi/map_kernel.c |  1 +
 arch/arm64/mm/fixmap.c            | 17 ++++++++---
 arch/arm64/mm/proc.S              |  1 +
 6 files changed, 77 insertions(+), 27 deletions(-)

-- 
Catalin

