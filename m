Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699560A5BEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=48BioTR7;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NGBwojoS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=; b=48BioTR7swawmL
	2YgghDX+7/+W284FXLZrIfeZd7a5gsvEs96V1SbZbtEYl2ueQ3HvCfNhi1c6+NcOyeczKeyW7AXGr
	xPV7NNPRWd/gzjnt2Gk5SKDgLRd6erCl9Z/zru2u0og7s3+BK3XG8mJpqZkrNboqOqPGQ4iohylpy
	j0VazWqFFKFa/+F5fA8uTAl2Pxr+vGRFqz0R2ZeU1JAo/NO/10WPR8DltwcLn4smoB20TMhWVFd68
	ewd7Zs/0eMR7KAyu59YUxf8ksKgacR7QOZS6J9RdZEciltf+wnXxwMSMFDy1v28QBHvuD8EoGRCak
	RAeAaJA6n26bVoGuImNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXp-00000009U6Y-3rGt;
	Wed, 18 Nov 2026 16:30:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXh-00000009Tz7-1PVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491846221ffso998111f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019391; x=1795624191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=;
        b=NGBwojoSVgrp3DrcM6Gyr6o6ztGbwdYavnvuKskwuHot/dO4+FAEBvnr7acBj7n98o
         H/TxEUwM9hrNynOUDehO+7jMILHuR+dDt8o8iY4qHmmdGEe5M63YkbAfvOPuOeJhxWd6
         SpLtmTt2m/UVepX8wUMctgdZS8oy1DSMWSO745MogTKsIBpeXiB5MUSqn0yJC3hJVti0
         lpD6MbIax7Mea1uWlMOaVjE6pSUMuXci9ppdHjp1/AnZuTQ0B4eecb7rQcQgD/e9xpCs
         IuxzTPZhMB79XpuUElRJelsCeYgA3CglqbOx7Sgs+6wRIP1rwd6SgOxWBGIOMnBq6pIw
         o9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019391; x=1795624191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=;
        b=0m60r7Mpj5FFZ28amzh7hS74J1beGyRh/56sb60znKWvGNypRtNmvgb8gIeniCpWjQ
         1h/a+cOTRx2Nc5r0qjHnRq57ZIUC1HRJZQCnOByL1Gpyo7LA54gLJ6fQY7ItUVJHf8fx
         FE9jQeCRD+82ItsosPbe3zvIl2zIOopszhYVxSC10vbevdzWKLuwAQn7i4p/0ryNkVQu
         4tMsiQn7IOw3ri3dw+gVwNafJ0IQaN8pU6XaRBq1tkSqNzYOcUmKATZizcTv8FtrE06Q
         00JO0gs4qIOidzm/VIwU5YYhAZ/9oS1uTc7czKnk+il1ORUD5AGf539BZ1Urdj01nsRe
         QSiw==
X-Forwarded-Encrypted: i=1; AL+hErENyK4JSS6BT6QhRlIffaZPUxzfrGGlTjgzB58mTJ9JNi7SKx3hUdRC3Bc/uYL9Xn18Ebmk/GpRXq1oxOFA+Wdu@lists.infradead.org
X-Gm-Message-State: APuU4Z8fiPQUiukSO6V5o1qqUB1SNYUMXr1smBS4mZFJT1Vq0Jv/dnnR
	7aAUq12Vx5MsYUTE8S7CkbfMzi/G+oXgxFWhRQSVtD4ZHs2AWmA7CqJFZpWxzVpuCpY=
X-Gm-Gg: AZFdTZfsvZKvTB0o67LKII0rp+1h1lT949EBl4hUhPmV8qsRVgL+dSXEOfB0vZuOXQE
	XOq05AUDyJFtu56lG6Xm1H3kLA1kMhHK8DM4ZyXPGhKgwFt0udcfODjgnQoBu0yuA8bkzISDM/c
	YbjfXFSWOMPBZ5RBOWPHai5xRqaDQMG4aBs9N3S7lfTFXkOE4sOP8VUv5JCAtKK89kj5qE/B7OD
	R9sKQwcrDQz4gWfgsnSxWW6EX7M/yrvrbMji5Sf4rOi1fECWcDIk/aALeqkhet86UCfRlsJbUdE
	IryAYrWyxDE01cJXCu8Vb6pBbdlLF3kP6xl0w8XrPkG8eNEXbz5ZVpYs1Cy3C9nTVgGYKimewDh
	/A024MifH6lv6W7hkLpdlZIhpuc1kUmfRItWT7XzhmY2EUsYk35bO1tOEFIQGY2iKMMQJhfzEU1
	NM2rGYEcctwi/3NcSRR8jTo1kjvIj0UlV/1y5RYHsTjRK2gyLyIn9wAP3lKJdYAwDWN9Eoge09c
	Y3WXsJULvd5g8AvyaF5qHFd+mTc9DznsdLe/k9qerFKG0jXQiwDuIh0H7hlMdDx42nEiWBnVAyr
	qXysp0HztwJTNTVO5+NnHM/jPsNN1tv690jyE4WtXOVnQRvHm9li1g==
