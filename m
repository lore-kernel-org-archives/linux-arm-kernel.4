Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D61A606A684
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Obl4qA6R;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tn6B2B4o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=; b=Obl4qA6ReakfC1DbJF7f1TgpN/
	AOI+wokHy0/I0oQyiGZuzMLTqNHuc1w1XhaZ1vCGJ0h6Qp5oWp7JcVZOOXYNmd+1i1FozkEw8fqNd
	EBiqR6Dfpy99CPbBzrnm+9eax78LKESXmdYNWx5qLmTEltzM963yE1eQrHHoX5KdMpDmXKQk11VRl
	hEv3je0nlQI1mwmdQTUy867cmR1xJU6QntlVthU1bOYlUTVhWPVkPkmAOJOcu1pEjDcwckFHCCetf
	36Fc/ZayjXRf/jljrpAdKEioocn7Hq0PDjNyr5JRS4rjZQ8ugnBJI0sb4I1GAmRThvg3GRxjDm1dU
	vNyNTKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF79-00000000eOK-2Sa2;
	Sat, 28 Nov 2026 09:53:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF73-00000000eLr-22hi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:53:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b5489c6b26so340505a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795859576; x=1796464376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=tn6B2B4ooF+3ONIToMfGhWgb7u94xwu3lWBZBH1r0quyHU6vbFDcNmBIpaYmug9fgK
         0HibuyZpjEh5Cp4y6/5S0B+8j09SXCbARkJ1e2zMkDQun4enYsrFhG8I+wKdTI1XGP8l
         yBBLOr6Iax4NftKMh48pnE7P26FFwfpQMJ78QvtV5C0eA1Ouj2aGu8k1deEpxodmQJnm
         hwzAR9ei4+zseJMLEkcJ7PbIiw9tN2WwgUKxmjjE5xqXrOz4BA1q+U3LYUiOlfbBfHqe
         CEtizxReO0vA1vPYsuuOylkcnrPwF+NmyfFwnTlMM7F9/1IiVKj6GAebbL6D8tn9W93n
         PCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795859576; x=1796464376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=ub4QD5AhjzFRwoWRvBj3CTqNjHiIX4nLIRfp0oJrJTNir3SbYvvANabrCAGKMYdKhw
         UrvBIBks+MvxmNC88krVD57HQfRT1AMyb2tNoK+RgIRPF4+sGn9tRfuqbNN1WnBic1F7
         DY+w5+r3U2zGL4i1qGwPRs0bD2qavBymNQ9yaHho3uj1u/gigkvLqgJ0K1yCb6JdMysy
         3LMYNzAP93BIS5NJpY5kjsayi3ZOuqR7JhpsScmSgD0bBz8JmWO/duRR7spzjTjar4Bb
         JBENWU2tCNyFViMj/mlHvjExK5aFjHt+/bA7WOSdDZDNDVIhEuBF7zpwNkG7HTwiidg2
         WYjg==
X-Forwarded-Encrypted: i=1; AL+hErE83oKHxoGvYBCmGC8ITFYGCPFseqbDHM4VmKXJi+z2qps2rWVMFm7MSVqJ/CHSXVUFuV35ESlJsNWQ98BzVr80@lists.infradead.org
X-Gm-Message-State: APuU4Z9Trv2FggeOCvQbpAG3sy2yZOIlPTTJ6I9VaTbJw2MUMZ1GTkel
	VTdqHBZl5DtTNcirYNsYY8hXQNzeX5jE5cPr63Uo1qYGKXkOWQVjiDxQRBsQDhyN8e4=
