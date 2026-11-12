Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JzA4Qrx+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZPXRURWX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CGHiuu6Flbnxhop8lRo3VVHItiGJMekjAXp4SiNAZKI=; b=JzA4Qrx+8CA8t6
	YiSCsxUqO0rMCwl5jVGfQpJaJCzL/qIlxBwSrFtxpVZgNUH4ZCI1mcForkuOM6qWOK9RR1iIur+8a
	+GPBDGc+0B4K7G6spmvo3QiUvN0WBh8mFwls/DJowLXpXQkQb91qCjSyHcqOHtofx5iyr4JJ18HZ4
	++C0Qiamq1XDMUUqPD7eWDBAOD9KOMIZyULj0BDXGjWKAmgcJYzkMUKjXtPLmgAjY4uCLOWvv5vvj
	z0a+VaczCfDwJ8wX2q6k/PIh5ubUfHqhI6KkVi09H76044eY4f0fhwbW2rRFOL6fVF4l22UKbXH6F
	6n93T05aunWEGt8zpuGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlP-0000000A1M8-22a9;
	Thu, 12 Nov 2026 13:22:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkf-0000000A0km-2YYy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CCE8165C;
	Thu, 12 Nov 2026 05:22:02 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88C0E3F632;
	Thu, 12 Nov 2026 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489725; bh=jjo40Xutli9BKCMbHDiYfU7GmbdtIvXVEMiChcNixdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPXRURWXDJXw4wgTSygHGV3QiRw0QtUdMFaOR3gTGW56wOcZGlzilNe1CHXlYly2I
	 u0kMjJ93XqmbbhHHHaoftWZJp89sED9K2zQw+8gX8FROAaqvO0KcS7fYZvNOj5g4CS
	 vq4W9/hEyOQzrnyaqPsFKqASRL2LrzmVFt6vFAjo=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 13/39] arm64: cpufeature: Remove system_has_prio_mask_debugging()
Date: Thu, 12 Nov 2026 13:20:16 +0000
Message-Id: <20261112132042.129062-14-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052206_923801_F126213B 
X-CRM114-Status: UNSURE (   6.39  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Users of system_has_prio_mask_debugging() have gone, so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e3c8a1493dc8..1c624b50b7a6 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -845,12 +845,6 @@ static inline bool system_supports_mte(void)
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
-{
-	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
-	       system_uses_irq_prio_masking();
-}
-
 static inline bool system_supports_bti(void)
 {
 	return cpus_have_final_cap(ARM64_BTI);
-- 
2.34.1


