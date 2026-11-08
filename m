Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A896606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppyeTVMz;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=J5s5mvfu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4BUyozTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=minVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=; b=ppyeTVMzO+qKFR
	OMG6MbmZAEEoRdr8yxrhrfnAR7dRKLiFPnUnUCOgG7/UfdbRspfbJMJ5bCRKCr/XhgLTK4XgYA3LE
	JPGBifpC8eQhS3ClaFCkRK0KccqQICH+HVlQlxKw7DwlPVk/FEoEMEulWwZKdimImnfmbCyJUCyuP
	dgzcCf8Sa1kGwDA+khX4AbHM7ibL6M9xr9CwyDfZlECWzq/tXBUHpPp860iWxa+zCZPef9YXeyVwZ
	hVg6DrX00+1xdGvJfm8HC4LQnEX6f71cDOMJtUf9g6voQhdq0eNN2Z4m3SggPHv2Ft4Ir0zzs4Mai
	xwczEErmPh1ApnKGJVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwwm-0000000FlcG-0kZS;
	Sun, 08 Nov 2026 07:04:12 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwwi-0000000FlaG-28yy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:04:10 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EEA4C1D0017C
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 02:04:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 08 Nov 2026 02:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794121443; x=
	1794207843; bh=minVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=; b=J
	5s5mvfu0kNY738IsjJHNsdLq1eDHxJcEG1dj6MBUP7YBbBwyLMuCHmVsRUy3AUvk
	98EbmqRfw2llpDcaYsYvf3l4g1orZfGi4EnB/tnbuQk56Tic3xOHKoSR/lrCV2J6
	eceK+wdK2KnzULLNdmzntUYQmxmY795y2enr02CFalXPgy+bJROZmd/fRKuhUMJF
	6fu7cF47OaBs3N5LldM71a2qbST7MSKluoXCWYeUE+cYZFVzNaU1hScSSHQF0eZI
	wQ/qRYhw1Oq71yq/KuMEKnb8tvqx2/udQqyanvo2M/tQLIJMOr1Wigb7RSpip2u2
	Bkzr100zwVNEjDKX6DufQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794121443; x=1794207843; bh=m
	inVMPaxKdnfyCJpbOwFdJHL/LDtX3McHU8H1MIv0Xk=; b=4BUyozTRXRqocQDrY
	CWsCV3Sc4EP9j8i1LSp2OrfbfQwKj9+518laiW1SSEoUyTcQv5Tuo8ds2iOMPTOQ
	z1pZYdQe+6wGWeybfSX5RGNFrJ+GsZikHk2cmh6eOIbvmwXoWx2M2NQ/qeo2NSM1
	QcsFYP68TLgkM1VLUZuMOxwfMfZTYUmgYxKCPrPqeUBVDSp/wo1hDNG0u34NBjbA
	QrgJfltWlETN2929Kgq+b8zjUYus7gxK6aLV3FkPwjgQfpNJKAS7SneebUr8uEY7
	xIESbzQyEqW2gXec2XO9oQT7JhrQqDz6EKjJYj+Ma8T8y5KLoGtcObqDLgiz18PA
	XtZmg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121443; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:BfpcKLXhKT8v3fP98GxVvPYwNAKwhjb4KD1j9o6RdpUMSzw
	pu2AGU7G+6O5d9KlE/vepvoBN6NqDML3Ui602PTsIFlRBGS7R2NeBDj1lFhHWSVD
	VnVK23PN+pOqFYbOtp8N0DmjnRjPdv0u5OLTzh6wg+T0lJbgNweH+LRlrFR8pfOQ
	hG3cKDx+CC73TQJOHM21Ed31DMgAkb4opBRaKGfWcIkP1E21+VwKWBw56D3OwmuH
	nY2b2s7Ek7LMJzyYBsZkflXyfdC7JDWiTnRwGvZ4dx3GshOBkqg2ery/lxrtcUHG
	wSHEW/mQk3Yo1nOMF1NGXH56mZLp5QmJjb6C0og==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:fsOSXMk/2/H8dPaDyZBfGGpfq7C0VvlJ+0jql16RHlk=:1+NbzSznMYt1rSZBGDikCAdMHVRI7t6SMcI79gsQSUo=;
