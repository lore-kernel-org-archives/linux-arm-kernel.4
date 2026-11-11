Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a45mqVq5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hzUpV3DD;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=H04kjZjj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=; b=a45mqVq5cvuHluOhry7InrYpDe
	qVFN9E1GKM+oBMJ5twR4dGqR7Fn1DijzN6bVpVZCN2YgjAh+CdEQUMCuOfsb8pePzWi5+06zrT1Ed
	ulAcqqbQtEkep2dpU/SppuRvCDMybWGPVkz18tXlQWJo10pPMwOXASRVcU4IphLI8BqJLwpqfTAUy
	9hCHfKLBELoDAVgAzfUsg05ZPEwAj8XKBjfg9V+83ttD/bw5kY+z4x7G/o917B2Ad68h3ghyDl31c
	NeyXac48O3IvqeTff9dAWGSbSPHxZmfdmBkmQVBYD4JfwQfq8zcUGaULntjN4QwiXpnIC+reYIEML
	W4yNGaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jR-00000006ViG-19iU;
	Wed, 11 Nov 2026 11:43:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jP-00000006VeP-1stE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 11:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=; b=hzUpV3DDlGPg6WmFzIMF5dGL7L
	1VxB9NPNsmHnzKjOBo7Jyya3wXA4yh1bQ4BxB+u/cblAYYjQ7KkWOX3yYTJAoQKbVR8JE5soM07KU
	gHA2oMobtOFkzyB7QwWMR3/koriHMzN2C07QGL/HslJO7N5ENIuA/5qDv5Q7Aor8mWsfiPp9zjwZr
	eGEjPph1Bc7aERLZsDkXTBYg/10Qs8FUDlCo0ZoxDC9ppDk66dfV1id3ExkcHBMmmegzBoGFIohhx
	tO6eQiNOYKEXEZuPIkJMy9pAy4vsibvm+Kmq9VhvaaXz9eloPEnEH38KjrsEe/I3dgq2sv5wZxDOH
	drweGv6w==;
Received: from [113.46.200.221] (helo=canpmsgout06.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jL-0000000956k-2dUJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=;
	b=H04kjZjj/yzZFnWJDfmGL+pacj/GYrh3KjJZBGJJ2UOCUjE0NyL73R25YU2gsDHAX4LbPafR5
	ldCmFAizL7lPssldKzdsYUtscSWhbhVp27KESDU7hIl9gkL45mNv7Ivko++PkVg8ut5VhLgr7Uy
	n8kzTjuEubnYkEWF2mosgaA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTg6q3gzRhT3;
	Wed, 11 Nov 2026 19:42:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 66DBA4057E;
	Wed, 11 Nov 2026 19:42:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:57 +0800
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
Subject: [PATCH v21 10/15] arm64: syscall: Use exit-specific flags check in el0_svc_common()
Date: Wed, 11 Nov 2026 19:42:20 +0800
Message-ID: <20261111114225.3977243-11-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261111_114307_876243_F8A37407 
X-CRM114-Status: GOOD (  12.15  )
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

The syscall exit path in el0_svc_common() re-evaluates all
_TIF_SYSCALL_WORK flags, but this mask contains flags that only
matter on entry:

- _TIF_SECCOMP: seccomp filtering is entry-only
- _TIF_SYSCALL_EMU: PTRACE_SYSEMU skips the syscall on entry

Re-checking them on exit is unnecessary and may trigger redundant work.

Switch to _TIF_SYSCALL_EXIT_WORK for the exit-path re-check to evaluate
only exit-relevant flags (_TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT, and
_TIF_SYSCALL_TRACEPOINT).

No functional change intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 0061fc63e7ba..f1f0b6f3e32b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,7 +127,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
 			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
-- 
2.34.1


