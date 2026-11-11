Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB35606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MaJbw+15;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lnua/kRY;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cQPtzUtv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QMaAMs6xR7T/aO1N9I//k1I6DFurg91LjcHnmn/S05Y=; b=MaJbw+15gKvukUwhlF0y2u/nQE
	/i9VncVCqDOpM0thCpzniYKJlKDwX46MtLUSIKqxAia4wO/obOiJsvAnYS7yEUlFKPXZ2utftctGP
	ZmiMQiv4X4lhUzEuG47SdUg7/V262bIwWtr3DvbWtt3jh1kmGDAxlw548R7LMRVc59Lag96LtxTht
	eJz1xvdE+9BKwUZMmG+/PFs6RmrZL2t0FsJheLmdl9lsHhDZzY9KjPeAyAS6UUMAoaMZhldNySrlS
	8TVar/igH9AkrlHWsWLKFke6qJn8BKK3LLuquYHu3RNaK2hI5XlpvABl9S5quVur450yUxsTCv33X
	dVzltLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jt-00000006WDI-2wld;
	Wed, 11 Nov 2026 11:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jS-00000006ViH-0Gp2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 11:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QMaAMs6xR7T/aO1N9I//k1I6DFurg91LjcHnmn/S05Y=; b=lnua/kRY9XvPIsbQqOPA6g4l/b
	zQWNB5jBFUKL8TvXLgVRuL8S6T3Xc8KqjX/knkuA/fG9RxiD1KG9GwMz7YczjKu29FYDOsP0jl2sb
	vcpnlCrvIFaD8fj0wA3TKRaMRxLMRA2oa3Sa8/Mr/lVEQlTjyk8cPYTTyM7AY71bOjrao7w5pvQRv
	sAZZyzHIBHzMm3UoLi4351A9SZ4SeyS/xSmB22bsx7SomLTHKO/0RCpZBv9N+D8sgG2vXHLQlnhCA
	JkhXfr/jKiCHprcKKNTCLG3E1I9QD1QpksYRw6+iFVLM9FBfSaHtUhfrbv8rbXAKDKY6KWa9vcX5e
	JFg7B/Qw==;
Received: from [113.46.200.223] (helo=canpmsgout08.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jM-0000000956a-0l4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QMaAMs6xR7T/aO1N9I//k1I6DFurg91LjcHnmn/S05Y=;
	b=cQPtzUtvy2o9PL5FMvDO+7Lzag/wZrtRtjChma0olY1padw+2L0H7MUQQazOx34Vu0fvX7AvS
	KCpGzLlP91dXed0wvh2mEFX5IgLXvih0ypczLFyJmutIaZnJQxJrENA295oad1aH9E9wV8bA2SC
	gm1GxiLBssIuuZObSbM6nBI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTX2TcwzmV8Q;
	Wed, 11 Nov 2026 19:42:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A3A240573;
	Wed, 11 Nov 2026 19:42:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v21 06/15] arm64: syscall: Invert the exit-path flags check in el0_svc_common()
Date: Wed, 11 Nov 2026 19:42:16 +0800
Message-ID: <20261111114225.3977243-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111114225.3977243-1-ruanjinjie@huawei.com>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_114309_004155_FBE7ED80 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: 1.1 (+)
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

In the fast exit path of el0_svc_common(), invert the nested flags
check so that it calls syscall_trace_exit() directly when work is
pending and then returns, instead of returning early when no work is
pending and falling through to the trace_exit label.

This makes the fast path call the exit work in the same place as the
slow path, which later patches fold into a single helper.

In preparation for moving arm64 over to the generic entry. No
functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3e78e159b2a1..b8d7d29a431b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,8 +127,9 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			syscall_trace_exit(regs);
+		return;
 	}
 
 trace_exit:
-- 
2.34.1


