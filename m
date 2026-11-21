Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8456606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t7n6x7EQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=; b=t7n6x7EQGhe1CM
	8RsPBgPPaxVPKeQroA+sblNXt1ethdUqMcQfY3eN8mgvabafHoCTtK+u4E3QjuvcDCwMEHxX69iVk
	tLkc57NSg8Ps8SnrjXUWl7SCzeB2OyvtzZ1xz7JopXKkAZFCFsgGgWWhPVHW6P9hhqHdRuZTTyrar
	Wl2p0p+7hwca+5mYlx3hevEPp+uB7BGy8qtKIxB3lwNPYHHCVk3Ecy2PFFE8WLIS5FXJtkQ7laXqD
	jVH8JB/3piQ1Zi5bOcYl/DH1v851puFAln4qegkawbAg/VJ+voG1pmHkchKH0M6aKYOyHVos3vuJG
	vO2Bmq1LmEXMbWH/dh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfx-00000000LXF-0aSZ;
	Sat, 21 Nov 2026 21:31:13 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfs-00000000LTp-3LIM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:10 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso1475573f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296667; x=1795901467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trAC4qto0VZq/PZpAdFLASz8SKgjV3D5l88kUo4+5Bk=;
        b=2xKcHEW9Up/8GgvurTXgXgG1MUxnOUEMr5i8uIgB3cPU7+kvXEwzh0WZ+3HZVw4y4F
         lkJ+N7TsYdiJqOzkdveQVSWpP2R5nxdXFhdPk/b6303fYStveWvff07w+O4T+ISi1xCx
         dqFzSgz0rLloUQd45wE76Cf2V8DUIHVGDcHOPUwC7EgNCEgQBmgsHFZYsXtD7eNYnyFA
         xBa+E92jNncJKeuz7aTBFXoRIktdbERv2nBB/vOE2vW9CVnfBro8IrWFrKD6zeMAGkIP
         Zt0RSAZ0iu9A905qlDH7cVnCu+iUCKMfICZ9HTyaZ4h9Tc8a2wbMOd+O223GuK/ik7AG
         yNRA==
X-Forwarded-Encrypted: i=1; AL+hErEuxohg7Y5FCqZyVfZJXRDkBc73hQgFky1EqAfel+E/6PisWPRebgIE+CUMQryQ6pyCviBORmVJ4dQ8wEEjF+AP@lists.infradead.org
X-Gm-Message-State: APuU4Z+5BwErIByNlzFp2kv+AkbeNKhXzxN4nbTwsKaaLvSYOQ/pv4j1
	lqtqm4lnfooUHxxf2wEVMkT7BUZEK9JI0mvZ8PS9OoMO7Y9HtPR+oAO/
X-Gm-Gg: AZFdTZd86MjrWAgN4DuBT1V9tZTQgPdic52sSJmX9a2KKeCr992kOfcZgjEIDkB4aJ6
	BW3zdCsWXCcpo5fMN9mdYJX6MhHm4w5wF7Dgdf970UJW4vF4mCXt65rTLDYzQAPaKe1bOvQ+ldJ
	wlB7353cWNjwzv+TuxOZ1wc3fjWhF77TOx0knu3ox4Uz1c2n0Y1VVmtaacq7xg3l7lngvEHPRK7
	3eTLuaAkDP7ZLB3ijVM6vH1YmMNxc34+RxXPwDA5JHUrIlPFGoVllbfk4AIU0dfkIcU/70EYGbh
	UVhxyaeaBAWx7PakbapZyn4Ci1wS5xvNNyFszoakLp4s+95kC1nGG3FEC9KetVh1XtkZ3KjLXxV
	VdmQERVLVrpuleJGtzA9a7SdK+H80ycTDRHE6rETu0/nMlqVhAuq875m54irupd+o95lSl+fy83
	fbJNk/DKL62CukAyumgfvEdGdlwbsgmD/BwmkpR3SU2N8BX/J9ikeylvT+jrsH2sp9wLfEFUwr/
	Tx9joljAGSStETwDNUql9dxeyjPwJbHB1Yl+9h80U0aNsxhB4MUVxdyfvFNm6u5KWbGlqmOGN37
	cu/fZkq5gLsXgbXYL9gsg3QSZHVsH+f0KkIT6GMQ4yJRAGGP3sTF67318z1wyLjtdEOLo8YhpZu
	Sby4FH0Z6q0yLcUaHDWhNBSQ=
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr11591573f8f.51.1795296666841;
        Sat, 21 Nov 2026 13:31:06 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:05 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 21 Nov 2026 21:30:59 +0000
Message-ID: <20261121213102.143130-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133109_003805_B1F5C115 
X-CRM114-Status: GOOD (  12.57  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The T7 has the same management bus multiplexer as the G12A, in front
of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
But a device tree that names only the G12A string leaves no way to
tell the two apart later: if a difference between the two blocks
turns up, every T7 board would have to change its compatible to get
the fix.

Give the T7 a compatible of its own with the G12A one as fallback, so
the existing driver keeps binding and a T7-specific match can be added
without touching the boards.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1


