Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CA606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0o9A4tj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrZOaIhM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NInYMJ+ut3zDh5Fb+CgE3l3kNaY9NJsY+o6n7flFLcw=; b=e0o9A4tj00iSNWDAuIOjlHAcT+
	2dY4CfjFEwk/WOLTIITX7hYcRpk5c6x9eoRGQlOaBYDdq/31Tbbdw7w8n7My8oVF2UAUXAyAYwvIY
	xcM2XNezwk2hzqC/OnvfABouUGbrvpRfz8bE1CFVrIi5nUKDJ9qbc7hcgtzziqYyZ59C6b33OTzvn
	k7AmpezVwZ2ecqmn8gV/c6ssyx8zBl+jq7hpe+C8LYohTFG3a9n7+ZNh3XhPPF8eSJXmBeCSfN0ek
	C29vy4zKe+IsVUjG8iL0S1XzdazDfTdnp8KHT3MQkosxgw8nAuPWelVGA72BbMbfB2/5GSEqydRML
	Dm8tZ7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScSm-00000000ALs-2qdT;
	Sun, 15 Nov 2026 15:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScSl-00000000ALa-2Hzr;
	Sun, 15 Nov 2026 15:48:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B8086061D;
	Sun, 15 Nov 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794757694;
	b=Lr3eodA8Kw75qmKUBUYgpnCpf4bXaEg3UZiF7dWF1dfu492etqJZM7Z4gtSxlEMEwjvv
	 AkBbWVuo3vuAIfuZLG70A4q5zAwoa+omuZrZgbPP1IYkdto6p6SPFZ3URYNic/cAxnShD
	 DUn4moy08dsDVJCw94DDNWOjVA9+6xWm+fAY9A+Jrq28FRcAmNqEAG+e6bR139OFuAWpb
	 avKFo6kbmQcQ9XUXElL3g5ZstJlJ7+eOl8C8AWCwD1z474m1TAVhbqDMIWJhpYy+S1mrF
	 3FhnJGmC7/5TbfynB0nIQfWk850JXZdK3JNeC6j+pPrX1zeIep/EYvxCnKkYt9H4MwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794757694;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NInYMJ+ut3zDh5Fb+CgE3l3kNaY9NJsY+o6n7flFLcw=;
	b=vO3MMUNEVQrsW1znvqToAaXEz0m/USwBgJnjZmayoJw6MlJz+wMGXF9oB+4Y3ulnANiF
	 KGLg9P4FlAfpAX8ecHoEylbPAa1F+3dSI2wN3RW0ZFkEXLQIDuR9rk7iU5AGEzP2wGEwh
	 IZeHrMKGUjN5ayudt2Ui9NS//xrre+oJU0gemYUjSR14PcecfVMsE0DQC4GcVt/pykKd2
	 P6D839e9+MeK44A82PsooQGcK87PeTNTLABtiVMBe8ATgOL3NaVNEzPilAnOGqFOSB8v0
	 jCkYM8Lb2YHnwzxkbfwreU0GtVL8z6W+sKGFuuvWO5s+bXCERQ1he0x/v76I45D9VIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 958EA1F000C4;
	Sun, 15 Nov 2026 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794757694;
	bh=NInYMJ+ut3zDh5Fb+CgE3l3kNaY9NJsY+o6n7flFLcw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=KrZOaIhMkWHaTakDBX4dnHLgAkHn7h/WboXX/sanQxYPbHQA2l/yiBQ4MTqDYPoMA
	 pC/4+PZX8s27EpRPBiHAdPTfeYU1/akNQOorSzNLyI/kNVx6WbPVb5iXJiZlBu+lNV
	 w0ob3HOXHUhajvbl9996UPTe+I7y+N5WVO7oF03Ne5Ql3zavmdx+BgFenTxQ0wefOt
	 X/YuOxor+wz5GRvtyd+hHIVl2A1ul6b4Ufp0IYk62v934Hb5OrICteIlqZOhtKcuAH
	 g8gD/dZ/klkTNt3wvrYNaUc/h0nTuAF71WEcvaaa/4jqUhnanoN8+q8gag6QeX0fKp
	 Gnz62um5ifR+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 19E274A0FA;
	Sun, 15 Nov 2026 15:48:13 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Sun, 15 Nov 2026 16:48:11 +0100
Subject: [PATCH v2] phy: rockchip: naneng-combphy: fix RK3588 SATA
 pipe_con1 register offset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-rk3588-combphy-sata2-6g-v2-1-778e0e8011fe@pardini.net>
