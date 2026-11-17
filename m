Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D092606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DqBceuF2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkpulNn5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=; b=DqBceuF2xpTMijT0XejIm4v1G/
	y9Q6zX+MaxmSONGIhSKzdOfQI83rSVH5BEHCcaR1zutuvkFDrXRMsONnN1+3Grd5HdlmX8gZ48B2H
	T5Z4w4y5D4vBTceRjUSCZIo8VNxBLtEouzPL/6iuyiC0FUJXyZo0bNm2STrzYigca5rY4Gq89QwHR
	F25p0GVC8XEjTyx2uQXUe3+GKmLq2V4e/t5P5lTYPV7cMm7yCP2e6qSvpBysKwrEI+RnUxKsIhz6g
	UDUhEkGZL+kQWM5Z6LVWfxY8fzGOmxJY2cchA5EnuMOrmx1dVwACKrOG/6cjyarYSV5knaF40MtYZ
	MhplIOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bv-00000004N2X-2HUe;
	Tue, 17 Nov 2026 02:07:51 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bB-00000004ML7-2cLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:06 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2ed276af91dso63570965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881224; x=1795486024; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=;
        b=FkpulNn5PxU9Avll/UiS6EIeucJSnQtfh6TEPZP8OBawLcVY+oxgXLXGAtpblnQC5/
         5DbYxGwRqYFmtUFApwVJmCngwnY+sJsvSw6IQGklQZ2ISzsyqNZ4hkun7frwwpPqs8c5
         e998vp2r9t7NLae0rVUSmt1Chq4us7MLL8MR+wnPopbfRlLYWvDhz2TOvTCVxSeunTtN
         jgdVeaAAG15rxSqZb8wRohwKmEQBxOjvr/1u/KJEGu8n2wnA+aZi5YpksXDQvqbcgquU
         zVLbSnrjLtv2enjIk1v0pXS+9ja12j6Fo6gM71/TSEuQWh3P3dVhxqclpR+8csKGJQR3
         zdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881224; x=1795486024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=;
        b=xY3fVVF3vPb88d0a8zUK5JFHEFGEycMG7krUOe/BDXANf7KcuH43Xr+wgc3lFL7UPd
         ku+QUZR+dEN++e2vhfKa7wnWJ7Vjx1Hk5TWzDTiz7zIbxMOqoqk3OJEJWrmP+1pv+01K
         1H2LAx6omKTyWjoV7bROtLyGsePo/pkl7Mm3YmHTQeQIGzTJgCm7YwhC3yDGK84VWfdR
         HdxNuP7KSrcz5EyZ8jrYoGYToZ+fHcPJ3kuHEXG2itiWv/GHa1QdrkcsdTOhNNx2thcA
         gx6fkTlCb4CnMTOB411F5n8ieyrl8g4kLxpba7ZhORlrRiTPoZ6oTypP6wRCUfKPYiw8
         SZuw==
X-Forwarded-Encrypted: i=1; AL+hErELeLvtPijEr2vYHZrMzVYFjxgb8AZohsbet6GPVIVwJVyUXeWFrsQaVBSEjylFqj9AQXs9iXxYElRQdjLpEFQH@lists.infradead.org
X-Gm-Message-State: APuU4Z8M+DuU87d0nGSFbJMPLBuCbqU5tLe5+ge7/D0NFkJ3m/9EIoj7
	kNEApJV4zWwhS9EkGnKWbiVzapbBoWXq1q20t+TY5qOxDxH+oepMx+2FKi1JlT52KTQB9KqxgHH
	L4geL+8v684wJbGRRfTIFKu5PZA==
X-Received: from plse6.prod.google.com ([2002:a17:902:b786:b0:2ef:d8b5:15f5])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e88d:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2ee0dad0713mr139046645ad.30.1794881223257;
 Mon, 16 Nov 2026 18:07:03 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:44 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-8-dylanbhatch@google.com>
