Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CCD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QDDcuM2p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k94VnK6t;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kH5IGtgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WUUeXjjWyK6qjX9x82xlteWuEad8XsxvDUnphU7EmH0=; b=QDDcuM2pyybdlxYgeeCkI72Zx0
	GkdLLQROVarO5AZ21GrKi029pOvWn/dSgrUtkrCHR+tvTdIeuOgdKwUDoXKfCFZ5ObUaOQdaY8doT
	vvKsdruiL72APyEoCgR6Fy2Td+SYOxmOZsI1rOXnccSl+N+wsOMfoH2906XHJ4GO+Q/Lm0j07sAoQ
	Y1PF70iz6dmLiFhs9MnlHhMmg0+YDVpKmDd5CuAkEVWygNLr4h2w0rwFsPiH1zEQDni1PNF/7tw82
	d7kr7kImmxEY0EyhvyMaFHBVaXyb3ppQa3Udjk99+fie0deL/6xQf+5LXHxW0qR5Y1MXWSU+GCzHF
	te1Cywyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Kk-00000008bZH-0l7b;
	Wed, 25 Nov 2026 06:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JF-00000008ZBa-3fBW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WUUeXjjWyK6qjX9x82xlteWuEad8XsxvDUnphU7EmH0=; b=k94VnK6thqsv3ZkE40I67RhAYr
	0tIbRATKxOm8962u/IeK6085gPtC6wZA7nDqaGkkqp5XDDLJXYzGyXqXgRNY/2657VJNE5yQ9ceJM
	kXCizTXfUX02m7txGaDfkQr+WM4u1MuyE+ae4noidDWhF8B/vhPZX/6Vk/4s3M7a4fPh6/nMx6jv/
	er7ecGgUnPvOZivw09dnX43udxKeNrYvpjciA++X67kS3BLVJE2nes/0KbZ70kW0qp/F1MzC0iIaC
	KhdWFtLqrcrpaz6o+snVQGb85ffpgOQJpO7Bn2gln0RXZE59wU3AJun3pqCCXol57HJADrQFADXcl
	Q2NTpexw==;
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JA-00000004u28-2B25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:46 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-386c3309469so1560280eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587401; x=1796192201; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUUeXjjWyK6qjX9x82xlteWuEad8XsxvDUnphU7EmH0=;
        b=kH5IGtgrm1Ko5SkYMDOM19Igpj829UIBirlxgXtqxiFYI7ZLgA2wY8iGMLiKFarwZA
         gV/6EsqppHGPqS5I7Kk7ayzvLaQfrZRzj7FwDJ+jKbzV7EA2yfeZVEKbwL2067Y70bQN
         Axo6UPhl+LCYpSEsjEdG2TojdwQZZmsKEb+AQI/RrG2Wv6P3dcz09joXbQ3BtQODeKal
         Juf+z0JKADxLr7RHLtqTzN2aL9YH6kOZm3hQavqvc83ExmLlOCHeVWEgh3nF1ebSnJEF
         Sh7F47nYAez0Ge35CEH6Hn0kgsjjifCWHswnBt8C8z5mQ6yOUT4ot7isoXtVkRX4szJB
         Gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587401; x=1796192201;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUUeXjjWyK6qjX9x82xlteWuEad8XsxvDUnphU7EmH0=;
        b=Nh5jy+CdpKbXvDqCVIJgA8wc2HmLCMQbxOLFoBBACRjF+iA0Z0Ca+nTkl2aq9JcWj4
         SQgLRum1JRVTgmsC8ec5vXH+vqc21rU+KQeCqq0OzH+iYArJa9U3yINCgBT6Mo+h4xEy
         J1HqGa1iUR9y7uuAMSjY/maTQYcXaO9s98ZhuSb7k762ApNXmQsmj3oZECYbWxshIne7
         OGC1JuDS1SDDCN94F7Z58UgWzMqKXw53sdRJPbKOQwQPBRygALBAvbnBsAnaHI4GF1Ze
         Jg3PjfRdFm9IG7QfXdXwncVHC0ILWjTFgqcCUYnCckJOMDZQ8CN6H7nqYujFFQEmz9Jm
         TG/w==
X-Forwarded-Encrypted: i=1; AL+hErE4uQWE907GPPtAKKbQZX/xXxbUYWOot4eADKUUA2gBG6zzNqHDdEV2FOGtP4y2tTDq8psiM5Bn3ycrmL4Ickt2@lists.infradead.org
X-Gm-Message-State: APuU4Z88rsdOkQMoWr61HTPBu88+NuI8ZHLVyWtV11JloMz5z/sg+GV5
	hqNvYLG+7ym6xBVC2KQn9fEI43nWYvsJc7Rw4QJTBaahJk6nTMmICdFC722scY8OxmL6GyzztIW
	It2S7XggySA==
