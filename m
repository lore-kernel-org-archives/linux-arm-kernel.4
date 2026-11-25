Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1117606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RbVcZxea;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dNCyYWVL;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ha9huIVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=; b=RbVcZxeaubNflZmDwU0bPCQaX4
	22glNS2mv20qQcgfAPU2uGI6SvD17M6VBS13knhU/21KJWTWi4Pqf0Qg2ntMlEtf6LWiB1gWNXpUK
	p8m8VVVc0GI6GSP0FWRPOiaTmbHTS/aCggjy2jiSrnRrPLF+B52lcZVa26lNzwXbc1xJ0LHlkDTaT
	rW71HXcuH5fD+cxC3vK4DewxZVEzG6IO/SeKlT+lsA+38ImE+xCE43rTIisSTUMJNbctQaVPVHv22
	w0FX19l+zIWlZVetCWOIYmlpWuN+n/QuaWEl9jpgP46HHXVwnzDHDabkhUL1VkcGr3i0G+gbmNVv7
	7lxCVZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JS-00000008ZOU-3i54;
	Wed, 25 Nov 2026 06:17:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ih-00000008YcV-2Q7g
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=; b=dNCyYWVLbvl0PzxCGASca3Lq4W
	wHlVCB6RVIvjnbGJ1zDw0r3ajP5e4E1jbJVEAGg5nDSzWTdeVLhvJmHxHgSfwLLbbOCFKfYKhA0jF
	vV5mR+Vak2qzHO8LQuXewR3DfE11VisZBBWqg+LzuXC/LkO0V0GTX/F2/G8FOHrg5NK0ZQpvHOgNy
	je55ul88T0FmPuO2V73xmUaTCXj7uUjCQxpXOva1Fa3S39CfmBReiI55bbDsgy/CYfdVl0kokuodU
	8KMOw6rFmx5acafd6xSPioaJYgrTkZJQSsAeCCYYStkrIoSocqVX/srFXXfdjxPH543s8rQ+Zl+ws
	f8kpF9rg==;
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Id-00000004tlL-2BeO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:14 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-3846d5f54c1so6513480eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587369; x=1796192169; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=;
        b=ha9huIVk+puKUag/RZTB2RWqLA3LM9pw82ukmy3Ja3hbrje+EOjAL6BX2B3Z1NteHF
         f4z3GPNA4kx+tUq1s/WoO7AU4TmT1NWHA5H4Lf6j1C8sHw+bULKBrDh0SUe9mW9qc4Sg
         oCWxubJQFmsCi28CxLHYU7zKvtSgc9BNPYwE5uSE67u4hDKTO/rMf8DT9YclHqoYq0YA
         d3HoAsANKDADAVFOJXIS+VqaWvPd7vsTWWfHQmJfCVF8BAVZ3PXy+xfJzy9RUoNpsS1C
         D+VxkFSQE/QDeV/ixIZLAw6mES2rtDgabysdfCNbP8kYpgStjTfHvsL827DVtnO0vsYf
         x7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587369; x=1796192169;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=;
        b=ZokrAd0JOS3SWokkldhY9J6WRk8RT5xQGKlp7anjBn9l6zu8QS2IiMoZ4vVKfhE2d0
         +egwAJatCvGctG+6XRPhVhmuAO663/0f3bXe4b6/GBSzIXRZraxYR89eAlIbiKyKHcfa
         W1e4xZ0hi753WDMC8Q7S32wPeFXLTV6CY1hs4WKXp8fNzSxBjPc31RPAZbSh5EWrgog9
         CGFdUBnnLicsj7rCnCnwrLHGOgXzPR2DD2vsavfjD29YEih7Eh0xyA7K/BNwunKI9ldC
         mI1YfaoT1OBiNCXD1z8n3yQYAoLqQdwmsPyYI/0pakkCJ8tU7jDjayczGx0XyQ2kAthC
         yuOQ==
X-Forwarded-Encrypted: i=1; AL+hErGFmrj8A2g98YMz8OtGr/oEN9gePZqMMGp44CsfbfLe9+EJFf/bOB5uTinkgUyLO/WwB8PXLFa8kQuKFFjykA4c@lists.infradead.org
X-Gm-Message-State: APuU4Z8FHVakU1uRhysgaQnQPIPJ28uEzjV8WQ4kIzd57hmzwxSAcr92
	alMtdo6K60Z53RRs1vAUe/3uI/ICDGlgvZ8MXFiEeESWvfJVmbt2Hoho1oyWv7Yi53Tj01o+n3b
	20dP0BPGWqQ==
