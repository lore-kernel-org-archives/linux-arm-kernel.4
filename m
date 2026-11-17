Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D46606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VuG8eP+1;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RdThKnGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IAXKw3NCpczyqKMg/+5vupgdE1sofuSw9OuygiY0TQ0=; b=VuG8eP+1QyBzPHmKf4E85JZhmO
	4r+yUCVdYYrnIOqZg7fpuREojsna6zywWRaWp3OVig42C6+A07vUaNcvPymtlDw8xK13Oa8aUFdJE
	JQHEAwzSDW23f7LuwfJ/oP8L14+RHO8kkY6+bfdmZ3ScHQwzKa8qNjyiUBDHyFhONuba+Y+3rGn2D
	/IrbCB4HatrD2A7JJBdRHPZrwZAmzLnSzsL9U2e3H71PubWRae8wuuyrWE+gBr11QrelKwo2t/ynS
	TIBGgvqTdKz2QOreq9Fl8zN1HAEnZLrWhFRjDPOMZb2ksXTClFymhrgWQX2Tu5EQlPCpGxQm7dvjk
	poimyRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAvB-00000004YIH-3ocO;
	Tue, 17 Nov 2026 04:35:53 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAug-00000004XuV-1QDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:25 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2e95f8543c9so60903545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890121; x=1795494921; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAXKw3NCpczyqKMg/+5vupgdE1sofuSw9OuygiY0TQ0=;
        b=RdThKnGGXTYej/GSpYLcf+nrefkJmwWgKEiVD+TFPR2Pc6TKJ9SRtt/DfM7h0rrTT6
         LHY8EMffsTYJCUbReSAvqeHEJ2CY+yUIoy61hftjU97DbGncL+5fVHVAirG2sKyJHKiq
         Iellnul19ffe8ECc9HTfNhUoexp/QWeUdNmzxAlJWb4eHDzxDtPl/AmgDCr2AtgdBlz7
         LzAVZBhe+Z7Q7P1erZKlo0OyTuF0TTgHsDn+6amTKYoyZJDKvdE8R+sjCpAJXIJSmBgs
         dnAZdXlA2ye+qq4ddpDyIPH3zrcsmPUIKhr7d8MvkMWa4PAvcaOQb0/TT4Htv+SI2V/C
         Ikbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890121; x=1795494921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAXKw3NCpczyqKMg/+5vupgdE1sofuSw9OuygiY0TQ0=;
        b=PtQSde/Y3GR8Akfz9TqOtKykRKbFvX4W8KXnjt0A/gbSLkiUH1FbExUdnSEseIMYp+
         MHhqcr/F4htu6LGXrk4/teSyqLri92tA0HT6sS0M7IQ0SHmjbj/qZ3zG3WSfvGwwPifD
         MG214oBgH5AmIMcYgMTu04j+7tqZTqUMoOGpxHISn1+hW0/KXr/dFJdNGDKRGO2L9g2s
         YYrwyqBCacbQoiCK5dJFfy7WimTxTOBS6YDJYRuUaucDZvz048uS5H+Cxldic7cGz9lY
         9oOq7go17sAUSjsL51WkQQerubTk8ic964w+weKYWq+LyVtwRkg7+vj/AZS71nMMz+ZI
         HeTg==
X-Forwarded-Encrypted: i=1; AL+hErH5q2nNg5C7wGgRruX9IM4Mjab8Yh4ur/KJaKFFXMQnz8bzOVD/GkW5kRH3NVR9XFTFmaR7N63dxo+t/sMM8pjq@lists.infradead.org
X-Gm-Message-State: APuU4Z+NUutsUfq4mV9BzTp3t5Mn8xBjWtALr+qZ9Qqa8RIXXrX6s2Yg
	5Zf3yWClyBv8m6TUFL/tU1rWkAfnxLt8tQuULiC/CNoKIsEFA0RtcA41Ohkr/tDlPEguBg6pSwA
	eaveo9vgCXS6UXTfeGCww2DkuDQ==
