Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B5606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdHkCKS0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZtvgWIdi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wmk/bbWl2jJTk/uL6VSD+8WUqUOpt5GKOa1yjJgQ5Ok=; b=JdHkCKS06dOUqpzKXG0gQHsyMc
	qqBKaDXjLIXvUNsGXP6pqEKfdwGBlE+fgoT2qNu7iyL9SYoRRT1kYbk15Zr8pU8PTXfHsJMbZ/UJ1
	nG1lHYroKyqFUEbQSYmUSxHLDvHPf7UBat0qw5m18Stcwjv8iFEtEyeF469uSgyE0q5ynd80Kmsg4
	jRtl/Hrcxbr8No3QVqnw4kVf+dLmx7pI42AuMtbFGirEbSDAz1/0k6sy+YzosD7YEz2yXtIWosXnN
	0/TBTTLsoWyXdvEHuL2Ql9mqcnAVNzUeWOaMHo0jLzTdIO6paOMPfdpUC+ihQy8b0eznB4BQEQ9Iw
	Dd6fuG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcT-0000000GiDe-2V92;
	Fri, 27 Nov 2026 15:12:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcQ-0000000GiBB-2DMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:12:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2186D169E;
	Fri, 27 Nov 2026 07:12:05 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974883F632;
	Fri, 27 Nov 2026 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792327; bh=OCMzx+iSsCMpWoW0jv7QNXScSWl4dEocpRUvUxsmCDw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZtvgWIdiu7QUq9fuAca84yswobbzpr01pGNr3Gz71ZCubQNeeklHHRoxn+WH13qxi
	 y6N0Bfjep0gBMQpxjsTU9EDqT/pqMcvIQyJLKP3ZOhNLNakuxLStPqThalXXgUPTsV
	 lnduj/P0dK/2YDvGT0Y4lbOH11p3WjSz/vu1w694=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] BBML3 cleanups and additions
Date: Fri, 27 Nov 2026 15:11:53 +0000
Message-ID: <20261127151157.406111-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071210_604500_C6109D7D 
X-CRM114-Status: UNSURE (   8.90  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi All,

This series updates the BBML3 allow list following a review of Arm CPU errata
and implementation support. Add a comment to track why 13 CPUs are not in the
BBML3 allow list, and enable BBML3 for Cortex-A320, A520 and A720.

Applies on top of v7.4-rc4.


Changes since v1 [1]
====================

 - First 2 patches of v1 were errata workarounds; they were already merged and
   are in v7.4-rc4, so dropped them here.
 - Documenting which CPUs have errata preventing admission to BBML3 allow list
   using comment instead of the previous Kconfig approach (per Catalin).
 - Dropped C2 Ultra definitions as they are no longer needed.


Thanks,
Ryan

Ryan Roberts (3):
  arm64: cputype: Add Cortex-A320 definitions
  arm64: cpufeature: Document BBML3 exclusions
  arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720

 Documentation/arch/arm64/silicon-errata.rst | 16 +++++++++++++
 arch/arm64/include/asm/cputype.h            |  2 ++
 arch/arm64/kernel/cpufeature.c              | 26 ++++++++++++++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)

--
2.43.0


