Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF339606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sH6+JTw0;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=o10D8L++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ju+S9oyc85uwedQeaMX1bcIVrmnLI/frBGJF0DcZf6E=; b=sH6+JTw06qut2dfQzEOzjrahay
	z+PIEwCO+5Sv/tc5ht2zXQmrp1sR7YWvPPZ5gvRDGGtVLmR94DNNzg2N9qe9miM2ZgpAG2P0TnOiC
	EfyM2Pktg3tSFWgM1fWlKxak6HfSpQoqP/gTYi23e8DCDb71j6/1Q8KHJlKRiqB0gmGzxDAoCBkjz
	LSUBIyZ2lAEM5TB7AzEarvClHsFNmaqcKBdi2d7Q9qLsDJwtdAiQoJcekcfoYdAg+xMfey1Rsmou7
	J3sTetKMWJXWXWj4BIjkKySGZyNLxp4ZbRYEroWcasIit/MR7aBCt/i5VnqqKVIcNrfeUYxQY+q3H
	FJSmzzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoe9-0000000Ey9R-1okm;
	Fri, 27 Nov 2026 05:37:21 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoe2-0000000Ey6j-2Uua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 05:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795757834; x=1827293834;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=idb+jXkILVxT03f1Wmltme/YCGuPkM4rAloBqQ13i5s=;
  b=o10D8L++VT2BEQpgWTGG6uuOf7dSfj/Q7LzOKgwRs/MK8k4mTv0+4EWZ
   FW9ayC8quI7h3P/jrpWaTJu08LCnWeaml9imkQhyg6Z+GEQXMmp5/QrTI
   g98E9VUJfiXvlJtYnnDkZSg0y1wJN/7s2c/S/oRZpT8onh1mzTcJOKFma
   c77ooJJhVNAUjs/YHKtfaUcYTIvgSw4l6zL0zx44L+4OUBT24yNGuQBNQ
   Kwqh0s1uRafnarvT5hw5dg6pGkLYOKZLN78XulelxauqpyCbvdtVVkQtL
   23y8wCVJEPn6OZaYtb3hJn+AlO4cE04qRpiV/I6qOs5XyVno3z9YMRfF/
   Q==;
X-CSE-ConnectionGUID: hpesLkqZRSK8X035IItkbg==
X-CSE-MsgGUID: 2gJQKYkDTJW5GIiclfzSug==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="241042294"
X-IronPort-AV: E=Sophos;i="6.27,236,1786978800"; 
   d="scan'208";a="241042294"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 14:37:11 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2AE8D1C01692
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:11 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CDFB41400632
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:10 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E2031406873;
	Fri, 27 Nov 2026 05:37:02 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Subject: [PATCH v4 0/5] arm64: Add workarounds for FUJITSU-MONAKA CPU
Date: Fri, 27 Nov 2026 14:36:29 +0900
Message-Id: <20261127-monaka-fix-for-upstream-v4-0-3395c415bbe4@fujitsu.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4WCWsC/4XNSw6CMBCA4auQrq2ZlsrDlfcwLko7lWqgpAWiI
 dzdwkaNIS7/ycw3EwnoLQZyTCbicbTBujaG2CVE1bK9IrU6NuHAMwbAaeNaeZfU2Ac1ztOhC71
 H2dCsgAKYRllyQ+J15zHurPL5Eru2oXf+uT4a2TL9b46MAhUSFVSgKkzFyQw324dhr1xDFnXkH
 xLLtiUeJaNy1Jib0ojiV0rfEmPltpRGCQ65NkJzJVP1Lc3z/AKELkvHVAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795757822; l=3047;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=idb+jXkILVxT03f1Wmltme/YCGuPkM4rAloBqQ13i5s=;
 b=E8iwiA3EcZe5FSPZBag5pkUBQwUCUj0DqfD2h7OqcAjnzD2HeqTUwXIe9Y8NNlaHx/8Ef/ELv
 tqg7cY7bsKiDvn3NKaY++EwlUwqas92kYhYGa1ugGUVtHZl+tRooNmj
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_213715_137683_DB3E0A2C 
X-CRM114-Status: GOOD (  14.42  )
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

Changes in v4:
- Address Sashiko review, see each commits for the details
 - Rework TLBI workaround(patch 2)
 - Fix build error in GIC workaround(patch 4)
- Link to v3: https://lore.kernel.org/r/20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com

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
 arch/arm64/kernel/cpufeature.c              | 17 +++++++++
 arch/arm64/tools/cpucaps                    |  3 ++
 drivers/irqchip/irq-gic-v3.c                | 35 +++++++++++++++++
 drivers/perf/arm_pmu.c                      | 13 +++++++
 12 files changed, 182 insertions(+), 3 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261002-monaka-fix-for-upstream-680801dea92f

Best regards,
-- 
Tomohiro Misono <misono.tomohiro@fujitsu.com>


