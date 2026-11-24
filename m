Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80086606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L2eNgrtW;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JeLjbpe2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HfZYu0W7xpmEBnGkS1JSMJR6zNAkfxoy56BJHRDK2zA=; b=L2eNgrtW4EdCMZlllfgiEPKT5M
	g91QYgOjfqYFf8UPxGfCdhLB9EKnACsQzxtdL+d9HZ7MmrNCp0hzl1u9cJJnMWWX8aaRfGwrxnF0M
	RKOQSj4eAepWkm2OZ9aWMFOn5D4na64rFoz9crEOjJQfST75BYOovFA+OB41tqkVHPQNeaiv5gFhz
	4h5xcSSLhUJxes/6phNVjqd0lyu/In955SNusWABHn9igsRLSOMGvDjlD7Hn8Z6wM9K19NK4yPO1M
	epi7sdfJYw/IGPC/6IMw3GYo1IW2etkS82WQUUK9acj3MQzyq/juuNBh9d2lJnErD0w5aqfcawTzS
	p6nwC9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmjR-000000062oQ-0Ki7;
	Tue, 24 Nov 2026 09:22:33 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmjM-000000062mv-3KqR;
	Tue, 24 Nov 2026 09:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Hf
	ZYu0W7xpmEBnGkS1JSMJR6zNAkfxoy56BJHRDK2zA=; b=JeLjbpe2UQGKudxBFe
	Po6qY8BTnOKg22yL3B2DidC8euyqV5bdhqSnOOZI7d/pPYhD9gN3YueXcezFlwNb
	lPYgy5h4w7HxuZmaqYj1MVIeYh7fxP/Gmp1L6DET54CZ6bxSgIfrcpgy6kTwsO4A
	wuYLaPTtpkkhMDgInCoGoJnA0=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXPEAyVwVrbijMHw--.22110S2;
	Tue, 24 Nov 2026 17:21:55 +0800 (CST)
From: Xiangyu Zhu <jerrytech92@163.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jerrytech92@163.com
Subject: [PATCH v3] phy: rockchip: inno-dsidphy: Fix 1.5GHz timing table rate units
Date: Tue, 24 Nov 2026 17:21:54 +0800
Message-Id: <20261124092154.2280807-1-jerrytech92@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDXPEAyVwVrbijMHw--.22110S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWkWry7AF1xGFy3Cr15Arb_yoW5ArW8pw
	1UG3y8CFZ5Gr1FqF9xXw1Utr4rXa97A3WUJ3yxGw1rXwn0g3ZYqF13GryDZa47Ars7ZF1Y
	vrn0yF4UKw18uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkCz_UUUUU=
X-CM-SenderInfo: xmhu25xwhfxmqs6rljoofrz/xtbC5BP9NWsFVzNBrQAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012229_410816_1CAA5EA2 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
whereas the other timing tables and the lookup loop use Hz. When
enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
372000000) against timings[].rate in Mbps (e.g. 400), so no entry
matches. The loop falls through to the last, fastest entry and programs
an excessively large TLPX/LPX counter, preventing panels from decoding
low-power DCS initialization commands.

Convert the 1.5 GHz timing table rate values to Hz so the lookup
selects the matching entry.

Tested on an RK3506B board: the panel receives the low-power init
sequence and the framebuffer console displays properly.

Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
Signed-off-by: Xiangyu Zhu <jerrytech92@163.com>
---
Changes in v3:
- Rebase onto the current linux-phy tree so the patch applies cleanly.
- Regenerate the diff against the current phy-rockchip-inno-dsidphy.c
  blob, including a matching index line for git am -3.
- Change tencent mail to 163 mail to solve threading bug.

 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 6ad04b0c9f8c..fcf7aa17f94a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -282,20 +282,20 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
 
 static const
 struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
-	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
-	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
-	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
-	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
-	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
-	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
-	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
-	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
-	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
-	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
-	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
-	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
-	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
-	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
+	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
+	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
+	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
+	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
+	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
+	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
+	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
+	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
+	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
+	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
+	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
+	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
+	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
+	{1500000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
 };
 
 static const
-- 
2.34.1


