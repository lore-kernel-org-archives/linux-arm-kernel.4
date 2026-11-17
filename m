Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8wWwl27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UU8LnXWi7SOAhTu8hL9ezXqRNkuSckzICbco40F7TEs=; b=M8wWwl27nAXYjP4xhwonUS8KMr
	aKWb3cq5dQjHdpFsSPhCd1GAx7EzMzpCc5C6IVQNaebT1SiW64GOyfUrOhxlUOKH4S3E3QXI/W9QW
	XHyrRJs91aKfCu8HIxh6VvQuInUEF9TiB3y7bTBImVLR6SQJ7q4eH7yixAats7nOijVnqbGqHQ1yn
	axCey6QC8gngUCkFaoSE0dfoUwNMCKBrSKiCXY7hzenKCPhSDbP+5Y6nAEP2A+oOoysTTo+bxVxb1
	Ht2VkbbmMGld0ynw/rP8iMod7Atd3L9vn67O4hM7ruhgvc56OLUs9itUoxjp24KaQxpBBwBkFr2hY
	Wbdl9HwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFSm-000000054f9-3mwO;
	Tue, 17 Nov 2026 09:26:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFSi-000000054de-0nYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:26:51 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 17 Nov
 2026 17:26:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 17 Nov 2026 17:26:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v6 0/4] Add Aspeed AST2700 SDRAM EDAC support
Date: Tue, 17 Nov 2026 17:26:37 +0800
Message-ID: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4d/GoC/23NTW7CMBCG4asgrzEaj+O/rnqPikXiGTdeQFCMo
 iKUu9eBqCA1y2/k5/VdFB4zF/Gxu4uRp1zycK7D7nci9u35m2WmugUCWrBoJFMbpedggQHZJSf
 q08vIKf88Ml/HuvtcrsN4e1QntVyfAa/wGZiUBAk6BGTiFoP7bMuFma4c+0McTmKpTPgmsVklV
 hk9+a6zQRtvN6V+yaDsKnWVqDkwYeoohU3ZvEkNq2yWP5EN2qSZ3LY0f1IBuFWaKk3UKkVDqYn
 pn5zn+RfnAueLhQEAAA==
