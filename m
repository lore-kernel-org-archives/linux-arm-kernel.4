Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uyz1HCt5;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XNbxXgTN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ryjYlWkznW2DKOHX8qcuICFEasi2tArbHOaOO+BeZrg=; b=Uyz1HCt59W4HiE1Z7f6alICa0W
	DJE7Nq7BumUcB7cEI411Xw/hthergHkMY0UrFSE7KenuCQbN+Y4S62Y4/1MRgaGsZ575KVmy18YZY
	MTd2Hu8gLYLBx2JRw5WI3hPPOgseHyIVdLSXfQ0V9U2Ohv+rfIVRbR4vrrZU/XF21xnhfzAwVXMdn
	SoeI40v0S9GaXLN6CYA7D9FzXhzGY/QEjqyKzm8nluVufUCmqZIik6U2nYW2mGtnOjwtwjcAJ4wE4
	AcQf/rsG/zQTLrdXryvLaO0Hr2+isy2UTUjM27NNDfLB27CusnwJC015HQgbpyPl/wArokV1wYMIJ
	lITx8Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T8-0000000CkoI-0Ze1;
	Thu, 19 Nov 2026 16:58:42 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5T6-0000000Ckmo-0gSQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:58:41 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so21050755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107518; x=1795712318; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryjYlWkznW2DKOHX8qcuICFEasi2tArbHOaOO+BeZrg=;
        b=XNbxXgTNZznSIzuQTOkgt9ToDJG9EXsFj2doj3Q1y1kcGJ/tmD2Fb2fH2sBGz+cpTK
         kv0SXQ//BT1WpT6/k2hleOz3hJwLZguh/zFy+w5J9YReqaFwnrkTMXD212m7b1h72Fnl
         mwQ085M35xfA1GxgrWrXOjQDZuITaWTtJkpI0QOPrSJfGynE4liySjmeffHg296OVtvT
         uNEjdEJuu6X8xHWoOqsmkgpmuPZHH6fjJKE6anaalYCWH2hSztGHC6g8mDlcV0Sk3GvU
         b+A0rLiegGyOKNRLtoDaBwtB8s1QKoY+bu2CoTZ50UO6o55ZAovjnFwWLSE2uqeD8kWR
         AUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107518; x=1795712318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryjYlWkznW2DKOHX8qcuICFEasi2tArbHOaOO+BeZrg=;
        b=aBOYs+MFxuOTShLY+kNUejs3Payttzy30IM4zlq1olQ2edwsXPQ2V84dk8ZSoHLC2q
         A7Y5l3RYkN0yX74k5WGrHCHEjkwUp6XzueD0ZwEhYJFqmNumJiXEls0VlfVNqEZA7dcL
         nfaLeCBMslsGApjK7zLD2Ie9NGITBei2A0KTBhN27RzRL796WFMdWMpMTI5d2rUBlOWS
         pFt8c/U/kLKRE7gjC5RjwJsybZeDs0aUxrlU/9BDZhXc6/1mox2ssEcA3c3zjc86KABD
         GJUlEQn9Coo8R7B33KqTXaKNxQE7vpzaUenSy94bRqucV5OjgDSDlW+sK8cc+xjWhkOh
         xxzQ==
X-Gm-Message-State: APuU4Z8GcOMFfHs1YzGpdWMcAQ4T2yVOQWUEJk8o/kquNl+IVfYl4aSt
	FlaZrFdqxBV1+1dojRwhr8gSL0t5Ea4NbazXZbiMc94UYGjV+Z4od0zXxZRjXGaxnhgfXZ2wKwJ
	3KXYdOsVoz1x1N4qyEmsd4+8Dc6KDl9tDETNL3ejKrt6BEIV9q/VQVrLl5sr2d2P/Z/9u58H3CW
	XO6+0DJQfl4iiY1J/GOmyDXaINlWYSbvdmSut+ZvYnQfct
