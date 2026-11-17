Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578AE606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zrJfwECX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ie75mc/d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=; b=zrJfwECXL0FaA8/dyQHfRYnNM6
	AgE3IsHZPL7g6AYIhAYmROgN1pcBjAtjybZbXV/6r3pktLaKLEPKXx2l4CkmeZHAWrjhyDvuT3LK8
	Q7M/IoWrCrEjSPBFwKRJmikLbbWCEjX3d+hXqGM8sX6wM8F+/IXhhMtuH14JKQu9xFbTWhJA7PKNm
	PN759DGagnCXBH+Xy/noQInMv7zQULkeg81E4PHZzYZgFtzHJE45SvKcmWKTh/a1J5qCLHOdZn1WO
	FJ3TXs5/bW7/etpxnWp5A6tZffjixaYTZar8Vz0MEOsqZXr2aGsV+StsHK3a5vb+nIDpRsUjJ1sUO
	aCJeQX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAuc-00000004Xrc-2nNc;
	Tue, 17 Nov 2026 04:35:18 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAua-00000004Xog-07i3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:17 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so3462474a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890115; x=1795494915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=;
        b=Ie75mc/dE4NR9EwUAYeJCnCSEx8tDABnVk8ngUpYSrD4RBBKJG9KpfpVVedkOEdEm3
         IYsJ9EKljiEl75k9sJ+4rBYMZ8ptzqjK3DoVmLOPQcVERfgGCquy6oL7gLpiDAH8nRnp
         +1PjcGnVCj4jT3fqMASsD1mHqhPXSmaTfOHbzSyKhn6od1eqps0tsiX7xtxiYU9gSClQ
         iexjWKN7symuKcCHuK2tMJwoSNGLJUE+8AqSohs2MxS6b7Bblu2/65cfCHsxFAcy6Bge
         9+KlOnA1kCwvOtrJBETRzwEM913R6h8rddXJfFBtVMwhh5imgizZa0DC+6rUGqCol7A1
         +okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890115; x=1795494915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=;
        b=LnF9WuicxanUI67807bs885V90TYYcBTm6PWhii9V+v5D1L9NyJYPu4Ub/WXFJJJi1
         dO4TxFYnBqIe52bvcF2lCxvOHIBcAcHEQdPKeyigJKkYEo5pGTlqKVUVyvl3TaDIStsD
         Znzfsk48KLezrpTyFHiOIUy1UeS9h22FnuhpODJpqUJW4gAIQ6qsx+xDEk9lgcDnyl40
         tMgapHtFuDDtF4X6MTqIiWRBGyniudSg9j4mTf6LCBQZl7ivMNLk89HEp68aSf0Cg1OD
         Pr3UT6pJZnDpcbfvPL51RWwbVm0U4ieugBEGNz/gVaGk7OGcH9tqmxjlwCebcCgr+gz+
         /WmQ==
X-Forwarded-Encrypted: i=1; AL+hErGKrMPyXNfbFuFvQFE84cUQvoGHhnn+XiemQPdUs1kBHWPdN1CRycF2gudQKLs323KT9oa+hnUhxcnHfgNAIzvj@lists.infradead.org
X-Gm-Message-State: APuU4Z+10Zly+USFQfhKvZAZ66TH2OTNRjmXlO6N77aMrlkW3pFKP0NS
	tgcdZBMnaAtXRQiHhYCJPsQktxxqf8qe8rQJnyqyKv1Dink+FerQDILuL3Ra/Vi2MsE6pM16Thd
	fWQ3XPjxYZ4WQhenlfSaZXbSQiw==
X-Received: from pjbrs16.prod.google.com ([2002:a17:90b:2b90:b0:3ae:bae0:3179])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:580c:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b1b0b50028mr12486450a91.54.1794890114431;
 Mon, 16 Nov 2026 20:35:14 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:57 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-6-dylanbhatch@google.com>
Subject: [RFC PATCH 05/12] scripts/gen_lr_unwind: emit .lr_unwind_fde and .lr_unwind_ranges
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
X-CRM114-CacheID: sfid-20261116_203516_102412_ACA52159 
X-CRM114-Status: GOOD (  16.74  )
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

Implement emit_lr_unwind_sections() in scripts/gen_lr_unwind to append
.lr_unwind_fde, .rela.lr_unwind_fde, and .lr_unwind_ranges sections to
the target ELF relocatable object and update its .shstrtab and section
header table.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/gen_lr_unwind.c | 140 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 134 insertions(+), 6 deletions(-)

diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index 118f995b2c48b..f65edd86ac78c 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -54,6 +54,19 @@ struct lr_unwind_ctx {
 	size_t		cap_runs;
 };
 
+#define LR_SHSTRTAB_EXTRA \
+	(sizeof(".lr_unwind_fde") + sizeof(".rela.lr_unwind_fde") + \
+	 sizeof(".lr_unwind_ranges"))
+
+struct elf_writer {
+	int		fd;
+	u64		off;
+	Elf64_Shdr	*shdrs;
+	unsigned int	shnum;
+	char		*shstrtab;
+	size_t		str_sz;
+};
+
 static int append_fde_entry(struct lr_unwind_ctx *ctx,
 			    const Elf64_Rela *eh_rela,
 			    s64 byte_off, u32 desc)
@@ -338,16 +351,131 @@ static int parse_eh_frame(struct lr_unwind_ctx *ctx)
 	return ret ? -1 : 0;
 }
 