X-Received: from plkz11.prod.google.com ([2002:a17:902:708b:b0:2ed:e740:3702])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:da89:b0:2e9:4175:3065 with SMTP id d9443c01a7336-2ee0d9e2810mr119417075ad.4.1794890120511;
 Mon, 16 Nov 2026 20:35:20 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:01 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-10-dylanbhatch@google.com>
Subject: [RFC PATCH 09/12] arm64/module, unwind: add .lr_unwind support for modules
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_203522_393157_82867F47 
X-CRM114-Status: GOOD (  22.51  )
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

Generate .lr_unwind_fde and .lr_unwind_ranges sections for loadable
kernel modules at modfinal link time, sort each module's FDE table in
module_finalize(), and support module IP lookups in lr_unwind_find().

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/lr_unwind.h |   7 ++
 arch/arm64/include/asm/module.h    |   6 ++
 arch/arm64/kernel/lr_unwind.c      | 125 ++++++++++++++++++++++++++++-
 arch/arm64/kernel/module.c         |  11 +++
 scripts/Makefile.modfinal          |  10 ++-
 scripts/gen_lr_unwind.c            |   4 +-
 6 files changed, 157 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/lr_unwind.h b/arch/arm64/include/asm/lr_unwind.h
index bfb6abed05f76..649009b49becf 100644
--- a/arch/arm64/include/asm/lr_unwind.h
+++ b/arch/arm64/include/asm/lr_unwind.h
@@ -113,6 +113,8 @@ static __always_inline void lr_fde_unpack_inline(u32 desc, lr_range_t ranges[4])
 #include <linux/errno.h>
 #include <linux/init.h>
 