X-Received: from dyblf45.prod.google.com ([2002:a05:7301:a2d:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8953:20b0:386:a70b:75dc
 with SMTP id 5a478bee46e88-386a70b7837mr10351275eec.11.1795587368701; Tue, 24
 Nov 2026 22:16:08 -0800 (PST)
Date: Tue, 24 Nov 2026 22:14:59 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-7-irogers@google.com>
Subject: [RFC PATCH v2 06/30] kbuild: Wire up CONFIG_UNWINDER_DWARF_CFI_MINIFY
 object pass
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061611_577006_7FF1E12E 
X-CRM114-Status: GOOD (  12.57  )
X-Spam-Score: -7.6 (-------)
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

Invoke scripts/min_eh_frame on standard kernel C, Rust, and post-LTO
composite .o objects when CONFIG_UNWINDER_DWARF_CFI_MINIFY is enabled,
recording scripts/min_eh_frame as a rebuild dependency in .*.cmd files.

Across full vmlinux builds on x86-64, ARM64, and RISC-V, minification
achieves 100.00% FDE coverage and reduces .eh_frame size 18%-28% below
SFrame v3 (.sframe).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 rust/Makefile              |  4 +++-
 scripts/Makefile.build     | 12 ++++++++++--
 scripts/Makefile.lib       | 13 +++++++++++--
 scripts/Makefile.vmlinux_o |  8 +++++++-
 4 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0165626decbe..1238b4ac661d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -668,7 +668,8 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
@@ -721,6 +722,7 @@ endif
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gendwarfksyms)
 endef
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..ced0f630f566 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -281,6 +281,10 @@ ifdef CONFIG_OBJTOOL
 $(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
 endif
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+$(obj)/%.o: private min-eh-frame-enabled = $(if $(filter-out scripts/mod/empty.o,$@),$(is-standard-object))
+endif
+
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
 endif
@@ -371,11 +375,13 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 define rule_rustc_o_rs
 	$(call cmd_and_fixdep,rustc_o_rs)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 endef
 
 $(obj)/%.o: $(obj)/%.rs FORCE
@@ -518,14 +524,16 @@ $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
 quiet_cmd_ld_multi_m = LD [M]  $@
-      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
+      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool) $(cmd_min_eh_frame)
 
 define rule_ld_multi_m
 	$(call cmd_and_savecmd,ld_multi_m)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 endef
 
 $(multi-obj-m): private objtool-enabled := $(delay-objtool)
+$(multi-obj-m): private min-eh-frame-enabled := $(CONFIG_LTO_CLANG)
 $(multi-obj-m): private part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
 	$(call if_changed_rule,ld_multi_m)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..b27bcd50daf7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -222,6 +222,12 @@ objtool-enabled := y
 
 endif # CONFIG_OBJTOOL
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+min_eh_frame := $(objtree)/scripts/min_eh_frame
+cmd_min_eh_frame = $(if $(min-eh-frame-enabled), ; $(min_eh_frame) $@)
+cmd_gen_min_eh_framedep = $(if $(min-eh-frame-enabled), { echo ; echo '$@: $$(wildcard $(min_eh_frame))' ; } >> $(dot-target).cmd)
+endif
+
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
@@ -265,7 +271,8 @@ endif
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single) \
-		$(cmd_objtool)
+		$(cmd_objtool) \
+		$(cmd_min_eh_frame)
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
@@ -273,17 +280,19 @@ define rule_cc_o_c
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gen_symversions_c)
 	$(call cmd,record_mcount)
 	$(call cmd,warn_shared_object)
 endef
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool) $(cmd_min_eh_frame)
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gen_symversions_S)
 	$(call cmd,warn_shared_object)
 endef
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 0b37bd5dc3a4..160d43fbb393 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -52,6 +52,10 @@ vmlinux-objtool-args-$(if $(KLP_SYMIDS),y)		+= --klp-symids
 
 objtool-args = $(vmlinux-objtool-args-y) --link
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+min-eh-frame-enabled := $(CONFIG_LTO_CLANG)
+endif
+
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
 
@@ -64,13 +68,15 @@ quiet_cmd_ld_vmlinux.o = LD      $@
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 cmd_check_function_names = $(srctree)/scripts/check-function-names.sh $@
 
 define rule_ld_vmlinux.o
 	$(call cmd_and_savecmd,ld_vmlinux.o)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,check_function_names)
 endef
 
-- 
2.56.1.831.g720f3f5937-goog


