Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51696606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMNwgu0H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGyYeJ0V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aBFHMhIIgXSbrUwb5q/wyndf+CH2M/iCX62Dg3RgmNw=; b=LMNwgu0HXcdvGq
	plO52H5Q0hTLYbQzChIEk0mSHwDGsa9il/UejqibQYd4PFKo4usxX6zg2OhCoakWmNTozlaGmWAFv
	yRnZy/edSTarAQYLECls7YDX4hH+E7rWvJnAJC8X5bSHII1kWTCO1LTnrJ42UVh/3P6EzYgKtdtWR
	00rOuyMIMKm3cT+Z5lJgyE5vCkGQsA7TYze4H2vukHIQpDBMrZYrXd9BQwO1fwM0bBrAO0l5kz1wx
	GtRtOckDeeRZrHjlhdEi0dDzh3mg0/WexeyuD5Mr3bpMLJ2SOQDz4yWgVRiL452TKT595pUGJh4wV
	/BJQs7NOJtKNb51ojzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZj-00000007DUB-3S0S;
	Tue, 17 Nov 2026 22:22:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZc-00000007DSL-3eZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13F8F61CD5;
	Tue, 17 Nov 2026 22:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEC11F000C5;
	Tue, 17 Nov 2026 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954163;
	bh=aBFHMhIIgXSbrUwb5q/wyndf+CH2M/iCX62Dg3RgmNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KGyYeJ0Vf8De+YOCbdp6qmWzBa5JiXoUaJ2xjZMvRbE6tucogxspja2Gsf6XcO/BB
	 Qy4PKsAFUvJsdH/McX3YRDGcuZ1EWovtlIuX2IbXbVGa77Lyn4ZdIAsS5abCPU7g11
	 Ry1b54Qcooc7UPZjKacjJxhtF0cguTkG8Y0ANY1qI123xwgjB5sxPW51M1oFi7vk0b
	 x977Iv3BdkwqVW3BrF3wT8vNpAL4RArfCvFGIuMcSjzrYYKrW9OrbdfbTwDSQZuCD5
	 EAGOltNOWZ63vqGgE8FX1bZVDcBm8cFt/obgfQHOmLtFFQYIf4sMEPfm6PhIT37xwx
	 BK8o2mCIGFVsg==
From: Arnd Bergmann <arnd@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: add HWCAP3_LS64_ACCDATA
Date: Tue, 17 Nov 2026 23:22:23 +0100
Message-ID: <20261117222224.1465328-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117222224.1465328-1-arnd@kernel.org>
References: <20261117222224.1465328-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

LS64_ACCDATA extends the LS64 feature with the user-space ls64bv0 instruction
and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
on x86 CPUs as described in the kernel's SVA documentation. [1]

Userspace can check availability of HWCAP3_LS64_ACCDATA to see if the shared
hardware workqueue feature is possible on a given driver.

Link: https://www.kernel.org/doc/html/v7.3/arch/x86/sva.html#enqcmd [1]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 7 +++++++
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 1 +
 arch/arm64/kernel/cpuinfo.c             | 1 +
 4 files changed, 10 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index f60ca5612daa..f63035696654 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -478,6 +478,13 @@ HWCAP3_SVE_LUT6
     Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
     ID_AA64ISAR2_EL1.LUT == 0b0010.
 
+HWCAP3_LS64_ACCDATA
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 >= 0b0011. Note that
+    the function of instruction st64bv0 requires support by CPU, system
+    and target (device) memory location and HWCAP3_LS64_ACCDATA implies
+    the support of CPU. User should only use st64bv0 on supported target
+    (device) memory location, otherwise fallback to the non-atomic
+    alternatives.
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 10272ddb4d6f..c85c445275f6 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -155,5 +155,6 @@
 #define HWCAP3_F16F32DOT	(1UL << 9)
 #define HWCAP3_F16F32MM		(1UL << 10)
 #define HWCAP3_SVE_LUT6		(1UL << 11)
+#define HWCAP3_LS64_ACCDATA	(1UL << 12)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 952f70a48190..bbd809c83a6c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3226,6 +3226,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94e6cd211d70..009de5255d2d 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_F16F32DOT]	= "f16f32dot",
 	[KERNEL_HWCAP_F16F32MM]		= "f16f32mm",
 	[KERNEL_HWCAP_SVE_LUT6]		= "svelut6",
+	[KERNEL_HWCAP_LS64_ACCDATA]	= "ls64_accdata",
 };
 
 #ifdef CONFIG_COMPAT
-- 
2.53.0


