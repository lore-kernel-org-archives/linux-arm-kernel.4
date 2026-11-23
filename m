Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HFbM4DnW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TiCkMJX3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=; b=HFbM4DnW2DAd+G
	h2QUKLk7qozTjhKPSEcn+TAG08EGdHSmjrgiCAh3uF4OP/b5hHQ80FzYxb+kaB9j55MCIWO3pVgaF
	4n+c1Uu9PUqeTYG4hE8eUazV6AwOkWLPSg1UPwEokFeFbOE0UjEcIDKbXn0xxE2d62m2XAqf0/Weg
	1BB1xOPufzINOTRtOBmxGx8c1/E/sXIz1QPSnaPcdmiF+OJPJ5WGzqlJrl8aHJpiDAKMAADIY6c72
	WcuUuE/uRP2MUvbElMpsv0hsP1REbTyYIDaMI9SiZ06eIKLd5uhh8dByYmQBx1aahQtphOmNo/Iqm
	YO3NitEezvqlYUivuyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUwL-00000003iJF-2Sol;
	Mon, 23 Nov 2026 14:22:41 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUwI-00000003iHt-2QkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:22:39 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15dd124bbe7so2098895c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443757; x=1796048557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=;
        b=TiCkMJX3ywiuIq+2jknFdfzJ+uNpkWptmxpSouGBNuVQF0Ql9X2nS6CrbG6hIEHTdk
         b06dlV5/g6RvApj7etRyZ414224Qf9JHpTDbGVtiihl1nbGo3JRDAk+ILaqQ6jX0kPEZ
         AomK2aTlZscXnyjKhyOQ5fqRcDyWzawB04cSFWLpfPSMp6Kgiwm16rTPszu6vlYse/A/
         0pQOmNy9pnVqDC7XaNPnClCtCdjCAUhXM795hHOIQw8Kb5mSHH7LPljO6BdJirzPFhHI
         ulV9rdcJgOMTlhKNJDAKrFrBcNt+kgwKqkDZ+hSAqawyDHorHKEn6BNaGg2wRGXGlSyW
         cDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443757; x=1796048557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD8O5puOfG0iheU7XPAAEXfV6psMblSZ2+dPBGXa1+c=;
        b=HX1whXAuZSNCgY0fE0BOinqWFuGJMkcPmiIteywEdx3MP1QfOTOKtPLozP6CmS2wbJ
         +yM06KdOAA2UWbkjq0WWobjE0HODzXOiWr9tJk6H5Y2e7y3RQ5N9HoKkZ6vRBTs4sMJt
         3YSy9y1rY6EtqBWxXWrwigHABD3EYAAJ6u2t7BXrMgkgsnFBY728y48mVQC5Sr3V8Hiz
         U53wfwTaZB1rTG7u6yOvWWY5rfnrK3aSGklAuYbmE+cKJC6Gt+QWjEtYneo5OcOK3NX5
         aVL9FegmiUPivgwAXafKndcqFQVTPvxCF0mVAndTAWHFRtNLEGIYWKLBqXM9YrCaPF+F
         edSA==
X-Forwarded-Encrypted: i=1; AL+hErE7yTqMckdQef1AIUIOAGRvePF/2xvkYq8d5yU0SLch+N1B3gulRI0HoglCdecIvU2/uEYPAAS56KAec2dYEIKS@lists.infradead.org
X-Gm-Message-State: APuU4Z+3g130BgY49g0LhTr8ytfsan9XN+/sg7wis7NC2yzsWjX6wQt1
	6ebY6iEEbYS4A0AZhHUzVNOwA65TN7rzWF8S6K9uxTS3JIQTg7sqSKdk
