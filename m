Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E719606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BKnuxpCt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0LLTpoJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=; b=BKnuxpCtQok3wl9nzD02F4g0Ug
	gexoGA++FL1qrIUHH3onIIXGQxXXke/kdO2pcrKP84zPYAMWTAC4Wbt6NHtbRev/k6Gu0i9TMRH46
	FbEOLCrU88ZDUGwzqe9XTWO4POw/k8hYOv5o76PY8FjCQScOsVcNC+0tLnhwjVUJvJJsTtZ+DuK/Z
	gdHP0X9WbeRLWhp+PE+bauJuwrGgUiDzW+0dDdOlsqVPlBH/+0TixX+BuAs44OusGTBxvxMfoGj3e
	3hjoRJThuBD3UPKhpN8OxWVZf3i/SQuV7KK5reZb7FN2D4ZvSP8/EgS5n/qZVjHRJzrW92CCr0E5Q
	LC3GM+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToeM-0000000ARqn-0uES;
	Wed, 18 Nov 2026 23:01:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToeK-0000000ARqd-2kGa;
	Wed, 18 Nov 2026 23:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2C946415A;
	Wed, 18 Nov 2026 23:01:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795042867;
	b=TxYAPgWRxVrwph/TaeniTXqu/olZCwwVBmxvIh/nqtlUxXcGT2aicZcTmX658JYVrkP8
	 wstKSMONoSupMupE5NVWtHGYtUP1jeQlTxjfi11x7cxCxpe8/MWv8M00LQOUZNhKXN/Cv
	 Hom8x2cmIT+JAzuQLZlqsAAgi7ftyxDQEr+JAjLoI2iNVXJXk+lWoUcNtbIqdqFDRzwv1
	 pjtSUrUnD8SctjIj8YbjSGItP6Ye6fMqpQIoc8uHtiC3rJOniBm/QZn4635+bzATVGn9u
	 Bub1uhA4YKeMbY72PexlDZY9YaWdv5jW4DVM3SKePhImwimHy+/skgxqRubum7xnodA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795042867;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=;
	b=Adc0Q67+ieOTNHrlfdVivrvSerypK+g0DVwXjfJXlMoNJVHmwdB39TO0RdyyACpGxiD3
	 7N4OWoNIa+6B1UMRtZk5RW9KPvc9dAik8dWnauwJoZDA5LcwA5HuiUXPo7mQegQahaOle
	 Ybc5ISrrpmQqVBQlADka4j22YndvfIT1IVZ0B4Dci3Q6RKUtNIBm8xngB6/7worQoHYBr
	 bcb5TGL6OtjNgfvbvRrXS+IPZwWqdEn37uwuNlgSZ042XqQZ+Mr/yLsBPsdjQT4b4/ETH
	 tVsDGDNTuDA9TA9jzSW1fix2M7dkJtkJK/SCXacfb0aZ6/bTN373il5gK5Jhs+lpGFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F03A21F000C5;
	Wed, 18 Nov 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042867;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Z0LLTpoJmE4wiRNTudtV6TVfccSt2qKZaKXlajJEgK/za7yAp9/NWEmCclEmfLfhJ
	 F1Slxcn16vnqOR6UwJ19q39/UKl5VWWzI/uJyrLim9ortnUNKPxpIN12Dz6x+v8JAY
	 99FSGEutW7UQPw+39fgXVLHHy9dMU5yA/MRvXaBan8+1zfZSonOymTIMSNKpIJ96ru
	 Ow35KXUsyRRlbzyn+BIQcSDCRUYus0LDuFam2LVnN9iAKVCXjE1ofljkAljQYGr+la
	 dsBv4cG1WWwlP/SiX4ROLAmC9oeSPqpWr4s9rYaR/SPZw61k26zg1WwHb7Frg47QnQ
	 HzzNzO1xsUmCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7D9374B004;
	Wed, 18 Nov 2026 23:01:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 18 Nov 2026 23:01:05 +0000
Subject: [PATCH] arm64: dts: rockchip: Keep the PCIe power of Kobol
 Helios64 on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-helios64-pcie-always-on-v1-1-b77dcf4f01b4@iav.lv>
X-B4-Tracking: v=1; b=H4sIADAu/moC/x3MywqEMAxA0V+RrA00ZaiPXxEXHSeOAWmlAR8U/
 93i8izuzaCchBX6KkPiXVRiKKC6gmnx4c8ov2KwxjoianHhVaK6D26TMPr18JdiDOiNpe/cGNe
 1DZR6SzzL+Z6H8b4f+VBGr2kAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=csC4RQd6YR8LhC4D4T+ae3/8hKPMoykDjDiK28IYahI=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGr+LjGjXuGgGi0NcgRJibYyX3z3oA2z4fntgBZHDpxaGAz22
 Yh1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmr+LjEACgkQMpeVi+pfeQOdGQEAixzq
 JcOSwoAS3wZZDLkOiE1x//+RWLpYCBczjYcLrKcBAJYJLXShTf5deewKTgzhNeB8iCyJzBXRINC
 Jv3xurRoD
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The JMB585 SATA controller needs PERST# high for about 60 ms after its
supply comes up. If PERST# is low at power-on, the chip stays dead
until the next power cycle.

At boot pcie_power is already on and PERST# is pulled high, so the
driver only pulses PERST# on a running chip. On unbind the driver
switches pcie_power off; on bind it asserts PERST# before it switches
the supply back on, and the link never trains (LTSSM in Detect.Active).

Keep pcie_power on, so that a rebind resets the chip the way boot does.

Tested with unbind/bind of the controller on v7.4-rc2 (plus the pending
rockchip-host link retry patch, which did not trigger): 0 of 4 attempts
without this change, 8 of 8 with it.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 76beac38699f..aba8a0c87edb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -230,6 +230,7 @@ pcie_power: regulator-pcie-power {
 		gpio = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pcie_pwr>;
 		pinctrl-names = "default";
+		regulator-always-on;
 		regulator-boot-on;
 		regulator-name = "pcie_power";
 		startup-delay-us = <10000>;

---
base-commit: a9d78db32fe78bdbe7c66ba77cb7dbb729b885de
change-id: 20261118-helios64-pcie-always-on-a021bf706987

Best regards,
-- 
Igor Velkov <iav@iav.lv>



