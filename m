Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B52606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QutM+0CN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RsrPhy5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aRYBZQ4Ht5kZX57P298GjLLCrbN6MxWAWiVcqBd8U/0=; b=QutM+0CNKtAoJ9d5furwCNQ4MK
	+SoPoW+OApuF3zzmaK+lAyNc1S6rDVenJ2c+pxJiMRRyzAMfP4IkJndWgSfhzj/ciHSjTAHbwd6th
	F5pMWzpjYCi7ELpwFnhfzM8Ml0XdmILMYK0LtHZEGx5ztqV6JKtWE9speiaiidcmWTqNKN/nwu42j
	uiQ9iBfPnZpd2LsMGTLW/eDdI+LnYotomt4q7wV2U4MfPQhKufvTW+icgD+kPyQ+l+5D08R83sQG6
	ZYLIBuN0w4N1d1G1DjCzDH0qeZsAd4EwJZkIpdqCLD/BZbrCJtl63lI6rtvyrg4BIeScAeE49wnnP
	5KkWZa5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNXu-0000000EvTs-2iXb;
	Fri, 20 Nov 2026 12:16:50 +0000
Received: from out-72.mta0.migadu.com ([2001:41d0:1004:224b::48] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNXr-0000000EvSp-03LP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:16:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fhu727nN0pvqV5zVBMZ/RjFZQtOGS0SCxmE807hB38E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177003; v=1; x=1795781803;
 b=RsrPhy5w5aFv5WVuDBn5pJx+f2eUuv9FAtg3R6YHw1UEcreKD8yHjUgUU9W/aWJqKqDdB3+L
 Su5yYX0f1aEq7a5swxg1iTuQBZDuPd3DR/Wu2/UyAwWMZyX9/bYbkAaUBczfiMqs4AyJyS1YiDH
 oLlFxlUOJt193rM9y718vHwc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 43ace5a5e7df4395;
	Fri, 20 Nov 2026 12:16:43 +0000
X-Mizu-Trace-ID: 43ace5a5e7df4395
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/3] arm64: Missing barriers in kernel page-table updates
Date: Fri, 20 Nov 2026 12:16:35 +0000
Message-ID: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_041647_266273_C966CABD 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Three fixes for kernel mappings that are made valid and then used on
the same CPU before an ISB, so the access can take a translation fault.

Tested on QEMU. The runtime changes to the linear map that patch 3
covers were not exercised, since they require a CPU with BBML3.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

Fuad Tabba (3):
  arm64: pi: Add an ISB after mapping the FDT in the initial ID map
  arm64: mm: Add an ISB after remapping the KPTI page-table slot
  arm64: mm: Don't defer the barriers when installing a fixmap entry

 arch/arm64/kernel/pi/map_kernel.c | 1 +
 arch/arm64/mm/fixmap.c            | 4 +++-
 arch/arm64/mm/proc.S              | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


