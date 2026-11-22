Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1t4U8sqF;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jpEtY1j9;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=FJ8I14c9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=; b=1t4U8sqFdtovBL
	r/oGA9S/Hc7qsPE8kHUUOf+U6YG2kpcFp4fTVdMnd+opZzVasYoPuZuWQN4zFX0ZfSZ9+tEWz5yXk
	ZLkrTGPGarbg37ByXCAi4ZeqLQpJ2QZpf2EnY4B0PCVrMFEMolkKNPrh+2o1K7DLjT5EnoVMU3X7h
	9UdKSgaoD5UQuEM6MCnAeEBcrkj/X63ZgiKGTNHNrur24UdLhycRI+BoLXWhGzbXtSESQ91HFfI2y
	MLTgyghSlV7rWmn+gfzD1W1RgcTj2D4+aO3ND3mJCGmVnqsH5HVfXhPfQnRzio1ZqdXtwSO34JgGE
	8PiZbYKqBEU1bkaum5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dx-00000000lR6-4B5G;
	Sun, 22 Nov 2026 06:01:41 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dn-00000000lFe-2SiO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327290;
 bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=;
 b=jpEtY1j9GQCYhTQLXkw3hqTRm3xwi9I8O2uiH1yst2FimjASV1bb0tKi0zMZgLIrnnFwW2byc
 1gzc/sSqo7Z+xqtmDtalIP9nTSF0pL35pQGqealmTzqkT8z5tiJUjnOV2mDi7CuYiEu51SRT/KD
 seqFqDssxUUPaJBMLzFxM4VZ6pSuecyhQWSOEzELkKaBVwJ3MfBPIaFztz9ApoVJFpmzSaXMfEe
 aoRkh5huGyfOme16EFeoEkpDCEgc4dIsbqddngSAe05DHUGIDwihaxBpYWCbbDJyRkkgtJ9VbYN
 +SCey9p8ujGpsB1AvUIOCSkkKsjcOnfBeuS29reywC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327290;
 bh=eN0oCpWpCumvmeNPzEEeEhK6pL9hBNoQmVPaU07OxmQ=;
 b=FJ8I14c9dtmmuH+T/fA7VSDScevL+z0T5hP23P0oA4+B27fZrQAXJUiOlhwrxvNupN0oTRKHp
 Pzs9waZchSNTdimNV+0j0oRthwoc4Ot95wK3lEhCLOt9vFKDIFVA4bENCjkzksJmCdrI0mYOb9x
 jRYtxpMdugVi7kFHKbGzc3k=
CFBL-Feedback-ID: 6b02853acff95ecda8c093a6:5a2a3aaf4a95b445a62476d8f16bba92
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02853acff95ecda8c093a6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
Date: Sun, 22 Nov 2026 06:01:08 +0000
Message-ID: <20261122060114.773624-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220131_694830_BA0781A6 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.0 (--)
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

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change

As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 37321e23b087..651da02cfa51 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -865,6 +865,7 @@ properties:
           - enum:
               - luckfox,lyra
               - luckfox,lyra-plus
+              - luckfox,lyra-ultra
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1


