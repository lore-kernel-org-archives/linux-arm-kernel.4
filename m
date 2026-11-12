Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yMDbT5As;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ezwQ56No
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IVjZ58U4WqJtvnbqVGQmwoIG35zU3s+Yzi58o6NmRfc=; b=yMDbT5AsjOljZlQbi97GQ7y5Jj
	mf7J7myXffykrpRt8KsF6IDmDdf/SEvjByGioL/vdctk1icrOs0JQLQPlefylpvr0ziRx8+gE/IuD
	GnGUNDo/NnNMN6jj93WTLzeMlywlPJBvHeGPMq6kUcGMf6N30MBzLnFpU8T0xrYhRsSQyFRd4Wmuw
	+1EZ37JQM+PlM7WoUn5Wc0Gt/G37uhtR1JMoQ1dZ06a/Dy/FucKI7R2Qa6J8hy37V0PK9teXUGK7q
	B6lKi98NKDfjqTENrJFjMnr17zET7Yy0K7+kBO9smxgfYMmFKLu7aE36nwGOqy6kPhtlk1/K8PfPP
	5adH++Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKbi-00000008Wm0-44TP;
	Thu, 12 Nov 2026 02:32:11 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKbb-00000008WjY-43Id
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ezwQ56NoBPCJcl12Ibf2rMHbt4d+MYsAxqViYAS4VwKdcyNAu95ME9q7/ig81JPIhsAW5FF87Gcnz
	 d56dVTlulnIisLDAtwxVrp3Q/4n/4FUn5vDFUJK2yMoCK1Ldk5KWRaD3qOC7dc3050gH2q9XGgzV3d
	 bPB7mdiN4VRhHlm4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af5251c5a2-7c80e;
	Thu, 12 Nov 2026 10:31:59 +0800 (CST)
X-RM-TRANSID: 2ee86af5251c5a2-7c80e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af5251e178-ef4df;
	Thu, 12 Nov 2026 10:31:59 +0800 (CST)
X-RM-TRANSID: 2ee16af5251e178-ef4df
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] clk: stm32f4: Return ENOMEM when allocating clock components fails
Date: Thu, 12 Nov 2026 10:31:58 +0800
Message-ID: <20261112023158.118273-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183204_590384_A6D09292 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stm32_register_cclk() and stm32_register_aux_clk() return -EINVAL when
allocating a gate or mux fails. These paths indicate memory exhaustion,
not an invalid clock configuration.

Return -ENOMEM for those allocation failures. Keep -EINVAL for an
auxiliary clock with neither a gate nor a mux.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 4261a881cfee ("clk: stm32f4: Add RTC clock")
Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/clk/clk-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 6603d4815514..bf78fd1744c3 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1204,14 +1204,14 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
 
 	gate = kzalloc_obj(*gate);
 	if (!gate) {
-		hw = ERR_PTR(-EINVAL);
+		hw = ERR_PTR(-ENOMEM);
 		goto fail;
 	}
 
 	mux = kzalloc_obj(*mux);
 	if (!mux) {
 		kfree(gate);
-		hw = ERR_PTR(-EINVAL);
+		hw = ERR_PTR(-ENOMEM);
 		goto fail;
 	}
 
@@ -1778,7 +1778,7 @@ static struct clk_hw *stm32_register_aux_clk(const char *name,
 	if (offset_gate != NO_GATE) {
 		gate = kzalloc_obj(*gate);
 		if (!gate) {
-			hw = ERR_PTR(-EINVAL);
+			hw = ERR_PTR(-ENOMEM);
 			goto fail;
 		}
 
@@ -1793,7 +1793,7 @@ static struct clk_hw *stm32_register_aux_clk(const char *name,
 	if (offset_mux != NO_MUX) {
 		mux = kzalloc_obj(*mux);
 		if (!mux) {
-			hw = ERR_PTR(-EINVAL);
+			hw = ERR_PTR(-ENOMEM);
 			goto fail;
 		}
 
-- 
2.51.0




