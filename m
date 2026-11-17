Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yv5Qrh0U;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rBhTkDnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AuJAo5sXOKJqP6dr35P+8qt11I9icgfuipOCWrKlAKc=; b=yv5Qrh0UiLkutYbVBlFk3vBMTA
	WMkvs4lryKtKBtgUTzUWACnRba5UITMv80mfwkvLSYUEAk22+P0pKLBEZm1zlFkRBZr7jKubwghyG
	LYEQCo1S9RMMmrBSKbg+SdUzvO72PKVN/eEoCVKdwdgo6uvlsbvonvTPoPNcYkqbGw362yCBZd9jS
	PNAJxQV5K9XASa2PdjjA/9TS7ekdWzsS2PxQRi/EqVUi8T6VBDi4YJbsOQRP9FDjdPdCAcIvIZgtw
	ZLBd0oV4qEan/Ed71DdxbKphbnHDqmHCBtGWpcaYj3mujY9yBpphX1D2x9xhcTxgKy/MiEeRBFGRM
	Macse6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBG-00000006R9A-47j7;
	Tue, 17 Nov 2026 16:37:14 +0000
Received: from out-52.mta1.migadu.com ([95.215.58.52] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMBE-00000006R8T-36dm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:37:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YdLYpWBKlUKagfnJowyll08aWW+OkxhrNMtlF8HSUF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933430; v=1; x=1795538230;
 b=rBhTkDnByteCwB9BjXwPqhFrXswQRoEDOvfoDr6dqMpeykljPTO0w6yzVgjTbRPnAqMWOMrT
 bAi2fcjRgFMOsQFyvsCAAaO1l0sHfCHVcoX83uRbvvZF/yYQ2DlZIykgbGTzy2OIyMh4qPwO3ZB
 U05r2RuH1Xu9pDp0zormkO4Q=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id adf884b6486dea4a;
	Tue, 17 Nov 2026 16:37:08 +0000
X-Mizu-Trace-ID: adf884b6486dea4a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: arm64: Fixes for the host SMCs that pKVM forwards to firmware
Date: Tue, 17 Nov 2026 16:36:59 +0000
Message-ID: <20261117163702.1678277-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_083712_920408_795B1CCE 
X-CRM114-Status: GOOD (  12.16  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - New patch 1, which stops forwarding the host's SDEI calls.
  - Don't run a protected vCPU on a CPU where the firmware Spectre-v4
    mitigation is disabled, instead of re-enabling it from EL2. (Marc)
  - Track the host's ARCH_WORKAROUND_2 calls with a kvm_host_data flag
    instead of a new per-CPU variable. (Marc)
  - Handle the calls in default_host_smc_handler(). (Marc)

Two fixes for the host SMCs that EL2 forwards in protected mode, which
reach firmware as calls from EL2.

The first stops forwarding the host's SDEI calls. With TF-A, the host
could otherwise register an event handler that runs at EL2.

The second is the v1 fix, redone as Marc suggested. It tracks the
firmware Spectre-v4 mitigation state from the host's ARCH_WORKAROUND_2
calls, and relies on the first patch because firmware restores that
state when an SDEI event completes.

Tested on QEMU with TF-A v2.15 and test-only host changes. When SDEI is
built into TF-A, the host's SDEI calls succeed without the first patch
and get NOT_SUPPORTED with it. With TF-A patched to advertise the
dynamic Spectre-v4 workaround on the Cortex-A57 that QEMU models, a
protected vCPU runs with the mitigation disabled, and the second patch
stops it from running.

Based on Linux 7.4-rc2 (7475ea8b58616; also applies to Linux 7.4-rc3
aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261113081934.1715497-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Don't forward the host's SDEI calls to firmware
  KVM: arm64: Don't run a pVM with firmware Spectre-v4 mitigation
    disabled

 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 30 ++++++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


