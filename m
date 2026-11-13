Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256A606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gw6VO14W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/AySg0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yz/8g0n4NRMp1v0RG/mbf9AW0/DPBjADn4ea0vIBins=; b=gw6VO14WHHe8/jHj+AwDcIol8Z
	QLTNcQh9hjNN1mgT5Oh9o2t4HGcoSN0WVkiyYPEqyb91udxxQIHVQ2MtNzAsWnyBsZQg3S5/Yhq0C
	HAedL8SEWnIP993U7HmxBpzcTUpcQ7IMVVYVYGh93iBYihp6UM0vgbTilDzhZHQDsTpPaYyp+aU8s
	aE8wnWKFv3pBuVV5rTuRVLcUudke8uE+b70B3371wl1YSzcPot3MvUq3kf0P2BmYCdzreTIUJqICe
	F3js+GAYbYTNocNH43L951i1WxqV1LD90MjXuOq89As3jx50MBd1MS9m8BYOAXircRd1An+J1aUzD
	h4dEPUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKT-0000000Db3r-1DUe;
	Fri, 13 Nov 2026 16:40:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKI-0000000DavS-2LrC;
	Fri, 13 Nov 2026 16:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07CAC6281B;
	Fri, 13 Nov 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588033;
	b=e4krojrIfADKXhPKH5Dp/MMFgG3OB7ha+VrO/gbewD0C39mHMPTksFwLgv4zTmpbPOMm
	 oasc7664Ccq9p7cRv8ziIx8U0TJD+WsRm2jCyGYFX15QP81qnHNP2j01O8k05KRsN2h5H
	 INwQX4b6OHB2bGqW1gKMsmDMJUACg50LYaP0pJtu9VjbcS/ToQ2/CRqfRp/Kf3I56v1yu
	 KEuVZbMWYq1iTkTzIc4d13s/9ifsbtJrZcemCuPoteoGwohqcjPHO+T9D5RfcDTcW4+1k
	 Q4vi/0dZNb/M5wZHKKlphQR1/eUFfN5AKhZVS/abre6lkWg9CEMPYCqDW6AK0jzDtnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588033;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Yz/8g0n4NRMp1v0RG/mbf9AW0/DPBjADn4ea0vIBins=;
	b=sKEq3nzpQ9r3nPZ26bvrGefLTc+YwLWJSMfBm2VgNlQTJWLJ6lANOzFvXAiS/mjQ1o3S
	 c7F2mZpB3N21Th0AYOuUSgrghwoyeUFYiC75PQT4hLRXJCrQcNGBk3C1NJTCNgzw+NRer
	 yBYhoxLJPLLQfM4JjD6wKu0UgbNRmkOnBg1y0DampSTMaQopKFpH+6E/eiQTqnjlVX5YT
	 QP+uA4H+GZG5UXC3UZ2JveXunjLLPZazyNa1DTRSz1gAJJK6Esd2LfqVnpkGNyRvyPHY0
	 93Ej4futhPVG/gGV4EdMY5PxtTMYO4hn5GJUy4ajRVyEuqflDoJHK3EjpjhkgQjaDOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D89A1F000C5;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588033;
	bh=Yz/8g0n4NRMp1v0RG/mbf9AW0/DPBjADn4ea0vIBins=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U/AySg0iu0kEu2OduIZVmFTEmM/NqFdg+EqvUudwgH87BXKMhMuueVRzKx/z7WBdD
	 Wmp/FGgSmXDYfBj4t4YBV7ZOWmCjIhCeyflvYGYVIqdJqHpBzp11Uh9ndFF0UkUjlj
	 IYRiQfJMQ4l3IUlLPez76bR4UvBI8mNCMsc2e5rcOCpO9MS0YLqPSvPg8f2Doz/Phk
	 L3vgtOKEkByuNkbjCgLADygZ3liQBmqIb9NRatp7FMbPRuRzVVmh8cIj3QUEXXeJp+
	 k1ftiZ3OkoLGUU5A8btdopZrGRIkoeQWB2KnwyYHrBZTOeMoUMFTEMqFmsfUdtFHNS
	 T5KRnC/KIbt1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B3967499D8;
	Fri, 13 Nov 2026 16:40:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:32 +0000
Subject: [PATCH v3 01/12] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-1-82383c722ad2@gmail.com>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
In-Reply-To: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, iommu@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588031; l=1209;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=MRydKxLJI0KA7GKlYnR04VTSaxTd+BLkO918wvLJV3w=;
 b=K8uB0c2XX7c4uheBnmnxsvmBT8na1dLiaxSRrgYZIJRv/zoj3/EzCXkIBHOM+LliMraOSG6G/
 0nFRXNg4AqPDR6pJOzw0CCwcXGiBnhEysj4HUWFoPe4mTog3Xj2/sxD
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

The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
They are needed to recover a core that is stuck on the bus, which its
registers can't stop.

Describe them as optional, so that existing device trees stay valid.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index d246f5d38427..e9fda4373f0f 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -32,6 +32,16 @@ properties:
       - const: aclk
       - const: hclk
 
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
   power-domains:
     maxItems: 1
 

-- 
2.55.0



