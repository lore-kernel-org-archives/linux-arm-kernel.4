Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HFtdzFCf;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=BAy9k8GH;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=j2P8wc0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=; b=HFtdzFCfjcs6/0
	i6/PFVAuOTnP/O4wg8HizuGnTXd18SxWGCzqG3yqScLsw4FGQ9eiHXjySLKlcOWQ0e/D5H75afK+D
	rYzwCuv6ZRSbmrGmCxPFGfXs4bj1LaZe6xpD4atNf2arrSNbRC590hm34uXPQ/KnmKmSLxNkzKaiN
	ZNsusf0zPFnbWBlKF5CMqXfuLbXEeg+s7GAjzlNU2KItWwiPH2h7IL2N0GyKS6AhQdh01z+GOSpGN
	KXfnSxSdogyZqLfFt2EDbG/IFi7M3kqrP1JybY011f+K78D5X0WqKFWOYxmH2Bo5rMWDCY/13zUlL
	yJUzfzBEuLKNuXLgC9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCcs-00000001aUJ-0Bec;
	Sun, 22 Nov 2026 18:49:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCcn-00000001aSN-2kUQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: References:
 In-Reply-To: Message-ID: Date: Subject: Cc: To: From: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be; t=1795373356;
 bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=;
 b=BAy9k8GH0w2RY02NR0u2ucsBMf0kAC/X2JSwIgExxiQfUEsY7NPNrVkWgxIIIWAKn4hsenoXY
 43mzwDiH4BnjTZ0+YlDdcfoULP8MsR1TVj3pf3I3IaCxYdetGCTgZOTzBai8Lj7WkMQH8WwkVhO
 kIxctpWB5q1j3Pzvc/TsSfjA/IbUMqrLu01oo+ZlUd1TzRLNhgcb3HP75m4Ox4/NcRoHzH2EvgX
 BtKaMTVRSxFH/QxwnNPzLI7kDgHT+Ird1FnYgJcQrEU4+1G3fUlUvr89GxUEQ+x8DEnWWp3anbj
 ns2NhGIchC4986IC9yXbu2pyt61aOek+0fq3jbM6iIcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: References:
 In-Reply-To: Message-ID: Date: Subject: Cc: To: From: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=default; t=1795373356;
 bh=S38kz8DMqbgEZVQZq3PeZnDsXM7CwdLW30hq9lNw370=;
 b=j2P8wc0z+AMOyf0IPtcRBTF4v9c2R5wO/GwAe/O68G47Hc5nlXxSQr3hhctkVoWnUGfGpJFnL
 0DgOxOgjxt5R6v/0WGy6rLK6E0gtnpUva5bY7xp8xNA9u/qDjtQGImv0X8ILUbLiI2qXaUEF14t
 9uenxE3fDoxUisTP0CGSxaM=
CFBL-Feedback-ID: 6b0338514432eb7754305b3b:6b29310fab77a2f0093031b22dd678fa
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0338514432eb7754305b3b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
Date: Sun, 22 Nov 2026 18:45:29 +0000
Message-ID: <20261122184532.1300004-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122184532.1300004-1-jonas@kwiboo.se>
References: <20261122184532.1300004-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_104917_745112_CD73B71F 
X-CRM114-Status: UNSURE (   8.05  )
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

ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
triple-core Cortex-A7 application processor​​. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 49c61ee985e7..38ae73e8a34c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -84,6 +84,11 @@ properties:
           - const: armsom,cm5
           - const: rockchip,rk3576
 
+      - description: ArmSoM Forge1 board
+        items:
+          - const: armsom,forge1
+          - const: rockchip,rk3506
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.56.1


