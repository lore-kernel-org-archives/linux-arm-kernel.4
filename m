Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntKqsgHV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPnPtLD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3FMYFsYc+wva2H/zEk/C4iK7aMpqtATF1UrEYEweIaM=; b=ntKqsgHVokdEb5
	6pGTSVG+cv7PKyjLzBmh6H/4haLZekEmV4UJbJiuY5ogC2naUQJUgbD7Wr2GyDfvK4qLkwGDmYMUY
	islVwacejQ/L8gZsRABUtuQTuDYr+j5pRd0rXlnBUnEAHF6+4XaSCYdgC84LpK2tOW/foyqoksyfh
	L9GBUyC5znK4R3JGV5szmUKEnNYrczCqOfd+Grphz08+KXvSztTTGhn63zGsimRYBCtG+7UmTIkC8
	GVz0aG0fuPTpyCfvrArUqqSzEyH56MjPNXzQ+ZvDbFeZlRIo91enMnT8df2CL+izApoOmUabhasKu
	7P3pXd2hNlm33NIpambg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkm-00000004LRB-2CGS;
	Mon, 23 Nov 2026 17:22:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkj-00000004LQN-3Lfn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:22:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C5646224B;
	Mon, 23 Nov 2026 17:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FF21F000E1;
	Mon, 23 Nov 2026 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454572;
	bh=3FMYFsYc+wva2H/zEk/C4iK7aMpqtATF1UrEYEweIaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mPnPtLD/VuZKnc5ZjfURUG5kqQ4DFhH+yLjIQ+XaA753XY/1ZQNEHXIMTKHli2Q+l
	 6QuU+bMnjLB63jE8AnI7N2Lp1Oc7vpoROhVVJx3fvG/8o74wI5S8oXyVbjgeoONuIJ
	 EyvYr0cM6oILwMmEBF7WVnmHM+PFM6D6iwBg5bstkuu1+gJb+WlaLaUqFl1zulSEmy
	 MDUwmI43NgJgVz9Em5ooZ1ecJKfkGgCl0TirKf2zOqhj7Rr6Hzbb0LCDBgblxTXblG
	 GODWu6a078+Wch/je8dTIBfn6/Fe3HNwqEMUubgwKdG/D9riVDrga2c6gHPNigRCqR
	 h7iS7uXaJrImQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 09/10] remoteproc: imx_dsp_rproc: Fix pointer stride in imx_dsp_rproc_memset()
Date: Mon, 23 Nov 2026 17:20:53 +0000
Message-ID: <20261123172140.3547896-10-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Commit 3c497f624d40 ("remoteproc: imx_dsp_rproc: Fix kernel test robot
sparse warning") changed tmp_dst from u32 * to void __iomem *.  In GNU
C, incrementing a void pointer advances it by 1 byte rather than 4
bytes.  Consequently, the word-fill loop in imx_dsp_rproc_memset()
steps by 1 byte per 32-bit writel(), triggering unaligned 32-bit MMIO
accesses on Device-mapped DSP IRAM, mispositioning tmp_dst for the
trailing-byte read-modify-write, and leaving roughly three quarters of
the target region uninitialised.

Advance tmp_dst by 4 bytes per 32-bit word write.

Fixes: 3c497f624d40 ("remoteproc: imx_dsp_rproc: Fix kernel test robot sparse warning")
Closes: https://sashiko.dev/#/bug/linux-720f943f-eefd-4df7-806e-0b50cad1abbe
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..2771043ee433 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -843,8 +843,10 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	q = size / 4;
 	r = size % 4;
 
-	while (q--)
-		writel(tmp_val, tmp_dst++);
+	while (q--) {
+		writel(tmp_val, tmp_dst);
+		tmp_dst += 4;
+	}
 
 	if (r) {
 		affected_mask = GENMASK(8 * r, 0);
-- 
2.56.1.750.gf70dc682cf-goog


