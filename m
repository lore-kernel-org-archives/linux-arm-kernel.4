Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IsHu+FJr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLVYTYvW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=; b=IsHu+FJr8dvVNNnnHHFU3FzDWC
	P3vTtfIykijy6HzKhJakRtowNUBoEpxg4yVXGPJuPgQFiFZOKKmLs7MV3DrBc7PZvrguKLMuGn5kJ
	rEKKtxWyYQzgfTQZffo3cAOOivBspwxHwKkugj9jhLpib1yYvuNAKeK8cSD0cFbS/nFvWXtqGgTe4
	kFKz+TojK1QI0+qw3qOVVVGe5uMPI1M85VTnB9qIqV6/sUzkUNTqq8wkkfMDbxZXs4j11SHTmFUzy
	hjTTQ4M1WVZg4AfDX3+DwJp50J2cACZbTlPwMZ3hvUrz2b1WRlpkoOgn/qJepbSEGhiSxYFaJvPeD
	vu3cDNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKwh-00000008ZEq-0DAJ;
	Thu, 12 Nov 2026 02:53:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKwe-00000008ZEP-20pn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:53:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2375236a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794452027; x=1795056827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=;
        b=VLVYTYvWjJ1AxDY2IQxQOedhwviAst+ORBo5lt/45Q/TtJOrnComfTdS1xVV7zMa7/
         K60OQHK5jkxBf2GpTQlIJIoc3ZvhV5QgU1n9ScQqHZx8N2VM1VJJqIPjWMXlN5arbhWT
         n87HqvHIt++rJB6J6O29fX6/o5/kjb9ZvolZeGs/VFuduEwQSO3rvCpqnw6NVtPp6uYj
         Gbib44H3I33epjx6ilfNO9B82I7sn3oERPcW6ZzbaiqJ+auW4A9h/chgpowc2H1msbKG
         hllr2Q4UDqI/biLG+MmWwMwlzm4IK2rbjp9FkOY4JjbHMTsMxGZYfhfNhItmjAGGHtUF
         1Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452027; x=1795056827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=;
        b=yptDnC15z6WIcYcxXZ8p6kR4t/vr2hYOLCtaEtuJy6FaPed07zhisNoCShp8pUAQaw
         7K1qfcO4OdXXq/L2s8kAUDvTw5VCLTFbtvJSpHzQsHbV2l1yZcitLrMFBPUnYXZudxG9
         Q1xf5qPQLeiHQqjZa3GTGh/i7n83x0f2MEZh/ET+v1eB9shRPK+1gQKqDqLrRttTdAh+
         4V/ptHS6WoqRJYO4OZBtuBwcNEPQXeb3+kpFv8GihuIL+1lY8LazH9NgBw+NqTm9L+mh
         GtUfqn6eTW7Zv8ymNVLKyBGQE5JRoT5uPUegfaDkgCSpoDetqoqF5G/X2mJjNqbzNVse
         +kLQ==
X-Forwarded-Encrypted: i=1; AL+hErH10gabrIKLW3cmqmgxnQqJI5tuFsZK6Vgkh0WkdCTKQ+xGVxYcPT8X+rOIKGFyXgdVt9QxRZ26JGnAcc248sMV@lists.infradead.org
X-Gm-Message-State: APuU4Z+z3TORRcH2rgtcrNNt9Yi5mzGOol/9PXfbQqQovZM1l1sENJxS
	LlX+Zb9y9vLqWukpdv9/0d4KdZR6gvLZ+irQO8XsymUVnN/4m8IVOo36
