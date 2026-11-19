Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0ua0qQF;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=BMMF59M3;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=buDkwQyA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=; b=G0ua0qQFKfsA2H
	XckXss1bwMFyOEMqCKQj2qGfTSGmslduX3PPBB5h7IzpRKZ5PMFV39VKqpySF+fBl7IsL7r6pLuWM
	/BNj8dl3ce9eIQtGLTcqmhXdPU83jGIlCQ3885wjaVStLARPkiHM4k2RofEzheTRQDc6A87jVzrtv
	A+RuNXfiDIF6MTwHJh4SZH+4gSjgg83pTLZ7nIgUmp3JiBnzJ7SlzCeXQaD15anBJGEmT4ouMKiKm
	+FzoA8XdKwumpWLH4W3StrN9yxfO6/3cZhjG2hIQak/XaCUiAmLRq7i7TbiQwAFp8fVIiznJb6beu
	OrqO2dP7sO8R3fM9G+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3xI-0000000CQ1T-3DP4;
	Thu, 19 Nov 2026 15:21:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3wu-0000000CPfl-1LLd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101679;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=BMMF59M3cjCtljhf3gO4o0To5ErLRKgIwKgMBggxxAff6Ii2khAVWpo8zeiGCzVmjNT/F0kPm
 Ilmq9X11JqVfR23qhEQI+0bd0PlWv9e+TMMIFWiYYskj/f1DSBSy5w5WOxTMvGXzRJwy4liLQWR
 rgCkkkYin1graJixQinOtcQxooUrEsePHXCfZMyyrO9yLrv/tRwrVqLEi6GGOOl9VTHp80sAPr5
 RFwjoXOZfIbSixc3yYu05qCHUyyJ7XFhEguwweL6dSOErE+ktS28/VNxowoYRjXzspMIik4hvBn
 XxbT7SWgTBZO9XBkGBiFITFyAu2B46LVzB2UvPMQVe4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101679;
 bh=raGHerYuISI+BlXUU2UvORoE0+ZBxpJSgfc63XVnp8c=;
 b=buDkwQyAv5v7i+Qqp1lIY27ypy1cVq+jyknvisa4XO5+FLrrQXkKINFzMhAQuKlwHWBwRAYYZ
 a0qIxt4nzpNGWTGTpkN+FabVUAiC/I/Yrhv7lkD8q3H0bJhON9NW0edEeA2yX1E02n7ZX3om3pA
 0NszPBeE7veHxrUqKaWiZkA=
CFBL-Feedback-ID: 6aff13e883f3cb488062ba87:e2901e9a9683cb47dcb4d9093b60c712
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e883f3cb488062ba87
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
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
Subject: [PATCH 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Thu, 19 Nov 2026 15:20:46 +0000
Message-ID: <20261119152055.556266-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072120_391533_EB6023DE 
X-CRM114-Status: UNSURE (   8.31  )
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..37321e23b087 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,13 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1


