Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7I1rPNk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OpuGfhe6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=037BP7LSN4gD0zQjrB6FwBIbxukPEEKzDg+C42Jifdw=; b=X7I1rPNkfz6t9e
	W7BZ2CCZWzowaI/Lo3zBUqvnSWbdD76QjTZK5wxO/f6ojGN8BuWMs+2eDsjX8M/uveJm0NEeOcBu1
	kZ1XmkHjF7okY38wA/gosrF88GyNU0j5hiofJa0Rc1gGOupEXF2vWrqDMyzCHcCRXNyQ9QmLQaX52
	J2SkJV4dq+Be0Nih/dk1ndFFZw9byrp7LlP5mJoCFy97Xk3Og47dWFmNrdZ4H/vKZIJKJNy+dnfWq
	IgDQYOZk3oXzyHs7cVLIlUbUdEL2hBb1UjlR+7EXoGKklZ5Uvf8xJNJbRTvkXP5c95ATME78KRZrS
	UzHFq6z2dJmVOf4dat6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHq-00000004irO-3o03;
	Tue, 17 Nov 2026 07:07:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHg-00000004idq-3Pey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:07:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF431688;
	Mon, 16 Nov 2026 23:07:13 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72E9E3F763;
	Mon, 16 Nov 2026 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899236; bh=ubPPA2iriBEKz9Li34H1P6Gjby7HXyDV/7vIdwZFjPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpuGfhe6W9DIBiXUJhTBR04nun2AmUPAaokxv/1jyVMXPblNPmYtiBM179AACGujk
	 ol3M2Fi/dsuNQqbHzFc4TU6C26fgzcv6r2SySrTx9kjrj02VP3QKNRpKe4++jPsBA7
	 7tjkGgaefzBrzBWuJmNQ+srM3RKLPzoJCegI45ag=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 14/14] arm64/configs: Add d128.config
Date: Tue, 17 Nov 2026 12:36:13 +0530
Message-ID: <20261117070613.1183243-15-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230717_374789_197AD7EC 
X-CRM114-Status: GOOD (  11.75  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide a slimline configuration intended to be booted with ARM64_D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/configs/d128.config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 arch/arm64/configs/d128.config

diff --git a/arch/arm64/configs/d128.config b/arch/arm64/configs/d128.config
new file mode 100644
index 0000000000000..e0a2d7bd8f204
--- /dev/null
+++ b/arch/arm64/configs/d128.config
@@ -0,0 +1,6 @@
+# ARM64_D128-specific configuration
+
+# CONFIG_UNMAP_KERNEL_AT_EL0 is not set
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_EXPERT=y
+CONFIG_ARM64_D128=y
-- 
2.43.0