X-Gm-Gg: AZFdTZeuN2sd9WWlnN5vFEGns6qsJzD9eQtPyFIW/pDTUxD4LimBW8OzFziQ2i2SJeA
	ZfoYwXWzoGbfgRwJHTTB1goJnB5RWD5WwbFe9QNOB8WP9o/j9DoVBeYwFz1NOx/Sa7nIDr9evs3
	6DjM+s6HzAJ5jMFtK8tdsJUPldxDxeSZx1oAypc0eESCzzj2dt5SrzVVbpP/eC4l6seRBAjqBWy
	NfCKUVbmUNj+Ew08oI16fkaWP3TLwlXWQ2SS16urqzEVBP25qJ2FCBPHSpwavSbIzX34J8JkCr2
	ZVmpmdN9BGGPOW2f5OUviKryQDDgFPE1YiobCeqgKInSmiYH7Ez/w8/ZEbR3eRt9Wiw9yx+E22T
	q4SqBKqoBwC3+D0GqkQEDsTqG+11i3fEW/tOvPyWJ16B3PFjYFNZl98KTPljRCOjnOFENorLkPG
	96ZS1Dom/aqPqUQ64e9R+3ImwWxQnYeOGiw2RUBU9pHIxMCH572O83jweUrhNyXQ1+LbLPj1Grb
	Ar+SsvpyAl/bH6ImOWNzx6jnPTY2bpPDtNr9yZJsoTcpzLzifQD/wCA7cJXTCKGYzLgGSXaZQyL
	5qE5QlPKCbJlOg3yXg7kVpJWqrWvPJsa/ieUkSrm8Ty29fbP6avi1CylMNMA1d4exfXyELiJkM8
	G/1kfB6hyxAoDU9iujR4hRw==
X-Received: by 2002:a05:7022:ea45:b0:1b5:31db:cc3e with SMTP id a92af1059eb24-1b5568b2b4bmr10864171c88.11.1795443757139;
        Mon, 23 Nov 2026 06:22:37 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38385854eec.28.2026.11.23.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:22:36 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Linus Walleij <linusw@kernel.org>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: bcm: support more than two CPUs on BCMBCA
