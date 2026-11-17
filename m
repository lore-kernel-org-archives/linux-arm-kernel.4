Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dtyrR0PF;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ODefVTtI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=; b=dtyrR0PFM0O5lfMHQCW57rmODk
	GbHbdMl2UcFo3rN4ALOQ4R5321DrM9JB/Nm+6oLZ5+r+PaSi04rS/Pf/ShMTtM5Hkq2gyJ9bMHUTE
	y8VrclKjyLkdu80DxFeo1Tg7Rdg3wmPgsoNTn/Ymj5+KmbdNYTlRE82mWBlciF7/eb3j9jpQYNmT6
	NmgPWKq5LIm38OlnJ22sQowuN/nm4rc6QqVJ6216vWLqP3R6cqjb1p2E9mtLPocDQxaU9Zq/B6B57
	mf7VCrxSBF4Atu7ajfVcau9OOeI8FHlVfCDlpZr78LgnB+cQ3dUGoQseYCMC+mauhTk+Q1dkcYUm8
	TdY/US7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bC-00000004MN8-1Xhm;
	Tue, 17 Nov 2026 02:07:06 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b8-00000004MJ1-1Lvz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:03 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3b3ad195a96so359011a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881221; x=1795486021; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=;
        b=ODefVTtI0UavwQ/T4I/0vrpA5PE6ZfZAuALNYV8776ltCn6jZyeqwL+jg9AnIOCdAT
         36qaIy12mSXrhypiTcBtveGmuKHXF4lxoo28j4DxnZ6xo+HzRWXeLS/X1EV58X7N/7Qy
         k5lKQwSd3jFIX81CRjUzPqYQ9ucG1zzRAnj7oXWM5q5Si+mfhMoGQyccILHnjUjtD4jo
         YuGpCpX4AuCDH722F1CEpdXdBY68StVaRLn6hWja6qPxOY1LegkU927q8QJQcDvVHUQt
         N8wYSBjLYzssw51X3raH0OxJ9jLotosLqwY9xdy1Vfm2nt8Q+Us/ObUW6rjTp65UKKBk
         TgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881221; x=1795486021;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=;
        b=KiLXscZUjVj3PticjnqUFD+jXwsc3qz8lyLyoABktMmjyZh+Dfviig46TeSMyfPj6Q
         cHt4jG34GA5VXx5GTZQA6bo+gmTPB8/1i5lLIpRSnU7FPlMqccvSU6WtWqBGAyps8B34
         +8bw2uBmsM3P2RPfbs0Tyv8KC030lc2D/3T/YmbU37/3LkW4YFJv2jYt+e/hR2jhQpNw
         TfMkIGorZDdDqOEfpF4mpzmb4gbsf9c4W1yWGxjo/N5zonSm7Bm++sy2CcCX+eLT/kBE
         eeNT5aJ3HoQQDlhBnyzP/343Vogea5jcKelfr10QOxxqtyICcg+PcQ/1AuNlu+XFIGtI
         2cHg==
X-Forwarded-Encrypted: i=1; AL+hErHlTpCcub57WeMK0m3A96jQbqQcbpitqucymDc5sF2enNRc3qAgj/1JDY25xcKzx3A85ewndKhIUb5+58vUnq49@lists.infradead.org
X-Gm-Message-State: APuU4Z9BeV4YDO4DuHa5cEEHvNH3LDO13FBlHbg9P6SX4HfN0hnt+AUf
	sh8cF40SeGSunEyY0t36T1J8IDAqU9+NGlVoIkIBXqL1BK7YY8wKeGOZ2GTM0InGRpihSovjmy4
	9oz8v6FheTpVWs/8CY7xdiFfgkg==
X-Received: from pgjk26-n1.prod.google.com ([2002:a05:6a02:81da:10b0:cdd:bfcd:be0a])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:3ad:544f:81e9 with SMTP id 98e67ed59e1d1-3b1b09fa382mr9942186a91.15.1794881220412;
 Mon, 16 Nov 2026 18:07:00 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:42 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-6-dylanbhatch@google.com>
Subject: [PATCH v9 05/11] module, sframe: Add sframe support for modules
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
X-CRM114-CacheID: sfid-20261116_180702_374372_102B9717 
X-CRM114-Status: GOOD (  22.64  )
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

