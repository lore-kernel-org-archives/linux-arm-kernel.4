Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B088606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5tj7Pr6;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MjkjWP4z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=04dQZCj1BDrZAF+6UeXOlw0NGYqib0zOsImSzzHzEGo=; b=h5tj7Pr6+7cX0t/pqt2RT7a2nQ
	h3270alSPXYDPQ7ATtFdjSb5zEFZBoIEcwN69z1HYciGd4DRc4toYeHyd1Ak3L4Nt+AkaHDBKgQzp
	2v+FYXsytNHGTlPHkogO9m4vwybXN7lvPAuYjtvGKxQkt36QWRHqFpXSePIDv0nejKZhTVrLaJy24
	SQPIiEXS4OkeSHnEeHajFSL8PtsAVBvD0+8hG5vDuiJ9PAkU3eIeUhKqqNX2zX2mKMTQI2cmuuS9A
	dnykDjtftdHIamh0bQ1yk5+eKtjugXOmQmPlfV5gSe/DF3phA4N+CC1b6bZabV3/U8bHSEJja80lN
	L3t7zX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCb-00000005vFb-2Sqv;
	Tue, 17 Nov 2026 13:26:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCY-00000005vED-33hX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:26:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6471476;
	Tue, 17 Nov 2026 05:26:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA2003F632;
	Tue, 17 Nov 2026 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921981; bh=nDbKgdf1MwSUZ2uyvB8m7xNJGz0aC8cVtUcYiJtf3mU=;
	h=From:To:Cc:Subject:Date:From;
	b=MjkjWP4zD8Q/046VEhZqkP6nC/uH0/aKAJ5mmVYR6Aq9sgmTCrTEINE4zbjjYOwdj
	 C6NA85khrR1nlCr2+9yqI/El2bEJbB0+1nP00OPx3bGlOxfE7a/HMNH2moiYkEPtf8
	 20FotckquhBc9a7yissgUzuN2Wfea6KmcHdQ/C5w=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 0/2] SCMI Power Control fixes
Date: Tue, 17 Nov 2026 13:23:09 +0000
Message-ID: <20261117132311.291199-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052622_813263_7E44CFDD 
X-CRM114-Status: UNSURE (   7.55  )
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

Hi,

Patch 1/2 is a fix to a possible deadlock already posted on the list,
BUT in v2 I dropped patch 1/2 from Chengyu Liu in favour of a new approach
that keeps the original locking sections.

Patch 2/2 is a rework aiming at fixing some unbind-time issues flagged by
Sashiko: it still has to solve one residual Sashiko flagged issues between
removal and reboot.

Based on v7.4-rc2.

Thanks,
Cristian

Cristian Marussi (2):
  firmware: arm_scmi: Fix deadlock between reboot notifier and forceful
    work
  firmware: arm_scmi: Fix SCMI Power Control driver removal

 .../firmware/arm_scmi/scmi_power_control.c    | 99 ++++++++++++++++---
 1 file changed, 88 insertions(+), 11 deletions(-)

-- 
2.54.0


