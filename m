Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrpP+d6i;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktuDrcuq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tulY0+446yHNX2/THqOjEH7cg/a7dJOlrWCe6BF5i34=; b=UrpP+d6iTEIckf8tylpCGi0bMu
	OkKT31px2eTrXg9Ze+vahLV0Rt8U4jufzQviukd69ELjJ6/Viy0FH1eyr4J2t32sGgtrQVBckX3+1
	Zr4ssWQQp+FMAu0VUw7KxH1HsyDtLmEFW87iQi0wlohfAMmEoEg7bKhnhdslj4EkN4Ia7+9Hp9tco
	BYEayunvcRy1iUooSXs2sXutDhuBoxxXLMyhM1+sdlPq5sGuLb1MhOsVbpvfn8pbIiuT2nmdMxdSX
	u5pQRcA10UqlglVdJsesckXNqn7PyAPxB+bOFnvyIJHl/DN5+cQdxP0fGyOTWFK5LjQGgTEsW3eYK
	5OWx9r5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5TL-0000000Ckuv-22wd;
	Thu, 19 Nov 2026 16:58:55 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T9-0000000Cknw-0N4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:58:44 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso1410340f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107521; x=1795712321; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tulY0+446yHNX2/THqOjEH7cg/a7dJOlrWCe6BF5i34=;
        b=ktuDrcuqvNMo0OO4frx9vktgEoZv2k6CJF+zHTSjtUmsvF0Pu/U/1xmSoNlX0BcAwx
         zlm9iRG0Xjq74MU6hR5y34owa9lyzCSwLcvcv2qkLwfpdt1Zc9UxiklAVzjZnyifdZzK
         2kJQZJOWIbIMGdU35qlzrzCxd4bkWXe+xKCddhSvI0HksC2kf6sA1ftrHD30fX4dfacy
         i+3zNn6GlneFX5tMeKusw+nLeIEF2mlJ/TJ5BdeJQOENBfBf9Egnu+b4UUIH5xZCn6tl
         s94iKCSANIYya/OmGYrt38X8mISRX5GyeoW77sezhFQY789i9m3K8WhjXzPMeS8KoLa+
         secA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107521; x=1795712321;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tulY0+446yHNX2/THqOjEH7cg/a7dJOlrWCe6BF5i34=;
        b=twMaGDRS0zRAH0AVE8CpXJ/93vSq5J6kGbNIS0Yu9UcotQDqF+7sm5iNnhFJdRRCld
         bxPsuFg8fOQKNYKExsLtVsJpPISvt77nUAURACv2OO0WxBsGBaRZlh+CcEk5LJkU5/Z0
         sZk2rd59242J1DsRY+XXyzSqCjyzYetJYpg8YrXCyiMJLTu0kMZtpEvHofRmmqbf0HZe
         sQO5MB9SzHLqm9n+iTz1+qqaxGsB15WNrsfulWt6GcK3uAWF/NJN/zvXF4Tq2J9ZhPNI
         ZSjLEvkwH/99ah592qEoE6V6IXMAEXZAr2DuDv9/a5fysP8QHueBoj0xto75JzbFKXvT
         JQaQ==
X-Gm-Message-State: APuU4Z9XcRLinr40zaChW1mnIgZN0QHahJocamBzJUDteRvzuU+qZX3c
	BgSrMuPWmIENvey/Xregx5pIM8pkWBIrBfnLmKcRQD8E2K9Bez6fI7rcTkQI23dwRs9kkNhBBij
	QfRieAO1cGkzIEn9UaQ5z6EwyPSRXvb9CmJSpWIhGqyOwzeeZMUAKeJQCZNKSRv5BEZLcRifIZq
	jEpUuTdeuml3GuPowVUZz1sThxWUfYVlWMnsh82ZYQw2TY