Add sframe table to struct module and support sframe PC lookups when an
.sframe section can be found on incoming modules. SFRAME_F_FDE_SORTED is
not set for module .sframe, so FDEs are sorted right after the sframe
header is read.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Preserve KASAN_SANITIZE_sframe.o, KCSAN_SANITIZE_sframe.o,
   and CFLAGS_REMOVE_sframe.o in kernel/unwind/Makefile.
 - (sashiko) Replace unused includes in include/linux/sframe.h with
   'struct module;' forward declaration and drop redundant includes in
   arch/arm64/include/asm/module.h and kernel/module/main.c.
---
 include/linux/module.h |   5 ++
 include/linux/sframe.h |   8 +++
 kernel/module/main.c   |  20 +++++++
 kernel/unwind/sframe.c | 118 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 146 insertions(+), 5 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 76f4f35964773..6793e9feb20a5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -25,6 +25,7 @@
 #include <linux/export.h>
 #include <linux/rbtree_latch.h>
 #include <linux/tracepoint-defs.h>
+#include <linux/sframe.h>
 #include <linux/srcu.h>
 #include <linux/static_call_types.h>
 #include <linux/dynamic_debug.h>
@@ -581,6 +582,10 @@ struct module {
 #ifdef CONFIG_DYNAMIC_DEBUG_CORE
 	struct _ddebug_info dyndbg_info;
 #endif
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	struct sframe_section sframe_sec;
+	bool sframe_init;
+#endif
 } ____cacheline_aligned __randomize_layout;
 #ifndef MODULE_ARCH_INIT
 #define MODULE_ARCH_INIT {}
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index c1fe8ac7df7b3..ad6d693c6f059 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -5,6 +5,8 @@
 #include <linux/init.h>
 #include <linux/unwind_types.h>
 
+struct module;
+
 #ifdef CONFIG_UNWIND_SFRAME_LOOKUP
 
 struct sframe_section {
@@ -15,6 +17,7 @@ struct sframe_section {
 	unsigned long	fres_start;
 	unsigned long	fres_end;
 	unsigned int	num_fdes;
+	bool		fdes_sorted;
 
 	signed char	ra_off;
 	signed char	fp_off;
@@ -23,12 +26,17 @@ struct sframe_section {
 extern struct sframe_section kernel_sfsec __ro_after_init;
 
 void __init init_sframe_table(void);
+void sframe_module_init(struct module *mod, void *addr, unsigned int size);
+
 extern int sframe_find(unsigned long ip, struct unwind_frame *frame);
 
 #else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *addr, unsigned int size) {}
+
 static inline int sframe_find(unsigned long ip, struct unwind_frame *frame) { return -EINVAL; }
+
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 34e0204ea37c1..ea7e49e294291 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3024,6 +3024,23 @@ static void module_deallocate(struct module *mod, struct load_info *info)
 	free_mod_mem(mod);
 }
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static void setup_sframe(struct module *mod, const struct load_info *info)
+{
+	unsigned int sframe_size;
+	void *sframe = section_objs(info, ".sframe", 1, &sframe_size);
+
+	if (sframe)
+		sframe_module_init(mod, sframe, sframe_size);
+}
+
+#else
+
+static void setup_sframe(struct module *mod, const struct load_info *info) {}
+
+#endif
+
 int __weak module_finalize(const Elf_Ehdr *hdr,
 			   const Elf_Shdr *sechdrs,
 			   struct module *me)
@@ -3043,6 +3060,9 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	/* Setup kallsyms-specific fields. */
 	add_kallsyms(mod, info);
 
+	/* Initialize sframe metadata. */
+	setup_sframe(mod, info);
+
 	/* Arch-specific module finalizing. */
 	return module_finalize(info->hdr, info->sechdrs, mod);
 }
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 50afaed9a0c93..55b7838bdd485 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -7,8 +7,10 @@
 
 #include <linux/mm.h>
 #include <linux/overflow.h>
+#include <linux/rcupdate.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/sort.h>
 #include <linux/unaligned.h>
 #include <linux/unwind_types.h>
 #include <linux/kallsyms.h>
@@ -98,6 +100,9 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
 	int ret;
 
+	if (!sec->fdes_sorted)
+		return -EINVAL;
+
 	first = (void *)sec->fdes_start;
 	low = first;
 	high = first + sec->num_fdes - 1;
@@ -411,12 +416,53 @@ static __always_inline int __sframe_find(struct sframe_section *sec,
 	return __find_fre(sec, &fde, ip, frame);
 }
 
-notrace int sframe_find(unsigned long ip, struct unwind_frame *frame)
+#ifdef CONFIG_MODULES
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	struct module *mod;
+	int ret;
+
+	if (!rcu_is_watching())
+		return -EINVAL;
+
+	instrumentation_begin();
+	scoped_guard(preempt_notrace) {
+		mod = __module_text_address(ip);
+		if (mod && smp_load_acquire(&mod->sframe_init))
+			ret = __sframe_find(&mod->sframe_sec, ip, frame);
+		else
+			ret = -EINVAL;
+	}
+	instrumentation_end();
+
+	return ret;
+}
+
+#else
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	return -EINVAL;
+}
+
+#endif
+
+noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 {
-	if (!frame || !sframe_init)
+	if (!frame)
 		return -EINVAL;
 
-	return  __sframe_find(&kernel_sfsec, ip, frame);
+	if (__is_kernel_text(ip) || is_kernel_inittext(ip)) {
+		if (!sframe_init)
+			return -EINVAL;
+
+		return __sframe_find(&kernel_sfsec, ip, frame);
+	}
+
+	return  __sframe_find_module(ip, frame);
 }
 NOKPROBE_SYMBOL(sframe_find);
 