X-Gm-Gg: AYBFou0F8GrtdQ008wFOYUpVsAkzFREJ8ZUgZ6kb99UhFlxiu6nWSXHaIaOcz+fJrV7
	cN8XP9PCDghQc2oUmnCmic8t6bt0jPquzE97FmTcAaCed+6F9vfzKc3QhonGh7mVmJEvpzlrUzD
	S+kEBrYia/fTYI6KgOmURY/VO7TD4nkWdwa7CvJjYCjjzUMZmpxdUgSVIXTg+eD8cANaMkCMqHR
	VcvTvaNBVoL73ud+AvK/7vdvOMC+VQAZIA0nNKA5wEEmvgIvm5YaNVdxHzjc/YZcvPpCcsvH5kT
	gHrl99MjZo/LYK63pG3y6uXp0UyHQh7ah0Z3VG3tZ2i5kF716UJZLjzD4YdUk91/3luzusr7q+y
	HTh7NjWF9u86rbvMfTI5LsJaA20bIb6zkg44PElkwa+U21EmU7hfid9ru+PHEUhw2m7xWerA5nH
	6+POJSyaOX2nzKkedCizYM71Pi4yRjNXN56KhJe2p4IV1YTum6DpPXWbzz0egILg21k2Wmtne5Q
	9GkRk8CjBcrPCAKDybAMNMU/bDMNw+G80t5JSkBhx/98C5tn3zV0DX/SzzEBLGszFwIhcdZqLCD
	1Y6Rjuie6Fn+AR36tzDlQuA8IgmPeeZF33VtUkETDm7bEUJay5t7py7HqzzltEgFNqMLgKFfZfd
	wXSmGx8dj8mtobd8PKLIuIArYRYUr
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr4020514a91.17.1794452027099;
        Wed, 11 Nov 2026 18:53:47 -0800 (PST)
Received: from prox-debian13-dev.listerlab.win (203-96-142-148.dsl-dynamic.connections.net.nz. [203.96.142.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf46sm27052045ad.31.2026.11.11.18.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:53:46 -0800 (PST)
From: Patrick Lister <patrick.lister.dev@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Lister <patrick.lister.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Date: Thu, 12 Nov 2026 15:51:59 +1300
Message-ID: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_185348_585566_3F96D371 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -2.1 (--)
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

NWFPE locates the trapping process's saved registers relative to
current_thread_info(), assuming thread_info sits at the bottom of the
kernel stack. Since ARM moved thread_info into task_struct, that
expression points past the end of the task_struct instead.

This breaks FPA instruction emulation, as the user registers are
never read or written and causes out-of-bounds reads and writes of
kernel memory beyond the task_struct. Any unprivileged process can
trigger this.

Fix by using task_pt_regs(current), which finds the registers on the
stack.

The bug was found with assistance from Claude Code (Anthropic), model
Claude Opus 5.5 (claude-opus-5-5).

Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")
Cc: stable@vger.kernel.org # 5.16+
Signed-off-by: Patrick Lister <patrick.lister.dev@gmail.com>
---
Build tested on Russell King's linux-arm tree with footbridge_defconfig
(CPU_SA110, FPE_NWFPE,THREAD_INFO_IN_TASK), W=1, no new warnings.

Runtime-tested on 6.12.116, where this patch applies unchanged
(arch/arm/nwfpe/fpa11.h is identical to mainline):

 - QEMU versatilepb (ARM926) with OABI_COMPAT, FPE_NWFPE and KASAN:
   a test that executes FLT and FIX gets the wrong result back and
   KASAN reports "slab-out-of-bounds in PerformFLT" without this patch;
   with it the result is correct and KASAN reports nothing.

 - Nokia 770 (OMAP1710, ARM926, OABI userspace): fixes the maemo
   battery daemon's FPA arithmetic which would incorrectly calculate
   the remaining charge of the battery and power off the device.

Not runtime tested on mainline: since 25900bd99d4d ("ARM: limit OABI
support to StrongARM CPUs") NWFPE is StrongARM-only, and QEMU's only
StrongARM machine (collie) currently fails to boot mainline.

A reproducer is available on request.

 arch/arm/nwfpe/fpa11.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/nwfpe/fpa11.h b/arch/arm/nwfpe/fpa11.h
index d51195d41f5b..25c327a73a27 100644
--- a/arch/arm/nwfpe/fpa11.h
+++ b/arch/arm/nwfpe/fpa11.h
@@ -13,13 +13,12 @@
 #define GET_FPA11() ((FPA11 *)(&current_thread_info()->fpstate))
 
 /*
- * The processes registers are always at the very top of the 8K
- * stack+task struct.  Use the same method as 'current' uses to
- * reach them.
+ * The process's registers are saved at the top of its kernel stack.
  */
-#define GET_USERREG() ((struct pt_regs *)(THREAD_START_SP + (unsigned long)current_thread_info()) - 1)
+#define GET_USERREG() task_pt_regs(current)
 
 #include <linux/thread_info.h>
+#include <linux/sched/task_stack.h>
 
 /* includes */
 #include "fpsr.h"		/* FP control and status register definitions */
-- 
2.47.3