X-Received: from dycnn7.prod.google.com ([2002:a05:7301:1407:b0:384:71f1:1227])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:5093:b0:36a:31b2:8643
 with SMTP id 5a478bee46e88-386992b3f3bmr14119799eec.38.1795587400863; Tue, 24
 Nov 2026 22:16:40 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:15 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-23-irogers@google.com>
Subject: [RFC PATCH v2 22/30] tools headers: Add linux/kmsan-checks.h copy
 from the kernel sources
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
X-CRM114-CacheID: sfid-20261125_061644_451498_34160FC4 
X-CRM114-Status: GOOD (  19.76  )
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

Copy include/linux/kmsan-checks.h to tools/include/linux/kmsan-checks.h
so host tools in tools/ can compile kernel sources using
kmsan_unpoison_memory() without referencing ../../include/linux
directly, and register it in tools/perf/check-headers.sh.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/kmsan-checks.h | 98 ++++++++++++++++++++++++++++++
 tools/perf/check-headers.sh        |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 tools/include/linux/kmsan-checks.h

diff --git a/tools/include/linux/kmsan-checks.h b/tools/include/linux/kmsan-checks.h
new file mode 100644
index 000000000000..e1082dc40abc
--- /dev/null
+++ b/tools/include/linux/kmsan-checks.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KMSAN checks to be used for one-off annotations in subsystems.
+ *
+ * Copyright (C) 2017-2022 Google LLC
+ * Author: Alexander Potapenko <glider@google.com>
+ *
+ */
+
+#ifndef _LINUX_KMSAN_CHECKS_H
+#define _LINUX_KMSAN_CHECKS_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_KMSAN
+
+/**
+ * kmsan_poison_memory() - Mark the memory range as uninitialized.
+ * @address: address to start with.
+ * @size:    size of buffer to poison.
+ * @flags:   GFP flags for allocations done by this function.
+ *
+ * Until other data is written to this range, KMSAN will treat it as
+ * uninitialized. Error reports for this memory will reference the call site of
+ * kmsan_poison_memory() as origin.
+ */
+void kmsan_poison_memory(const void *address, size_t size, gfp_t flags);
+
+/**
+ * kmsan_unpoison_memory() -  Mark the memory range as initialized.
+ * @address: address to start with.
+ * @size:    size of buffer to unpoison.
+ *
+ * Until other data is written to this range, KMSAN will treat it as
+ * initialized.
+ */
+void kmsan_unpoison_memory(const void *address, size_t size);
+
+/**
+ * kmsan_check_memory() - Check the memory range for being initialized.
+ * @address: address to start with.
+ * @size:    size of buffer to check.
+ *
+ * If any piece of the given range is marked as uninitialized, KMSAN will report
+ * an error.
+ */
+void kmsan_check_memory(const void *address, size_t size);
+
+/**
+ * kmsan_copy_to_user() - Notify KMSAN about a data transfer to userspace.
+ * @to:      destination address in the userspace.
+ * @from:    source address in the kernel.
+ * @to_copy: number of bytes to copy.
+ * @left:    number of bytes not copied.
+ *
+ * If this is a real userspace data transfer, KMSAN checks the bytes that were
+ * actually copied to ensure there was no information leak. If @to belongs to
+ * the kernel space (which is possible for compat syscalls), KMSAN just copies
+ * the metadata.
+ */
+void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
+			size_t left);
+
+/**
+ * kmsan_memmove() - Notify KMSAN about a data copy within kernel.
+ * @to:   destination address in the kernel.
+ * @from: source address in the kernel.
+ * @size: number of bytes to copy.
+ *
+ * Invoked after non-instrumented version (e.g. implemented using assembly
+ * code) of memmove()/memcpy() is called, in order to copy KMSAN's metadata.
+ */
+void kmsan_memmove(void *to, const void *from, size_t to_copy);
+
+#else
+
+static inline void kmsan_poison_memory(const void *address, size_t size,
+				       gfp_t flags)
+{
+}
+static inline void kmsan_unpoison_memory(const void *address, size_t size)
+{
+}
+static inline void kmsan_check_memory(const void *address, size_t size)
+{
+}
+static inline void kmsan_copy_to_user(void __user *to, const void *from,
+				      size_t to_copy, size_t left)
+{
+}
+
+static inline void kmsan_memmove(void *to, const void *from, size_t to_copy)
+{
+}
+
+#endif
+
+#endif /* _LINUX_KMSAN_CHECKS_H */
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..76fc6e20096c 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -28,6 +28,7 @@ declare -a FILES=(
   "include/vdso/unaligned.h"
   "include/linux/gfp_types.h"
   "include/linux/hash.h"
+  "include/linux/kmsan-checks.h"
   "include/linux/list-sort.h"
   "include/uapi/linux/hw_breakpoint.h"
   "arch/x86/include/asm/cpufeatures.h"
-- 
2.56.1.831.g720f3f5937-goog