X-Change-ID: 20260625-edac-8e960e02e7f7
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907599; l=5749;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=ST0L4QPW1A8R34qKK1TI0LPc6bCG1Beinf9ovjbd4cE=;
 b=0SRJVt7ZmBC3Kk48RuhvVrTUu8AjRUM3jdXjmq9yLv4Y3n1Ltz0AHac4F6ITY/Iews1TY8kpV
 LZmztnzXsUzC80YDO21bEqBnCHNUl0OaLyZAZi28DZqDZTrFpQ6IlMS
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012648_236697_9587F80D 
X-CRM114-Status: GOOD (  21.70  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ECC error reporting for the Aspeed AST2700 SoC to the existing
aspeed_edac driver.

The AST2700 memory controller keeps the same overall EDAC programming
model as the earlier Aspeed BMC SoCs, but uses a different register
layout, a split interrupt status/clear/mask scheme and DDR4/DDR5 memory.
Rather than fork the driver, the existing code is first generalised,
then the AST2700 is added as one more per-SoC variant.

The bug fixes, cleanups and AST2700 binding from v5 (v5 patches 1-5)
have been applied to the edac-drivers-aspeed branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git, and this
series is based on that branch.

Patches 1 and 2 rework the implementation to accommodate the AST2700:
patch 1 replaces the driver's private regmap with direct register
access, and patch 2 moves the SoC-specific details behind per-SoC chip
data. Patch 3 adds the AST2700 support itself. Patch 4 is Stefan's
step-down patch, amended to leave the entry in place with me as its
reviewer.

Claude, an AI coding assistant, was used in developing patches 1-3.
It drafted parts of the code and of the changelogs, and proposed the
locking changes in this revision. I reviewed every change, and the
AST2600 and AST2700 test results are in patches 2 and 3.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v6:
- Rebase onto the edac-drivers-aspeed branch of bp.git and drop the five
  v5 patches applied there (v5 patches 1-5). v5 patches 6-9 are now
  patches 1-4.
- Patch 1: use a spinlock_t rather than a raw_spinlock_t for the
  register lock, as regmap did; the interrupt handler is not
  IRQF_NO_THREAD. Patches 2 and 3 follow.
- Patch 1: drop the __guarded_by() annotations and the context analysis
  opt-in, and assign the register base in probe without taking the
  lock, so aspeed_probe() no longer mixes scoped_guard() with goto
  unwinding.
- Link to v5: https://lore.kernel.org/r/20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com

Changes in v5:
- v5 patch 2: register the ECC interrupt with request_irq() instead of
  devm_request_irq() followed by an explicit free, and keep the
  interrupt number alongside the driver's other state so
  aspeed_remove() does not have to call platform_get_irq() again.
- Link to v4: https://lore.kernel.org/r/20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com

Changes in v4:
- Put the bug fixes first: the two fixes became v4 patches 1 and 2, the
  cleanups v4 patches 3 and 4, and the bindings patch moved to v4
  patch 5 ahead of the AST2700 work.
- Explain in v4 patch 1 where the grain value comes from, rather than
  the warning it silences.
- Drop the Cc: stable tags from the two fixes. Neither meets the bar in
  Documentation/process/stable-kernel-rules.rst; the Fixes: tags stay.
- Merge Stefan's step-down patch into v4 patch 9 (now patch 4),
  keeping the MAINTAINERS entry alive with a reviewer instead of
  removing it.
- Link to v3: https://lore.kernel.org/r/20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com

Changes in v3:
- Establish the AST2700 interrupt mask in the driver rather than
  deriving it from the register's contents: ast2700_set_irq() now
  writes the mask outright, masking every source and unmasking only
  the ECC ones, and the mask is established before the interrupt is
  requested.
- New patch: add myself as a reviewer for the driver in MAINTAINERS.
- Tested on an AST2600 with CONFIG_PROVE_LOCKING=y; injected correctable
  errors are reported from the interrupt handler with no lockdep reports.
- Link to v2: https://lore.kernel.org/r/20260824-edac-v2-0-c8d8bb693586@aspeedtech.com

Changes in v2:
- New patch (v5 patch 2, now applied): free the ECC interrupt before
  the mem_ctl_info in aspeed_remove(). The interrupt is requested with
  devm_request_irq() and is only released after .remove() has returned,
  so edac_mc_free() could free the handler's context while the handler
  was still running on another CPU.
- Acquire the register lock with the irqsave variant in init_csrows() and
  in aspeed_probe(). The interrupt handler takes the same lock in hardirq
  context.
- Move the dev_dbg() of the interrupt status register out of the
  raw_spinlock critical section in the interrupt handler.
- Opt aspeed_edac.o into context analysis in drivers/edac/Makefile. The
  check is opt-in per object, so without it the __guarded_by() annotation
  added by the same patch was never actually verified.
- Return IRQ_NONE from ast2700_dramc_isr() when no ECC interrupt status
  bit is set; the handler clears only the ECC bits, so unconditionally
  claiming the interrupt could livelock the level-triggered line.
- Tested v2 on both AST2600 and AST2700 by injecting a correctable
  error with the memory controller's ECC error injection; each is
  reported as a CE with the expected failure address.
- Link to v1: https://lore.kernel.org/r/20260812-edac-v1-0-03992edea297@aspeedtech.com

---
Ryan Chen (3):
      EDAC/aspeed: Replace regmap with direct register access
      EDAC/aspeed: Abstract SoC differences behind chip data
      EDAC/aspeed: Add AST2700 support

Stefan M Schaeckeler (1):
      MAINTAINERS: Step down as Aspeed AST2500 EDAC driver maintainer

 CREDITS                                            |   8 +
 .../bindings/edac/aspeed,ast2400-sdram-edac.yaml   |   2 +-
 MAINTAINERS                                        |   2 +-
 drivers/edac/aspeed_edac.c                         | 385 ++++++++++++++-------
 4 files changed, 273 insertions(+), 124 deletions(-)
---
base-commit: 65d0a904696bae7e99a2c6eef61d4df03bac025f
change-id: 20260625-edac-8e960e02e7f7

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