X-ME-Sender: <xms:4h7wagtR_mLn4S9NlFuWh3ZqdVF18Z4_BIepNWbw-QNBULmOTtoGIw>
    <xme:4h7wap7ky8Z1qgQrnpJKH_eqg_78CuqMbmpnvBzwWykGEaXOWvOe05EzjqMwVlvou
    073NOKyI4rGPyBKQlxOi9nQsdwy6eJfFqhBDCR8sWMBdRFd6IhRi3eE>
X-ME-Received: <xmr:4h7wajCWvKRNA-cbcXZCz3Bh3b7ZUMIxQRfe2c2Vr7ntfOloNQ-f3fqVcRSruTwtjfWSTa8p>
X-ME-Proxy-Cause: dmFkZTFKhclCCJN9i5LFQp5fvn9DylL5PDR95+qcmUDEkBDvAaUlhVhO6JW1PTcA0oiilr
    afxU+kS37MwfkRVrV2sLhNS1OkBSH9hrpfUYkvEeAEfTx8oUhC1lvQdEqsrvfO12L2kPDm
    Y90xvEv61R5vWsABT3XVmqKcWsSTBPoQRHs33ySAWpN7mh8mIX7nfmpu6Q5St0DdZLVl6o
    GJpMHUC7TjUVqLMHfqfKk9SHn10f5lL6CdG6YeehrsosttZtbM1aNiFk46XYC+svmJcMBn
    4w1I3sJZaXrv8SSndHCWUOH7cbPZHBY65Sr1oZjnZZRxSV2wTTFO+3xU/Lmvhk4YCMlhbS
    9JiaDqD89tyFFP/A+KYonL2jODf4kA6AzXjKTU674GQpuy6KOluMwfYlO7nDNfuAediZup
    6e0k9HFkw0Kad/jwmnp6TUonRorml8U7tvo8/U/eLzn9r4YaEhmkhGNjw9QYlMvYnx3N9p
    RFifA8IGS5+CqVgeVgYXVBJjA3zJubFTymEDos8/BfsKfeGQFjZthVPFMPxvkMyMU9poq8
    fr3Il6nKEWO6zoGcGKIJvo0dTrh5P8Nsf5KP8Lcerd3ft9ur9dgQrKEYpTFOjjEDJxc8of
    0JqYPXUw4cvyWaE/Stm4vQz0H3WyAs6sVOkl/ZFobWe2jFBv1c/+bySNn/fg
X-ME-Proxy: <xmx:4h7wapsu0GSrXOBlqJTwTS4pMzjU7ndTjL4_B-d1T4oGVNdv3YrCCA>
    <xmx:4h7wahN_Squr8NT1N7KyDr3NHEsA9TSpZyXE4vsmzrFsNS66uVz43g>
    <xmx:4h7wahUk59KHU-8S6Fe1xMGwzDb9qmiA03oBiL3jgTxBv0iVL14HLw>
    <xmx:4h7wasQvE8WUk47OxyLu5AlBW9y7XCA4twjUAhq9HglPhzbvE6XsvA>
    <xmx:4x7waq1sdf-EPwivqKpVHwNUh_rPS9V66SES8PNSUirKBqsoJts5C2cJ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 02:03:53 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v16 16/16] arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
Date: Sun,  8 Nov 2026 19:59:17 +1300
Message-ID: <20261108065917.135194-17-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108065917.135194-1-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_230408_585408_9F4BED80 
X-CRM114-Status: UNSURE (   9.44  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable both NPU cores and their IOMMUs in the ROCK 4D device tree.

Make vdd_npu_s0 the supply of the NPU power domain, so the NPU rail is
switched on and off with the domain.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index f068794e48d4..72b251d396fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -722,6 +722,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi_tx_on_h: hdmi-tx-on-h {
@@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };
-- 
2.43.0