+struct module;
+
 struct lr_unwind_section {
 	const struct lr_fde	*fdes;
 	unsigned int		num_fdes;
@@ -123,12 +125,17 @@ struct lr_unwind_section {
 #ifdef CONFIG_ARM64_LR_UNWIND
 
 void __init init_lr_unwind_table(void);
+void lr_unwind_module_init(struct module *mod, void *fdes, size_t fdes_size,
+			   const void *ranges, size_t ranges_size);
 int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
 		   unsigned int *sp_off);
 
 #else /* !CONFIG_ARM64_LR_UNWIND */
 
 static inline void __init init_lr_unwind_table(void) {}
+static inline void lr_unwind_module_init(struct module *mod, void *fdes,
+					 size_t fdes_size, const void *ranges,
+					 size_t ranges_size) {}
 static inline int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
 				 unsigned int *sp_off)
 {
diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb15..3b6457875e453 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -6,6 +6,7 @@
 #define __ASM_MODULE_H
 
 #include <asm-generic/module.h>
+#include <asm/lr_unwind.h>
 
 struct mod_plt_sec {
 	int			plt_shndx;
@@ -17,6 +18,11 @@ struct mod_arch_specific {
 	struct mod_plt_sec	core;
 	struct mod_plt_sec	init;
 
+#ifdef CONFIG_ARM64_LR_UNWIND
+	struct lr_unwind_section lr_unwind_sec;
+	bool			lr_unwind_init;
+#endif
+
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
 	struct plt_entry	*init_ftrace_trampolines;
diff --git a/arch/arm64/kernel/lr_unwind.c b/arch/arm64/kernel/lr_unwind.c
index 53e2c78a8bdaf..d554c2e1e57e2 100644
--- a/arch/arm64/kernel/lr_unwind.c
+++ b/arch/arm64/kernel/lr_unwind.c
@@ -5,11 +5,15 @@
 
 #define pr_fmt(fmt)	"lr_unwind: " fmt
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/kprobes.h>
 #include <linux/limits.h>
+#include <linux/module.h>
 #include <linux/printk.h>
+#include <linux/rcupdate.h>
+#include <linux/sort.h>
 
 #include <asm/lr_unwind.h>
 #include <asm/sections.h>
@@ -17,10 +21,20 @@
 static bool lr_unwind_init __ro_after_init;
 static struct lr_unwind_section kernel_lr_sec __ro_after_init;
 
+#ifdef CONFIG_MODULES
+static const char *objname(const struct lr_unwind_section *sec)
+{
+	if (sec == &kernel_lr_sec)
+		return "vmlinux";
+
+	return container_of(sec, struct module, arch.lr_unwind_sec)->name;
+}
+#else
 static const char *objname(const struct lr_unwind_section *sec)
 {
 	return "vmlinux";
 }
+#endif
 
 #define dbg_sec(sec, fmt, ...) \
 	pr_debug("(%s): " fmt, objname(sec), ##__VA_ARGS__)
@@ -55,10 +69,36 @@ static __always_inline bool is_kernel_ip_valid(unsigned long ip)
 	return false;
 }
 
+#ifdef CONFIG_MODULES
+static __always_inline bool within_mod_mem(unsigned long ip,
+					   const struct module_memory *mem)
+{
+	return ip - (unsigned long)mem->base < mem->size;
+}
+
+static __always_inline bool
+is_sec_module_ip_valid(const struct lr_unwind_section *sec, unsigned long ip)
+{
+	struct module *mod = container_of(sec, struct module, arch.lr_unwind_sec);
+
+	return within_mod_mem(ip, &mod->mem[MOD_TEXT]) ||
+	       within_mod_mem(ip, &mod->mem[MOD_INIT_TEXT]);
+}
+#else
+static __always_inline bool
+is_sec_module_ip_valid(const struct lr_unwind_section *sec, unsigned long ip)
+{
+	return false;
+}
+#endif
+
 static __always_inline bool is_sec_ip_valid(const struct lr_unwind_section *sec,
 					    unsigned long ip)
 {
-	return is_kernel_ip_valid(ip);
+	if (sec == &kernel_lr_sec)
+		return is_kernel_ip_valid(ip);
+
+	return is_sec_module_ip_valid(sec, ip);
 }
 
 static __always_inline int __find_fde(const struct lr_unwind_section *sec,
@@ -151,9 +191,31 @@ static __always_inline int __lr_unwind_find(const struct lr_unwind_section *sec,
 	return -EINVAL;
 }
 
+#ifdef CONFIG_MODULES
+static noinline int __lr_unwind_find_module(unsigned long ip,
+					    enum lr_unwind_mode *mode,
+					    unsigned int *sp_off)
+{
+	struct module *mod;
+
+	guard(preempt_notrace)();
+
+	mod = __module_text_address(ip);
+	/* Pairs with smp_store_release() in lr_unwind_module_init() */
+	if (mod && smp_load_acquire(&mod->arch.lr_unwind_init))
+		return __lr_unwind_find(&mod->arch.lr_unwind_sec,
+					ip, mode, sp_off);
+
+	return -EINVAL;
+}
+NOKPROBE_SYMBOL(__lr_unwind_find_module);
+#endif
+
 noinstr int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
 			   unsigned int *sp_off)
 {
+	int ret = -EINVAL;
+
 	if (!mode || !sp_off)
 		return -EINVAL;
 
@@ -164,7 +226,16 @@ noinstr int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
 		return __lr_unwind_find(&kernel_lr_sec, ip, mode, sp_off);
 	}
 
-	return -EINVAL;
+#ifdef CONFIG_MODULES
+	if (!rcu_is_watching())
+		return -EINVAL;
+
+	instrumentation_begin();
+	ret = __lr_unwind_find_module(ip, mode, sp_off);
+	instrumentation_end();
+#endif
+
+	return ret;
 }
 NOKPROBE_SYMBOL(lr_unwind_find);
 
@@ -272,3 +343,53 @@ void __init init_lr_unwind_table(void)
 	lr_unwind_init = true;
 	dbg_print_section(&kernel_lr_sec);
 }
+
+#ifdef CONFIG_MODULES
+
+static int lr_unwind_sort_cmp_fde(const void *a, const void *b)
+{
+	return cmp_int(lr_fde_start_addr(a), lr_fde_start_addr(b));
+}
+
+static void lr_unwind_sort_swap_fde(void *a, void *b, int size)
+{
+	struct lr_fde *x = a, *y = b, tmp = *x;
+	int delta = b - a;
+
+	x->start_offset = y->start_offset + delta;
+	x->range_desc = y->range_desc;
+	y->start_offset = tmp.start_offset - delta;
+	y->range_desc = tmp.range_desc;
+}
+
+void lr_unwind_module_init(struct module *mod, void *fdes, size_t fdes_size,
+			   const void *ranges, size_t ranges_size)
+{
+	struct lr_unwind_section *sec = &mod->arch.lr_unwind_sec;
+
+	if (!fdes_size || (fdes_size % sizeof(struct lr_fde)) ||
+	    (ranges_size % sizeof(lr_range_t))) {
+		pr_warn("invalid .lr_unwind section sizes in module %s\n",
+			mod->name);
+		return;
+	}
+
+	sec->fdes = fdes;
+	sec->num_fdes = fdes_size / sizeof(struct lr_fde);
+	sec->ranges = ranges;
+	sec->num_ranges = ranges_size / sizeof(lr_range_t);
+
+	sort(fdes, sec->num_fdes, sizeof(struct lr_fde),
+	     lr_unwind_sort_cmp_fde, lr_unwind_sort_swap_fde);
+
+	if (lr_unwind_validate_section(sec)) {
+		pr_warn("invalid .lr_unwind section in module %s\n", mod->name);
+		return;
+	}
+
+	/* Ensure table is initialized before lr_unwind_find() observes it */
+	smp_store_release(&mod->arch.lr_unwind_init, true);
+	dbg_print_section(sec);
+}
+
+#endif /* CONFIG_MODULES */
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0eb..685b4301df96e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -21,6 +21,7 @@
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
+#include <asm/lr_unwind.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
 #include <asm/text-patching.h>
@@ -515,5 +516,15 @@ int module_finalize(const Elf_Ehdr *hdr,
 		}
 	}
 
