Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB5606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hbXfSC6i;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dQE2JrKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wNO+pQA+z2mGdW/buS+s8Ij2Nth+akjvSz+KUTzTPlI=; b=hbXfSC6iV/za5LYmboNN1arZ+N
	XEQ+vI5EP8Apa05cHnIyZcYh6SoDaTtSm49VsVcZOupJYvHLuVLJ4V3PKdZI7gBfB+VnWdue6agHD
	OzLAaKNzrw0WA0mXKLyp0lVJRH8tMGgvLnN/1I9+YfDWThEjBsRehMVgcZknXQ809GK1sk9uqj+sK
	WeyD4u2HEA3btvlrdeJrgNMEx+FEaIK85ooqdVfSv6dMxHpASE0NehInKwaRsQeNPXiItMhfVlIGt
	0LqU1DwY+8J4MP3vsGdL2mvnaQcrGiwGa19d8kaDixob60Zp+5Jz4qXpXRoAjDSNi7bgEKz+IASZt
	eboWrMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7cq-00000006hQ6-23pc;
	Wed, 11 Nov 2026 12:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7co-00000006hOz-1JCG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C9DF1576;
	Wed, 11 Nov 2026 04:40:20 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.69.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27C773FA32;
	Wed, 11 Nov 2026 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794400823; bh=1Nc0RbxOXukH7jC1DIpqnAnnH8zu2+0RQlLG4QdYanM=;
	h=From:To:Cc:Subject:Date:From;
	b=dQE2JrKmfmCoeWZd9yX1X2s50vjMwG1cj6e4Q2Ae/2h9jxMnbImZ5p4bzWn+zvpWX
	 QHJZN21ceWzJj0pU/ULFnQxcqwi6FIm/VZVOjsy+i3WkUWoBupBSCJvZzYFPGDpno+
	 iIralfhTnzPOSUM3S+QdFZzGCPMkwD9zu/lJVMjY=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: errata: Update AMU workarounds
Date: Wed, 11 Nov 2026 13:39:26 +0100
Message-ID: <20261111124005.2688820-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_044026_408897_AA60ABDF 
X-CRM114-Status: UNSURE (   8.50  )
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

This short series updates errata for AMU core & const counters.
The last patch in the series tries to optimize a bit the paired
readings of both counters, so that the workaround checks do not
skew the results. It is also intentionally the last one, as it
will not apply on older stable kernels.


Beata Michalska (3):
  arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
  arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
  arm64: topology: Reduce the skew for AMU feedback counter sampling

 Documentation/arch/arm64/silicon-errata.rst | 12 ++++
 arch/arm64/Kconfig                          | 44 ++++++++++++-
 arch/arm64/kernel/cpu_errata.c              | 29 ++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/topology.c                | 73 ++++++++++++++-------
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 133 insertions(+), 29 deletions(-)

-- 
2.43.0


