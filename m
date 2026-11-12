Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB910606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3YEbf9A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IWI28ENe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vTeGxeSM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sVcdAHXiGEmKbpHWadwlRimhG+IB6tBqySeskFFJpsQ=; b=b3YEbf9AZSlAG3
	/X3B8A10CGlbjUmGbXInwxx4iB6cEFvfuM7N3ri5A04dCfuRIhhRRY4WHHlqTTmBV5mHj8r+MkUCK
	Z7/AhNVuxLeiKy9yg93wb8aBxAXsqvVlIagBLmp5ekHAqqf68ZXtKg716mGJeTyRWo7YGPJHqA3Tz
	IAT0WohUs88GOKVwpttJTvnSPNFKbyTAChnBp/iJAXk/cC9nyj8dOG7FYj85vfF4UE86XqFSloRgX
	B7TKMgnaBWgWGSAwmw0k8T/Gr4GqssoRn5EnnhfSC5FZq8RJSkfz2izGm0hrvByGsYyb+8mS1oeTp
	lfeZj4OCKQayAUrcaAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUm6-0000000A2BL-2P6W;
	Thu, 12 Nov 2026 13:23:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlL-0000000A1Gr-1oOm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sVcdAHXiGEmKbpHWadwlRimhG+IB6tBqySeskFFJpsQ=; b=IWI28ENenzCgZ6vSSaianByc6S
	MLY2K++/qrNrSsNUDoma3LtCOkjfSXyql6G3g+lff5F1opKQMdp1wT9Hn2UD2wNPf1piQ6VA1yoTs
	UuLnNptaGwpqPC2vLPjVlzhsdpvAoTHMfOJ01Ck7ei2Slbnx7IPKVTUCV2CLS5MrcgV4aMp7RLzqN
	hmaGxKvTnPKzSDJS6H+EXAPyMQ/PtA1bE++AgLBb4jgquigvsF55zxBPQVWqeDq6ViNbGeTHG5zty
	I0taxhehq1Bv0C8gZE1iNVQpuS8JEbdqMrKqh9SDkYILOdUyMEMRfpfcdDlpajrGqbz5YZnTiOfXS
	rFiZniNA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlI-0000000AMqL-22Ki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 786731BF3;
	Thu, 12 Nov 2026 05:22:39 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DB813F632;
	Thu, 12 Nov 2026 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489762; bh=QQhTWY2PpIIpKwluIxvsIRnkuAtIdzZipZa7sjNDer4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vTeGxeSMZ+n6PmAiy14Xv13D0L9IaRxfYDqJJb2bWw4oU4PYh7VcXocT0qWmv4OmY
	 zBuFhRSbZ7DIiH3Vp9DACoijImxxZPcrXmGHGXILDRaNUNlFC/sy1TrZ6+Z/NvKCXn
	 1RlNQw5UM0J2HJV3V6hvs+0vAcRvp1P8EuAUQEnE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 33/39] arm64: nmi: Select HAVE_PERF_EVENTS_NMI for FEAT_NMI
Date: Thu, 12 Nov 2026 13:20:36 +0000
Message-Id: <20261112132042.129062-34-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132244_860696_90FB9579 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.5 (--)
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

HAVE_PERF_EVENTS_NMI is currently selected only when pseudo-NMIs are
enabled. FEAT_NMI also allows performance events to use NMI context,
so select HAVE_PERF_EVENTS_NMI when ARM64_NMI is enabled.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 12cad0650863..5f8c71e44af5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -216,7 +216,7 @@ config ARM64
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
-	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
+	select HAVE_PERF_EVENTS_NMI if (ARM64_PSEUDO_NMI || ARM64_NMI)
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
-- 
2.34.1


