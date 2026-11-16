Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54775606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TMoTq4XN;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h5+Yz6Gc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mmct4hLjqfM6P4J4rNlaQewbZx02Ku0ihgJPS4dJhPg=; b=TMoTq4XN3s/EDPjGSKp/DgQFnY
	9lDl4gDPKYsP5IhQ28Hun4WX5alU/2WInz6qs4UTdPEZ+sngNa86sSgkYlx7XyjhgnFbZ9xiMTmWF
	YJZAyB7kNOhHvhIwCGX5xL9Z0Gnfj/0Mn8WkWUPm8PwS1PPh1ywAYkVxv4YoNKtMjtk+IvzD4IjRG
	kgbD+uYN0zQFAR32FOYXGVd7jh81CqTgcXa0Yrb7G1pZF3HyY4OxCp4cAVhS/V+xr8giaPHrypsE8
	sklwGRs4+157GMiwOQ4wrLd/PJKULnEFI7mcQsLGHC3gNOebQ1rLTjMlbmAkJBXHKaGrI34roJSpf
	sLUaX3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBo-00000001PY2-0k1s;
	Mon, 16 Nov 2026 07:31:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBk-00000001PWA-18Vu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mm
	ct4hLjqfM6P4J4rNlaQewbZx02Ku0ihgJPS4dJhPg=; b=h5+Yz6GcEpigF0B5Vd
	6x3tXEpypfpKY3dRM9/+exVLNXNMWj00su59AjJWnILUAtqzfpNiOyR69WLHSG5Q
	TTeyrbsa1peSOvC8I4A5tQVctwNy8vzhmPGxKQD+mJaAGrC3R63THx9isd05pCqD
	wVziw8zjNvKz6I2Eh69QukQkE=
Received: from mm (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnB4dFsfpqIKNJFg--.7882S2;
	Mon, 16 Nov 2026 15:31:19 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Niu <benniu@meta.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com,
	xiqi2@huawei.com
Subject: [PATCH v4 0/2] arm64: speed up __arch_copy_from_user() for large copies
Date: Mon, 16 Nov 2026 15:25:10 +0800
Message-ID: <20261116072512.1323883-1-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDnB4dFsfpqIKNJFg--.7882S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW3ZFW5KF13WF1UAw4fKrg_yoW5Ar18p3
	yjywsxKrs5Wr1xAa93Z3W8X3yFvan7GryUWFn7Gr4YvFWagryjyryfGwnY9a17Cr1xG34S
	ya1DtF9rCwnYva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5eOJUUUUU=
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7QnXDmr6sUm9bQAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233140_783968_157F1652 
X-CRM114-Status: GOOD (  11.31  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Qi Xi <xiqi2@huawei.com>

Based on Ben Niu's "Faster Arm64 __arch_copy_from_user and
__arch_copy_to_user" work [1], this series continues the optimization
for __arch_copy_from_user() only, following Catalin's review of v3 [2].

For copies of 4096 bytes or more, __arch_copy_from_user() uses
privileged LDP instead of LDTR and toggles PSTATE.PAN for the duration
of the copy, together with an offset-addressed 64-byte loop added to
copy_template.S.  Smaller copies keep the original code.

copy_to_user() is deliberately left alone.  Clearing PAN and using
privileged STP there puts the PAN update in the middle of the user
store stream, which breaks hardware write streaming; on Kunpeng 920
the resulting regression outweighs the gain from paired stores.

Performance improvements measured on Kunpeng 920:

The ku_copy microbenchmark [3] (a kernel module that measures
copy_from_user throughput across various sizes by copying 1GB of
data in each test):
copy_from_user throughput change (positive = improvement):
8B-2048B: ~0% (not covered by this optimization, no regression)
4KB: +2.0%   8KB: +19.1%  16KB: +29.8%  32KB: +36.5%
64KB: +38.0%  128KB: +57.9%  256KB: +71.2%

Real-world workloads:
- iperf3 over virtio-net/tap in a two-level PVM stack
(L1 send to KVM L2 guest):
Throughput improved from 38.5 to 50.1 Gbps (+30%).
copy_from_user hotspot in the QEMU main-loop thread reduced
from 68% to 55%.
- meshproxy:
256KB request latency reduced from 0.91 ms to 0.78 ms (-14%)
at 16 connections / 16k QPS.

Changes since v3:
 - No global PAN disabling.  PAN is toggled only around the
   new fast path, so LDTR/STTR remain the default for every
   other copy and keep protecting against user-controlled kernel
   accesses, as Catalin pointed out.
 - Fault semantics fixed: every load in the 64-byte loop has its own
   exception table entry, and the fixup advances dst by the number of
   16-byte blocks that were actually stored.  A fault in the middle of
   the loop now returns the number of bytes really not copied instead.
 - A 4096-byte threshold is added; from there on the new path is
   used, since toggling PAN also has a cost.
 - copy_to_user() is deliberately left alone.

[1] https://lore.kernel.org/all/20251018052237.1368504-2-benniu@meta.com/
[2] https://lore.kernel.org/all/20260316123100.82932-1-xiqi2@huawei.com/
[3] https://github.com/mcfi/benchmark/tree/main/ku_copy

Qi Xi (2):
  arm64: copy_template: add an offset-addressed 64-byte loop
  arm64: copy_from_user: use privileged LDP/STP for large copies

 arch/arm64/lib/Makefile             |   2 +-
 arch/arm64/lib/copy_from_user.S     |   8 ++
 arch/arm64/lib/copy_from_user_opt.S | 114 ++++++++++++++++++++++++++++
 arch/arm64/lib/copy_template.S      |  35 +++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/copy_from_user_opt.S

-- 
2.53.0


