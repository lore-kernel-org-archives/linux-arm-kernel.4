Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180FA606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ubORBzWV;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=H5KTG+Tj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tVnybqfQP+0SY9toa390RewPeBuG9wb3MHioOA0atLc=; b=ubORBzWVM2S7TR
	iosDC+rHKNYOjg8S9PhqU5BiWvBUO9bh+bsjXh7PAeiAIQ4DoXRP+CSI2XexHl7gvTQ55v/+CTRXJ
	wKMPSKPhUr5YOPh3vw1T7UcS7b0wQ4enHtFB6anNL9K0MUrX8OuzofPvxrPfrH40w+gF+Lb0E6Z+/
	AGmFZcqsvRCALK7T/n4fCG6oWFL8Nd+LThoxqYF+m8ow4dsTRmZ2WyLwYQAav02rKF4TpR+9CRjc4
	A1mFTR0pA8yFt29h7QRBNuPBrtFNSEvzvEUipC727BgP6dmGQZ7bhCjAimg5CjlVK9o7Tf5NAaUGB
	DO7gMlR2ezXbzHlZWx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy4u-0000000BKzC-3HT6;
	Thu, 19 Nov 2026 09:05:12 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy4s-0000000BKy4-2gQM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795079118; x=1826615118;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=t70F907DzW+0QdbW9r0saLortrOhZdjwwGxQU9dlVtE=;
  b=H5KTG+Tj1JuoRs4D98dcxigglEWvIViCOlC4M80OZ05q/9Km7VBopCF4
   4DxBHdqZHeJeeSzDM6i4Vu3F24whgWThlzi8f/6sdGQe3T6bTgvMgex5x
   8YyObonqfO8ZNGGPCL0J1cGrgNI0HCmDvkprEPmsDWxJrRmh2oyPqHPDg
   suw+Myb3N7FbY7zZxZ0A/zOhtyL4gYa57SRA7XS8jQyWQ9XZH5TBlQYtC
   R9j1+0mIKizXCf/bAVc7iDjVqTak2CSURy+kmE3kt5r+4khg4EWh88T/Q
   lkMQTsxo27ZaVnGo9L8P1n1VIZqNZ22UcSKRYmsUpiVIYegr0hgewA7oC
   g==;
X-CSE-ConnectionGUID: kqsGz9weT8iuasd0Tp7TGg==
X-CSE-MsgGUID: 18xzwajTSXiP2NQ5dPPoVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="250354532"
X-IronPort-AV: E=Sophos;i="6.27,220,1786978800"; 
   d="scan'208";a="250354532"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:05:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CA17710000B4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:08 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 73F271C0011E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:08 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CA7DC1001166;
	Thu, 19 Nov 2026 09:05:00 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Thu, 19 Nov 2026 18:04:33 +0900
Subject: [PATCH v3 1/5] arm64: cputype: Add FUJITSU MONAKA definition
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-monaka-fix-for-upstream-v3-1-057df4d2ca3c@fujitsu.com>
References: <20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com>
In-Reply-To: <20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795079092; l=1299;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=t70F907DzW+0QdbW9r0saLortrOhZdjwwGxQU9dlVtE=;
 b=7tbIjW9MamZkZ0/AH09YZ8pHA3eHaC05RCH6WpmeFUm9rq3ptSPPxKF0yX/X8HmuAvKbVsSO6
 uKjvZ/8D5SLClGuVr97t8nS3IoqBbqoQdvOp5E4BXAhm7xq2C+L4WNz
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010510_972364_A5091DBF 
X-CRM114-Status: GOOD (  10.53  )
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