X-Received: from wmco21.prod.google.com ([2002:a05:600c:a315:b0:4bb:5ea0:79c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4515:b0:4bb:659c:b8db
 with SMTP id 5b1f17b1804b1-4bb88813b27mr2132215e9.12.1795107517297; Thu, 19
 Nov 2026 08:58:37 -0800 (PST)
Date: Thu, 19 Nov 2026 17:58:27 +0100
In-Reply-To: <20261119165825.1793558-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532; i=ardb@kernel.org;
 h=from:subject; bh=iQrboBOqxMmlNO2j3pbeilZqXSuLdMEWKwHBULushzg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu/1pYNLhMY7K1dNdpttK9kXrfN8nR0UPBPP3V4251t0
 k8m/vzcUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZS5MPI0JA/4eSsfSwZN114
 fm1fdUtEQmOndL1g6pXnzjVvDK2W/mVk2Jr7WnpOm+C2OEcjdxYP/+2J3/Ydevrl9TfOlmvzl4f M4wQA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119165825.1793558-6-ardb+git@google.com>
Subject: [PATCH 1/3] arm64: module: Keep executable init sections in the core
 text region
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085840_245059_31E3581A 
X-CRM114-Status: GOOD (  18.74  )
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

Since commit 3e35d303ab7d ("arm64: module: rework module VA range
selection"), the core and init text regions of a module may end up more
than 128 MiB apart, i.e., out of direct branching range of each other.
This is why the module loader maintains a separate .init.plt section for
branches emitted into .init.text, and a separate ftrace trampoline for
ftrace callsites in .init.text.

__init code typically makes up only a small fraction of a module's code,
so instead, keep .init.text in the core text region, by overriding
module_init_section(). Do the same for .exit.text in
module_exit_section(), which is only consulted when CONFIG_MODULE_UNLOAD
is disabled, in which case .exit sections are moved into the init region
too.

On arm64 allmodconfig (10604 modules, disregarding modules with 'test' or
'torture' in their name), this grows the aggregate size of the modules'
core text regions by 2.6 MB (+0.58%), or 243 bytes per module on
average. As this only costs an additional page at runtime if a module's
core text region happens to end within that many bytes of a page
boundary, this is expected to affect ~5.5% of modules. In practice, 527
modules (5%) grow by at least one page, of which 16 by more than one,
adding up to 567 pages of 4 KiB. Given that allmodconfig enables KASAN,
KCOV, UBSAN and GCOV instrumentation, which inflates __init code by
1.5-2x, these figures should be taken as an upper bound.

On a distro-style configuration without sanitizers (1023 modules), the
average growth is 104 bytes per module, or ~10 KiB per 100 loaded
modules, which is expected to cost ~2.5 additional pages of 4 KiB (or
~0.6 pages of 16 KiB).

This permits the separate init PLT and init ftrace trampoline to be
removed in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/module.c | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..39e7a50733a9 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -25,6 +25,39 @@
 #include <asm/sections.h>
 #include <asm/text-patching.h>
 
+/*
+ * The module loader allocates the core and init text regions of a module
+ * independently, and so they may end up out of direct branching range of each
+ * other. This complicates the handling of PLTs and ftrace trampolines, which
+ * need to be emitted within range of the branch instructions that use them.
+ *
+ * So keep executable .init sections in the core text region instead. This
+ * costs a bit of memory, as __init code will no longer be freed after the
+ * module's init routine returns, but this is usually a small fraction of the
+ * overall size of the module. Non-executable .init sections are not affected.
+ */
+bool module_init_section(const char *name)
+{
+	if (strstarts(name, ".init.text"))
+		return false;
+
+	return strstarts(name, ".init");
+}
+
+/*
+ * Without CONFIG_MODULE_UNLOAD, the module loader places .exit sections into
+ * the init region, as they will never be used. Keep .exit.text in the core
+ * text region in this case too, so that branches emitted into it are always
+ * guaranteed to be in range of the core PLT.
+ */
+bool module_exit_section(const char *name)
+{
+	if (strstarts(name, ".exit.text"))
+		return false;
+
+	return strstarts(name, ".exit");
+}
+
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
 	RELOC_OP_ABS,
-- 
2.56.1.708.g77570a6a1d-goog


