Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42255606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdAi4nBc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h/ltmBfH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=88w6QzEJLCb8lOBnvjJq8KpuEJV6ibY/O1xw29xF2wI=; b=zdAi4nBcGKtyaUIZLobO2yhdMn
	IOBZoiUoCVM+Tbdo23xMILCf0tSVX3BX+ogtz7fhQP4m/zfQOeWmCUZeSGvjEov73FjutVYsMGUL1
	XtQGOXO6FhUzrc2+7JItWtwDrENpUanZph4o+fJ15JNxXEICiH1AghMG/+w644nZU5NjbEuo2muda
	97Qq4bUXQF7sPNzeS2NWeq9vE6+8c/c9Mc3PpY8ttJdHKxd5muaSKr0SJxnjrKvPqozLhkkvElCVg
	+XtgCZHQGOH1OTsdBybESdLEulcjznx73kN3At1TiPglk+3cYxb8o7YDm1pnEhzXDDp1fm+fhe8ov
	e04tdBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6L-0000000HQcm-3AJY;
	Sun, 15 Nov 2026 11:08:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6J-0000000HQbk-1Uqa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:08:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C5FF497;
	Sun, 15 Nov 2026 03:08:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C6393F632;
	Sun, 15 Nov 2026 03:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794740924; bh=KhEeNemkEpavm37chizGaegKBBqImS4b67JG9WiRUc0=;
	h=From:To:Cc:Subject:Date:From;
	b=h/ltmBfH5qRqUrpDLciy1QrMBFsmAB9s06AjHF7OcoCf3y1x3JD/RfpmCxrBQQClS
	 D2Aq5M1Eih6bqh+RyyPI7K8rXY7i5hwq2otIb1zyklO13KA7YwM5695so3KpYwTKM6
	 MOR52TSRRHvgV2UVJdSJjny/XMUSOqMhkg1aM+NQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/3] SCMI Powercap zones processing fixes
Date: Sun, 15 Nov 2026 11:05:43 +0000
Message-ID: <20261115110546.2344308-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_030847_534892_A8B02838 
X-CRM114-Status: UNSURE (   7.73  )
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

A tiny series of fixes around SCMI Powercap hierarchy-scanning logic to
address a number of issues reported by Sashiko.

Patch 1/2 is really a repost to an alreday reviewed fix, included here
simply to avoid conflicts.

Patch 2/3 provides the fixes around the logic used by the SCMI Powercap
driver to validate the hierarchy of zones provided by the SCMI platform
firmware: these are applied first to the original code to ease
backporting.

Patch 3/3 simplifies the code above by refactoring using cleanup handlers.

Based on v7.4-rc2.

Thanks,
Cristian

Cristian Marussi (2):
  powercap: arm_scmi: Reject zones hierarchy containing cycles or holes
  powercap: arm_scmi: Refactor scmi_zones_register error path

Guangshuo Li (1):
  powercap: arm_scmi: Fix potential stale zones after a skipped leaf

 drivers/powercap/arm_scmi_powercap.c | 42 +++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

-- 
2.54.0


