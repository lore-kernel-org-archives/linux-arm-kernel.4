Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+rDRDmA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dl1kXYIR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=; b=R+rDRDmAt9Wpr2STHI9o/8GM3f
	O7GITfxPoiXlSlzVT+97myQC0Di20Vee6UcG/e6zXj60YkOet9A7H7KK8FE/OPfRykGioo5JSlrLi
	Y6CUjEyZdl4sBwCwE8EBWXxJSCIN/RW7aFPVL1jud3KVYjPMiK8TBSLRxe++7zjLqlyvMkFw84lm7
	CKe8hvYP4EdFSAwmmYD0dhMDg8G+ystqIrcLKr00a7Nxa486+llBSlqepYwMzSIPU9d6BXMXHt3EJ
	5A1L2YCAxOvUe47ZWiZIH1s7Ivs/cIsMmVNQI1ndEdh5VqTgQj2nTcrqHcMBifNrLShS4slw/XxyE
	eNxlSvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAv7-00000004YES-3a4g;
	Tue, 17 Nov 2026 04:35:49 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAub-00000004Xpp-43J9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:19 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3699462a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890116; x=1795494916; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=;
        b=Dl1kXYIRpwkAQxoeI6wRJ2p+bPO9nQBHuZXLoW2pebp/GJ9Dol+BUMifSpI8HFTNAo
         6Gptlzmi836QkrIjIdWcv4Hwf6nI4+KYxP/1aXG0yQG2vAWidxiZlx2ar9UhimzsMy3P
         XOXjmCrlDVY5xdUrhiaPtps0WN8ZevTehsEXwLAzPgAgvU504e2H/FoZs0PQKoYUVdTM
         Up0+BUkO7eZsJvVZtQF5Rh4AgKCRHEFmqtO5qTNrm+oAK2MzPh9baXDki7s4eCN9hkOZ
         pXKN2dF0SUEUG++Ekg8hni3KST+baU8OBlFydO+ASd0W1T+Ki5ou5jry6A4VLgQtP7Us
         MQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890116; x=1795494916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=;
        b=26ptaw9MkjTuVCAENlKwWIhZJh7uFdpDdZasuUXuwNYIOnLzMTDgc0vSQH5iShLXOG
         M6O/xoAzlC0iUVMTvMXlb9teDijpsMnUa900i4wZaDcED2Ag+HjEEg0yoLnzTE0VQqH0
         X+BRs1aBamns8pR2kAc4m6ESb5Q7rQUURSacQxgD/MMbqv+MF+a1m3GScmMZ+Zh4PmWf
         ZQlQANMv2U3NdKuvHxdXgm0kl9dbhijexRQVw184wNQKowdsmQ8ZSiTiBXHMVh8BFiiI
         ul1LwCuNdZJdJPa9FscY0q9Nzz1fD44HckRLdpS+bjbVeG/Gd9vqaF8nAsSHQSZ+eqlu
         lUZg==
X-Forwarded-Encrypted: i=1; AL+hErG6+2o3FeWEvhi12qr/IpvFFYXpZR0ZNVRN1fGtBGX5wZwFA8f5OAvEElri21ehTNfmTtPys2UzZaUHyRE47uyl@lists.infradead.org
X-Gm-Message-State: APuU4Z9z+dLVoD0Ma4DPxK7IUrwtQSlCcLU5OuxxwML9k/qj64D3sjJw
	9DIkCDKIW5yXBkrs63uXktBc2xKogRwOrOWjNm5TyjMA/wpTk1y8LNHV6SGB355Rfk6h/qgf4KC
	yCW26i22TBCpSIajiS7M0z6modQ==
X-Received: from plqw18.prod.google.com ([2002:a17:902:a712:b0:2e9:4ce7:154a])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f710:b0:2e8:93b1:49cc with SMTP id d9443c01a7336-2ee0dc2a5a9mr131239395ad.35.1794890115946;
 Mon, 16 Nov 2026 20:35:15 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:58 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-7-dylanbhatch@google.com>
Subject: [RFC PATCH 06/12] scripts/gen_lr_unwind: add --dump option to inspect
 .lr_unwind tables
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
X-CRM114-CacheID: sfid-20261116_203518_015706_2094FE37 
X-CRM114-Status: GOOD (  22.52  )
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

Add a --dump (-d) flag to scripts/gen_lr_unwind to dump .lr_unwind FDEs
and instruction ranges in human-readable format. Support dumping both
linked/post-processed objects containing .lr_unwind_fde and individual
relocatable .o files containing only .eh_frame.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/gen_lr_unwind.c | 268 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 257 insertions(+), 11 deletions(-)

diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index f65edd86ac78c..2058601ec6135 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -35,6 +35,8 @@ struct lr_unwind_ctx {
 	const Elf64_Shdr *eh_sec;
 	const Elf64_Shdr *rela_eh_sec;
 	const Elf64_Shdr *fde_sec;
+	const Elf64_Shdr *rela_fde_sec;
+	const Elf64_Shdr *ranges_sec;
 	unsigned int	symtab_shndx;
 
 	const Elf64_Rela *eh_relas;
@@ -67,6 +69,13 @@ struct elf_writer {
 	size_t		str_sz;
 };
 
+struct dump_sym {
+	u64		addr;
+	unsigned int	shndx;
+	bool		is_func;
+	const char	*name;
+};
+
 static int append_fde_entry(struct lr_unwind_ctx *ctx,
 			    const Elf64_Rela *eh_rela,
 			    s64 byte_off, u32 desc)
@@ -478,6 +487,225 @@ static int emit_lr_unwind_sections(const char *fname, struct lr_unwind_ctx *ctx,
 	return ret;
 }
 
+static int cmp_dump_sym(const void *a, const void *b)
+{
+	const struct dump_sym *sa = a, *sb = b;
+
+	if (sa->shndx != sb->shndx)
+		return sa->shndx < sb->shndx ? -1 : 1;
+	if (sa->addr != sb->addr)
+		return sa->addr < sb->addr ? -1 : 1;
+	if (sa->is_func != sb->is_func)
+		return sa->is_func ? 1 : -1;
+	return 0;
+}
+
+static const struct dump_sym *find_dump_sym(const struct dump_sym *syms,
+					    size_t nr_syms,
+					    unsigned int shndx, u64 addr)
+{
+	size_t lo = 0, hi = nr_syms;
+	const struct dump_sym *best = NULL;
+
+	while (lo < hi) {
+		size_t mid = lo + (hi - lo) / 2;
+		const struct dump_sym *s = &syms[mid];
+
+		if ((shndx && s->shndx < shndx) ||
+		    ((!shndx || s->shndx == shndx) && s->addr <= addr)) {
+			if (!shndx || s->shndx == shndx)
+				best = s;
+			lo = mid + 1;
+		} else {
+			hi = mid;
+		}
+	}
+
+	return best;
+}
+
+static const char *mode_name(enum lr_unwind_mode mode)
+{
+	switch (mode) {
+	case LR_UNWIND_LIVE:
+		return "LIVE";
+	case LR_UNWIND_FP:
+		return "FP";
+	case LR_UNWIND_SP:
+		return "SP";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static int dump_lr_unwind(struct lr_unwind_ctx *ctx, const Elf64_Shdr *shdrs,
+			  unsigned int shnum, const char *shstrtab)
+{
+	const struct lr_fde *fdes;
+	const Elf64_Rela *relas = NULL;
+	const lr_range_t *ranges = NULL;
+	size_t nr_fdes, nr_ranges = 0;
+	const Elf64_Sym *elf_syms = NULL;
+	size_t nr_elf_syms = 0;
+	const char *strtab = NULL;
+	struct dump_sym *dsyms = NULL;
+	size_t nr_dsyms = 0;
+	bool is_rel = (((const Elf64_Ehdr *)ctx->map)->e_type == ET_REL);
+
+	if (ctx->fde_sec) {
+		fdes = ctx->map + ctx->fde_sec->sh_offset;
+		nr_fdes = ctx->fde_sec->sh_size / sizeof(struct lr_fde);
+		if (ctx->rela_fde_sec)
+			relas = ctx->map + ctx->rela_fde_sec->sh_offset;
+		if (ctx->ranges_sec) {
+			ranges = ctx->map + ctx->ranges_sec->sh_offset;
+			nr_ranges = ctx->ranges_sec->sh_size / sizeof(lr_range_t);
+		}
+	} else {
+		if (!ctx->eh_sec || !ctx->rela_eh_sec || !ctx->symtab_shndx) {
+			fprintf(stderr, "No .lr_unwind_fde or .eh_frame section found\n");
+			return -1;
+		}
+		if (parse_eh_frame(ctx) < 0)
+			return -1;
+		fdes = ctx->fdes;
+		nr_fdes = ctx->nr_fdes;
+		relas = ctx->fde_relas;
+		ranges = ctx->ranges;
+		nr_ranges = ctx->nr_ranges;
+	}
+
+	if (ctx->symtab_shndx) {
+		const Elf64_Shdr *sym_sec = &shdrs[ctx->symtab_shndx];
+
+		elf_syms = ctx->map + sym_sec->sh_offset;
+		nr_elf_syms = sym_sec->sh_size / sizeof(Elf64_Sym);
+		strtab = ctx->map + shdrs[sym_sec->sh_link].sh_offset;
+
+		dsyms = malloc(nr_elf_syms * sizeof(*dsyms));
+		if (!dsyms)
+			return -1;
+
+		for (size_t i = 0; i < nr_elf_syms; i++) {
+			const Elf64_Sym *s = &elf_syms[i];
+			unsigned char type = ELF64_ST_TYPE(s->st_info);
+			const char *name = strtab + s->st_name;
+
+			if (s->st_shndx == SHN_UNDEF ||
+			    s->st_shndx >= SHN_LORESERVE)
+				continue;
+			if (type != STT_FUNC && type != STT_NOTYPE)
+				continue;
+			if (!name[0] || name[0] == '$' ||
+			    !strncmp(name, ".L", 2))
+				continue;
+
+			dsyms[nr_dsyms++] = (struct dump_sym){
+				.addr = s->st_value,
+				.shndx = is_rel ? s->st_shndx : 0,
+				.is_func = (type == STT_FUNC),
+				.name = name,
+			};
+		}
+
+		qsort(dsyms, nr_dsyms, sizeof(*dsyms), cmp_dump_sym);
+	}
+
+	for (size_t i = 0; i < nr_fdes; i++) {
+		const struct lr_fde *fde = &fdes[i];
+		u32 desc = fde->range_desc;
+		u32 sp_off = LR_FDE_SP_OFF_BYTES(desc);
+		lr_range_t inline_ranges[4];
+		const lr_range_t *r_list;
+		u32 r_cnt, total_insns = 0, insn_off = 0;
+
+		if (desc & LR_FDE_INLINE) {
+			lr_fde_unpack_inline(desc, inline_ranges);
+			r_list = inline_ranges;
+			r_cnt = 4;
+		} else {
+			u32 idx = LR_OOL_IDX(desc);
+
+			r_cnt = LR_OOL_COUNT(desc);
+			if (idx + r_cnt > nr_ranges) {
+				free(dsyms);
+				return -1;
+			}
+			r_list = &ranges[idx];
+		}
+
+		for (u32 j = 0; j < r_cnt; j++)
+			total_insns += LR_RANGE_LEN(r_list[j]);
+
+		printf("FDE[%zu] ", i);
+		if (relas && elf_syms) {
+			u32 sym_idx = ELF64_R_SYM(relas[i].r_info);
+
+			if (sym_idx < nr_elf_syms) {
+				const Elf64_Sym *sym = &elf_syms[sym_idx];
+				unsigned int shndx = sym->st_shndx;
+				u64 off = sym->st_value + relas[i].r_addend;
+
+				if (shndx < shnum && shndx < SHN_LORESERVE) {
+					const char *sec_name =
+						shstrtab + shdrs[shndx].sh_name;
+					const struct dump_sym *ds =
+						find_dump_sym(dsyms, nr_dsyms,
+							      shndx, off);
+
+					if (ds)
+						printf("%s+0x%lx <%s+0x%lx>",
+						       sec_name,
+						       (unsigned long)off,
+						       ds->name,
+						       (unsigned long)(off - ds->addr));
+					else
+						printf("%s+0x%lx", sec_name,
+						       (unsigned long)off);
+				}
+			}
+		} else if (ctx->fde_sec) {
+			u64 field_addr = ctx->fde_sec->sh_addr +
+					 i * sizeof(struct lr_fde);
+			u64 pc = field_addr + (s64)fde->start_offset;
+			const struct dump_sym *ds =
+				find_dump_sym(dsyms, nr_dsyms, 0, pc);
+
+			if (ds)
+				printf("0x%016lx <%s+0x%lx>", (unsigned long)pc,
+				       ds->name, (unsigned long)(pc - ds->addr));
+			else
+				printf("0x%016lx", (unsigned long)pc);
+		}
+
+		if (desc & LR_FDE_INLINE)
+			printf(" (len=0x%x, inline, sp_off=0x%x):\n",
+			       total_insns << 2, sp_off);
+		else
+			printf(" (len=0x%x, ool[%u..%u), sp_off=0x%x):\n",
+			       total_insns << 2, LR_OOL_IDX(desc),
+			       LR_OOL_IDX(desc) + r_cnt, sp_off);
+
+		for (u32 j = 0; j < r_cnt; j++) {
+			u32 len = LR_RANGE_LEN(r_list[j]);
+			enum lr_unwind_mode mode = LR_RANGE_MODE(r_list[j]);
+
+			if (!len)
+				continue;
+			printf("  [+0x%04x..+0x%04x) %4u insns  %s",
+			       insn_off << 2, (insn_off + len) << 2,
+			       len, mode_name(mode));
+			if (mode == LR_UNWIND_SP)
+				printf(" (sp+0x%x)", sp_off);
+			printf("\n");
+			insn_off += len;
+		}
+	}
+
+	free(dsyms);
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	struct lr_unwind_ctx ctx = { 0 };
@@ -485,22 +713,29 @@ int main(int argc, char *argv[])
 	const Elf64_Ehdr *ehdr;
 	const Elf64_Shdr *shdrs;
 	const char *shstrtab;
+	const char *fname;
+	bool dump = false;
 	struct stat sb;
 	int fd, ret = 1;
 
-	if (argc != 2) {
-		fprintf(stderr, "Usage: %s <file>\n", argv[0]);
+	if (argc == 3 && (!strcmp(argv[1], "--dump") || !strcmp(argv[1], "-d"))) {
+		dump = true;
+		fname = argv[2];
+	} else if (argc == 2 && argv[1][0] != '-') {
+		fname = argv[1];
+	} else {
+		fprintf(stderr, "Usage: %s [--dump] <file>\n", argv[0]);
 		return 1;
 	}
 
-	fd = open(argv[1], O_RDONLY);
+	fd = open(fname, O_RDONLY);
 	if (fd < 0) {
 		fprintf(stderr, "gen_lr_unwind: cannot open %s: %s\n",
-			argv[1], strerror(errno));
+			fname, strerror(errno));
 		return 1;
 	}
 	if (fstat(fd, &sb) < 0 || (size_t)sb.st_size < sizeof(Elf64_Ehdr)) {
-		fprintf(stderr, "gen_lr_unwind: invalid file %s\n", argv[1]);
+		fprintf(stderr, "gen_lr_unwind: invalid file %s\n", fname);
 		close(fd);
 		return 1;
 	}
@@ -510,7 +745,7 @@ int main(int argc, char *argv[])
 	close(fd);
 	if (ctx.map == MAP_FAILED) {
 		fprintf(stderr, "gen_lr_unwind: mmap failed on %s: %s\n",
-			argv[1], strerror(errno));
+			fname, strerror(errno));
 		return 1;
 	}
 
@@ -518,10 +753,12 @@ int main(int argc, char *argv[])
 	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) ||
 	    ehdr->e_ident[EI_CLASS] != ELFCLASS64 ||
 	    ehdr->e_ident[EI_DATA] != ELFDATA2LSB ||
-	    ehdr->e_type != ET_REL ||
+	    (!dump && ehdr->e_type != ET_REL) ||
+	    (dump && ehdr->e_type != ET_REL && ehdr->e_type != ET_EXEC &&
+	     ehdr->e_type != ET_DYN) ||
 	    ehdr->e_machine != EM_AARCH64) {
-		fprintf(stderr, "gen_lr_unwind: %s is not an AArch64 ET_REL ELF\n",
-			argv[1]);
+		fprintf(stderr, "gen_lr_unwind: unsupported ELF file %s\n",
+			fname);
 		goto out;
 	}
 
@@ -536,6 +773,10 @@ int main(int argc, char *argv[])
 
 		if (!strcmp(name, ".lr_unwind_fde"))
 			ctx.fde_sec = &shdrs[i];
+		else if (!strcmp(name, ".rela.lr_unwind_fde"))
+			ctx.rela_fde_sec = &shdrs[i];
+		else if (!strcmp(name, ".lr_unwind_ranges"))
+			ctx.ranges_sec = &shdrs[i];
 		else if (!strcmp(name, ".eh_frame") ||
 			 !strcmp(name, ".init.eh_frame"))
 			ctx.eh_sec = &shdrs[i];
@@ -546,6 +787,11 @@ int main(int argc, char *argv[])
 			ctx.symtab_shndx = i;
 	}
 
+	if (dump) {
+		ret = dump_lr_unwind(&ctx, shdrs, shnum, shstrtab) ? 1 : 0;
+		goto out;
+	}
+
 	if (ctx.fde_sec) {
 		ret = 0;
 		goto out;
@@ -558,11 +804,11 @@ int main(int argc, char *argv[])
 
 	if (!parse_eh_frame(&ctx) &&
 	    (!ctx.nr_fdes ||
-	     !emit_lr_unwind_sections(argv[1], &ctx, shnum, shstrndx)))
+	     !emit_lr_unwind_sections(fname, &ctx, shnum, shstrndx)))
 		ret = 0;
 	else
 		fprintf(stderr, "gen_lr_unwind: failed to generate .lr_unwind for %s\n",
-			argv[1]);
+			fname);
 
 out:
 	if (ctx.map)
-- 
2.56.0.679.gc527c65306-goog


