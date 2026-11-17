Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7676606A885
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N7sGLAjT;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BnQfriOm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3j1/LPII0agGL+7GGF+Dy4qs3ftQPKUhDA9Jt0WBq1w=; b=N7sGLAjTI6BhyzAMekqsaFW91B
	XXLL4vwdfcZdTLDFs6oktNqFl3UjPuHTQTAmI9c7BfuoWnKmradp1ikyiXIFTbcRELVOPS8vgXGvA
	i3SbqeNFh/AgoxWs9Q1OoJX6Zs36PeYcc8O8QDLY/gSgnAfBv+hNZcoYpJD73055wgMlYOq19ErE5
	JxEVcmIV0/NESkne5zpJnbjeBb6J92q8ZbIH52RbAkqxnaH4mB2MiNMafvq+QJIFXA5UlcKwHbfRy
	RiLAxvrjGPzWLNmd9brp57oyoBVUqlq2IitpyYnsftAdPYyiQJuQsssNpTwO2J/pNlepDebyQOzoU
	iLZMdAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8XD-00000004LYb-3JBG;
	Tue, 17 Nov 2026 02:02:59 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8X3-00000004LVd-3n0m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:02:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3j1/LPII0agGL+7GGF+Dy4qs3ftQPKUhDA9Jt0WBq1w=;
	b=BnQfriOmjYqZaNtmWwEWDJ7ZOGw6Lhma2L1aTwiU+hOtUzpBpDbq9ivkvsipKWXiMz39V0uDe
	rWQ1ecG8Yr1S4rXiyPquSYC8ENi8R9F724umfppvjQc3LCOuhceS1eEbyqcHpRjvuYUMC609ur4
	KpIyDOIcbNwNMpvQDr6YXgY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jT7K72lS3z1cyQG;
	Tue, 17 Nov 2026 10:02:19 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 68C874055B;
	Tue, 17 Nov 2026 10:02:38 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 10:02:37 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 0/4] arm64: Add PUD THP support for DAX and pfnmap
Date: Tue, 17 Nov 2026 10:02:33 +0800
Message-ID: <20261117020237.4037980-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180250_124189_303C3EDA 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds PUD THP support for arm64, enabling PUD THP for DAX
and pfnmap.

Patch 1 moves the identical pudp_invalidate() implementations from x86
and riscv to a generic location so arm64 can reuse it.

Patch 2 is a minor cleanup that simplifies pmd_special/pmd_mkspecial.

Patch 3 adds the necessary spurious PUD fault fix and PUD page table
helpers and selects HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.

Changes since v1:
 * fix issues reported by sashiko

Jinjiang Tu (4):
  mm: define generic pudp_invalidate() implementation
  arm64: simplify pmd_special and pmd_mkspecial
  mm: add spurious fault fixing support for huge pud
  arm64: Add PUD THP support for DAX and pfnmap

 arch/arm64/Kconfig                           |   1 +
 arch/arm64/include/asm/pgtable.h             | 104 +++++++++++++++----
 arch/powerpc/include/asm/book3s/64/pgtable.h |   1 +
 arch/riscv/include/asm/pgtable.h             |   3 -
 arch/riscv/mm/pgtable.c                      |   9 --
 arch/x86/include/asm/pgtable.h               |   3 -
 arch/x86/mm/pgtable.c                        |  12 ---
 include/linux/huge_mm.h                      |   5 +-
 include/linux/pgtable.h                      |  11 ++
 mm/huge_memory.c                             |  17 +--
 mm/internal.h                                |   2 +-
 mm/memory.c                                  |  14 ++-
 mm/pgtable-generic.c                         |  14 +++
 13 files changed, 131 insertions(+), 65 deletions(-)

-- 
2.54.0


