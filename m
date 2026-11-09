Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DFD60A2604
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vBAcnCla;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9QTvSfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=THGngqhatlE+u83536ffwHcOrp0mYpAierLo9Jo609U=; b=vBAcnClaxmZ5TCx7VKZthVlB5Z
	NQXQy9vQYJa8VSD50VshxLtbylSvCcZ3ugX6aWR/LupI5S4wLB3B3e0I0pexisnLyf8wHPS+6bvs9
	XtZsI4cNrsU/iQW4T/1mtiqdGWkr+nI1JvMIe2ikX+jKPlnPzIkb1TkSya9ZvxK0h1Mo7FwnoZDw4
	iXrjFS3Vy4wb6UfuHg3NH/ebACVEgMjjpV+oadjVkL3E9SQWd+uZB/d85edcR7irXpffLefhG0m6D
	bwsif0fOPhQeb7DLTnC9TLJ7bh9QPYFDMc5NqBhuX5mvCtzcLajUDdCZmD+d5BUc6LcLDZmFwr5tH
	WF/19bFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQURJ-00000001Uwu-2PZ4;
	Mon, 09 Nov 2026 18:49:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQURI-00000001Uwf-3GnQ;
	Mon, 09 Nov 2026 18:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E1594088E;
	Mon,  9 Nov 2026 18:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C419F1F0089F;
	Mon,  9 Nov 2026 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250196;
	bh=THGngqhatlE+u83536ffwHcOrp0mYpAierLo9Jo609U=;
	h=From:To:Cc:Subject:Date;
	b=e9QTvSfJ5Hq1C2T0Q320b9VMbgB/lLDPTWchtqYQ/xpzulY47Z6/Nh7c/BEKh/Oxw
	 xT5MhV4Q+SkJmDowxM1SdUJVilikxjkt9K+HY9KiI6sj77j7OzQm2+O20UZpLmPwtJ
	 v5OB4pWcmrEmKtwlKApmYj0mctAEJmOM0RnkRSX56QWh8tA78CACUUvO0QydymGvio
	 z5IWEJeuEyGd0M5vUG78PiIpoPNBMgMRsc7FE47j48HRt9Fv+CrZ6tQ1nJ4c9C/AZL
	 G8pMjhVoNnYUdHEZV8xdSfbERCZpI146ViQlIAyTx9YgVIWZ/RDZFCqI+WT71Ha3+I
	 k6GZQDSljZu0A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: rockchip-dw: Allow endpoint supply
Date: Mon,  9 Nov 2026 12:49:47 -0600
Message-ID: <20261109184948.477095-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rockchip PCIe endpoint DTs describe the 3.3V PCIe regulator with
vpcie3v3-supply.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.yaml
index f2d1137aff50..8915ca3b9f0d 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.yaml
@@ -40,6 +40,8 @@ properties:
       - const: addr_space
       - const: atu
 
+  vpcie3v3-supply: true
+
 required:
   - interrupts
   - interrupt-names
-- 
2.53.0


