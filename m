Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B317606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ElSAhVJD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/cb/ilp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lICZsoWNN7f2Y9SJh6pMMmkRnXVzNYDr9zDGtWPq8YI=; b=ElSAhVJDYy9L6Aw9XyBCQBMoM8
	TQsLC8C7xluSwmF/Powndxiu4XZ/U/57nA6Nazq7xOp91hhfTx3EuOs2THFnxfTutxKxyhZsgPGvq
	kQddK0nr5JsUq69pY+IeePAYF8i/AwMNq3G2QvQAxe9cz03OhPZEUZDQgX2uL2YYL5RDzHVMsuuwZ
	nswiS8PKPZP5X17ZENqhP1JN/TRHkrEbSRhstwLAklTVFwOWfJievT+zNDa2CS8X6MJ7knaU5XIey
	yjbtkhrIp4yx5drIHV8iTgzKNUkvGzqLCOcQYrpPpsMQrbaj/Hszse7nWeFzLCRLaDsMDztonlyL4
	k6QXSOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWBn-0000000CdcT-3lvz;
	Thu, 26 Nov 2026 09:54:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWBc-0000000CdSd-3kPY;
	Thu, 26 Nov 2026 09:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50D6443E90;
	Thu, 26 Nov 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686880;
	b=FZIsSGIlGF1ShYMnDt+nOaYtp/WQwDinBXbhOwMgljvSZRUpXr13uAfWd+WvaWvAp+Ym
	 a7CvklAKTR8ScdHXUh9ru4OERp3QdQnDYR8HQsmWgadCGLI09XZX6puaizTA4e+8jhoZ1
	 j11mQjLHR5eEa7LKjAZ4s5wDyzSx5+qiY8NTD1MDN7o1Ily56SaJrnQJemaaPMsnKC0ov
	 y68uj8qPuTI8Ofy9PVLwgpgDmvs6cXbJbgHpARk6ohUfFLSE4WJdw4WfB0q6RvUstEPDT
	 wPZteL5x7XQaP2JFAcS2/n8sBqg+XGHdwm7ieOB/bR9KEeShwYEo6hcocxCvRSxRkXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686880;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lICZsoWNN7f2Y9SJh6pMMmkRnXVzNYDr9zDGtWPq8YI=;
	b=2KuceV4zgFTalN6/BbkQPxUWo8cdX3tnvh5lrP+RbvyouGkmr3aFAB9DiJajH9CxVeNW
	 bc2qkwPAlHkYWccGWOpGAB3jhJ6Ty8+d1f/DWqq8ZaAhEaUUbQ7YtxxXogppyfGqOzsl9
	 EkHfvhbSr/VaOGm/LGs5x0cMoN+d5adv5VdiDFuZTmbBkEJL30B8sEetptWI7uk3TuA/2
	 jLe+NVc2BqYCRV3k71wdUFF82Hx5pXda6ZK99a3VRqUh7fLA/GXMlOg9jfqVBZdS/JpBI
	 Lu4Ep8FWtfnt40ToDatEcNqVdH9wUfHMhIfjbDFaXc1U3nG+MI9Amv7Yc/ua6ZlxQ/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A77021F000C6;
	Thu, 26 Nov 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686880;
	bh=lICZsoWNN7f2Y9SJh6pMMmkRnXVzNYDr9zDGtWPq8YI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E/cb/ilpROUjf01ScLyzsd1AUnzBLzWf1BPnmKclnrlw1uQlIjh76OvIgEUaywqAE
	 UjrdrCt6fy/2dI5ZwdZzubyR5Wcf3LnsedyBt9MFqOGgWvgUQUlP0GgLWHP20Z4/9W
	 kndBTMtkvJ9EhRjFEc+tIKCUtdecFua/J9fxC/sDyshy+bnTcXga7VYL6jepRpk5ow
	 Spi7ZIarjLGZaeNIwG2850zASElJ1pwQpffa5G+/VF2cR7PKB9ZHWnCxp0QdwRrboZ
	 8JgCOg1fbD8Gnh9Jid8w8vKF26P1Npe7q25+VJTKipFZ2xtgyevHLO3MBgrJMaHgmE
	 DiMm4er5xUwyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 336DB4D3D5;
	Thu, 26 Nov 2026 09:54:13 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:54:13 +0000
Subject: [PATCH v4 1/3] dt-bindings: iommu: arm,smmu-v3: Allow a clock and
 a reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-smmu-v3-pcie-pd-v4-1-c340c2dbd1d2@gmail.com>
References: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
In-Reply-To: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Niklas Cassel <cassel@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686852; l=1077;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=9WAa2NdMh1o7WUxCm4TzGQvYKe0WZ6XQgmX515d4dVY=;
 b=63waUiGI4v4hVMEjm6yVga02Blx6wFdxNGsI+dbposPNbEuhb18980OuRakdTPp+VVaQsUOGO
 /ZmW8GMDDSLBeLjkEeviM7rzy50ZhUwDuQ7kbei48AeyuTzjG8qXsJS
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The RK3588 PCIe MMU-600 has a clock (ACLK_MMU_PCIE) and a reset
(SRST_A_MMU_PCIE) in the CRU. When no PCIe controller holds the clock,
it is gated as unused and the SMMU stops responding. Allow one clock and
one reset.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 3c044e4f03d4..9ab80142a485 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -63,6 +63,14 @@ properties:
 
   msi-parent: true
 
+  clocks:
+    maxItems: 1
+    description:
+      Clock of the SMMU's register and memory interfaces.
+
+  resets:
+    maxItems: 1
+
   nvidia,cmdqv:
     description: |
       A phandle to its pairing CMDQV extension for an implementation on NVIDIA

-- 
2.55.0