X-Received: from wrrh9.prod.google.com ([2002:adf:fa89:0:b0:4a5:39b8:11e8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:491a:b0:4a7:518f:bebc
 with SMTP id ffacd0b85a97d-4a8c1ed32b9mr7586312f8f.25.1795107520510; Thu, 19
 Nov 2026 08:58:40 -0800 (PST)
Date: Thu, 19 Nov 2026 17:58:29 +0100
In-Reply-To: <20261119165825.1793558-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=12642; i=ardb@kernel.org;
 h=from:subject; bh=B0sXzel1eWwSy26Yis0BuaHuDdBgGjE+p5fFuIEdkIA=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGr/KrajLffZ+u91G1BqsqkQ0kZWFOS1tJbM7zoKIzlBfTlkl
 Yh1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmr/KrYACgkQMG4JVi59LVxoZwD+K3ud
 0bDsLDHLFcqboi5oNdSPX4bnxaIfyh18g78mo/MA/3lmrNnexFPMc5BldOO5gQNUUuZ/vxRyoRs 8PE28RBcF
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119165825.1793558-8-ardb+git@google.com>
Subject: [PATCH 3/3] arm64: module: Revert separate init PLT and init ftrace trampoline
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085843_195199_6697C157 
X-CRM114-Status: GOOD (  27.04  )
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

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit a7ed7b9d0ebb ("arm64: ftrace: fix unreachable PLT for
ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE") and commit
24af6c4e4e0f ("arm64: module: split core and init PLT sections").

Now that executable init sections are kept in the core text region, all
branch instructions that may need a PLT entry, as well as all ftrace
callsites, live in the core text region, and so a single PLT section and
a single ftrace trampoline suffice.

This also means that branches to symbols defined in another section of
the same module no longer need a PLT slot, as all executable sections are
within direct branching range of each other. So only reserve PLT slots
for branches to external symbols, i.e., SHN_UNDEF symbols as before
24af6c4e4e0f, but also SHN_LIVEPATCH symbols (and other reserved section
indexes), as these are resolved against vmlinux or other modules.

On arm64 allmodconfig (10604 modules, disregarding modules with 'test' or
'torture' in their name), this drops 2126 reserved but never used PLT
slots for intra-module branches (about 25 KB in total).

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/module.h     | 11 +--
 arch/arm64/include/asm/module.lds.h |  2 -
 arch/arm64/kernel/ftrace.c          | 13 +--
 arch/arm64/kernel/module-plts.c     | 98 +++++++-------------
 arch/arm64/kernel/module.c          | 13 +--
 5 files changed, 40 insertions(+), 97 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..9d34f915d59b 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -7,24 +7,17 @@
 
 #include <asm-generic/module.h>
 
-struct mod_plt_sec {
+struct mod_arch_specific {
 	int			plt_shndx;
 	int			plt_num_entries;
 	int			plt_max_entries;
-};
-
-struct mod_arch_specific {
-	struct mod_plt_sec	core;
-	struct mod_plt_sec	init;
 
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
-	struct plt_entry	*init_ftrace_trampolines;
 };
 
 u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
-			  void *loc, const Elf64_Rela *rela,
-			  Elf64_Sym *sym);
+			  const Elf64_Rela *rela, Elf64_Sym *sym);
 
 u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 				void *loc, u64 val);
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 603f92a8a73e..983e768203a1 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,8 +1,6 @@
 SECTIONS {
 	.plt 0 : { BYTE(0) }
-	.init.plt 0 : { BYTE(0) }
 	.text.ftrace_trampoline 0 : { BYTE(0) }
-	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
 #ifdef CONFIG_UNWIND_TABLES
 	/*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..389675690293 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -258,17 +258,10 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return ftrace_modify_code(pc, 0, new, false);
 }
 
-static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
+static struct plt_entry *get_ftrace_plt(struct module *mod)
 {
 #ifdef CONFIG_MODULES
-	struct plt_entry *plt = NULL;
-
-	if (within_module_mem_type(addr, mod, MOD_INIT_TEXT))
-		plt = mod->arch.init_ftrace_trampolines;
-	else if (within_module_mem_type(addr, mod, MOD_TEXT))
-		plt = mod->arch.ftrace_trampolines;
-	else
-		return NULL;
+	struct plt_entry *plt = mod->arch.ftrace_trampolines;
 
 	return &plt[FTRACE_PLT_IDX];
 #else
@@ -339,7 +332,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftrace *rec,
 	if (WARN_ON(!mod))
 		return false;
 
-	plt = get_ftrace_plt(mod, pc);
+	plt = get_ftrace_plt(mod);
 	if (!plt) {
 		pr_err("ftrace: no module PLT for %ps\n", (void *)*addr);
 		return false;
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..0a0257b6a5e8 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -67,11 +67,9 @@ static bool plt_entries_equal(const struct plt_entry *a,
 }
 
 u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
-			  void *loc, const Elf64_Rela *rela,
-			  Elf64_Sym *sym)
+			  const Elf64_Rela *rela, Elf64_Sym *sym)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	struct mod_arch_specific *pltsec = &mod->arch;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
@@ -101,8 +99,7 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 				void *loc, u64 val)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	struct mod_arch_specific *pltsec = &mod->arch;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries++;
 	u32 br;
@@ -154,8 +151,21 @@ static bool duplicate_rel(const Elf64_Rela *rela, int num)
 	return num > 0 && cmp_rela(rela + num, rela + num - 1) == 0;
 }
 
+/*
+ * We only have to consider branch targets that resolve to symbols that are
+ * not defined in the module itself. This is not simply a heuristic, it is a
+ * fundamental limitation, since the PLT itself is part of the module's core
+ * text region, and needs to be within 128 MB as well, so the module's code can
+ * never grow beyond that limit. Note that SHN_LIVEPATCH symbols are resolved
+ * against vmlinux or other modules, so these need to be taken into account.
+ */
+static bool branch_target_is_external(const Elf64_Sym *s)
+{
+	return s->st_shndx == SHN_UNDEF || s->st_shndx >= SHN_LORESERVE;
+}
+
 static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int num,
-			       Elf64_Word dstidx, Elf_Shdr *dstsec)
+			       Elf_Shdr *dstsec)
 {
 	unsigned int ret = 0;
 	Elf64_Sym *s;
@@ -167,19 +177,8 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int num,
 		switch (ELF64_R_TYPE(rela[i].r_info)) {
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
-			/*
-			 * We only have to consider branch targets that resolve
-			 * to symbols that are defined in a different section.
-			 * This is not simply a heuristic, it is a fundamental
-			 * limitation, since there is no guaranteed way to emit
-			 * PLT entries sufficiently close to the branch if the
-			 * section size exceeds the range of a branch
-			 * instruction. So ignore relocations against defined
-			 * symbols if they live in the same section as the
-			 * relocation target.
-			 */
 			s = syms + ELF64_R_SYM(rela[i].r_info);
-			if (s->st_shndx == dstidx)
+			if (!branch_target_is_external(s))
 				break;
 
 			/*
@@ -246,13 +245,11 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int num,
 	return ret;
 }
 
-static bool branch_rela_needs_plt(Elf64_Sym *syms, Elf64_Rela *rela,
-				  Elf64_Word dstidx)
+static bool branch_rela_needs_plt(Elf64_Sym *syms, Elf64_Rela *rela)
 {
-
 	Elf64_Sym *s = syms + ELF64_R_SYM(rela->r_info);
 
-	if (s->st_shndx == dstidx)
+	if (!branch_target_is_external(s))
 		return false;
 
 	return ELF64_R_TYPE(rela->r_info) == R_AARCH64_JUMP26 ||
@@ -261,14 +258,14 @@ static bool branch_rela_needs_plt(Elf64_Sym *syms, Elf64_Rela *rela,
 
 /* Group branch PLT relas at the front end of the array. */
 static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
-				      int numrels, Elf64_Word dstidx)
+				      int numrels)
 {
 	int i = 0, j = numrels - 1;
 
 	while (i < j) {
-		if (branch_rela_needs_plt(syms, &rela[i], dstidx))
+		if (branch_rela_needs_plt(syms, &rela[i]))
 			i++;
-		else if (branch_rela_needs_plt(syms, &rela[j], dstidx))
+		else if (branch_rela_needs_plt(syms, &rela[j]))
 			swap(rela[i], rela[j]);
 		else
 			j--;
@@ -280,10 +277,9 @@ static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
-	unsigned long core_plts = 0;
-	unsigned long init_plts = 0;
+	unsigned long plts = 0;
 	Elf64_Sym *syms = NULL;
-	Elf_Shdr *pltsec, *tramp = NULL, *init_tramp = NULL;
+	Elf_Shdr *pltsec, *tramp = NULL;
 	int i;
 
 	/*
@@ -292,21 +288,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	 */
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		if (!strcmp(secstrings + sechdrs[i].sh_name, ".plt"))
-			mod->arch.core.plt_shndx = i;
-		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".init.plt"))
-			mod->arch.init.plt_shndx = i;
+			mod->arch.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name,
 				 ".text.ftrace_trampoline"))
 			tramp = sechdrs + i;