Date: Mon, 23 Nov 2026 22:22:00 +0800
Message-ID: <20261123142203.3860616-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123142203.3860616-1-hjf3108@gmail.com>
References: <20261123142203.3860616-1-hjf3108@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_062238_619431_C9AFF825 
X-CRM114-Status: GOOD (  24.61  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BCMBCA Cortex-A7 SoCs can have more than two cores, such as the
quad-core BCM6755. Extend the CFE SMP support to all secondary CPUs.

CFE parks every secondary CPU on the same mailbox, and the wakeup SGI
wakes all offline CPUs at once. Hold them in a pen and release them one
at a time.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 arch/arm/mach-bcm/Makefile         |  1 +
 arch/arm/mach-bcm/bcmbca_headsmp.S | 26 +++++++++++++++++
 arch/arm/mach-bcm/bcmbca_smp.h     |  9 ++++++
 arch/arm/mach-bcm/board_bcmbca.c   | 46 ++++++++++++++++++++++++------
 4 files changed, 73 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
 create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h

diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index fcc4e0174a..c3cd2959bc 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -60,4 +60,5 @@ endif
 ifeq ($(CONFIG_ARCH_BCMBCA),y)
 obj-y				+= board_bcmbca.o
 obj-$(CONFIG_SMP)		+= bcm63xx_smp.o bcm63xx_pmb.o
+obj-$(CONFIG_SMP)		+= bcmbca_headsmp.o
 endif
diff --git a/arch/arm/mach-bcm/bcmbca_headsmp.S b/arch/arm/mach-bcm/bcmbca_headsmp.S
new file mode 100644
index 0000000000..3d0d0d97be
--- /dev/null
+++ b/arch/arm/mach-bcm/bcmbca_headsmp.S
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * All CPUs will wake up on an SGI. Wait in the holding pen until
+ * bcmbca_cpu_release matches the MPIDR.
+ *
+ * Based on arch/arm/mach-versatile/headsmp.S
+ */
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+
+	.arm
+ENTRY(bcmbca_secondary_startup)
+ ARM_BE8(setend	be)
+ THUMB(	badr	r9, 1f		)
+ THUMB(	bx	r9		)
+ THUMB(	.thumb			)
+ THUMB(1:			)
+	mrc	p15, 0, r0, c0, c0, 5
+	bic	r0, #0xff000000
+	adr_l	r6, bcmbca_cpu_release
+pen:	ldr	r7, [r6]
+	cmp	r7, r0
+	bne	pen
+
+	b	secondary_startup
+ENDPROC(bcmbca_secondary_startup)
diff --git a/arch/arm/mach-bcm/bcmbca_smp.h b/arch/arm/mach-bcm/bcmbca_smp.h
new file mode 100644
index 0000000000..30055cf766
--- /dev/null
+++ b/arch/arm/mach-bcm/bcmbca_smp.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __BCMBCA_SMP_H
+#define __BCMBCA_SMP_H
+
+extern int bcmbca_cpu_release;
+
+void bcmbca_secondary_startup(void);
+
+#endif /* __BCMBCA_SMP_H */
diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_bcmbca.c
index 248b8bd776..1afba1d680 100644
--- a/arch/arm/mach-bcm/board_bcmbca.c
+++ b/arch/arm/mach-bcm/board_bcmbca.c
@@ -1,14 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
 
+#include <linux/cache.h>
+#include <linux/cacheflush.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <linux/units.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/smp_plat.h>
 
+#include "bcmbca_smp.h"
+
 #ifdef CONFIG_DEBUG_BCMBCA
 /* This is needed for LL-debug/earlyprintk/debug-macro.S */
 static struct map_desc bcmbca_io_desc[] __initdata = {
@@ -29,16 +35,28 @@ static void __init bcmbca_map_io(void)
 }
 
 #ifdef CONFIG_SMP
+int bcmbca_cpu_release __cacheline_aligned = -1;
+
+static void bcmbca_write_cpu_release(int val)
+{
+	WRITE_ONCE(bcmbca_cpu_release, val);
+	/* Order release write before cache clean and wakeup IPI */
+	smp_wmb();
+	sync_cache_w(&bcmbca_cpu_release);
+}
+
+static void bcmbca_secondary_init(unsigned int cpu)
+{
+	/* Let the primary processor know we're out of the pen */
+	bcmbca_write_cpu_release(-1);
+}
+
 static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	struct device_node *np;
 	void __iomem *mailbox;
 	u32 release_addr;
-	int ret;
-
-	/* CFE has already powered up CPU1 and left it waiting in WFI. */
-	if (cpu_logical_map(cpu) != 1)
-		return -EINVAL;
+	int release, ret;
 
 	np = of_get_cpu_node(cpu, NULL);
 	if (!np)
@@ -58,17 +76,27 @@ static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	/*
 	 * The CFE stub reads GPIO GeneralPurpose after an interrupt and
 	 * branches to it in ARM state. Clear any Thumb function pointer
-	 * tag and complete the MMIO write before sending the wakeup IPI.
+	 * tag and complete the MMIO write before opening the pen and
+	 * sending the wakeup IPI.
 	 */
-	writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
+	writel(__pa_symbol(bcmbca_secondary_startup) & ~1, mailbox);
 	dsb(sy);
-	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
 	iounmap(mailbox);
 
-	return 0;
+	bcmbca_write_cpu_release(cpu_logical_map(cpu));
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+
+	ret = read_poll_timeout_atomic(smp_load_acquire, release,
+				       release == -1, 10, USEC_PER_SEC, false,
+				       &bcmbca_cpu_release);
+	if (ret)
+		bcmbca_write_cpu_release(-1);
+
+	return ret;
 }
 
 static const struct smp_operations bcmbca_smp_ops __initconst = {
+	.smp_secondary_init = bcmbca_secondary_init,
 	.smp_boot_secondary = bcmbca_boot_secondary,
 };
 
-- 
2.53.0


