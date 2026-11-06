Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5249606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MYtbjnXR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEDF77Sg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=; b=MYtbjnXRhBkuTD0sBmB1CvsK8m
	3z1R4ealGCU8KPERi3TaY31tUNMNNJUL6B5GpLY03G36S+alIPJRwoLwqlX1Km/4mMFnwnfJQTYx8
	3IT2sLzJVVzevRYhZCXDCDaoO4XJWrBkdfdhMmnnGz+hLzlSY960AsethSWvdGQ7rB+UWj6irtsGo
	C9fITUUz6tLTFYqLAkUpQw56kWt9dWnVgt/YMF/62R6S+7AVX3oC/B4zahKPbiGkxhVJNlS7e4yys
	RhgJAojD0pid+xmB+eTzcCynPZoei9OuP7fgsYWKAmiwo3s2KteQrbDRiGRx8LfYiaK42F/AJPG0r
	nZIUUwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTdH-0000000DsI5-0Hff;
	Fri, 06 Nov 2026 23:46:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTd5-0000000DsDh-2j1I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:45:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e96502e447so10207485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008755; x=1794613555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=CEDF77Sg+1K/QwjLpIIEu72zC4bcSK7xPvIpUapxsoF05WjUcMd7dCu5d7h5ytWEwY
         emtU7ZzwHqL9UlLXz7/dNaFoucXbJKLDNM2QMhK8ufEezKuR3rgS46MoVBclvpSbXawn
         cek64Ccybflj8y5H1G1VOc/hbTGVriK6Xcm3+ahaoG6iUCU8YETQQiPlOHU92K8XwVoE
         GCY8G6FADJEmCMpkEFpH1lZg7ah29zAt2XzdUzKeWzEPGtoBbAbMUTWmb4EqUlWSbzRq
         j2DrOF0U8a8wpp9OpXT777ygY1ZRp7a1JCil9rL+XpTke7XqFZNVUGojHfhJ+je5c7Vv
         P1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008755; x=1794613555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=HnL6IQ/OYcSdnuSn1AoPr5fVi47+u1TyCi8i8CL4/pQX4gIEAeteUC5STTtjSUBBam
         cTw4GWraDBeaeaiGRL4gNrgDIexHbWm+N1orabN6zAS4a2sHys0y+/s1KvomLeiDh+4r
         5imb2+C4fUUjcyJ+KwSbZjzG7Anj+HLnmuAuiv+VYCoYhPxridPmEm6UKA25qvXVilDS
         ISN9kp9ber0CauMPig3Jiijxi9BIWXHiQbIV4f+UDlQxkkfc9FDotb8sbHiG337f4RTw
         JAcHhmUGa1B/KAcU6Y5AWTQHnWxp0b3/akyVBPkNd52RDwK1jk7VeSgDM14lhj2iRYNv
         3a8g==
X-Forwarded-Encrypted: i=1; AL+hErH8MOWqnKtEmLIDH17uiJy5bOoJuRbA7wSd8aOioERuIy9F5R7+rbJXgic/DPq8/+141nYq2NS4nWFV87Hei6E2@lists.infradead.org
X-Gm-Message-State: APuU4Z+FccxgZ6KET0/LAt1SiHBoQPDwyF0cc/iXn6kw1ybF+9biyyUg
	Tk79G6WxFQNUP/6V027WOpgVEUB0QyZjFekAWufKnARdLv5THK+cCoq6
X-Gm-Gg: AYBFou0DOC30zYvt69tEOiznZ6WkHcr00IiNPHo/EWvS0XWPUS0Gue874Zc0iVk/cqm
	4UkTEyAxpbIpqP9jbHq1FQz9VmeJ/cF1vWlqDHOnWRcRlLf0avTM0QdBj8OGuq0M5choLHjmzaT
	o7i59ILPoKeLjnL5hq/MYt5PY8TE7GwcpVVA6QR1/Hq3Yp9u/hLu6DZCtK5ppnjAxUPwN5HLsy4
	IK/xKfCNg+0iYfnXj4GuBQJ1/hEOuPe2iaB/ItkAs02f2MgLYk00fgtwZcdiJmhUyBlTP4yX8jP
	+/9U+XUMWxez/0Iceg96vS9JgLCmwy2wuAl9S9z4ewHH7GQjit0AP0MFHUWr/6lQebuuoAQkD2f
	nS6pJ/3MyAaiQCCzpVZrHaGaOw8hLquTzB0wYV4gagjQMpF9Bvkn9ExujsqtMBivgniHYmhSWKe
	RvXpzOCK3sg42aoZKVhamTJXwzFDDVIwBM71CFHYweC6nAEkAXQkypQgVAVoV+ZdCqI+myda9KH
	DUE44ugS1Z/4uyKAGtVUpn1v5ffwXPx3C0uI45denfHeeUP1JcLQxYA80Mh6Ye0awEqox209xKa
	3Wc6o5Fc5EqOntqR+u9YwQtCKn0wufUijbeWFswuPA==
X-Received: by 2002:a17:90a:e708:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b0db6d3fc1mr3846365a91.27.1794008754637;
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm796145a91.4.2026.11.06.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: perf: Fix the userspace counter example link
Date: Fri,  6 Nov 2026 23:45:51 +0000
Message-ID: <20261106234551.1474417-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_154556_596591_808B3E71 
X-CRM114-Status: GOOD (  19.26  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but the file does not exist: no file of that name is in
tools/perf/arch/arm64/tests/, and no commit in the history leading to
this base has added one.

The userspace register access described in this section is covered by
the "User space counter reading of instructions" and "User space
counter reading of cycles" cases in tools/perf/tests/mmap-basic.c.
That file is the only in-tree userspace test that walks the core PMUs,
pins the test task to each PMU's CPUs, and selects the PMU by its type
number when the kernel accepts the extended type.

perf test -v user runs the four cases in that file; the two reading
cases ask for user access through config1.

Point the text and the link target at that file.

make htmldocs does not fetch external links, so a plain documentation
build does not report it, but make linkcheckdocs does.  I checked that
the old link target returns 404 and the new one returns 200.  No kernel
was built.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/perf.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..236cb5da425a 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -140,9 +140,9 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
+Have a look at `tools/perf/tests/mmap-basic.c`_ for an example. The two
+'User space counter reading' tests in it can be run using the perf tool to
+check that the access to the registers works correctly from userspace:
 
 .. code-block:: sh
 
@@ -160,8 +160,8 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
+.. _tools/perf/tests/mmap-basic.c:
+   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/tests/mmap-basic.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0


