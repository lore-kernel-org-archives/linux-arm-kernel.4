Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB86606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PwI2vWbA;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mjFYgez9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=; b=PwI2vWbAtQlMaZSfgPD2eR5tc2
	0fFbFgxNZBZAg2aJVVq7kiXP+5RB0gvaYzRFBxDWoErakmyQinOGzVpS15fySEQNpiqRyYMuyzZV4
	mSrbWg6HbhOqL1GOhDu4qfrAWQhmMGO/doNzq5P//vuPnJ80AlPoMO6KvzCDlIyd9df+vODrUNi9a
	6Lf+wd/kL+f9UUyjaXzS9mjmM9bXwBji/5DcTdfjVeFDFjHzHkdJBn+GOKgKxGVQailKVlJzQrNi5
	eJYvnjkukYQGtWlIl0dn6SvH1ajE6o3FfKWqLeUHJCD7r9mVD6jVJlATSOfxUhR1GJTHFLRFzTUFd
	ySNFDoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bv-00000004N2v-30ZS;
	Tue, 17 Nov 2026 02:07:51 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bC-00000004MLh-3wyh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:08 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-571bc0b66d7so2832133b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881225; x=1795486025; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=;
        b=mjFYgez92Yj/M8dxXS3G44DZPJ+muRjMH+gLTpMIsCTkvNtVHWbHabyr4kWKgqJ1/w
         hNj6hgZ4JRpNSizjUzq994lhfOyqczvQK1mELiD3dFQPpXp04ddYTJsR/A1l6po5ZlCh
         5JspyjrZf0xlgaLpsG/bKjGN1DUau+Gk24imfKvddTyTKBZ99j8lGCNCgaGogUlUUTD9
         w4dFsVQVnByKNsJTfuwDAHNSVbh74dr2yb9zsB7axgc8XJQKy/EGhdsXQPLt/1i9lyHb
         Mf8LlwhLlyjKxTAGhneSpDd4/u9BuhjdBqYkuMZPABtBy5sGU55oKO9VYLc85BzyiKWu
         aKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881225; x=1795486025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=;
        b=YxOruIyYWCdCtmoYfqaB9dMeKsnKp0+XXF4NHFmtd1ZnCe5AUxT3fUkvpPSEJPaOWr
         h3+Ol+Xb6mmW9/UyMr8ynbJhaMHs3sg2hl2OwrFZyeREEnrQIaekoLIY3Qf5QQPkrIYO
         iKDV0ewTJHUUfiQINV2Prc13JCR7HmEAifGW/8HOkBKIxznJO8jYxleyQHnCJHTB2btR
         9k3un5MixeQ6Cp/vpG4M/L8qWyqwBjeLYGUASJ+m4KB9XdAMLz4XpyuTRzdNzW+dMI++
         iDMD2ZGDVrr6wbr5eySLqaamvxbIGY4PuOZqvn1k+htEPB7Pjp2EjdIuSF0TgCFJqxvf
         3EDw==
X-Forwarded-Encrypted: i=1; AL+hErGr7Mag4RJVzF13wI9cSHFtRFOhacM4SDOeMb5uDNrhz7UIVMSFw9h3j3eggCkf26nthhQ7ps0xFezJm9qWPSXu@lists.infradead.org
X-Gm-Message-State: APuU4Z88GkeHwWjeBd81OzjYwS/P7uaxvIhsfpLN0WfkudT3eSiUXkeC
	9bek+kigRe3H7ktty69Qy4XRqioLlMFnrszIqK0LdGco5/q5rK06etY86Q9Q6vRKQt4uJfJqELG
	jTXTeDltdVzG8uBFUVkpl0B3T5A==
X-Received: from ilbek7-n1.prod.google.com ([2002:a05:6e02:4f07:10b0:53d:d5c4:1e46])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr7148123b6e.6.1794881224996;
 Mon, 16 Nov 2026 18:07:04 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:45 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-9-dylanbhatch@google.com>
Subject: [PATCH v9 08/11] sframe: Add .sframe validation option
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
X-CRM114-CacheID: sfid-20261116_180707_034948_21F05E43 
X-CRM114-Status: GOOD (  17.92  )
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

Add a debug feature to validate vmlinux and module .sframe sections at
boot and module load time rather than on demand during unwinding.

[ Jens Remus: Add support for SFrame V3.  Add support for PC-relative
FDE function start offset.  Adjust to rename of struct sframe_fre to
sframe_fre_internal. ]

