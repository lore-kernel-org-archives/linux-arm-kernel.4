Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBltPUX9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P6/pgzNi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SKLh7NaPcZMHnOU2sm1eukz8SXtZxHzml55UTzZOPaA=; b=UBltPUX9gPFg4l
	2ywIDpTYRv98uXksq7UTHlCn/3qRjr7uIJwn0tjGcOiyLRSnWJ3cyCPmDJ+jlOPcs5yi7GAJI7hwx
	yF6MFNAfIQToHkMlVVFtc3wf8UaOj0TeGb8MnPtLAroaYXZDSTkW7uEXB7zlT4Zrjuj/T78PaldQi
	kO7NM854Y0w5DsLxdREux+caoLgtItSc2icjAS20nq8cHe8MGTHpWfEpk5Y7z8fPl0zzSGUY0HQOt
	ukR8pBdEni+Xzb1JXLKor5On5ez9bckliNWbaxKR3VG0DgEFS4uB8/UNCqcS26VL+AUrz4HY9LMY3
	iUWrnZgKLGwedZjjnf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc7-0000000DECo-43Uo;
	Fri, 13 Nov 2026 14:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc4-0000000DE7f-0pKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:50:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692971516;
	Fri, 13 Nov 2026 06:50:44 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436043F673;
	Fri, 13 Nov 2026 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581447; bh=a5m4ysPdwyGSGObjocs16GCukbgNzqxTIp8ZFTo6HQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6/pgzNiwR+xiURr+QOsFiJdBfXTAhOC/+4fkQIbldKvz0MfrC/9QvoeZB1g5DPZh
	 kF0Kk9MuNqoybN/vhUDTdNVOdzKfgktHv5w1Dq5cAEVXTg6ORNiMV5weP4eJMyuz/I
	 aKf3eovyxiHjRhwE5JHUFMJrRIPpiyGbwos1qiiY=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720
Date: Fri, 13 Nov 2026 14:50:20 +0000
Message-ID: <20261113145022.2592454-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065048_287604_94B6A1F4 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Cortex-A320, Cortex-A520 and Cortex-A720 advertise BBML2 and are known
not to raise conflict aborts for mapping-granularity changes. They can
therefore use the BBML3 semantics, but their MIDRs are missing from the
allow list.

Commit a7ac60414475 ("arm64: cpufeature: Extend bbml2_noabort support
list") named A520(AE) and A720(AE), but added only the AE MIDRs. The
non-AE CPUs have distinct MIDRs and need their own entries. Cortex-A320
can now be identified using its new MIDR definition.

Add all revisions of these three CPUs to the allow list. The reviewed
SDENs identify no BBML3 exclusion erratum for them.

Cortex-A510 remains excluded because it can raise conflict aborts.

Link: https://support.arm.com/documentation/SDEN-2877630/0000?lang=en&rev=0000-06
Link: https://support.arm.com/documentation/SDEN-2444153/0000?lang=en&rev=0000-12
Link: https://support.arm.com/documentation/SDEN-2439421/0000?lang=en&rev=0000-17
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index aa6f4c8c1052..de2d2bd686d8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2015,11 +2015,14 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A320),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
 #ifndef CONFIG_ARM64_ERRATUM_3696244
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
 #endif
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 #ifndef CONFIG_ARM64_ERRATUM_3696244
-- 
2.43.0


