Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930D60A383D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7ohzJMZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkXsh9bZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sMSQ+avg+iqG/IQkttcCunKx1tc/rZHgiCheJcioyCQ=; b=m7ohzJMZNXHPMv8nlUlxFKl50V
	lkwSgf4xZJSuqGWFj4GLfC7TppvEqJzLXhHStAdms8lnjtf8we/iNK1kth2ov1ZANcZPc0eyM88wO
	xV13wG0Z/EgeXHoLnZS2pyCU8rj0FI3jJCHo9vlQ4f6ngUxupH5ClJ7fVk5W0un6qki57eoqkngmV
	C1wMT53/Wjy6OH1Dje4ShMcKpEax4JMff3Wv/Ek7j7qZ4radXHNEpzb82ny7EpKa/pWKI8ScXLkLP
	1TlhSmDodBAOrS0oOKsodmbIC95p+GOEL9MM+pgsfcSPcgRjs4Xu9agVLm5mUqM8q/+2dWUIbirYJ
	aiFaLpfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuId-0000000DZAR-38xV;
	Fri, 13 Nov 2026 16:38:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIc-0000000DZ9i-2Svk;
	Fri, 13 Nov 2026 16:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EE664358D;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587930;
	b=BXFvbf5uDGqNmWTVEps7Z8GHnyTRgnWtRh9DLhvT+VrYC9jasEPWOsSaul2Jh1l3ftOV
	 YuFPypGtMNQxpJRiKbSO2gAmYgpHEGaghj7ZYQB1J1I9IvyNFI9wE8uLTWptCG7OVbQ+O
	 myMDKe9E+7L6RSZtekKmrmRAhCr5Np7lEi/9o47AKAsxIDIteljFDDV36ACEQm06NYAZ4
	 aZlaNhxDP8aRtd52gqcLsk6F9zUp2oxskU/QKmRsmi3pmfATNaJxZW/+bKNqPVZr0GXpy
	 CwNICwJ/UDSLMYXuVXk8Mvr8FMVMmjA+f2Ahpwlq7I8v48e5OEsU5qsJwc3FMPrZcnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sMSQ+avg+iqG/IQkttcCunKx1tc/rZHgiCheJcioyCQ=;
	b=DMNN18EFcn1Sj3ORchYzYT6+l8L9ZPSfHyk/MUJ4hlAHyNkHa7cR56WPbfTN7VduqZk8
	 qOX7rScliWOEpFCxpcy8GXUNCvGbdplxHQzhZXHTEAS6//rAPxV01XrE6mcPx2x1jsCA/
	 xvEqveKSVew4hDAKFZ0yfrOPLi59wnyiek+nS0twM7DDbeRscch9vWwxEYOnJ9Q9tB68L
	 AZwjWpIzNlHjYNrlfRTSRUgl8bnFrDoxaInY4HmfhV5PEADHIMvBg5CcNIg3tXFG8ufcS
	 f34WKNbKGE9l+Ya6fgyIy6bl5FvmEezrsRgpYX62uKFh4pxqUAKt+NVu4+maD9vxLhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5F781F000C6;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587930;
	bh=sMSQ+avg+iqG/IQkttcCunKx1tc/rZHgiCheJcioyCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EkXsh9bZDseRe9miJMAbztnsJErnPjuvTS7FVcixPr8rygs6RuTFAvP2yuddFdpFF
	 Qfd3fXmcIUz+h0e0aZMfIpxtUiWaS0x+F313bW8X2Fn+KAxE6Bs9StExEMorzKGeDo
	 IcsIW4IlNQ5NatojYDWa40/614WkiWvwruFTkKDKH9D/Weflt8PKNYXcqjLsmq4R1U
	 FMPtZxTSg8O6AqCbcunnnlmoN8g9P0YR34RcA6I5UGP7IVI7JQH6l+L91Bx3jugrpl
	 a1kisrweRNM5cwwi0ByfLU0jayJv+zKN3LbsRdgebqhXAY3d2w+uXZUJb9URKgximy
	 eJVMSDtULXgVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 72D1E49996;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:48 +0000
Subject: [PATCH 2/9] dt-bindings: ata: rockchip,dwc-ahci: Allow iommus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-2-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
In-Reply-To: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=768;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=isSOzqim4au9wHe7ayRhl/SLN2i9x9Bd32HMuVeTIQM=;
 b=f6Y3AcMeSBLf/zykfhiJs5LybaevPurozLoFXlFNqhejoU33A3G1MjYQNWi1Mb5O1U8Ymvg19
 B/YuuGiVKViCq0yib6lm2auaQC3rhJ4p7/Hv04UMNTk54hvSQsIEhip
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

The RK3588 SATA controllers are behind the PHP SMMU. Allow iommus, as
snps,dwc-ahci does.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
index b5ecaabfe2e2..e33e8b5591ee 100644
--- a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
+++ b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
@@ -34,6 +34,9 @@ properties:
           - rockchip,rk3588-dwc-ahci
       - const: snps,dwc-ahci
 
+  iommus:
+    maxItems: 1
+
   ports-implemented:
     const: 1
 

-- 
2.55.0



