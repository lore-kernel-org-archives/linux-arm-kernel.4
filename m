Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rhy+sSm2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Nf2XfZyl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vqsT4G0D4V6nNi7E6egQ9VCKY9RzrNCtBwi3Kq/WrH4=; b=rhy+sSm26jKo9T
	cA0ppSLdp6OWDHxBd+puLZXUgxpNn0AdfT8+IOuIge3msHQcRmKFthtnl/6kIU3T5bjl/HUD0M8jW
	ctwD98glU4k/znSXLBf0lZ/Bt/1/HjEbtgSzI9ERXJr5HGbbzRbqeR/zYpPX6bA37siOAXzV/TWY9
	QLjZPcll5/7DY1W+ovzDimAjyARcTgCtxYBfSRBAiymL/xy70fb49ae1AzhKsWb7KTA1eedxpw4iz
	sAVK28n/8AgbgcKnyIc7DRw4goBy71D4t7eZFMVDDb/dWvLZrXtNGYwfdeaQ9VM85RZ4TCuxSk/QT
	Jh3Yr92QSdQz6ZZoPyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmF-0000000A2Nu-2GlQ;
	Thu, 12 Nov 2026 13:23:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl7-0000000A10U-3CNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98F451BB0;
	Thu, 12 Nov 2026 05:22:29 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58E163F632;
	Thu, 12 Nov 2026 05:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489752; bh=yfTVytMDkRPJBccmL6FgsVQYvGctfTicJEosytb/oGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nf2XfZyltX7Oy+cuk3Etwd/GTILIK9QiBypjcDzoxZUAutOUxrx/UCrsOcp6dJxti
	 g5ALj4UnwR+m4o2pX8njIldC0z4vNjipm463VRUmpaw1f2TwBNPnYz+LmiaXL/s7v2
	 F7tEBrkDvACFf9DkNyzqxGQWSJN6L/fB2rONC4Qs=
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
Subject: [PATCH v2 27/39] arm64: suspend: Always initialise PSTATE.ALLINT
Date: Thu, 12 Nov 2026 13:20:30 +0000
Message-Id: <20261112132042.129062-28-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052236_699232_74D5E102 
X-CRM114-Status: GOOD (  10.70  )
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

PSTATE.ALLINT is always set to the inverse of SCTLR_ELx.SPINTMASK,
regardless of the value of SCTLR_ELx.NMI. SCTLR_ELx.NMI is initialised
to 0 by default, so PSTATE.ALLINT does not cause any interrupt
masking. With upcoming FEAT_NMI support, SCTLR_ELx.NMI will be set as
part of the enable sequence.

However, during CPU suspend/resume, we reinitialise PSTATE to
INIT_PSTATE_EL1. INIT_PSTATE_EL1 currently does not set
PSR_ALLINT_BIT, but SCTLR_ELx.NMI is restored from the saved
value. Since all exceptions are masked during CPU suspend/resume,
avoid a state where SCTLR_ELx.NMI is restored to 1 but PSTATE.ALLINT
is clear, since that would permit an NMI during resume.

Include PSR_ALLINT_BIT in INIT_PSTATE_EL1 so PSTATE.ALLINT is always
set.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 2c42296b7675..d0cb50bcda68 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -17,7 +17,7 @@
 #define CurrentEL_EL2		(2 << 2)
 
 #define INIT_PSTATE_EL1 \
-	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
+	(PSR_ALLINT_BIT | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
 
 #include <linux/irqchip/arm-gic-v3-prio.h>
 
-- 
2.34.1


