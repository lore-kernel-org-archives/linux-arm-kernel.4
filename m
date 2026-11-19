Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTJccltL;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vd/VIKkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o5n64/UFwdj57pP75MGqiJydiJtnF+eblWXXb8LXDEk=; b=bTJccltLOrD9sx
	QY7mIou5DeoM/C1+idZZQynM5jikDKElMhjEUym1z/Fx91WsZXpiYo95nG1sREDsifUy6qEHL6eMs
	SQVKHyiz5lbUcNLU+C8jfnerlPxHGEqEJWb9aDF8GyTeIdVfXCBCcSAdQ0R+Z5Y+TXNy/kUaOwW15
	Qzs8oH+YyJg2YPbQSE/tPvL4NlHfkQUkQAtlu+Bof4udhRs/Aw9ayU4vIWhOgQySumNRVYTilrFgO
	306mMt8B0xLquNmOfKv8yLYAbJQ7jSx4vizZRg48uocuG7n6cYanxGYRSimuW0XzayPc0SDF/Iy4z
	MYPJKKmiy6kbkzhSFn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrh-0000000BSar-0J0g;
	Thu, 19 Nov 2026 09:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrd-0000000BSYi-0QAB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41CFD1AC1;
	Thu, 19 Nov 2026 01:55:29 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2ACA3F882;
	Thu, 19 Nov 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795082132; bh=g+O9+alZj4EnDHlfvvZKh0toOqYvRgzXwOtEwypI9LA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vd/VIKkGII6l2hvbBZE3/WMg3XV5vxHlcQpPwQCsI5wA12kck7c93Btcmo0pjJHDY
	 vmWS75P7LWBkbMFVEctNOaP+Xi8rsHstlykUpDh+kksLsbu5aSJix5m6XFkRbbsVYU
	 Zr9mcWH2WZ1UR2bg57F004BhTUuR87CdUMebn4EA=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 09:54:38 +0000
Subject: [PATCH v2 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_futex-v2-2-244c7a01f788@arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
In-Reply-To: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082127; l=4117;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=g+O9+alZj4EnDHlfvvZKh0toOqYvRgzXwOtEwypI9LA=;
 b=ogfu3Z4yNMxxCccU1fzpmeLHXxGwMXKlzVRqf5EyNnUHJkyPMUuV3LsP/ramj8e0XIOiz2tjP
 /rQuvwW2IWfB/Eqjdg431fW4DP7RYO5VCnsK+kE+c5U8wJePVXciT2F
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015533_232429_3AA9AA7D 
X-CRM114-Status: GOOD (  18.07  )
X-Spam-Score: -4.4 (----)
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

Add a new test to ensure that atomic futex uaccess succeeds on
memory mapped with a non-default POIndex/pkey.

In the absence of FEAT_LSUI, atomic futex uaccess operations such as
those triggered by FUTEX_WAKE_OP use privileged atomic load/store
instructions and thus cannot have user permission overlays (POR_EL0)
applied. In case the kernel enabled POE at EL1, it is worth
checking that kernel overlays (POR_EL1) are not applied to these
accesses, as that would fail for non-zero pkeys.

Note that if such misconfiguration occurs, futex_wake_op() may get
stuck in an infinite loop because futex_atomic_op_inuser() will fail
but fault_in_user_writeable() will still report success.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa1..bad5c3b33dce 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -4,7 +4,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),aarch64 arm64))
-ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
+ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs poe
 else
 ARM64_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/arm64/poe/.gitignore b/tools/testing/selftests/arm64/poe/.gitignore
new file mode 100644
index 000000000000..0dce4a3aa38b
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poe_futex
diff --git a/tools/testing/selftests/arm64/poe/Makefile b/tools/testing/selftests/arm64/poe/Makefile
new file mode 100644
index 000000000000..2af2bbf3f6d3
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += $(KHDR_INCLUDES)
+TEST_GEN_PROGS := poe_futex
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/poe/poe_futex.c b/tools/testing/selftests/arm64/poe/poe_futex.c
new file mode 100644
index 000000000000..21a2e109ee43
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/poe_futex.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include <linux/futex.h>
+#include <sys/syscall.h>
+
+#include "kselftest_harness.h"
+
+static int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
+{
+	return syscall(__NR_pkey_alloc, flags, init_val);
+}
+
+static int sys_pkey_mprotect(void *ptr, size_t size, int prot, int pkey)
+{
+	return syscall(__NR_pkey_mprotect, ptr, size, prot, pkey);
+}
+
+static int futex_wake_op(uint32_t *uaddr, uint32_t val, uint32_t val2,
+			 uint32_t *uaddr2, uint32_t val3)
+{
+	return syscall(SYS_futex, uaddr, FUTEX_WAKE_OP, val, val2,
+		       uaddr2, val3);
+}
+
+/*
+ * Trigger some atomic uaccess on a page mapped with a non-default pkey.
+ *
+ * This ensures that such access is not mistakenly checked against the
+ * kernel's POR_EL1 register.
+ */
+TEST(poe_futex)
+{
+	int ret, pkey;
+	void *ptr;
+	size_t size = getpagesize();
+
+	pkey = sys_pkey_alloc(0, 0);
+
+	if (pkey == -1 && errno == ENOSPC)
+		SKIP(return, "pkeys are not supported");
+
+	ASSERT_GT(pkey, 0);
+
+	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ret = sys_pkey_mprotect(ptr, size, PROT_READ | PROT_WRITE, pkey);
+	ASSERT_EQ(ret, 0);
+
+	/*
+	 * There is no one to wake up so this syscall boils down to *(ptr+4) = 0
+	 * (arch_futex_atomic_op_inuser() called with FUTEX_OP_SET and op_arg=0).
+	 */
+	ret = futex_wake_op(ptr, 1, 1, ptr + sizeof(uint32_t), 0);
+	ASSERT_EQ(ret, 0);
+}
+
+TEST_HARNESS_MAIN

-- 
2.56.0


