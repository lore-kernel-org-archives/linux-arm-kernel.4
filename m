Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B46606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Xg9mgMo;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=O9+D4Fzl;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=VuHh82J8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=; b=3Xg9mgMoFRNUXd
	jgkaokAZKJgZ8RJY7RnY8pItvmrmf60W77vPGv24Kb8RPUVz/Cwpw3+3GW23/4Dj9k3IBwWZ0pDX/
	HZXSKJ8g4FH4Pkop5HG2RdlqSVLc9w7i6SGzzqb6eiovngcXeT3aPMR7CrRX587HJgn8npH/T7EcU
	ejwJ7mIgvWhRAzfJ095/o7zHcA5ITPJ2ZAr9hr/0OLa68O+2NsfqYAvWioW+iHVzvsw3um8kD6YrK
	/Yhp4rAo0cKBCwhFocPLIdbJVa/dPuYYfQA6lkZ8qJBkE76iGKv7Q6OIEtchjfruOCW35P+m3xBHW
	G5HQJ5uXFipe9zk15gfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0eF-00000000li2-3Tv0;
	Sun, 22 Nov 2026 06:01:59 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dq-00000000lJl-3OUS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327294;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=O9+D4FzlgVjaulwhI+d9Z5/BtUtYH/r+0hCoNyW43HtF5UcImFkJUzi/hlE95FotJ/22pjlgz
 uTAlJc5Ptw1wAD8prACFBIIaI54dKM4ZtK52nZ0S+0Sasq7mD8MwdlGWet6oFDON2zCRZAo5+b0
 CGZUYNr0nDia5zxPtRpFAyf+XSVytjR+VGBjh9zrZ4lEzZVi0p+lanIXtMQYvxSDHEltoJE/VFg
 4IhoDQnkmLqdN1id2qByZr0D8M9lEeLFj31r45R77EFJA0NFxlfF9gdOeqOZ2DVIGMoEcQpV4lH
 VAW26AZF2hsnUHhACwmHyAm80S3ZZnOanh4YNC2/H9FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327294;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=VuHh82J8ynOy8JjLr5B2nVcdAaOtuOBGcyWQA9LaDCmhSg4LDSLhAlt+igZTBFKOVcgeJGJhU
 ExEO+nvWFaj2OTI61YAnkzzXbwrw1AxlxYYQW8rXuMOrx/tOV6S6xZ7esrTz5/q255j2edGdLVd
 eiFon1HB8I5wtjlHN06vAb0=
CFBL-Feedback-ID: 6b028536cff95ecda8c09374:9101f6a6405eef24968ec9d89ff35255
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028536cff95ecda8c09374
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v2 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Sun, 22 Nov 2026 06:01:06 +0000
Message-ID: <20261122060114.773624-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220134_879655_56ACC081 
X-CRM114-Status: UNSURE (   7.97  )
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
Changes in v2:
- No change
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


