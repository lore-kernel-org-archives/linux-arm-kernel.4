Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9931606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=laFh2+hy;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bT1Xmvbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oNHqfl9+bibmQEueGqHatMhjdg5hoX83BhY/GM2pZFg=; b=laFh2+hyi7COsHqwrXCXXXkZlM
	T1Q1WwPWlQatWouslNKURibDj7stFvD1/0uTaee+2bTq1j+payU4TsLMLFLMiBZsCeQm8CoOFYWPJ
	7t8YI7KmBzw05CWl3o2hqmZBROz+bN8ja0jzcvZDgZGhzUSPOW/devjzPMLxd6w9Hf7ZGUTGA+EiL
	Q7DiggqjWinNwlOktJI19q9k4iimoMQ05K/bni3/yQv/Ym8kSlfpWjVrS/AbPcq0id+4ujetgiuME
	uicDZU6mGsyeZ0D8iwCRpggleNzBCBGqzq0cUepzWPn7cnA90c/2XRKBFcBzINF/Yp3iO3l+1zXH9
	GWEHd2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD6-0000000FpZx-3ugm;
	Fri, 27 Nov 2026 11:33:48 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCu-0000000FpN8-22MY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:37 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299833;
	Fri, 27 Nov 2026 19:33:33 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com,
	pierre-yves.mordret@st.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] dmaengine: stm32: Pair DMA provider registration with cleanup
Date: Fri, 27 Nov 2026 19:33:29 +0800
Message-Id: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc838b903a2kunm85c9bc3d395df8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB1JVkpJTk8YQkpKSU9OGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=bT1XmvbfQTvdpviiigCrR55Dgo1EZtbECMxnS9ukfh+r3kEfnfD1jE5nKHk9aPj5oGSJuKzX4TPAOXiHWimD0oHIO/gVnVZYI6m1Akf7eowDW/TQKo30p8xk0rN9lXpk/iaIbGEpKdcOcPsgGKGdoVGA530A/+2rzfWttQSjor0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=oNHqfl9+bibmQEueGqHatMhjdg5hoX83BhY/GM2pZFg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033336_813874_A7F85A1E 
X-CRM114-Status: UNSURE (   2.32  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Unregister the STM32 DMA mux, DMA and MDMA providers when their devices
are removed.

Tian Xuechen (3):
  dmaengine: stm32-dmamux: Unregister the DMA router on removal
  dmaengine: stm32-dma: Unregister the OF controller and DMA device
  dmaengine: stm32-mdma: Use managed OF DMA controller registration

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

