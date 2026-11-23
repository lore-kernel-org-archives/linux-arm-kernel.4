Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F561606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IXcObi7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pb2lYs+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n9Vi6fXV2kLrma4jnlJMeItulhA2U5CH2EzMknqFkBM=; b=1IXcObi7UrVAnXrWciCaJtT0WX
	iPOjYfuRplvi07QQEXr6u/MD4O3HYnjcsmbd3GoQgjsPm3ZkqoYKDHABCfwpzg080k7YRQXtnsCFt
	k5P0m8bGvFDmeGQYDKLM5YAvssnDYYKsJncseXXmfO00ok6V7S/gyyu9W2lIHbjW/sAtZhyD5zXSf
	U2gqRqwuAKmgIE4OA8Thu5uymf/EiAjhyiphPh+/es8Gk7HK9xeFfAS0QQVbjtyyz+go0VyTuk4Uj
	BCC8XBD4LdBCWby1nda6GCK+X8C38P2WRDJBHPsLKiEplQkcubCydy7rs3cDuhiff1kNgiBjF8+GZ
	0XNbYvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeC-00000004KDJ-4Btl;
	Mon, 23 Nov 2026 17:16:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeA-00000004KCp-2nGG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:16:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5621F143D;
	Mon, 23 Nov 2026 09:16:02 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8EF43F763;
	Mon, 23 Nov 2026 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454165; bh=PLmix3wUMZznq30E+gdl5v2UeGWepbJeohyBg07iSZo=;
	h=From:To:Cc:Subject:Date:From;
	b=Pb2lYs+YvRXVt6HKquDn6jX9yH3snAt20GK6LCJEq2uxGmYmUBH6R18hrUssoeJdW
	 ApZLc4tGLYO9IoUhWBlje3ir8as4A5LPUMxaMwcmLfS9BDni3XN8bLdYv0tMjXbCq3
	 Ag6srrcD4KOh/Qqu6injoweRNZIj80v7R/deJnTc=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] arm64: sdei: fix entry edge cases, pseudo-NMI
Date: Mon, 23 Nov 2026 17:15:54 +0000
Message-ID: <20261123171557.140944-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091606_762221_882F1E90 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This v3 has a few small fixes and commit message clarifications.
More details in the [v1] cover.

As discussed in [0], SDEI entry has a number of remaining issues.
This small series aims to fix the biggest potential issues :
 - Patch 1 : with KVM in VHE, VBAR_EL1 might not be correct
 - Patch 2 : PMR was not handled at all when using pseudo-NMI
 - Patch 3 : very early SDEI interrupt on non-boot hotplugged CPU
     might end up with `current == NULL`

I spent most of my time digging into the details of boot and
CPU bringup so I still do not have an SDEI test setup, so any testing
especially with `CONFIG_ARM64_PSEUDO_NMI=y` and
`irqchip.gicv3_pseudo_nmi=1` would be appreciated !

After some discussion and digging in the code, it looks like the issue
patch 3 fixes should be incredibly rare, so we might be OK without pulling
this patch at all. (Though the comment change for `__entry_task`
remains a relevant clarification.)

Thanks in advance
Ada

Changes in v3:
 - Clean up comment that an SDEI interrupt during KVM world switch
   would always hyp panic as patch 1 should avoid it (Kiryl)
 - Reword the commit message to detail the specifics in which the SDEI
   handler might get a NULL `__entry_task`
Changes in [v2] (patch 2 only):
 - Properly use pt_regs to save/restore the PMR in `__sdei_handler()`
   (Vladimir)
 - Update commit message accordingly

[0]: https://lore.kernel.org/r/20261105120835.3321912-1-kirill@shutemov.name
[v2]: https://lore.kernel.org/r/20261118154233.83599-1-ada.coupriediaz@arm.com
[v1]: https://lore.kernel.org/r/20261117174814.95936-1-ada.coupriediaz@arm.com

Ada Couprie Diaz (3):
  arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
  arm64: entry: sdei: save and restore PMR for pseudo-NMI
  arm64: head: set __entry_task along with task setup

 arch/arm64/kernel/entry-common.c | 38 +++++++++++++++++++++++---------
 arch/arm64/kernel/head.S         |  3 +++
 arch/arm64/kernel/process.c      |  3 ---
 arch/arm64/kernel/sdei.c         |  3 ---
 4 files changed, 30 insertions(+), 17 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.0