-		else if (!strcmp(secstrings + sechdrs[i].sh_name,
-				 ".init.text.ftrace_trampoline"))
-			init_tramp = sechdrs + i;
 		else if (sechdrs[i].sh_type == SHT_SYMTAB)
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
 
-	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx) {
-		pr_err("%s: module PLT section(s) missing\n", mod->name);
+	if (!mod->arch.plt_shndx) {
+		pr_err("%s: module PLT section missing\n", mod->name);
 		return -ENOEXEC;
 	}
 	if (!syms) {
@@ -330,34 +321,20 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		 * sort branch relocations requiring a PLT by type, symbol index
 		 * and addend
 		 */
-		nents = partition_branch_plt_relas(syms, rels, numrels,
-						   sechdrs[i].sh_info);
+		nents = partition_branch_plt_relas(syms, rels, numrels);
 		if (nents)
 			sort(rels, nents, sizeof(Elf64_Rela), cmp_rela, NULL);
 
-		if (!module_init_layout_section(secstrings + dstsec->sh_name))
-			core_plts += count_plts(syms, rels, numrels,
-						sechdrs[i].sh_info, dstsec);
-		else
-			init_plts += count_plts(syms, rels, numrels,
-						sechdrs[i].sh_info, dstsec);
+		plts += count_plts(syms, rels, numrels, dstsec);
 	}
 
-	pltsec = sechdrs + mod->arch.core.plt_shndx;
-	pltsec->sh_type = SHT_NOBITS;
-	pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-	pltsec->sh_addralign = L1_CACHE_BYTES;
-	pltsec->sh_size = (core_plts  + 1) * sizeof(struct plt_entry);
-	mod->arch.core.plt_num_entries = 0;
-	mod->arch.core.plt_max_entries = core_plts;
-
-	pltsec = sechdrs + mod->arch.init.plt_shndx;
+	pltsec = sechdrs + mod->arch.plt_shndx;
 	pltsec->sh_type = SHT_NOBITS;
 	pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
 	pltsec->sh_addralign = L1_CACHE_BYTES;
-	pltsec->sh_size = (init_plts + 1) * sizeof(struct plt_entry);
-	mod->arch.init.plt_num_entries = 0;
-	mod->arch.init.plt_max_entries = init_plts;
+	pltsec->sh_size = (plts + 1) * sizeof(struct plt_entry);
+	mod->arch.plt_num_entries = 0;
+	mod->arch.plt_max_entries = plts;
 
 	if (tramp) {
 		tramp->sh_type = SHT_NOBITS;
@@ -366,12 +343,5 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
 	}
 
-	if (init_tramp) {
-		init_tramp->sh_type = SHT_NOBITS;
-		init_tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-		init_tramp->sh_addralign = __alignof__(struct plt_entry);
-		init_tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
-	}
-
 	return 0;
 }
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 39e7a50733a9..e0cbd499e4a9 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -450,7 +450,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
 					     AARCH64_INSN_IMM_26, me);
 			if (ovf == -ERANGE) {
-				val = module_emit_plt_entry(me, sechdrs, loc, &rel[i], sym);
+				val = module_emit_plt_entry(me, sechdrs, &rel[i], sym);
 				if (!val)
 					return -ENOEXEC;
 				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
@@ -499,17 +499,6 @@ static int module_init_ftrace_plt(const Elf_Ehdr *hdr,
 	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
 
 	mod->arch.ftrace_trampolines = plts;
-
-	s = find_section(hdr, sechdrs, ".init.text.ftrace_trampoline");
-	if (!s)
-		return -ENOEXEC;
-
-	plts = (void *)s->sh_addr;
-
-	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
-
-	mod->arch.init_ftrace_trampolines = plts;
-
 #endif
 	return 0;
 }
-- 
2.56.1.708.g77570a6a1d-goog