+static u64 align_up(u64 val, u64 align)
+{
+	return (val + align - 1) & ~(align - 1);
+}
+
+static int pwrite_all(int fd, const void *buf, size_t count, off_t offset)
+{
+	const u8 *p = buf;
+
+	while (count > 0) {
+		ssize_t n = pwrite(fd, p, count, offset);
+
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		p += n;
+		count -= n;
+		offset += n;
+	}
+	return 0;
+}
+
+static int append_section(struct elf_writer *w, const char *name,
+			  const void *data, u64 size, u64 align,
+			  u32 type, u64 flags, u32 link, u32 info, u64 entsize)
+{
+	size_t name_len = strlen(name) + 1;
+	u64 sec_off = align_up(w->off, align);
+
+	if (size && pwrite_all(w->fd, data, size, sec_off) < 0)
+		return -1;
+
+	memcpy(w->shstrtab + w->str_sz, name, name_len);
+	w->shdrs[w->shnum++] = (Elf64_Shdr){
+		.sh_name	= w->str_sz,
+		.sh_type	= type,
+		.sh_flags	= flags,
+		.sh_offset	= sec_off,
+		.sh_size	= size,
+		.sh_link	= link,
+		.sh_info	= info,
+		.sh_addralign	= align,
+		.sh_entsize	= entsize,
+	};
+	w->str_sz += name_len;
+	w->off = sec_off + size;
+	return 0;
+}
+
 static int emit_lr_unwind_sections(const char *fname, struct lr_unwind_ctx *ctx,
 				   unsigned int orig_shnum,
 				   unsigned int shstrndx)
 {
-	/* TODO: Emit .lr_unwind_fde, .rela.lr_unwind_fde, and .lr_unwind_ranges */
-	(void)fname;
-	(void)ctx;
-	(void)orig_shnum;
-	(void)shstrndx;
-	return 0;
+	const Elf64_Shdr *orig_shdrs =
+		ctx->map + ((const Elf64_Ehdr *)ctx->map)->e_shoff;
+	size_t orig_str_sz = orig_shdrs[shstrndx].sh_size;
+	Elf64_Ehdr ehdr = *(const Elf64_Ehdr *)ctx->map;
+	struct elf_writer w = {
+		.fd = -1,
+		.shnum = orig_shnum,
+		.str_sz = orig_str_sz,
+		.shdrs = calloc(orig_shnum + 3, sizeof(Elf64_Shdr)),
+		.shstrtab = malloc(orig_str_sz + LR_SHSTRTAB_EXTRA),
+	};
+	unsigned int fde_shndx = orig_shnum;
+	int ret = -1;
+
+	if (!w.shdrs || !w.shstrtab)
+		goto out;
+
+	memcpy(w.shdrs, orig_shdrs, orig_shnum * sizeof(Elf64_Shdr));
+	memcpy(w.shstrtab, ctx->map + orig_shdrs[shstrndx].sh_offset,
+	       orig_str_sz);
+
+	w.off = (ehdr.e_shoff + (u64)orig_shnum * sizeof(Elf64_Shdr) ==
+		 ctx->map_size) ? ehdr.e_shoff : ctx->map_size;
+
+	munmap((void *)ctx->map, ctx->map_size);
+	ctx->map = NULL;
+
+	w.fd = open(fname, O_RDWR);
+	if (w.fd < 0)
+		goto out;
+
+	if (append_section(&w, ".lr_unwind_fde", ctx->fdes,
+			   ctx->nr_fdes * sizeof(*ctx->fdes), 4,
+			   SHT_PROGBITS, SHF_ALLOC, 0, 0, 0) < 0 ||
+	    append_section(&w, ".rela.lr_unwind_fde", ctx->fde_relas,
+			   ctx->nr_fdes * sizeof(*ctx->fde_relas), 8,
+			   SHT_RELA, SHF_INFO_LINK, ctx->symtab_shndx,
+			   fde_shndx, sizeof(Elf64_Rela)) < 0 ||
+	    (ctx->nr_ranges &&
+	     append_section(&w, ".lr_unwind_ranges", ctx->ranges,
+			    ctx->nr_ranges * sizeof(*ctx->ranges), 2,
+			    SHT_PROGBITS, SHF_ALLOC, 0, 0, 0) < 0))
+		goto out;
+
+	if (pwrite_all(w.fd, w.shstrtab, w.str_sz, w.off) < 0)
+		goto out;
+	w.shdrs[shstrndx].sh_offset = w.off;
+	w.shdrs[shstrndx].sh_size = w.str_sz;
+	w.off = align_up(w.off + w.str_sz, 8);
+
+	if (ehdr.e_shnum == SHN_UNDEF || w.shnum >= SHN_LORESERVE) {
+		ehdr.e_shnum = SHN_UNDEF;
+		w.shdrs[0].sh_size = w.shnum;
+	} else {
+		ehdr.e_shnum = w.shnum;
+	}
+	ehdr.e_shoff = w.off;
+
+	if (pwrite_all(w.fd, w.shdrs, w.shnum * sizeof(Elf64_Shdr), w.off) < 0 ||
+	    pwrite_all(w.fd, &ehdr, sizeof(ehdr), 0) < 0 ||
+	    ftruncate(w.fd, w.off + w.shnum * sizeof(Elf64_Shdr)) < 0)
+		goto out;
+
+	ret = 0;
+out:
+	if (w.fd >= 0)
+		close(w.fd);
+	free(w.shstrtab);
+	free(w.shdrs);
+	return ret;
 }
 
 int main(int argc, char *argv[])
-- 
2.56.0.679.gc527c65306-goog


