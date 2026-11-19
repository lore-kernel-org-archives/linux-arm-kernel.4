Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA104606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTc5f6Pg;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LZhznp3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1wCwidvWt1cqBrbT7rjfx5MEEUDzKrjbVm0qxvrz8SI=; b=uTc5f6Pg2owSoy
	LYNYgP8/B3G9JSzi1Mn0JEoRi3KLcbtNEH8/Bhf7JyHTST6qbiRsC9+BkTdCo8nBNg02kuCkBQXM/
	F2gp/kTPuGF7i0O9eEsSfK9f6yXRl/r+hGxGgnwxVKXRf2cgMGxB0m3fAComXCAv1FEZ2u8I+eoqf
	cIL+9I6ppV1tOu/dseHcM9BpRhUckNr1ijGXrgpscmBNnQ665uaF9fJ7jsdAIu+rm2iKN/afFQR/u
	3qroTuhmZXEh7mtSCBwnHNiZE9Z2iF+wNZvnLO/MxKP1zfLt33ZX2g9SUdCLi7JOv5TOr/tmetKEl
	LcZnvR6Xz/HGO7bExcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzoj-0000000BcDT-0yr3;
	Thu, 19 Nov 2026 10:56:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzob-0000000Bc9Q-3vun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:56:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A56C619F0;
	Thu, 19 Nov 2026 02:56:25 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13E793F673;
	Thu, 19 Nov 2026 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795085788; bh=syNZT2w4whFXFirm0x7ThuFyXkb0QRz/R/XB+nu4RGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LZhznp3sWko7nWnT1w4AM1ZfrkPxlp9uJ4cQHJYrLAGogHb19f2+CCdqZXCCFkxLi
	 CfU/uDi4fMU8wiRQ47SGjEMNJGJHXhCfJIU5lSd3fw83C2YkD7lbCXRcCBRzmdPkFa
	 5g4PZBAojJ3rdx2VsjDU3mDvScCaV+rpOGQBo3Og=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 10:56:18 +0000
Subject: [PATCH v3 1/2] arm64: mm: Add note about overlays in PIE_EL1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_futex-v3-1-0baeb0aee0d9@arm.com>
References: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
In-Reply-To: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085784; l=1340;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=syNZT2w4whFXFirm0x7ThuFyXkb0QRz/R/XB+nu4RGI=;
 b=P+hEOkqyywAV7BHvXSFevUVvs54ph9TkqpVX92bDaWXy5GzBGz+QHx2dAwHP/2n5eIThYrkMP
 Orh87+nvP8FA0/6YcrdwE3S35twxQ9CR7epuNhdPJ1No+guFxLcB9ai
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_025630_029101_67FB096F 
X-CRM114-Status: GOOD (  10.17  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
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


