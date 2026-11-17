Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E916606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wFMH6g6v;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=na71AWj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=; b=wFMH6g6vOHGzJAbkz+GhMSD9gQ
	S1V6dWCzKL/JqRvzmKYyIKDy570JHtbiIp7QkapsmUK2r0c62VNzv4+rkPI49TFgkmmxw3vvStUhp
	BPiUQ2PewZrsJQPB/GAQvBsYhDbtHN4C2AdWM0Kd25ukoXYE+LQPwCmL48PTVC8kzCIpzpUsV0ahb
	PqRXP1DukbWenEV78J9G1asH+6vr7bDDVfAOxmP4X9b4Aeq6unxbt4fjgxS71NsbOde+0wx8Y3dse
	drOHScvZgOmP38Kj/yR19REMryAiBcwV3KRbhB5Ppn8WbZ7ZtTeSFmR+9ZHoVmebzu6fv37tETlcN
	4RbpgTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAv7-00000004YEg-44o4;
	Tue, 17 Nov 2026 04:35:49 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAud-00000004XrV-20Pn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:20 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2ed08904845so27012775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890118; x=1795494918; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=na71AWj352XEI/EQAEKVnx4c1n/FPRbxK6b8t05p9KMA/y5R8hNcWpdk//0kjE1pCR
         pHtpalUhQl3k8bdNV5BP3Nt8jMFfl1dX74hFygwUEkCPLfbKFdPVeic99eV4AXCztD0O
         McYZGV2Ajx+aMMjBFip95YBp+FkIcIY3BGNIJqC98zevUKqQchmnxoIV0bLr6DfWOjmI
         OW9xGkpNTjyoqm8cQlDkPCaiB0EVgymgUzp+ulimVHoSy7SCta4W5LePwzkI1t1Y0xF1
         5wCNCu0ilWV4vjYR74MyYkV6FQ2zjvWt6CZv93v8BvrnErXlv2Zpe6WUlT00FqJYnvXr
         fqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890118; x=1795494918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=buUfawiYIKmEZanC/glySAH0tLy59rUSCfYvaDi3vgk6jm5F3VPpTZ06aPd4Jq0ZMA
         5N6PkLfQh4Mh5EUA/Vb2H8M25qvT3crPur2DSSHT9h1GgdDs6jLfGnB428+tW90M74xg
         CGe8/PYh/tsiRrCw7chl7qxvoQqwW1+yM8dn+kWoBXkoZRDiVEuq/Ea6oBZGpkgKkD63
         kbF28NIbtiexkDsDRy3lOlTPtTgUN3PnI7bTmiLbNg73THktY7a9iV5CMhQDIvxj7OHf
         4jdvBXEsTRrDR4/r9a97kjlT1okwaQay/M/GSIsiH1u6E/bWatsrO+wmTxhtBpCjcAYb
         9U3g==
X-Forwarded-Encrypted: i=1; AL+hErH/ARSBGkgYA/ZghoBE26kJKe6tP957+7RYVcb9Vmej2hdtHjJX/7JPSI9Hsc1KSZn/tFf6XKAWXIH6pSIYjefW@lists.infradead.org
X-Gm-Message-State: APuU4Z/I/OKYAiLOuyoggyetgsROuDhz841chMPwuDtiKAZ3X8sZJ7Yi
	cx91IW4qL+y5vaZ5LpQafMNRCzd6CuUgMg2iCYOaMYvfDDB3H0XUkj0oq72sb+VykKpV987OtgA
	tDU7uB5E2/oAXQxrD+cBG19c3Uw==
X-Received: from plbju12.prod.google.com ([2002:a17:903:428c:b0:2e8:44b9:5c18])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b50:b0:2ee:1f51:32ea with SMTP id d9443c01a7336-2ee1f513339mr100649615ad.25.1794890117329;
 Mon, 16 Nov 2026 20:35:17 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:59 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-8-dylanbhatch@google.com>
Subject: [RFC PATCH 07/12] scripts/sorttable: sort .lr_unwind_fde by start_offset
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
X-CRM114-CacheID: sfid-20261116_203519_523577_6700CAFE 
X-CRM114-Status: GOOD (  14.98  )
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

Normalize the PC-relative start_offset word of each 8-byte struct lr_fde
entry in .lr_unwind_fde, qsort by virtual address, and denormalize back
to PC-relative offsets without modifying range_desc.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/sorttable.c | 50 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c42512..38495c39e404b 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -600,6 +600,37 @@ static void get_mcount_loc(struct elf_mcount_loc *emloc, Elf_Shdr *symtab_sec,
 static inline int parse_symbols(const char *fname) { return 0; }
 #endif
 
+static int compare_relative_table(const void *a, const void *b)
+{
+	int32_t av = (int32_t)elf_parser.r(a);
+	int32_t bv = (int32_t)elf_parser.r(b);
+
+	if (av < bv)
+		return -1;
+	if (av > bv)
+		return 1;
+	return 0;
+}
+
+static void sort_lr_unwind_fde(char *fde_image, int image_size)
+{
+	int i;
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) + i, loc);
+	}
+
+	qsort(fde_image, image_size / 8, 8, compare_relative_table);
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) - i, loc);
+	}
+}
+
 static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
@@ -609,6 +640,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
 	Elf_Shdr *extab_sec = NULL;
+	Elf_Shdr *lr_fde_sec = NULL;
 	Elf_Shdr *string_sec;
 	Elf_Sym *sym;
 	const Elf_Sym *symtab;
@@ -656,6 +688,8 @@ static int do_sort(Elf_Ehdr *ehdr,
 		idx = shdr_name(shdr);
 		if (!strcmp(secstrings + idx, "__ex_table"))
 			extab_sec = shdr;
+		if (!strcmp(secstrings + idx, ".lr_unwind_fde"))
+			lr_fde_sec = shdr;
 		if (!strcmp(secstrings + idx, ".symtab"))
 			symtab_sec = shdr;
 		if (!strcmp(secstrings + idx, ".strtab"))
@@ -759,6 +793,10 @@ static int do_sort(Elf_Ehdr *ehdr,
 		      extable_ent_size, compare_extable);
 	}
 
+	if (lr_fde_sec)
+		sort_lr_unwind_fde((char *)ehdr + shdr_offset(lr_fde_sec),
+				   shdr_size(lr_fde_sec));
+
 	/* find the flag main_extable_sort_needed */
 	sym_start = (void *)ehdr + shdr_offset(symtab_sec);
 	sym_end = sym_start + shdr_size(symtab_sec);
@@ -833,18 +871,6 @@ static int do_sort(Elf_Ehdr *ehdr,
 	return rc;
 }
 
-static int compare_relative_table(const void *a, const void *b)
-{
-	int32_t av = (int32_t)elf_parser.r(a);
-	int32_t bv = (int32_t)elf_parser.r(b);
-
-	if (av < bv)
-		return -1;
-	if (av > bv)
-		return 1;
-	return 0;
-}
-
 static void sort_relative_table(char *extab_image, int image_size)
 {
 	int i = 0;
-- 
2.56.0.679.gc527c65306-goog