@@ -436,7 +482,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr->preamble.magic != SFRAME_MAGIC ||
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
 		pr_debug("bad/unsupported sframe header\n");
@@ -459,6 +504,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr->preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
@@ -475,10 +521,72 @@ void __init init_sframe_table(void)
 	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
 	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
 
-	if (sframe_read_header(&kernel_sfsec)) {
+	if (sframe_read_header(&kernel_sfsec) || !kernel_sfsec.fdes_sorted) {
 		pr_warn("invalid vmlinux SFrame header\n");
 		return;
 	}
 
 	sframe_init = true;
 }
+
+#ifdef CONFIG_MODULES
+
+static int sframe_sort_cmp_fde(const void *a, const void *b)
+{
+	const struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	unsigned long func_start_a, func_start_b;
+
+	func_start_a = (unsigned long)fde_a + fde_a->func_start_off;
+	func_start_b = (unsigned long)fde_b + fde_b->func_start_off;
+
+	return cmp_int(func_start_a, func_start_b);
+}
+
+static void sframe_sort_swap_fde(void *a, void *b, int size)
+{
+	struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	struct sframe_fde_v3 temp;
+	long delta;
+
+	/* Swap potentially unaligned FDE */
+	memcpy(&temp, fde_a, sizeof(struct sframe_fde_v3));
+	memcpy(fde_a, fde_b, sizeof(struct sframe_fde_v3));
+	memcpy(fde_b, &temp, sizeof(struct sframe_fde_v3));
+
+	/* Adjust FDE function start offset from FDE */
+	delta = (long)((unsigned long)fde_b - (unsigned long)fde_a);
+	fde_a->func_start_off += delta;
+	fde_b->func_start_off -= delta;
+}
+
+static void sframe_sort_fdes(struct sframe_section *sec)
+{
+	void *fdes = (void *)sec->fdes_start;
+	size_t num_fdes = sec->num_fdes;
+
+	if (sec->fdes_sorted)
+		return;
+
+	sort(fdes, num_fdes, sizeof(struct sframe_fde_v3),
+	     sframe_sort_cmp_fde, sframe_sort_swap_fde);
+	sec->fdes_sorted = true;
+}
+
+void sframe_module_init(struct module *mod, void *addr, unsigned int size)
+{
+	struct sframe_section *sec = &mod->sframe_sec;
+
+	sec->sframe_start = (unsigned long)addr;
+	sec->sframe_end   = (unsigned long)addr + size;
+
+	if (sframe_read_header(sec)) {
+		pr_warn("invalid SFrame header in module %s\n", mod->name);
+		return;
+	}
+	sframe_sort_fdes(sec);
+
+	/* Ensure SFrame is initialized when sframe_find() happens */
+	smp_store_release(&mod->sframe_init, true);
+}
+
+#endif
-- 
2.56.0.679.gc527c65306-goog


