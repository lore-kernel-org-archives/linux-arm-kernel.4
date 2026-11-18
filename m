Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B660A3810
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcTYz9aT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlMdNTNu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=; b=jcTYz9aTDn/E+iZt6NFcn0S7UD
	DZn9Lo5z6zp0/LgDb/AVXx9NXNXxDROjXGo8ZKc09Xi5O3IlR7WW98QYsaUzB03PCqmThAAsWeD9i
	Ru71+QDjTo9fyoY4Oo0ArJgOybER9MqQWxsfq7DgDZuyIKg3hRnVRxsmWu5QVZt3RHVOgteEvYcNu
	B9CAj/TnuWypQl7LuGfcuA2xLOxdPWv6TXiL2+2OcZ4Am2m9bPJO96Noj7jqrv32s4eK37Y6qwUKk
	c4abMH/vDhxU47RKM5ZmXC4gpnXEcC4isrVIbfEciC+vm0/hihtdSJR3rjDdEN+QiCtkJYMLF97s0
	e8cjvw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl00-0000000A4P8-3FoF;
	Wed, 18 Nov 2026 19:07:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl00-0000000A4Ow-1LJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7DF46CFA;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028835;
	b=cMqwmDWDY5TDZh+wIwZHQyRRIrOYRNP2bHf0RsDG3GKh1i/R23qc9ONRAqcI6oV7zDrE
	 n5GoF5rd2XAIW3KXbCuFfO74FUKZCHmTuKsMf8ZH46BJDt10Mlg/JZF+wiZXyg8QxU9/5
	 DO/TFzLNM1405JNS0B0/+mNw4aVP1J0bWyYRFnQuEh0Y0ctvFn4/SXcvemGkFC9FR6r/b
	 6AjxCm1NevEAMws67NKLUFmZS9vh2MtLyguac5oNmEDCsvOAqQQ1i5Rq/PtPCHmwTjh4N
	 obqFtOYRHnvkSrr1tPJh60DC/Wq3Ahf6g5oO/M1tOcdNoB2w5h89bviFsSmKZsGcarA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=oUZ+9QkDrK4Hh3IN7HDymtbWUUEqZoSGiUmWsVwNXOnAvXEcblsdBBCqH8TL1EBOrsEn
	 I3e5S45Sl8yfC7nG4nqWRgfDDa746C588hEzICaN/F2bZf37yp2Fxums/h6lkPBMLA2sr
	 eejskUY5tWYPJ3f1ENc07k+GoQ7lZWwJrjL2nFmQi7PH3GRnRSmioAfvVr8O/0YV7BI2c
	 hDy1zRHICGt2gQOUSArqRNiNwPzvepNvfB/KgW6c82Ph4Ef20UaXNXF0+Mqxbk75U8cp6
	 i44fecHynhsxuzZfNT5KIy4yOI0hLOsVeNWj/D4f8v7m9DH54+xpEkVXlDiFad/F1og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EE8D1F000C6;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028835;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TlMdNTNuqm4Bax8mGtgSPtQsF4fJHKYNky/NknjWX64UuksZie34RO+UcGVOWLscZ
	 rpQc5cyoivk6M87AiYMF7+Qu6lXHflJcOIQ2sXjzUY2rzK29gsaQjQrjbO8xbFvFqW
	 wXdleYigMG9kWqo+m3JDOiBz1ArM3UhxUj4jKlse9krX3f7WhiVUM4PRRCBWTdVyHv
	 67Wceizklb9yQJvVH/dHCTgNjxEgnryEEqgTltCimq/DUXhftFa4hwJv9wSXuUqThM
	 eQBsBquHxXZZEoGF49yF5/C4pnvNR1kb+PAgvvDtyLFxWVZBRc6Ahmw4g7vf7bhRys
	 0XCBB5ijaj7jQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF1774AF2E;
	Wed, 18 Nov 2026 19:07:14 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 20:07:13 +0100
Subject: [PATCH 1/3] arm64: dts: socfpga: agilex5: add the service layer
 interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-de25-nano-v1-1-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
In-Reply-To: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=1261;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=481VP81WZKi/ygpfq41EOdbsewe8WlT8xUBo1hTQ0dA=;
 b=VA25FgGLIXjC3WvEziZDi4ZpKCwgpHfs9xJ7Wq5dLe0HaxyXjHjcSn3f98n6+93GhmrRyNLDB
 FNeHe6JWH5YA1tr7qZlpiEvVdV9FHu3L8OYTluGlB2sDRoFTPzmjXyi
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
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
Reply-To: alex.cramt@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandra Østermark <alex.cramt@gmail.com>

The SDM signals completion of asynchronous service layer requests on
GIC SPI 0, which the Stratix 10 and Agilex 7 device trees already wire
up, as does Altera's vendor tree for Agilex 5. Upstream's Agilex 5 svc
node lacks it, so stratix10-svc logs "Failed to get IRQ, falling back
to polling mode" and polls for every async reply.

Add the interrupt as the other SoCs do. Tested on a Terasic DE25-Nano:
the driver registers it for sip async operations, it fires
(/proc/interrupts counts it), and FPGA configuration through the FPGA
manager still works.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
index 161f3d4bb..d272cc4fd 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
@@ -84,6 +84,8 @@ svc {
 			compatible = "intel,agilex5-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&intc>;
 			iommus = <&smmu 10>;
 
 			fpga_mgr: fpga-mgr {

-- 
2.56.0



