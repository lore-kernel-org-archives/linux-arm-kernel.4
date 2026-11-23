Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aGtJXjKA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KI122c90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G4qYWpqovmvk+9CIMhCz421wyrCHWIrInzS+iRYLtfA=; b=aGtJXjKAKKvKZB
	Tlm/TvaZI9XjK3kyCgP++5L4n1yhHv2S0njrCVK2voEwCpjvhyZaGFMze8F80qWlI4Tn1ow74UkT8
	12aZI/55nVsyy9NoiJbSROD+CpvdUk0fjiYQoeadDMWJNceCiIoqoE4C1D2Ftj9yFps2257f6bCwR
	YnjBTkgmWgTMHBhVJkRk//uWuuwJYmgHfAQKgx+mZ5qsnEs9KSSVrWIkevUfWkHKqd2ckWnpSt+bT
	ry4Z6Ne1Q0PmtHU4HFcJ5pzik1VRpIFvFrMc6uorJ9l86R0Zqhls5i6zBJIq4siXOxeuEAKmUviz3
	/iMr118awl1RfbldzR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZY1-00000004dZI-17ik;
	Mon, 23 Nov 2026 19:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZXz-00000004dYr-2WFJ;
	Mon, 23 Nov 2026 19:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCAF459C0;
	Mon, 23 Nov 2026 19:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E001F000C4;
	Mon, 23 Nov 2026 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461470;
	bh=G4qYWpqovmvk+9CIMhCz421wyrCHWIrInzS+iRYLtfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KI122c90sEnif9hK3syRdPPZSe9CHD2HNBjHwGBi7zdCtUoVfisue0CSwIJ5XYb/i
	 mrjtqdbh1hP41qUITVa4+U882r9pJ8l4TCNX8Pox7246EQ01h16vMTYrZZgZ58rA0Q
	 BXAofhs8US8tJMvYbH3RMI94A6wzvT/HrNI5huoTYvumiVMZ+jAcyBdVxmXQxL+O4y
	 8lXhZnhIxRy22dv7VVNZmxVtKOvUA8Exx2dt+/5G96mXblF27fqKjIca2olF9Z7M95
	 i8dAA6lKoKLnku8AgNtE54C7lPTuSQX3893gdbevbUV8proxg6MX7BWv3+0M3XgTRN
	 zp4Wsz579O4fQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 04/13] mmc: meson-gx: Fail request when descriptor chain DMA mapping fails
Date: Mon, 23 Nov 2026 19:15:48 +0000
Message-ID: <20261123191703.179283-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123191703.179283-1-lee@kernel.org>
References: <20261123191703.179283-1-lee@kernel.org>
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

meson_mmc_pre_req() flags eligible transfers with
SD_EMMC_DESC_CHAIN_MODE before mapping the scatterlist with
dma_map_sg().  If dma_map_sg() fails and returns 0, meson_mmc_pre_req()
logs an error but leaves SD_EMMC_DESC_CHAIN_MODE set with
data->sg_count equal to 0.  When meson_mmc_request() subsequently
dispatches the transfer to meson_mmc_desc_chain_transfer(), the
for_each_sg() loop executes zero iterations and
desc[data->sg_count - 1].cmd_cfg writes to desc[-1], corrupting memory
immediately preceding the coherent descriptor buffer before starting the
DMA engine.

Check that data->sg_count is non-zero before starting a descriptor chain
request in meson_mmc_request() and complete the request with -EINVAL if
mapping failed.

Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
Closes: https://sashiko.dev/#/bug/linux-e22e5db6-4232-447c-82b0-6850ad48d2a2
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mmc/host/meson-gx-mmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index d2b9b5df9596..f859d9ac0a0a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -914,6 +914,13 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (host->needs_pre_post_req)
 		meson_mmc_pre_req(mmc, mrq);
 
+	if (mrq->data && meson_mmc_desc_chain_mode(mrq->data) &&
+	    !mrq->data->sg_count) {
+		mrq->cmd->error = -EINVAL;
+		mmc_request_done(mmc, mrq);
+		return;
+	}
+
 	/* Stop execution */
 	writel(0, host->regs + SD_EMMC_START);
 
-- 
2.56.1.750.gf70dc682cf-goog


