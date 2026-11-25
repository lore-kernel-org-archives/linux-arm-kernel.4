Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VUKyu2u5;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=hqkP8eO2;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Q0Tw+Q8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=; b=VUKyu2u54g5Sr7
	gfg3rmSV69BXAgUeFgmgDD63VEAOh402uBtLG34KhEU0Hzg1hCcsF7nNhTuq6otqhxvdO+3Tke6Hw
	ahYMpmWoSrKpCaD3mjQy66ZzzQsVD2t4Aw5CqLzE3fVZFxH+127kqXR/E3/wUlX1/mBZguQX7EeXu
	Lz65PTBJKLhI+nTvvTSZ12Wu6RJwEmg7RaK1tE6sL+hP1lInzlZ8LTCWhntoU4TWGRiynkDHIF3Fn
	8FjjDOQje6ssfystNmRsnDjnHHaJL8/LsrthgT47ssIa0HZ6YB69Mk3Tdc6BGe44PixGbbi8LShOO
	ThzcX8b5rAJjCEIbpeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKnu-0000000BOot-1PnL;
	Wed, 25 Nov 2026 21:45:26 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKnc-0000000BOcE-2UAH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643108;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=hqkP8eO2OS9JiI4DJgCBeH2p9bLD30q0b0+0gHM9lTGjeUH/a2fQWwPhTZ2QO0b3nmPBx7l2d
 qIzDwaAH4pzCzwK3ybt8B6oijwDAEMabRLmLhySoR5b6Sw50H3z9aki+BeOarp2dFMNTdNRESt4
 WWSZsZpeSpwS48YbGT8ECK+GvO1+iqtI2IDdVnQ4Gbp8Vg0rm/41iGVkbue53C4W9LRE5uoqXKV
 aumK58aCr/3OEb8OaXSwvbbEfih/Uf3o+MY056ACBhGyoMbe4ihGqk6YapYgJZrvjBF6tM3IHgv
 50i0qy0P74sCNN8UKudxWJlSVmGvcHbsXCwxXN8+OsWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643108;
 bh=P3fIZN9wR3GP5H4ySKRBzErV81pAP8XccdYUMRKtqmU=;
 b=Q0Tw+Q8w8r+ACYaPoDIGMsueDCN9orJ8wWAJS45+5OLstHGsdGogJvvAu75XJ+OTvLsCNbmFz
 vRYIaLfcuX+WDHzQ0ApZydwuzo+M7pNWND5zzpUBlujhI5XG+YUq8iqRqOk3v2fW0LNzn9UqYiI
 9lmUGHFn0mZQyw6QED8FERE=
CFBL-Feedback-ID: 6b0756c5f930f38bf754f99a:55ace0071697eb29754ce598a7fc0c7a
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756c5f930f38bf754f99a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
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
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: Add Luckfox Lyra boards
Date: Wed, 25 Nov 2026 21:44:15 +0000
Message-ID: <20261125214421.1580359-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_134511_978800_07C153E5 
X-CRM114-Status: UNSURE (   9.08  )
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

Add board compatibles for the Luckfox Lyra, Lyra Plus, Lyra Ultra and
Lyra Zero W boards.

The Lyra and Lyra Plus use the Rockchip RK3506G2 SoC variant with
128 MiB integrated DDR3 memory. The Lyra Ultra and Lyra Zero W use the
RK3506B SoC variant with 512 MiB external DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Update commit message
- Squash patches
- Collect a-b tag
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,15 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+              - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1