X-B4-Tracking: v=1; b=H4sIADrU+WoC/3WNyw6CMBBFf4V07ZhOawm48j8MixZGGI2FtJVIC
 P8uj7XLk9x7ziwiBaYortksAo0cufcrqFMm6s76loCblYWSKkepLhBe2hQF1P3bDd0E0SarIG9
 Baue0RIPGKLG+h0AP/u7me3Vw/Lgn1WnTbYuOY+rDtKdH3HZHBWX5tzIiIFCJ2tQlNpTb22BDw
 57PnpKolmX5AZz+eZnSAAAA
X-Change-ID: 20261024-rk3588-combphy-sata2-6g-03bb30151552
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Lucas Tanure <tanure@linux.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 stable@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3245;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=7C3z50HF4YPPhxfojWOPHlWST5mhlOANTFSCF0BvMLE=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq+dQ8Q7AOEqBEaJ40Qr8v90oLDQJ4qH6b6aZGN
 Rxv5wgYhS2JATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavnUPAAKCRA7Xj/jnsft
 6Qu5B/43ii5B5vLp7uePCdS2Y60DAhqinh6J/QWpePpP4kNJVbE3YWpuHFy9lFKwgX7VaIRTNjq
 b3b06t7skss2elc97aE6opCrKTCog4udVuaUFgbXajh63e/nJBZgr91p9dSespZKw1RkNg9fsj7
 XEnFvSfys82kKhyK3Ap7g9qvhyukWwo6XsSCbUjnTRP0WBBNPJBM2LQ6cjEwia06jlipE5LZIxQ
 Hv49ZX2NnMZ3ba4y3Q+Dwh1U/KGFw2UuOjpo23r+4MFQFYEetjNqPKQxVkFdseeyz9GHGYtgCpV
 lJdsS2jc6D6do+YxNpwORkbkyNwgrK9fifExcH/RUeVuGsK4
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yifeng Zhao <yifeng.zhao@rock-chips.com>

On RK3588, the sata2 PHY speed is selected by sata2_phy_spdmode in
PHP_GRF_PHP_CON1[1:0] (offset 0x0004), with sata2_phy_rx_err in bit 2.
rk3588_combphy_grfcfgs has pipe_con1_for_sata at offset 0x0000 though,
so the value 0x2 (6.0 Gb/s, rx_err cleared) ends up in PHP_GRF_PHP_CON0
and CON1 is never written.

This leaves sata2 at its 1.5 Gb/s reset value, so the link only trains
at 1.5 Gb/s, even with a 6 Gb/s capable disk and no SControl speed
limit. sata0 and sata1 are not affected: their speed fields are in
PHP_GRF_PHP_CON0 and are set by pipe_con0_for_sata.

The misplaced write also lands in PHP_GRF_PHP_CON0[2:0], which are the
PCIe link reset grant bits, and turns on the one for pcie3x2 whenever a
combphy is put in SATA mode. No effect from that is known, but this
stops it too.

The register layout is described in the RK3588 TRM V1.0 Part1, section
6.17 "PHP_GRF Register Description".

Tested with an mSATA SSD on sata2 (combphy2_psu). Before:

  ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
  Timing O_DIRECT disk reads: 374 MB in 3.01 seconds = 124.45 MB/sec

After:

  ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
  Timing O_DIRECT disk reads: 1266 MB in 3.00 seconds = 421.78 MB/sec

Fixes: a03c44277253 ("phy: rockchip: Add naneng combo phy support for RK3588")
Cc: stable@vger.kernel.org
Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
[rewrite commit message]
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
Only sata2 was tested. U-Boot has the same table and the same problem;
the fix was sent there in [1].

[1] https://patch.msgid.link/20261109-rk3588-sata-fixes-v2027-01-v1-0-e54ca8e68f18@pardini.net
---
Changes in v2:
- Author is now Yifeng Zhao, who wrote the fix in the Rockchip BSP
  kernel; add his Signed-off-by (Sebastian)
- Move the PCIe link reset grant note into the commit message (Sebastian)
- Drop the BSP history sentence, the BSP Link: and the Cc (Sebastian)
- Trim the notes below the fold (Sebastian)
- Collect Sebastian's Reviewed-by
- Link to v1: https://patch.msgid.link/20261109-rk3588-combphy-sata2-6g-v1-1-e9135c91de6a@pardini.net
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 3102a99128f6..c469222dba8b 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -1395,7 +1395,7 @@ static const struct rockchip_combphy_grfcfg rk3588_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x0407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 11, 5, 0x00, 0x22 },
-	.pipe_con1_for_sata	= { 0x0000, 2, 0, 0x00, 0x2 },
+	.pipe_con1_for_sata	= { 0x0004, 2, 0, 0x00, 0x2 },
 	.pipe_pcie1l0_sel	= { 0x0100, 0, 0, 0x01, 0x0 },
 	.pipe_pcie1l1_sel	= { 0x0100, 1, 1, 0x01, 0x0 },
 };

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rk3588-combphy-sata2-6g-03bb30151552

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