[ Dylan Hatch: Adapt this patch for in-kernel sframe sections. ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Update CONFIG_SFRAME_VALIDATION help text and commit message
   for in-kernel vmlinux and module .sframe validation, and move
   <asm/unwind_sframe.h> include to "arm64/sframe: Validate IP addresses".
---
 arch/Kconfig           | 19 +++++++++++
 kernel/unwind/sframe.c | 77 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index d2fc68e7023db..255f419f3f20e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -539,6 +539,25 @@ config HAVE_UNWIND_KERNEL_SFRAME
 	  practice, this can provide more reliable stacktrace results than
 	  unwinding with frame pointers alone.
 
+config SFRAME_VALIDATION
+	bool "Enable .sframe section debugging"
+	depends on UNWIND_SFRAME_LOOKUP
+	depends on DYNAMIC_DEBUG
+	help
+	  When initializing the .sframe section for vmlinux or a module,
+	  validate the entire section immediately rather than on demand.
+
+	  This is a debug feature which is helpful for rooting out .sframe
+	  section issues.  If the .sframe section is corrupt, SFrame unwinding
+	  for that object will be disabled immediately with a warning, and more
+	  information provided in dynamic printks.
+
+	  This adds overhead at boot and module load time due to validating
+	  every FDE and FRE in the .sframe section.  Not recommended for
+	  general use.
+
+	  If unsure, say N.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 4d804f2ad9dde..2f491abc9f84c 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -509,6 +509,73 @@ noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 }
 NOKPROBE_SYMBOL(sframe_find);
 
+#ifdef CONFIG_SFRAME_VALIDATION
+
+static int sframe_validate_section(struct sframe_section *sec)
+{
+	unsigned long prev_ip = 0;
+	unsigned int i;
+
+	for (i = 0; i < sec->num_fdes; i++) {
+		struct sframe_fre_internal *fre, *prev_fre = NULL;
+		unsigned long ip, fre_addr;
+		struct sframe_fde_internal fde;
+		struct sframe_fre_internal fres[2];
+		bool which = false;
+		unsigned int j;
+		int ret;
+
+		ret = __read_fde(sec, i, &fde);
+		if (ret) {
+			dbg_sec(sec, "__read_fde(%u) failed\n", i);
+			return ret;
+		}
+
+		ip = fde.func_addr;
+		if (ip <= prev_ip) {
+			dbg_sec(sec, "FDE %u not sorted\n", i);
+			return -EFAULT;
+		}
+		prev_ip = ip;
+
+		fre_addr = sec->fres_start + fde.fres_off;
+		for (j = 0; j < fde.fres_num; j++) {
+			int ret;
+
+			fre = which ? fres : fres + 1;
+			which = !which;
+
+			ret = __read_fre(sec, &fde, fre_addr, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre(%u) failed\n", i, j);
+				return ret;
+			}
+			ret = __read_fre_datawords(sec, &fde, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre_datawords(%u) failed\n", i, j);
+				return ret;
+			}
+
+			fre_addr += fre->size;
+
+			if (prev_fre && fre->ip_off <= prev_fre->ip_off) {
+				dbg_sec(sec, "FDE %u: FRE %u not sorted\n", i, j);
+				return -EFAULT;
+			}
+
+			prev_fre = fre;
+		}
+	}
+
+	return 0;
+}
+
+#else /*  !CONFIG_SFRAME_VALIDATION */
+
+static int sframe_validate_section(struct sframe_section *sec) { return 0; }
+
+#endif /* !CONFIG_SFRAME_VALIDATION */
+
 static int sframe_read_header(struct sframe_section *sec)
 {
 	unsigned long header_end, fdes_start, fdes_end, fdes_size, fres_start, fres_end;
@@ -569,6 +636,11 @@ void __init init_sframe_table(void)
 		return;
 	}
 
+	if (sframe_validate_section(&kernel_sfsec)) {
+		pr_warn("invalid vmlinux SFrame section\n");
+		return;
+	}
+
 	sframe_init = true;
 	dbg_print_header(&kernel_sfsec);
 }
@@ -629,6 +701,11 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 	}
 	sframe_sort_fdes(sec);
 
+	if (sframe_validate_section(sec)) {
+		pr_warn("invalid SFrame section in module %s\n", mod->name);
+		return;
+	}
+
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
 	dbg_print_header(sec);
-- 
2.56.0.679.gc527c65306-goog


