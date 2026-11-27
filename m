Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11369606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=di7H67kj;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=XNPwwV9f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tVnybqfQP+0SY9toa390RewPeBuG9wb3MHioOA0atLc=; b=di7H67kjcCrPi/
	KFGPcmmPNmG3v7Ii99hBfRH/esP5j9tsu3YQNBqLJwdLr+XXkJ/SCEh3YM+dam2lbUto0b2Z1ZbRh
	jJEi7mc2k5bCIZypxQ+gvPszCXI101ouo4Qd/rc3cfwznOxkjHCAxqD7THQ1wKPTX8mcJxljXOWGa
	nkY87EAzP3VnKiZwktv0pQvoo13BleREIb5JC57FFK8rL3JBkaXK4LH+mABstX7fKr8tonda27GLd
	Vo4N9s8DHWydPRpHuebNLq/mknp3B8iSp8ygy1+UQ3Uf5YLQTI6jgL/WcXTSQNaYMyct+TbcTByg7
	L4pHvHZTdFuv+7h/Qwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoeI-0000000EyCo-2J05;
	Fri, 27 Nov 2026 05:37:30 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoe8-0000000Ey8w-1zw1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 05:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795757840; x=1827293840;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=t70F907DzW+0QdbW9r0saLortrOhZdjwwGxQU9dlVtE=;
  b=XNPwwV9fxNEKaIKg40Fc5jmtOGhp9OoTCNgbzcUxE1SyvYyw0X/QzoqJ
   L1G+by1puT64+zMc2Gr1fFzDc5kEo0IosjcdMvFXaeBCSwNBFp50anKu2
   KxLolB97T8Q1JeYjc8fMcl1dZ/i1N0ydZa60Lez5vt5O7Eci8juZZ1X2P
   nc3W/up5n1M9KBYoum1qLcyN8eMKQruLFv2aWJe0XrhjRs+L5WGSso5YN
   FmHFflyLrEG34Uhj5OKiw5TlYWok83jwfu/3zZucSgry59iCHYzyFsigP
   /+AeQQpQcey2vEklSduh22iUH7QxeRgI83CuAMZ146CBubybon6eITkHY
   g==;
X-CSE-ConnectionGUID: rqc0SoabQbmC13kxtgnmuw==
X-CSE-MsgGUID: t013JRpNRJmB/yZXsYddZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="242193239"
X-IronPort-AV: E=Sophos;i="6.27,236,1786978800"; 
   d="scan'208";a="242193239"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 14:37:18 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 49E77C06DA8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:18 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EDF6C8D65D7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:17 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 7952E4045EE;
	Fri, 27 Nov 2026 05:37:10 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 27 Nov 2026 14:36:30 +0900
Subject: [PATCH v4 1/5] arm64: cputype: Add FUJITSU MONAKA definition
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-monaka-fix-for-upstream-v4-1-3395c415bbe4@fujitsu.com>
References: <20261127-monaka-fix-for-upstream-v4-0-3395c415bbe4@fujitsu.com>
In-Reply-To: <20261127-monaka-fix-for-upstream-v4-0-3395c415bbe4@fujitsu.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795757822; l=1299;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=t70F907DzW+0QdbW9r0saLortrOhZdjwwGxQU9dlVtE=;
 b=uo0E+IarAjICrItkUNTDd7YTIlhjU6ClHbTKnjkdDTYC46jtdai+Js7t6184fHECST/PbUykE
 3NjjP4RzVEJBpj6YuT6vkUmsuxQSty4FTJX+cRWdyn9/LvpiSBkC6aW
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_213720_813567_E506D25D 
X-CRM114-Status: UNSURE (   9.83  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add cpu part definition for FUJITSU-MONAKA.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6002d1d5f55f..fff0f460f43f 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -139,6 +139,7 @@
 #define NVIDIA_CPU_PART_RIGEL		0x011
 
 #define FUJITSU_CPU_PART_A64FX		0x001
+#define FUJITSU_CPU_PART_MONAKA		0x003
 
 #define HISI_CPU_PART_TSV110		0xD01
 #define HISI_CPU_PART_HIP09			0xD02
@@ -237,6 +238,7 @@
 #define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_NVIDIA_RIGEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_RIGEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
+#define MIDR_FUJITSU_MONAKA MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_MONAKA)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
 #define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)

-- 
2.43.0


