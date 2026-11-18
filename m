Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2onnyas7;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=IOhvuMLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DvXJcTGrWQH7Z0QlV+55M/z9iw2Exbd9dATeTnNEbhw=; b=2onnyas7UAxktPCCXuO2Q0XzI7
	zR+p/6/stu90hG7Sb9jgxfmFT0+eNbyY8ErF5+EbntFVZPuclg7UPG/1g1tserkYbcvpQshgP/4fW
	SJUf3NHJ03cImErMJsOY3SjnqWQlWriuDvb5u5jSp8xxrMtSESTbceD1S3jMOuZwajiKWUs3gpVrw
	6l4u+/WmWiU70T9usogDMXOM55P2ZXc2yQEpvVmbrSJejMIZHy1UySAPFJk5kv2I9YZjGyQtaxIQf
	xDxrSBCTzPan3d+BUV8FMk0JCBacmxg4FF45+SydQbZxvyGdGKsHcNV/k0Ej0sekxG88YQE3AEThw
	OdqUV1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTViA-00000007Yfz-1aiU;
	Wed, 18 Nov 2026 02:47:50 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVi6-00000007YfW-3KyH;
	Wed, 18 Nov 2026 02:47:48 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jTmGz1CZzzKvhH;
	Wed, 18 Nov 2026 03:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794970059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DvXJcTGrWQH7Z0QlV+55M/z9iw2Exbd9dATeTnNEbhw=;
	b=IOhvuMLgXkz1Hkzo2ppxZp1CUzkWNUvWS51fzC5gnyf9RmPVh/Ufb76QeYOErae4M1uJAH
	2MBJ1dFPYWCpl50x2QQmSWoB+tDQ2DlOBg9SSEcQgnLTt73+06aLrbYmGwWk77jmOmvMMS
	bc6NlmLNDXceTfh/6IzFDNROcuxezetUNXHOTNMNuFGJe69y6Kh1duY8x8nxu/0ai5Dao8
	XuGC/ruJgLd2yqgUouDHAa5UN8IaB5Lrb7jabKYueHnBm2/kUZzCh2htHWK2r9/Ja9jH+f
	9+W5PO28zEuMWdY6+FiJ0jWgDgi/ktIcFl4J8Cbx07XB9FNFQCJaU+Udrusg8g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tim Surber <me@timsurber.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Fix HDMI RX 5V detection pin on CM3588 NAS
Date: Wed, 18 Nov 2026 03:47:15 +0100
Message-ID: <20261118024718.1540336-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jTmGz1CZzzKvhH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_184747_360164_F1073CBA 
X-CRM114-Status: GOOD (  14.61  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
(hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
hdmirx_hpd pin group). The GPIO setting wins, so the receiver can never
drive HPD. Sources then see HPD asserted all the time, may read the EDID
while the driver is writing it, and never notice EDID updates.

FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
low, for the 5V detection [1]. Use that pin and leave GPIO3_D4 to the
HPD function. Tested on a CM3588 NAS with HDMI0 looped back into HDMI RX.

Link: https://github.com/friendlyarm/kernel-rockchip/blob/30d3e1c2470a7282f37b96fdd4354314dda69aa3/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev09.dts#L299-L309 [1]
Fixes: f9f45293f0d8 ("arm64: dts: rockchip: Enable HDMI receiver on CM3588")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Surber <me@timsurber.de>
---
Changes in v2:
- Shorten the commit message, keep only the problem and the fix
- Drop the cover letter
- Capitalize "Fix" in the subject
- Add Cc: stable
- Link to v1: https://lore.kernel.org/linux-rockchip/20261111210059.3489502-1-me@timsurber.de/

 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index f4c34da61c4d..b2df36113d22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -376,7 +376,7 @@ &hdmi_receiver_cma {
 };
 
 &hdmi_receiver {
-	hpd-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -571,7 +571,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
-			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 

base-commit: a9d78db32fe78bdbe7c66ba77cb7dbb729b885de
-- 
2.55.0


