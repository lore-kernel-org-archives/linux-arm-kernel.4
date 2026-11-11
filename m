Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hhW/Yg2s;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=Tn968xXV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=phA4+CyUoxbHyvL+wVGw21rFfYJHlyNvvy1aIyXcZcQ=; b=hhW/Yg2sd6Jwyw
	+cMtDx8dfXultMkig/q18sHeB34K01tVsciOiEMzYM351lLq42MUt2Op9miAmoI2wlkQbPxaLUCJG
	PbdH5lruavdPoDF8XRmYvDYTy+VIvJWOFgCHfcQ4CIn01y8OcDr5ptx1tCjob8HIWmCoSSKtl5ofN
	u17yl8xttVQac5dzL/uPqXt77FfVScma0nPpGXnV7V1nU4UxNGGFPuVpWsNP65m2d/Rm/FKc+b3tM
	kM32qpp1fp6s6pc2FLRGlSpb8Fnt0pFrewqMXqrEXq2S6i/L4ND5+76V1X3oHWcrIWx0svwOFqMvt
	AvB7cAfk9WQ/9BfvlLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFRx-00000007hnd-1N7T;
	Wed, 11 Nov 2026 21:01:45 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFRs-00000007hlE-1UQN;
	Wed, 11 Nov 2026 21:01:41 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jPwtS4K9FzMltJ;
	Wed, 11 Nov 2026 22:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794430896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phA4+CyUoxbHyvL+wVGw21rFfYJHlyNvvy1aIyXcZcQ=;
	b=Tn968xXVlYzLor7lhnO8lOrnrfj6E34WPUDS7qe52XfNv0TO7dyqCsbOhysif9yRlZ8yyp
	XmvTQiDN1ezNsZSJ1kEvkl5WoU5SefjwlG7Hc28xQm6QoI5g8VaXWPON1s0FdTMPO9YXwv
	rPl+prqWhfXG2gSrr60kWnSqTJ5hLdPaGBblqhvx9A5g1YHpN6GjnUrZh+cVn6LOKVM2uU
	rzXZ0YZU8UJP+bczfpjgCweDU0mRYCbBHZ7o/Zat+h1r4Zviw8J8HsySn4P/FPLZdeuxnt
	gnuh7O0XkM19zaKRT8zRIQbEb3KAZVVeCyeDRKz0VCWTG5dqZJAsxJ8vLTyXHg==
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: fix HDMI RX 5V detection pin on CM3588 NAS
Date: Wed, 11 Nov 2026 22:00:27 +0100
Message-ID: <20261111210059.3489502-2-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111210059.3489502-1-me@timsurber.de>
References: <20261111210059.3489502-1-me@timsurber.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jPwtS4K9FzMltJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_130140_542826_C7BCB593 
X-CRM114-Status: GOOD (  19.12  )
X-Spam-Score: -2.8 (--)
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

The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
(hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
hdmirx_hpd pin group). Both pin groups are in the same pinctrl state and
the later one wins, so the pin ends up as a GPIO input with pull-up.
The controller can then never drive HPD: the source sees HPD asserted
all the time, and the 5V detection reads back the HPD line instead of
the source's 5V.

The driver relies on HPD being low while it writes the EDID, at probe
and on VIDIOC_S_EDID. With HPD stuck high, a source may read the EDID
while it is being written. A source that does so at boot keeps the
damaged copy, as it never sees the HPD pulse that should make it read
the EDID again. On a CM3588 NAS with HDMI0 looped back into HDMI RX
this happened on 3 of 10 boots: HDMI0 logged "EDID has corrupt header",
found no valid EDID and fell back to 1024x768. Changing the EDID with
VIDIOC_S_EDID was not noticed by the source at all.

FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
low with pull-up, for the 5V detection. The NanoPC-T6 uses the same pin
upstream. Use that pin and leave GPIO3_D4 to the HPD function.

With this change the pin multiplexing shows GPIO3_D4 in the HPD
function, the source's HPD interrupt fires on every EDID update, and a
changed EDID reaches the source within 0.5 s. In 10 boots (5 power
cycles, 5 reboots) the EDID read by HDMI0 always matched the one
written by the receiver, and HDMI0 came up at its native mode every
time. The receiver still detects the source's 5V and locks to its
signal.

Using the pin in two groups also made pinctrl warn on every unbind of
the receiver ("not freeing pin 124 (gpio3-28) as part of deactivating
group hdmim1-rx-hpdin - it is already used for some other setting"),
and in earlier testing the following bind sometimes failed with
-EINVAL. With this change the warning is gone.

Fixes: f9f45293f0d8 ("arm64: dts: rockchip: Enable HDMI receiver on CM3588")
Signed-off-by: Tim Surber <me@timsurber.de>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index f4c34da61..b2df36113 100644
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
 
-- 
2.55.0


