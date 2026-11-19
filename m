Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xL0KVVLw;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C/sbStvA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XIB6M4Pn7MaMbV0LjTjtc8YsdU+Og6VyAOfbG5hYnZs=; b=xL0KVVLwSVTo/5
	1knV/ZwrQt57VuzQaZvVWgdvxwkcPCifNod/ZF0wJchum1fEZI+58NoO+1WIZC1/xpDlb/Dqdz7nJ
	qfHN0PSBb5/vZK/4qfFZXtqxxQe62+ow6IepV8jDXN7pJeh2i6LTvg5UFE01X7sD8+gBztEqmPi8N
	eOt6xLS2V1R5SUuH02koSX43zGrIzvPbYQ2/qwEnYFgRoxdvrT2+9ZLzJQHbBdZo7d+kB5aQcX805
	SCq1W1rEcLR4Pr6BrPYbxmONss/WyFXthFY+dDQeIW1riZNnTuv8JviWodxuDTW/hBQhUQTW5n1su
	YejF/3Zku47Ixh/bNSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrg-0000000BSaR-3YvF;
	Thu, 19 Nov 2026 09:55:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrd-0000000BSY2-2tCz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD87F19F0;
	Thu, 19 Nov 2026 01:55:27 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E003F882;
	Thu, 19 Nov 2026 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795082130; bh=syb2Id5d1NmBSpb67maJTDdXcKDxidynmk4E6xC0f6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/sbStvACwh4293rdqcZbO7A20EUjzcMPsjbu2yAehjXdu26ZKoSFbWmVya/qVnqP
	 /KFPZtZIYPQNAqJDBSEweqQENBb7FZFvJc7AC3Dn0sPenaEoAApZ5dNueUA1gnRLiC
	 m0wXfHZ42I5n6x8cx+VCjAyJL1BIFBfTAsavjgSA=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 09:54:37 +0000
Subject: [PATCH v2 1/2] arm64: mm: Add note about overlays in PIE_EL1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_futex-v2-1-244c7a01f788@arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
In-Reply-To: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082127; l=1292;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=syb2Id5d1NmBSpb67maJTDdXcKDxidynmk4E6xC0f6Q=;
 b=QU0NeRBExCgHLxzTpAHbmIHRYXfarCeSXRfSgUtH54+6hKG2x7PQrwZ2hKaKesjyq5aDJvLKE
 rHf3XYRde3oBzBxD1cj+kk3FXugea5QA7duibMWapyIW/fawi49cT4z
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015533_773618_885AD85E 
X-CRM114-Status: GOOD (  10.37  )
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

It isn't completely obvious why user page types do not have overlays
applied in PIE_EL1. Add a comment to that effect, to avoid
unpleasant surprises in the future.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 590ef4328f12..e6788e2e23bf 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
 
+/*
+ * Regular user page types such as _PAGE_SHARED must not have overlays applied
+ * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
+ * would break futex atomic operations on user memory with a non-default
+ * POIndex; the privileged atomic load/store instructions would be mistakenly
+ * checked against POR_EL1.
+ */
 #define PIE_E1	( \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \

-- 
2.56.0


