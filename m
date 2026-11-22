Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6EgDAiL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdRCwCpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E+Fp6cNttPvM4VxDuimKQ4XRCvflJSmhvQUQ+Qb+x84=; b=d6EgDAiLUW9Bqny/ix1ObvQndK
	t2Qz7rVo5LW9WmO5LPGq8c9a63AgWeyzLXgtSQtFF8HKurC5GsnfeaWY0GF9+EFN3xrYH3P/+NINb
	wGrKJ9By/o7m1nKeRzRU8kOgRVNwuR7pHOQ4U7d425QvzXVGkixacOHcUbOT0QsNbQeJhyYmuKBx0
	4WEvkxSwu2SYsA73pp7fUR6saavefzc7pDtX9/xvXReTbG4Q2vqkeHssz7RPYUo1Z3yaRs0MllE1p
	YH/9VCp4QxevvYb8aWGUC73mukmEtPj21HVkzsO6OzCH5QIGhWL6nCvfSVRJU87W3+Sf1CJt/9qww
	J4djIiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGxt-00000001tTZ-2n2B;
	Sun, 22 Nov 2026 23:27:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGxs-00000001tTJ-1zCw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 23:27:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98998605FB;
	Sun, 22 Nov 2026 23:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6EC1F000C4;
	Sun, 22 Nov 2026 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795390038;
	bh=E+Fp6cNttPvM4VxDuimKQ4XRCvflJSmhvQUQ+Qb+x84=;
	h=From:Subject:Date:To:Cc;
	b=TdRCwCptNZQnG6kODSgzOJdBKdvTTu70ohFjU+G1uUK8bFxfvzMa8s7RvGEyPXV7S
	 8PNdH54gLdB9msuyOuJ4rEEYrcmTaljczy9L5ST8ebWqQ5HwQlUQ63EXDGQpB7T5C+
	 mMlJ5UfRdPiHp3LK8lZ70XXENnIjNxtsXrJkfgCJjDaAqzm3VrdYLsiYwaP9ykzCgi
	 FlVD1wDJAaO8Y9qO/HeTWasUp7V+4CHDprDonvMMamjlxIfyhXchiFWKQUbLG/Jmk6
	 L4hUYpf89/7WYidVRwWg26xNxYOSyn7JULZJxNVG1VQoIJM58B8Y+uMZdm6Ybx70ZL
	 dvqdnFraENgjg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/2] ARM and ARM V7M generic entry
Date: Mon, 23 Nov 2026 00:27:14 +0100
Message-Id: <20261123-arm-generic-irq-entry-v7-1-v4-0-49d245498f72@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33Ny2rDMBCF4VcRWmeKLrZke9X3KFnY0shR28jty
 BENwe9elFJCKXh54PD9N56RImY+sBsnLDHHJfGBNQfG3WlMM0L0fGBcCWWEUQpGOsOMCSk6iPQ
 JmFa6QrEgIQTjpDeud03HD4x/EIb4dcdfjj87X6ZXdGsV6+MU87rQ9V4vsv5+Q3ovVGStqdaNV
 tge9fT8hpTw/WmhmddSUQ+rE2bXUiBBe29tYyfVGvvP0g+rl2LX0iChDb4XwXRtj/KPtW3bNzY
 u08JvAQAA
X-Change-ID: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
 Yoshifumi SHU <envzhu@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

An earlier attempt at generic entry for everything (like syscalls)
was too invasive. Let's begin with just IRQ entry.

On QEMU Cortex-A15, perf bench syscall basic and perf bench sched
messaging (sockets and pipes) showed no statistically significant
slowdown in 12 paired runs against v7.4-rc1.

V7M is now handled by way of Yoshifumi SHU:s patch.

An LLM assisted with this patch series.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v4:
- Rebased on v7.4-rc1.
- Fix rseq aborts on V7M preemption.
- Add Yoshifumi SHU's V7M generic IRQ entry patch.
- Link to v3: https://patch.msgid.link/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org

Changes in v3:
- Rebased on v7.3-rc1.
- Fix rseq abort handling for synchronous userspace exceptions.
- Link to v2: https://patch.msgid.link/20260806-arm-generic-irq-entry-v7-1-v2-1-3dd7747b2567@kernel.org

Changes in v2:
- Rebase on v7.2-rc1
- Select GENERIC_IRQ_ENTRY also for V7M even if this platform is not
  using it, in order to properly link the image.
- Link to v1: https://patch.msgid.link/20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org

---
Linus Walleij (1):
      ARM: entry: Convert IRQ handling to generic IRQ entry

Yoshifumi SHU (1):
      ARM: v7m: entry: Convert IRQ handling to generic IRQ entry

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  16 +++++
 arch/arm/include/asm/entry.h        |  16 +++++
 arch/arm/include/asm/ptrace.h       |   7 +-
 arch/arm/kernel/Makefile            |   2 +-
 arch/arm/kernel/entry-armv.S        |  78 ++++++---------------
 arch/arm/kernel/entry-common.S      |   8 ++-
 arch/arm/kernel/entry-header.S      |   7 +-
 arch/arm/kernel/entry-v7m.S         |  49 +++----------
 arch/arm/kernel/entry.c             | 133 ++++++++++++++++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/signal.c            |   6 ++
 13 files changed, 227 insertions(+), 104 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260622-arm-generic-irq-entry-v7-1-ff6c1d6c9c48

Best regards,
--  
Linus Walleij <linusw@kernel.org>


