Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244060A2605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GDD9no5L;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=n3zya52U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Yp3Hjda6lxuiEBuymF9bC8d04KPbQZvVj87ezsy2FT0=; b=GDD9no5LYl65NM6ln5igco2kLf
	EUDJKQv1EiZnF2Xxpm2DGqZ1ClBUADljv1y+mBv2qvXRJgVx6m9RZGPIfIcJuYUEzKIs/yXqCpJFu
	+K4lUSOjOKUsn9A98NJ56mnJloLnboG+GD+L3MEp4Lx/+ZTHJHP7WgYb3KfH0ZNrGTQJZV0nK3Duj
	nOlyUASXlw8yilaT/7b/lQX+38et3B+hwKrbcfeSobKHYheCKQu5snUIgCx1Djwt2tE4AGb5Aqqjd
	QJ2ecTQLsiH5UVOPDPg5J6PBGchrKL0Na9hZ7Le1gdt5sZzTrSruuftD/SqVZDB9bu9aOhF1vUXZy
	xahuWsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy4o-0000000BKwu-2mGz;
	Thu, 19 Nov 2026 09:05:06 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy4l-0000000BKw9-1fJW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795079111; x=1826615111;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=K6eWaA+Bi5PWcZzJp9RtBNoBV6QsuWOUzHii7RlhKM4=;
  b=n3zya52UObGZOYIxpVQOoEIxvlAkjI4BLl32HrC38zvz/rb2zUMKaPWs
   EraUoEHjFJr0WVYmGbSVjruMYWxa+GjjPSopUdq+wwvfHkNHZX7IYFBqp
   PFyKnnuUElW9vnjFQvV15FcsKZQh6UZGmZ2D02ajdF6znP7tNruts300V
   JMEcIEAMy01O3YaSJ9zNpo3ySNI3lsx6imAvaa8zhLQ7CxvzbEepCO0F0
   XwLuUm5R4iuoPYNDfaZifRQgX4iZK5ScD4Rlsk7zHm+cMVvJHw43B56mH
   W2D614PZjQsQ0SbK61zIvXiim0K94nsI9Uv8yxrWxfGJXhTuKBTUU0Z6T
   w==;
X-CSE-ConnectionGUID: 9f4bOGebSUSSz0DzbU8Tug==
X-CSE-MsgGUID: Z/XUkKunRmOw300SNOAvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="240120156"
X-IronPort-AV: E=Sophos;i="6.27,220,1786978800"; 
   d="scan'208";a="240120156"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:05:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8227410001F0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2E9FFC0182E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:01 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 985B5100116B;
	Thu, 19 Nov 2026 09:04:53 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Subject: [PATCH v3 0/5] arm64: Add workarounds for FUJITSU-MONAKA CPU
Date: Thu, 19 Nov 2026 18:04:32 +0900
Message-Id: <20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKC7/moC/4XNzQ6CMAzA8VchO1vTDcKHJ9/DeBijk2lgZGOLh
 vDuDk56MB7/Tfvrwjw5Q56dsoU5isYbO6bIDxlTvRxvBKZLzQSKkiMKGOwoHxK0eYK2DsLkZ0d
 ygLLGGnlHshGapevJUdrZ5cs1dW/8bN1rfxT5Nv1vRg4IhSSFLaqW8uKsw93MPhyVHdimRvEh8
 fK3JJKkVUUdVbrRRf0trev6BrgtFHcKAQAA
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795079092; l=2835;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=K6eWaA+Bi5PWcZzJp9RtBNoBV6QsuWOUzHii7RlhKM4=;
 b=FM88/bpj1g7cCHmukWrrAYqnnWY1EmhGJyRRqcCarjKBvGgNq0pl1v7gmEFwUjvOCGHbdE3NP
 B18d+3KJmUuCa0TdNWPlkmjAOaV+3NQ4+s4B+2+EWgP+/P/TGB6aFti
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010504_158543_32C8E141 
X-CRM114-Status: GOOD (  14.72  )
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

This series adds workarounds for the FUJITSU-MONAKA CPU.
Unfortunately, another erratum has been found since v2 and
I added patch 5 for this new workaround.
 - Patch 1 ... Add the FUJITSU-MONAKA CPU type definition
 - Patch 2 ... Add a workaround for TLBI operation
 - Patch 3 ... Add a workaround for perf operation
 - Patch 4 ... Add a workaround for GIC operation
 - Patch 5 ... Add a workaround for WFE operation

Although these workarounds do not depend on each other functionally,
I have combined them into one series because patch 2-5
use the CPU type definition added by the first patch,
and all the workarounds update silicon-errata.rst.

If preferred, I will resend them as separate patches.

Best Regards,
Tomohiro Misono

Changes in v3:
 - Add new workaround for WFE as patch 5
 - Address review comments in patch 2-4.
   Especially now patch 2 disables TLBI range operations on MONAKA CPU.
   See each commits for the details
 - Add Acked-by by Mark in patch 1
 - Rebased on 7.4-rc3
 - Link to v2: https://lore.kernel.org/r/20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com

Changes in v2:
 - Address review comments in patch 2-4. See each commits for the details
 - rebased on 7.3-rc7
 - Link to v1: https://lore.kernel.org/r/20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
Kohei Enju (1):
      irqchip/gicv3: Add workaround for FUJITSU-MONAKA Erratum E#030003

Tomohiro Misono (4):
      arm64: cputype: Add FUJITSU MONAKA definition
      arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA Erratum E#030001
      perf: arm_pmu: Add workaround for FUJITSU-MONAKA Erratum E#030002
      arm64: Add workaround to replace WFE with NOP for FUJITSU-MONAKA Erratum E#030004

 Documentation/arch/arm64/silicon-errata.rst |  8 ++++
 arch/arm64/Kconfig                          | 58 +++++++++++++++++++++++++++++
 arch/arm64/include/asm/assembler.h          |  4 ++
 arch/arm64/include/asm/barrier.h            |  3 +-
 arch/arm64/include/asm/cmpxchg.h            |  4 +-
 arch/arm64/include/asm/cpucaps.h            |  6 +++
 arch/arm64/include/asm/cputype.h            |  2 +
 arch/arm64/kernel/cpu_errata.c              | 32 ++++++++++++++++
 arch/arm64/kernel/cpufeature.c              | 11 +++++-
 arch/arm64/kvm/sys_regs.c                   |  8 ++++
 arch/arm64/tools/cpucaps                    |  3 ++
 drivers/irqchip/irq-gic-v3.c                | 35 +++++++++++++++++
 drivers/perf/arm_pmu.c                      | 13 +++++++
 13 files changed, 183 insertions(+), 4 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261002-monaka-fix-for-upstream-680801dea92f

Best regards,
-- 
Tomohiro Misono <misono.tomohiro@fujitsu.com>