X-Received: by 2002:a05:6000:4312:b0:4a6:4ac6:d952 with SMTP id ffacd0b85a97d-4a64ac6dad3mr6914932f8f.31.1795019391032;
        Wed, 18 Nov 2026 08:29:51 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:25 +0000
Subject: [PATCH 03/34] perf jit: Add address ranges to DWARF compilation
 units
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-3-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082953_476653_3428BA86 
X-CRM114-Status: GOOD (  23.41  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The JIT ELF writer emits a line table and a compilation unit containing
only DW_AT_stmt_list. LLVM locates the CU by address before looking up a
source line, but the CU address range isn't written into the DWARF.
Therefore it can't resolve these files even though GNU addr2line could
by reading the line table directly. This means that JIT src line lookups
when LLVM is used.

Pass the generated code size to the debug information writer and emit
DW_AT_low_pc and DW_AT_high_pc address ranges. Also mark the compilation
unit as childless to match its contents.

Add a test which writes JIT debug information at a nonzero runtime load
address and resolves an ELF-relative address through LLVM.

Fixes: c3f8644c21df ("perf report: Support LLVM for addr2line()")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/genelf.c      | 70 +++++++++++++++++++++++++++++++++++++++++-
 tools/perf/util/genelf.c       |  2 +-
 tools/perf/util/genelf.h       |  3 +-
 tools/perf/util/genelf_debug.c | 22 +++++++++----
 4 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/genelf.c b/tools/perf/tests/genelf.c
index 95f3be1b683a..4d23778c1979 100644
--- a/tools/perf/tests/genelf.c
+++ b/tools/perf/tests/genelf.c
@@ -5,6 +5,8 @@
 #include <string.h>
 #include <unistd.h>
 #include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/unaligned.h>
 
 #include "debug.h"
 #include "tests.h"
@@ -12,6 +14,8 @@
 #ifdef HAVE_JITDUMP
 #include <libelf.h>
 #include "../util/genelf.h"
+#include "../util/jitdump.h"
+#include "../util/llvm.h"
 #endif
 
 #define TEMPL "/tmp/perf-test-XXXXXX"
@@ -50,4 +54,68 @@ static int test__jit_write_elf(struct test_suite *test __maybe_unused,
 #endif
 }
 
-DEFINE_SUITE("Test jit_write_elf", jit_write_elf);
+static int test__jit_write_elf_dwarf(struct test_suite *test __maybe_unused,
+				     int subtest __maybe_unused)
+{
+#if defined(HAVE_JITDUMP) && defined(HAVE_LIBDW_SUPPORT) && defined(HAVE_LIBLLVM_SUPPORT)
+	const uint64_t load_addr = 0x12340000;
+	static const char filename[] = "jit.c";
+	unsigned char code[16] = { 0 };
+	unsigned char debug[2 * (sizeof(struct debug_entry) + sizeof(filename))];
+	struct debug_entry *entry = (struct debug_entry *)debug;
+	char path[] = TEMPL;
+	char *file = NULL;
+	unsigned int line = 0;
+	int fd, ret = TEST_FAIL;
+
+	/* The second row terminates the first row's source-line range. */
+	for (int i = 0; i < 2; i++) {
+		put_unaligned(load_addr + i * 8, &entry->addr);
+		put_unaligned(42 + i, &entry->lineno);
+		put_unaligned(0, &entry->discrim);
+		memcpy(entry + 1, filename, sizeof(filename));
+		entry = debug_entry_next(entry);
+	}
+
+	fd = mkstemp(path);
+	if (fd < 0) {
+		perror("mkstemp failed");
+		return TEST_FAIL;
+	}
+
+	if (jit_write_elf(fd, load_addr, "main", code, sizeof(code),
+			  debug, 2, NULL, 0, 0))
+		goto out;
+
+	/* LLVM must find the CU from the ELF address before reading its lines. */
+	if (llvm__addr2line(path, GEN_ELF_TEXT_OFFSET + 4, &file, &line,
+			    NULL, false, NULL, NULL) <= 0) {
+		pr_debug("LLVM could not resolve the JIT source line\n");
+		goto out;
+	}
+	if (!file || strcmp(file, filename) || line != 42) {
+		pr_debug("Unexpected JIT source line: %s:%u\n", file ?: "??", line);
+		goto out;
+	}
+	ret = TEST_OK;
+out:
+	free(file);
+	close(fd);
+	unlink(path);
+	return ret;
+#else
+	return TEST_SKIP;
+#endif
+}
+
+static struct test_case tests__jit_write_elf[] = {
+	TEST_CASE("Write JIT ELF", jit_write_elf),
+	TEST_CASE_REASON("Resolve JIT ELF source line with LLVM", jit_write_elf_dwarf,
+			 "requires JIT dump, libdw and LLVM support"),
+	{ .name = NULL, }
+};
+
+struct test_suite suite__jit_write_elf = {
+	.desc = "Test jit_write_elf",
+	.test_cases = tests__jit_write_elf,
+};
diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index 14882def9704..fc145f9401d2 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -449,7 +449,7 @@ jit_write_elf(int fd, uint64_t load_addr __maybe_unused, const char *sym,
 
 #ifdef HAVE_LIBDW_SUPPORT
 	if (debug && nr_debug_entries) {
-		retval = jit_add_debug_info(e, load_addr, debug, nr_debug_entries);
+		retval = jit_add_debug_info(e, load_addr, csize, debug, nr_debug_entries);
 		if (retval)
 			goto error;
 	} else
diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 9f0b875d6548..67309794239a 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -10,7 +10,8 @@ int jit_write_elf(int fd, uint64_t code_addr, const char *sym,
 		  void *unwinding, uint64_t unwinding_header_size, uint64_t unwinding_size);
 #ifdef HAVE_LIBDW_SUPPORT
 /* genelf_debug.c */
-int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries);
+int jit_add_debug_info(Elf *e, uint64_t code_addr, int code_size,
+		       void *debug, int nr_debug_entries);
 #endif
 
 #if   defined(__arm__)
diff --git a/tools/perf/util/genelf_debug.c b/tools/perf/util/genelf_debug.c
index 7d9ef43aa6ac..a124ab40f36b 100644
--- a/tools/perf/util/genelf_debug.c
+++ b/tools/perf/util/genelf_debug.c
@@ -449,9 +449,13 @@ add_debug_abbrev(struct buffer_ext *be)
 {
         emit_unsigned_LEB128(be, 1);
         emit_unsigned_LEB128(be, DW_TAG_compile_unit);
-        emit_unsigned_LEB128(be, DW_CHILDREN_yes);
+	emit_unsigned_LEB128(be, DW_CHILDREN_no);
         emit_unsigned_LEB128(be, DW_AT_stmt_list);
         emit_unsigned_LEB128(be, DW_FORM_data4);
+	emit_unsigned_LEB128(be, DW_AT_low_pc);
+	emit_unsigned_LEB128(be, DW_FORM_addr);
+	emit_unsigned_LEB128(be, DW_AT_high_pc);
+	emit_unsigned_LEB128(be, DW_FORM_addr);
         emit_unsigned_LEB128(be, 0);
         emit_unsigned_LEB128(be, 0);
         emit_unsigned_LEB128(be, 0);
@@ -459,9 +463,11 @@ add_debug_abbrev(struct buffer_ext *be)
 
 static void
 add_compilation_unit(struct buffer_ext *be,
-		     size_t offset_debug_line)
+		     size_t offset_debug_line, int code_size)
 {
 	struct compilation_unit_header *comp_unit_header;
+	uintptr_t low_pc = GEN_ELF_TEXT_OFFSET;
+	uintptr_t high_pc = low_pc + code_size;
 	size_t old_size = buffer_ext_size(be);
 
 	buffer_ext_add(be, &default_comp_unit_header,
@@ -469,6 +475,9 @@ add_compilation_unit(struct buffer_ext *be,
 
 	emit_unsigned_LEB128(be, 1);
 	emit_uword(be, offset_debug_line);
+	/* DW_FORM_addr uses the address size declared in the CU header. */
+	buffer_ext_add(be, &low_pc, sizeof(low_pc));
+	buffer_ext_add(be, &high_pc, sizeof(high_pc));
 
 	comp_unit_header = buffer_ext_addr(be) + old_size;
 	comp_unit_header->total_length = (buffer_ext_size(be) - old_size) -
@@ -476,7 +485,7 @@ add_compilation_unit(struct buffer_ext *be,
 }
 
 static int
-jit_process_debug_info(uint64_t code_addr,
+jit_process_debug_info(uint64_t code_addr, int code_size,
 		       void *debug, int nr_debug_entries,
 		       struct buffer_ext *dl,
 		       struct buffer_ext *da,
@@ -489,7 +498,7 @@ jit_process_debug_info(uint64_t code_addr,
 		put_unaligned(get_unaligned(&ent->addr) - code_addr, &ent->addr);
 		ent = debug_entry_next(ent);
 	}
-	add_compilation_unit(di, buffer_ext_size(dl));
+	add_compilation_unit(di, buffer_ext_size(dl), code_size);
 	add_debug_line(dl, debug, nr_debug_entries, GEN_ELF_TEXT_OFFSET);
 	add_debug_abbrev(da);
 	if (0) buffer_ext_dump(da, "abbrev");
@@ -498,7 +507,8 @@ jit_process_debug_info(uint64_t code_addr,
 }
 
 int
-jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries)
+jit_add_debug_info(Elf *e, uint64_t code_addr, int code_size,
+		   void *debug, int nr_debug_entries)
 {
 	Elf_Data *d;
 	Elf_Scn *scn;
@@ -510,7 +520,7 @@ jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries
 	buffer_ext_init(&di);
 	buffer_ext_init(&da);
 
-	if (jit_process_debug_info(code_addr, debug, nr_debug_entries, &dl, &da, &di))
+	if (jit_process_debug_info(code_addr, code_size, debug, nr_debug_entries, &dl, &da, &di))
 		goto out;
 
 	/*

-- 
2.43.0


