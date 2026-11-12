Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1F7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YSbucya7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i60kaY7N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=06WxKnQvop6UT94EP85+QxBk7rHfPWQdAUArJZL8TY4=; b=YSbucya7aRQkN+FeVlxPWwW/uZ
	OqPMwgmXeA1HBwmaDAEm7HmcUUJmCYGF2OxUfQ4+BTixbiOgNNnmWozj9CQo7Wcth+Z80O8R0k2tV
	jYP1QXHomLIDr5N/ZtjmrrDNKAazz2xM8BAWRS7Oc06FMCHpjPPs1rQ2SA8ZBoBHgJMn4qP6Pctce
	hk+Mt3Y/rVS6rixFmHyeL8rSXIaG9xKKTFyaOcgWCnHzvhS/LG9029xdpqBi+bvWMQFP461hUpfsD
	By3/NHye/ltflLsgocrQLIrE2CuuSJ/bLPiX9RmR+vqQQ5PyD1aow7NzK7mELFVvyUYZ3Bw1ut+io
	/+XzseeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUle-0000000A1Yv-20X8;
	Thu, 12 Nov 2026 13:23:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkp-0000000A0vT-1lt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B87165C;
	Thu, 12 Nov 2026 05:22:11 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02F8B3F632;
	Thu, 12 Nov 2026 05:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489734; bh=nsJXfxMEzD7+L0Fh74W9qo+rYrw4gGDfbDPGFSRN5lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i60kaY7NkymFgtPdfOWFcmJkzTDgLphOPLfkj12IMO/ec3G9q48wnEtt3aypY6/a9
	 IbpCUitvXM5FkAkW58iIuU3s8Llf/tHGBQDSkLF91OtjOVzVXt5dZ0Wvin3WvOmqVW
	 YCziWh2sXD7EVfODtuRwhGm4O3M0bKISh2r9BIEs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 18/39] arm64: booting: Document boot requirements for FEAT_NMI
Date: Thu, 12 Nov 2026 13:20:21 +0000
Message-Id: <20261112132042.129062-19-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052215_613787_C04B25A5 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Brown <broonie@kernel.org>

In order to use FEAT_NMI we must be able to use ALLINT, require that
it behave as though not trapped when it is present.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/booting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dae5ff9fae26..344a4305669a 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -569,6 +569,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
 
+  For CPUs with support for Non-maskable Interrupts (FEAT_NMI):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.TALLINT (bit 6) must be initialised to 0b0.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.34.1


