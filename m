Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0mH60dw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG3r7kTa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=; b=J0mH60dwjU0SlLaiW/rXp4fOpa
	/PJY++aHNGXVjD6RPZwiilrI1BvHFyoNVYQqAgG5SK1sOYyevDtSWUcKLmdGftQT955JDxtFtbMnX
	83QSEPOYGyGRYUajc2Hszayt+fT0CA9ReMFspI2XOvmxvl+bgX/sco2UEqRwascBdycpWXGng/M9Z
	oByMFBxrEirSGk7TKpq4YCJwtB3QE1+iNEeTQ2U3XR7BXp+Gt50H8awVJO5vCwAeKrweePE3i32jv
	9AXtFt6yMDhgSuaQ6z41cm3fzNtBXhfCniT0gxGcWcJh/HbKYrk5fLwwEyeG6z9p1XRzQ7YNMXEL+
	r3HhP5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW5Y-0000000Cbs8-351U;
	Thu, 26 Nov 2026 09:48:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW59-0000000Cbk7-2PkC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B417360D6E;
	Thu, 26 Nov 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686478;
	b=SpskddrOHa7gyyhKzVBfUhXcFi+kDALrfOiFA6L0d3YGQg/1xNta0uL5OCy4MA7yFG4v
	 0CGKJDVVg16GPQQCB0eExR2xi1rjzLJ3NPCA84TZyLfF+M2waLNd1LzPtTN/wA+UMHhxr
	 MV1KVYF5NCwV7HBNT2kmYraR5+AjJDBquz6d1z7VBeNesHHgTFdzYJtLOAYFT3YOC535I
	 w+Ump97DG8FYaLWYMihONEnWShTme/ya2hZi2T8OEr9ufVmND46aPgtRMekGd1xNyv3h8
	 BDyhrZr5k5KSlrEw2hAiXDU2fxHmapxsTiLpfDyuIKrqjRaE14nDt3bV4+O0oQufv2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=lxM9mwk240M94FAHx3tXNwvI7o/mrLhfOuJLXhBqEyv1tJtvdwovbJUi1iMjrhrMoDKX
	 m0qSU/BEqwYx0FA2fRYzmTrbjkLjeRqDd9tnxBXkvE8AXiIQZyng/ayBM8hE/MH650n7T
	 9zckg2MiC1UAyHPK6AqXvhM0VLgX7pmHbpAW5RASOhwVGSzDfNIWGZaXc1WsUFchcJAt5
	 Sq1Kj0Jucf+zaor2MXqOkpJYO3D7cIe3gRUyxXrQMlbZymna5xFPoH1GJquGOk3/1SBl7
	 SAFJ7t7gOSPJCVGoaM1RnlQoJZMcJPrR/PEj7kZNgMcDraTm6rcC8H0+DUGOFTaIeIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB4691F00AD3;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686478;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JG3r7kTantY+00tQEj5dBxq+RBw9Ydd9jSTs8cVbGP0ZsJ4aj7DX1TfTN58F27in2
	 fHgTIoI4oS26tBwP4aPfBwoIHRu5Q7RZKwizjRPUOxnfASM6YAfWpumie1qBxj8VsO
	 3gDVw32xKoXXmVFtmlBOei5J2/BAdJTdPcHVToRRKZ+7QHc9aqxA56I9EwyVcxHV/M
	 PK0yQQmA/8KJe4f4OZ69hO5N7Cq6T9Ns7RIE+J3QGlDn8f95aCupqK21/Bpw0Vvnsr
	 HKD98kufCydoy+rS0trG98z/gaJaTzwGwkXRantLig/gCgEWWOYcSK+uRub2cVsj95
	 vH9wanO0jZg1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E7C84D3B8;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:35 +0100
Subject: [PATCH v2 1/3] arm64: dts: socfpga: agilex5: add the service layer
 interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-de25-nano-v2-1-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=1261;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=481VP81WZKi/ygpfq41EOdbsewe8WlT8xUBo1hTQ0dA=;
 b=siF8qeeDcuYhyByZQU49qFw+m5FjuhcwK4321DzEy9c7Idk4Xy7SSN++kWqW45d1n9g80W3ue
 A0CddYjUDZjDRVFqhqGDaBb98NYc+WEZzquCDtgdmYRCWhBAm8BWKJM
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