Subject: [PATCH v9 07/11] sframe: Add debug helpers with object name
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180705_672135_48735744 
X-CRM114-Status: GOOD (  17.06  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Include the object name for kernel .sframe sections, indicated with the
format "(<module-name>)" or "(vmlinux)".

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Include <linux/container_of.h>, <linux/module.h>,
   <linux/printk.h>, and <linux/stddef.h> in sframe_debug.h.
---
 kernel/unwind/sframe.c       | 11 +++++++----
 kernel/unwind/sframe_debug.h | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 kernel/unwind/sframe_debug.h

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index d5c1c8148dadd..4d804f2ad9dde 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -19,6 +19,7 @@
 #include <asm/unwind_sframe.h>
 
 #include "sframe.h"
+#include "sframe_debug.h"
 
 static bool sframe_init __ro_after_init;
 struct sframe_section kernel_sfsec __ro_after_init;
@@ -516,7 +517,7 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (check_add_overflow(sec->sframe_start, sizeof(struct sframe_header), &header_end) ||
 	    header_end >= sec->sframe_end) {
-		pr_debug("header struct doesn't fit in section\n");
+		dbg_sec(sec, "header struct doesn't fit in section\n");
 		return -EINVAL;
 	}
 
@@ -526,12 +527,12 @@ static int sframe_read_header(struct sframe_section *sec)
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
-		pr_debug("bad/unsupported sframe header\n");
+		dbg_sec(sec, "bad/unsupported sframe header\n");
 		return -EINVAL;
 	}
 
 	if (!shdr->num_fdes || !shdr->num_fres) {
-		pr_debug("no fde/fre entries\n");
+		dbg_sec(sec, "no fde/fre entries\n");
 		return -EINVAL;
 	}
 
@@ -542,7 +543,7 @@ static int sframe_read_header(struct sframe_section *sec)
 	    check_add_overflow(header_end, shdr->fres_off, &fres_start) ||
 	    check_add_overflow(fres_start, shdr->fre_len, &fres_end) ||
 	    fres_start < fdes_end || fres_end > sec->sframe_end) {
-		pr_debug("inconsistent fde/fre offsets\n");
+		dbg_sec(sec, "inconsistent fde/fre offsets\n");
 		return -EINVAL;
 	}
 
@@ -569,6 +570,7 @@ void __init init_sframe_table(void)
 	}
 
 	sframe_init = true;
+	dbg_print_header(&kernel_sfsec);
 }
 
 #ifdef CONFIG_MODULES
@@ -629,6 +631,7 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
+	dbg_print_header(sec);
 }
 
 #endif
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
new file mode 100644
index 0000000000000..748d69ff6c103
--- /dev/null
+++ b/kernel/unwind/sframe_debug.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SFRAME_DEBUG_H
+#define _SFRAME_DEBUG_H
+
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/sframe.h>
+#include <linux/stddef.h>
+#include "sframe.h"
+
+#ifdef CONFIG_MODULES
+
+#define objname(sec) ((sec) == &kernel_sfsec					\
+		     ? "vmlinux"						\
+		     : container_of((sec), struct module, sframe_sec)->name)
+
+#else
+
+#define objname(...) "vmlinux"
+
+#endif
+
+#define dbg_sec(sec, fmt, ...)						\
+	pr_debug("(%s): " fmt, objname(sec), ##__VA_ARGS__)
+
+static __always_inline void dbg_print_header(struct sframe_section *sec)
+{
+	unsigned long fdes_end;
+
+	fdes_end = sec->fdes_start + (sec->num_fdes * sizeof(struct sframe_fde_v3));
+
+	dbg_sec(sec, "SEC:0x%lx-0x%lx fdes:0x%lx-0x%lx fres:0x%lx-0x%lx ra_off:%d fp_off:%d\n",
+		sec->sframe_start, sec->sframe_end, sec->fdes_start, fdes_end, sec->fres_start,
+		sec->fres_end, sec->ra_off, sec->fp_off);
+}
+
+#endif /* _SFRAME_DEBUG_H */
-- 
2.56.0.679.gc527c65306-goog