X-Gm-Gg: AZFdTZfQbbgHkgQsUaAVfekaaxcxb+fdhmvMqGcHVjHT1ySJQB0pMueUs9afSHTTfCm
	upg0X/+FEG8tkgQKtmbbBdEtGcXSbkhVFfWVuq6nEuSyFQ2dONU7CAZTaLLAJ/AZv2L5GpTieHo
	IiM4uPdTo5ipGyB1kypy95UKBBY9kqVQyPWA81Y6wXhblMK3ZtZQPs7nbOx7Ob3CyS9eUiLBBIW
	sw7ZgiHk516OjOEMnBl6LZSNRsLN7MmAQ7/esmTH9BlUflnmwGG7fGysLCBeOZ17uojwA1Kizep
	6OeH0JRVOxix0fVuZmUVcW0cGa86jyMJQzxZ5I1B4YE8jX2UBVPFtjPuRZEPstZISlkNoTS/fTv
	zQzooSNOV4vdoPqjl7qrDGWZdV56MU70xzjCVm9vCUJdAeIDUhI+Dz151dBEz+z1SSV/upzHREV
	2SOkHg1Xp2KCEFs6qhT+W+ZU+poljrZKMP0f372fdAvekrgkr8REaI/6xq2b22/w/smXjzNk+mJ
	044atTaw4QfVpBsan+3gDgwYyrbSURcjwk4NwhNoypIJ7Eb9pFK74Sz4mOEfgDayviJ1aSsCTYT
	OymX1dKLEjxRpQE8NNYcOBIZ/MRn8iaeqvJcZAZAJ2zkIJvLg84tpiZxD/L8gdR2LVZKTyxPH0y
	qNJrHdM//3gHZkYTzFylLh3zVvBo/WLqCtJI=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr27534660a91.23.1795859576339;
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm29481748a91.0.2026.11.28.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v3] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Sat, 28 Nov 2026 09:52:54 +0000
Message-ID: <20261128095254.358131-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_015257_832863_0EB3D26E 
X-CRM114-Status: GOOD (  27.73  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kexec_load() fails with -EINVAL on NPCM7xx because the platform does not
provide the CPU hotplug callbacks that machine_kexec_prepare() requires
on SMP systems. Add them.

The NPCM7xx cannot reset or power down a single core, so hand an offlined
core back to the boot ROM instead of leaving it in a WFI loop in kernel
text. The dying core switches to a static stack, takes the identity
mapping, disables caches and branch prediction, flushes L1, leaves
coherency, turns the MMU off and jumps to the reset vector in the ROM.
The ROM then parks it as it does after a real reset, overwriting SCRPAD
and waiting in WFE for npcm7xx_smp_boot_secondary(). The core can
therefore be brought back online, and it no longer executes from RAM that
a kexec'd kernel is free to overwrite.

cpu_kill() waits for the ROM to overwrite the kernel entry point left in
SCRPAD before reporting the core dead.

Map the GCR once in smp_prepare_cpus() since it is now also needed after
init.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
Changes in v3:
- Park offlined secondary cores back in the boot ROM reset vector instead of a
  WFI loop in kernel text so cores can be re-onlined and do not execute from
  RAM across kexec.
- Poll GCR SCRPAD in cpu_kill() until the ROM overwrites the kernel entry
  point, and map GCR once in smp_prepare_cpus().
- Drop Tomer's Reviewed-by due to the implementation rewrite.
- Link to v2: https://lore.kernel.org/r/20231102101009.15104-1-william@wkennington.com

Changes in v2:
- Fix NPCM7xx/NPCN8xx typo in the commit message.

 arch/arm/mach-npcm/headsmp.S |  38 ++++++++++++
 arch/arm/mach-npcm/platsmp.c | 109 ++++++++++++++++++++++++++++-------
 2 files changed, 127 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
index 84d2b6daaf0b..1718b70b7e1d 100644
--- a/arch/arm/mach-npcm/headsmp.S
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -5,6 +5,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <asm/assembler.h>
+#include <asm/cp15.h>
 
 .arch armv7-a
 
@@ -17,3 +18,40 @@ ENTRY(npcm7xx_secondary_startup)
 
 	b	secondary_startup
 ENDPROC(npcm7xx_secondary_startup)
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * void npcm7xx_cpu_park(unsigned long phys_reset, unsigned long rom_addr)
+ *
+ * Exit cache coherency and jump back to the boot ROM reset vector via
+ * cpu_reset() in the identity mapping.  Must be called after
+ * setup_mm_for_reboot() with IRQs and FIQs disabled, and must not access
+ * memory or the stack once SCTLR.C is cleared.
+ */
+ENTRY(npcm7xx_cpu_park)
+	mov	r7, r0
+	mov	r8, r1
+
+	mrc	p15, 0, r0, c1, c0, 0
+	bic	r0, r0, #(CR_I | CR_Z)
+	bic	r0, r0, #(CR_C | CR_A)
+	mcr	p15, 0, r0, c1, c0, 0
+	isb
+
+	bl	v7_flush_dcache_louis
+
+	mrc	p15, 0, r0, c1, c0, 1
+	bic	r0, r0, #(1 << 6)		@ clear ACTLR.SMP
+	mcr	p15, 0, r0, c1, c0, 1
+
+	mov	r0, #0
+	mcr	p15, 0, r0, c7, c5, 0		@ ICIALLU
+	mcr	p15, 0, r0, c7, c5, 6		@ BPIALL
+	dsb
+	isb
+
+	mov	r0, r8
+	mov	r1, #0
+	bx	r7
+ENDPROC(npcm7xx_cpu_park)
+#endif
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 4c1fc9983746..6055d44075ac 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -7,37 +7,35 @@
 #include <linux/delay.h>
 #include <linux/smp.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <asm/cacheflush.h>
+#include <asm/idmap.h>
+#include <asm/irqflags.h>
+#include <asm/proc-fns.h>
 #include <asm/smp.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
 
 #define NPCM7XX_SCRPAD_REG 0x13c
 
+/* The boot ROM is mapped at the high vectors and holds the reset vector. */
+#define NPCM7XX_ROM_RESET_VECTOR 0xffff0000
+
 extern void npcm7xx_secondary_startup(void);
+#ifdef CONFIG_HOTPLUG_CPU
+extern void __noreturn npcm7xx_cpu_park(unsigned long phys_reset,
+					unsigned long rom_addr);
+#endif
+
+static void __iomem *gcr_base;
 
 static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 				      struct task_struct *idle)
 {
-	struct device_node *gcr_np;
-	void __iomem *gcr_base;
-	int ret = 0;
-
-	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
-	if (!gcr_np) {
-		pr_err("no gcr device node\n");
-		ret = -ENODEV;
-		goto out;
-	}
-	gcr_base = of_iomap(gcr_np, 0);
-	of_node_put(gcr_np);
-	if (!gcr_base) {
-		pr_err("could not iomap gcr");
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!gcr_base)
+		return -ENODEV;
 
 	/* give boot ROM kernel start address. */
 	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
@@ -45,13 +43,12 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 	/* make sure the previous write is seen by all observers. */
 	dsb_sev();
 
-	iounmap(gcr_base);
-out:
-	return ret;
+	return 0;
 }
 
 static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 {
+	struct device_node *gcr_np;
 	struct device_node *scu_np;
 	void __iomem *scu_base;
 
@@ -70,11 +67,83 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 	scu_enable(scu_base);
 
 	iounmap(scu_base);
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	if (!gcr_np) {
+		pr_err("no gcr device node\n");
+		return;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
+	if (!gcr_base)
+		pr_err("could not iomap gcr\n");
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * The dying CPU moves to this stack before it takes the identity mapping,
+ * because its vmapped idle stack is not guaranteed to be mapped there. One
+ * stack is enough: CPU hotplug is serialised and npcm7xx_cpu_kill() waits
+ * for the CPU to leave the kernel.
+ */
+static u64 npcm7xx_cpu_die_stack[64];
+
+/*
+ * The SoC cannot reset or power down a single core, so hand the core back
+ * to the boot ROM instead. Entered through the reset vector with the MMU
+ * and caches off, the ROM parks a secondary core the same way it does
+ * after a real reset: it overwrites SCRPAD and waits in WFE for
+ * npcm7xx_smp_boot_secondary(). The core no longer executes from RAM.
+ */
+static void __noreturn npcm7xx_cpu_reset(void)
+{
+	unsigned long phys_reset = virt_to_idmap(cpu_reset);
+
+	setup_mm_for_reboot();
+	npcm7xx_cpu_park(phys_reset, NPCM7XX_ROM_RESET_VECTOR);
+}
+
+static void npcm7xx_cpu_die(unsigned int cpu)
+{
+	u64 *stack = npcm7xx_cpu_die_stack +
+		     ARRAY_SIZE(npcm7xx_cpu_die_stack);
+
+	local_fiq_disable();
+
+	asm volatile("mov\tsp, %0\n\t"
+		     "mov\tfp, #0\n\t"
+		     "bx\t%1"
+		     :
+		     : "r" (stack), "r" (npcm7xx_cpu_reset)
+		     : "memory");
+
+	unreachable();
+}
+
+static int npcm7xx_cpu_kill(unsigned int cpu)
+{
+	u32 val;
+
+	if (!gcr_base)
+		return 0;
+
+	/*
+	 * The boot ROM overwrites the kernel entry point left in SCRPAD once
+	 * the core is parked, so wait for that before declaring it dead.
+	 */
+	return !readl_poll_timeout(gcr_base + NPCM7XX_SCRPAD_REG, val,
+				   val != __pa_symbol(npcm7xx_secondary_startup),
+				   100, 100 * USEC_PER_MSEC);
 }
+#endif
 
 static struct smp_operations npcm7xx_smp_ops __initdata = {
 	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
 	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die = npcm7xx_cpu_die,
+	.cpu_kill = npcm7xx_cpu_kill,
+#endif
 };
 
 CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);