+	s = find_section(hdr, sechdrs, ".lr_unwind_fde");
+	if (s) {
+		const Elf_Shdr *r = find_section(hdr, sechdrs,
+						 ".lr_unwind_ranges");
+
+		lr_unwind_module_init(me, (void *)s->sh_addr, s->sh_size,
+				      r ? (const void *)r->sh_addr : NULL,
+				      r ? r->sh_size : 0);
+	}
+
 	return module_init_ftrace_plt(hdr, sechdrs, me);
 }
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b90..301393dbb9dd3 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -32,11 +32,17 @@ ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
 endif
 
+ifdef CONFIG_ARM64_LR_UNWIND
+cmd_gen_lr_unwind = ; $(objtree)/scripts/gen_lr_unwind $@ && \
+	$(OBJCOPY) --remove-section=.eh_frame --remove-section=.rela.eh_frame $@
+endif
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^)
+		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^) \
+	$(cmd_gen_lr_unwind)
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
@@ -47,7 +53,7 @@ quiet_cmd_btf_ko = BTF [M] $@
 	fi;
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(if $(CONFIG_ARM64_LR_UNWIND),$(objtree)/scripts/gen_lr_unwind) $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed,ld_ko_o)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index 2058601ec6135..cc6b8790e00d8 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -797,12 +797,12 @@ int main(int argc, char *argv[])
 		goto out;
 	}
 
-	if (!ctx.eh_sec || !ctx.rela_eh_sec || !ctx.symtab_shndx) {
+	if (!ctx.eh_sec || !ctx.rela_eh_sec) {
 		ret = 0;
 		goto out;
 	}
 
-	if (!parse_eh_frame(&ctx) &&
+	if (ctx.symtab_shndx && !parse_eh_frame(&ctx) &&
 	    (!ctx.nr_fdes ||
 	     !emit_lr_unwind_sections(fname, &ctx, shnum, shstrndx)))
 		ret = 0;
-- 
2.56.0.679.gc527c65306-goog


