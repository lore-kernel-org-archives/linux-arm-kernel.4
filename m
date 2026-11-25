Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274DE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XiWRdwP5;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=CZ0nLNW1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=83eNWKSER7AsPEjIiws9167fJCTB6KmzsxTKIsGFr1k=; b=XiWRdwP5FyFtGf
	tLYuwo3dq+ST7ztaKhDhfTiFgZrJD+tlDsSIZKEXlk55y9J/0w0OpoXF3fJGf77oEtvikjGG27yX3
	Aw9YjJ0vR5HUeHzIPtE1vSxQk49cagtxhza/UAYCaAKb5G1dnzVDBxgGUEG3bNqun1NqryAXK9Ad8
	+jI+dnjkXqPz9ipKlJjFfFnDbNwbAHcDn/pJaRyEonH9koLmQH0yxlzeLxmd+kGyj8rKBGlZewWOt
	gYjbBtAjI1x/kyFBjK3K/0sWqBkqqjbQud6lW83vxpm3HXrdjD7kz35JKYZLEPb6p8SBwITRn/J0U
	XQKE2NB7GMAbv/UIXmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMR-00000009sM4-04ai;
	Wed, 25 Nov 2026 12:44:31 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMI-00000009sJe-2j7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:44:23 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5B5DE4C943;
	Wed, 25 Nov 2026 23:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83eNWKSER7AsPEjIiws9167fJCTB6KmzsxTKIsGFr1k=;
	b=CZ0nLNW1m9mAL/zeMGCZHZGRRLumKHq2gQma1R2EwY2G9x73x81SnidUU60LVdxFvDUj2o
	pKm+9C7NU+V0e7e4gwGEGTklX7EQX6ubRzMzxqK2KyacLmojDgByb951Ku68qQ6bIodq+w
	LiJ/0HvppNfT0YkOu9cYv8v7NtiBOqw1Vho1f1hcdTOhIb9Ew9PBZOYDB2kz4liaQrrKFb
	pT0izfjRMnR7OJrvc8u/uy56nnHqcA7uzrxsQg9rMRRt7WEoLBwkEGPQqrbalX0y7SdKlK
	gfU8AOmPlPyN9j9mKsU7UFc6Cm1wGZsWIPBXdhl2dJq8d8uzW63lKGmQFtDcvg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	that perfectly matches the personal mailbox of alastair@d-silva.org;
	the sender domain (d-silva.org) matches the recipient domain exactly;
	the content is a standard Linux kernel-style patch (dt-bindings)
	with no urgency, marketing, or phishing indicators; and the lack
	of external URLs is consistent with a developer's code submission.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
Date: Wed, 25 Nov 2026 23:44:05 +1100
Message-ID: <20261125124407.4098345-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125124407.4098345-1-alastair@d-silva.org>
References: <20261125124407.4098345-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_044422_836032_9B6C4433 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Document the Xunlong OrangePi 4 Pro board compatible.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 091cb0765ac9..a41d4c752878 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1023,6 +1023,11 @@ properties:
           - const: xunlong,orangepi-4a
           - const: allwinner,sun55i-t527
 
+      - description: Xunlong OrangePi 4 Pro
+        items:
+          - const: xunlong,orangepi-4-pro
+          - const: allwinner,sun60i-a733
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.53.0


