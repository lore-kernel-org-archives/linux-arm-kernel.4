Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF91606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZQfw4yi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCdrMZ2Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sV07NUFdFEUChvvq9JQ9jX1g0Au9Mf6nya4n4B1WSVc=; b=HZQfw4yi9wG3d5
	uDjB+ByigNZqskZ3/f7qqN7lA6Ad2jDuy+/4Qf900OxyQ1GryCcDn3gGZ6edyo8KT/7LmkeM4vCoP
	6U4rR49VYs1ZiJ4YJrJLA7JOvDL+mbkBTkl5HR2O8N91tZcQSk0i+8QM6RRLjxWwkHm20imRnXB5z
	ckXOMisJ864ZvtihcGo4tBApAoiT2BZYIra8aDVNJ6S7HDsfJq4KTM5NIct8wFCtDF5VX7mqCKSqH
	6lU03YMpskqf3hhDdpd9QoY2e7FiTT+HHFcWYhv8KbaVpgPZiw+jIM3c1tlyeKj+POcpFdL6AZipc
	oli1QJr55LHE1L7eHpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBe-00000007Xkz-0rdF;
	Wed, 11 Nov 2026 19:40:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBU-00000007Xbp-1Fvx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1402441209;
	Wed, 11 Nov 2026 19:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27131F00A09;
	Wed, 11 Nov 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426039;
	bh=sV07NUFdFEUChvvq9JQ9jX1g0Au9Mf6nya4n4B1WSVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YCdrMZ2QaFEWHIRTYRS7dOIqS0gpVDXWzdVAOqCK0VxhwakcpPGjMPhqCtenzSbUP
	 bHaZXFCm6sIHZwi9dQjnq7sGY3mdfIZeE4y3MeR2lyABkRL8GmTYuJsN2FvyYSFbsX
	 XUNIPGyTKxRKuVYWY1Za5tN24Z2V7s9p5NGPhGGnN9lbBp4LbaSP6LoViiUHdOJa0A
	 IKE6KJV+IiDxoI1aO1Iu1LxlNNdyvTIEkVhwZiammZTkqtfGNgg04lAWcqVSZsZC5w
	 +T4/eg0c5I6ZAt3TzL5Cq6LcVkQfVcAzKM61QKDoO1fks73wsaboosb6dNi5WLlzPi
	 /7/Elo92r7llQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:19 -0600
Subject: [PATCH 09/12] arm64: dts: hisilicon: Correct DMA node names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-9-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Use the dma-controller node name required by the K3 DMA binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 9f0b5d5b97cb..f9c1f7718b82 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -604,7 +604,7 @@ uart6: serial@fff32000 {
 			status = "disabled";
 		};
 
-		dma0: dma@fdf30000 {
+		dma0: dma-controller@fdf30000 {
 			compatible = "hisilicon,k3-dma-1.0";
 			reg = <0x0 0xfdf30000 0x0 0x1000>;
 			#dma-cells = <1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 8bb74b4274a9..1cf552d02ecd 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -412,7 +412,7 @@ uart4: serial@f7114000 {
 			status = "disabled";
 		};
 
-		dma0: dma@f7370000 {
+		dma0: dma-controller@f7370000 {
 			compatible = "hisilicon,k3-dma-1.0";
 			reg = <0x0 0xf7370000 0x0 0x1000>;
 			#dma-cells = <1>;

-- 
2.53.0


