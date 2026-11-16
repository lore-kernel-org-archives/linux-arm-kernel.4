Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F41606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3NvPchsj;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cUGU25fK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rtFnDyl47tsTGuxK40gEh/K+aKI4GtpFKqvWpQwqqwQ=; b=3NvPchsjrxGJ1DzmhyQXkoT8eI
	grC37mCbrKZX0FUDQcXVcVRgN6BMwYZer7KwezspzVRX9+fSZ4068TbaDaWqUJvY1f+LLrah3uQKO
	2iaqiFmfcml0xwKFxnvgXDqYw/M72THTqGbwEC5W2En7YNIdEz+dDOzLFoYa8/x7nikbX98biM7cb
	yCLze9UfGRfKSPWiG3/DpuFvBJbe8+iLjkdBHA9dZk+RHajzUTOb2GWzseq0Lrpf/UDoiimMMQ+L4
	8g6IshF1MNNRXXOWrNT0/shb1337Y1R57rbmrcAIQwsagDAKgAszyVYagp1y4r09ZLW/2eKc9viaL
	kzz+7nBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKP-00000001eDK-3ZAz;
	Mon, 16 Nov 2026 08:44:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKN-00000001eCa-3388
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:44:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F6B91476;
	Mon, 16 Nov 2026 00:44:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AE4C3F673;
	Mon, 16 Nov 2026 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818678; bh=NV4ryiahK74Sd/qVQCgOoI8Ogk6RRN3p9sla8O177pg=;
	h=From:To:Cc:Subject:Date:From;
	b=cUGU25fKj58px44C0ZYSxLTw6qwjJ6MulVGA4vFhSi1NyWt38ykS5l1v9kiWxN8+u
	 p49ziWScwTD7GKlFdlD+2krHBTcagLyOsSD4e0piEsbXIy46fWNasTm3o5eL5O/OGJ
	 g516rpXghT/27um4/Yh3bOuFk+4Rrb2LFUYNrM/w=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] SCMI Power Control fixes
Date: Mon, 16 Nov 2026 08:42:09 +0000
Message-ID: <20261116084211.3066460-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004439_878462_D3314992 
X-CRM114-Status: UNSURE (   6.75  )
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

Patch 1/2 is a fix to a possible deadlock already posted on the list which
had still some residual issues as flagged by Sashiko: I addressed such
issues (hopefully) maintaining the original authorship and reposted within
this series to minimize conflicts.

Patch 2/2 is a rework aiming at fixing some unbind-time issues flagged by
Sashiko.

Based on v7.4-rc2.

Thanks,
Cristian

Chengyu Liu (1):
  firmware: arm_scmi: Fix deadlock between reboot notifier and forceful
    work

Cristian Marussi (1):
  firmware: arm_scmi: Fix SCMI Power Control driver removal

 .../firmware/arm_scmi/scmi_power_control.c    | 102 +++++++++++++++---
 1 file changed, 89 insertions(+), 13 deletions(-)

-- 
2.54.0


