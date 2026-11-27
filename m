Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C57606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1tQO4n+N;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCuqdHno
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0pyZKqnDWMuc95St72Xgy3CQJky567UxPOLvnlQg5vw=; b=1tQO4n+NHzif8D
	FWmkJymzUjfRmWvtR6Iwzp11flmwQC2FLnS1wyJQsKkjMqfcZUsCgi1RQ4mMbHoSJgQ9M+HLpNf82
	hss0GFxx61A+mPHh7j99uHjrKHnhcggYZu0DqvckxtR/k0wVDby1uCWRCt2o3x/ynjZI2YReTyR4t
	H7uyIEUCukpJIwd312MRzIGslhvVLLiHGPDSf7Y0k+lFuFIPzKxE8ot9fYUibJ1MldiFwHXKy+1T+
	x/F4EU5imWY9w+1VLk7d41DD9OP5zaCW0qwyLdnF1MVIOOD/3UilKc7TO0LfcY+W+Q/oL8b2Adr05
	uEI0XYDY5x5YrDCqYZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxch-0000000GiJN-1Ttf;
	Fri, 27 Nov 2026 15:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcT-0000000GiD8-0gsO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A086E1DB5;
	Fri, 27 Nov 2026 07:12:09 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 237B63F632;
	Fri, 27 Nov 2026 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792332; bh=MxCYFbgbltrmMMr0MHqOOsTbz5t4vRUGRW7Vw3l2Y7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCuqdHnoNNtfuX/W8z7GpIPrdn5rStcDNgIcn42t7WOmlHpBZhcchQHWCjOO1We6P
	 mjZ334e2vZCMWS5p0UpEhE6oVIOr2Mz8lEBkWbCnPstO4lEyN04kGKKRv6KXpyUI8c
	 P7RgJoXCuiEX7VEKdI4D8DCvifO+TZGVNbSiciOI=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720
Date: Fri, 27 Nov 2026 15:11:56 +0000
Message-ID: <20261127151157.406111-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127151157.406111-1-ryan.roberts@arm.com>
References: <20261127151157.406111-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071213_241214_FD936595 
X-CRM114-Status: UNSURE (   9.40  )
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
index 710d44a30d29..1c4e809f73e4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2037,8 +2037,11 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A320),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
-- 
2.43.0


