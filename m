Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2lLGCcQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=; b=2lLGCcQvzkZMrZ
	UuKxAk0tWJb8ueOir9c5Kl5JRkoQLkaheuWvhsRyG3be6fKCKkWDsCHS8RtG1zUqKV33dz3FnInrM
	4u0sFYeyLyyMGXGUQOfcZWgwNlMW3jb27opR3hOXspdHfl0Axld564aRbb9PX7gA7F36KdSt/8EHH
	7Jo7sjByrQtJB6gOyCuJC0Rdj1whiHn0QjDq5LjFb+MYo5kOVoYaGTe1LWETlp+iSJKhREoEaki9b
	FNAeqNE7I32OBSe8SvMOtiBWMekp6B28BUQTBFak7wSSDq1r/nv/qn3993f060lQh/vCUBXTEnce4
	/qBBVkYxNUtFiaroErIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXChc-00000000Rnw-2TV3;
	Sat, 28 Nov 2026 07:18:32 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfO-00000000RK3-3yIh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:17 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so82957505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850173; x=1796454973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
        b=MmF/1JjbDfFemn31Cw9e6jeDQoUPvMIhYJ2nxNQhOFTKZJKuLJE0wyvP5Po5Iq37Nt
         hTI3o5THP7bdVdzsUyVyOb0mefPvRefbhfeXT7ZpbsW3A+0qVz9z1lVc6y5mayvj+v9Q
         A73GgYo61aM0uqhdFZ2Y8d8yPsFYe14RvHUOR7ce/yk2ohcj45kPaUvX66C7Abbq16QA
         OzeUQd+L1jFZufCjagfUw3cJM3bgp4zZp8jwq3J8Ar4uVvjO9FEq6ypW9hw8i/bt4/FJ
         WJ7hzdetW5IZRyXBe3CP0qeoacN9hD9hRZ5Ywyy94N2N2cIboogNG2kAFM01E/38l5sL
         FdmA==
X-Forwarded-Encrypted: i=1; AL+hErHTnabvgr0NOle1cv1+B3S8vbgN4Ezs6ul8+Yamih9lJVaVRpKukJcMLiXQ1g4rPb0FvcJ0K428UWjW4c508j4P@lists.infradead.org
X-Gm-Message-State: APuU4Z/HQYDcef4RFeaE2Pr6psFDTS0099Oc8H3cR1WXlK70r6KesVVU
	clO0ftHG7rK0uyL7mJYfRTrnufsI/TWNwBEUa5F87ICeqBm4Ql0NDV7H
X-Gm-Gg: AZFdTZdT1BpHnvJs1gDIPXb5db1gYyMJVTrmLbbLgDoLqFHSej7+JRKhb/le5H2UxdQ
	6qRpB/K6jesX8n+8Hldv0ehoWG12W9ldtgQ4X00t7xybdzR+N2PTD68kMZ1wyYhmyYVDWrREnwz
	C0qZYhqHy6iitDQHMT864N/iEY6K+wdLrT9Rj4DPqnsVkx/ZkdwX4mCzWBn07dJx33k6PWSKmjH
	DVQPgFnv3y0T5ZplXwvXABshbyJGgzu5vkn8MCExLbH99DrKSTDtcGF+60VI/JH4sEknQ8CUsNn
	1CQ7KCInZXPm31LZ+CxdciMnBML3TZBRR/WUy7a9bLlcCGDPrv6MfyFrJ5CUgec3ezt5jruFuJD
	t7OOPq9k4zxyZMXJtPGW6ew5+/fRYuDhbIYKPDM5MxeXD187++nMbrD2NzSZDip/LDIPk2GxdFi
	qn8o0+w+pPCNM5jgxu3VTFVXMNpixELrEqVJ7WkAUcW5P2qDTyt4xxtOo1IVtrzks9wxlDM8g0f
	fAdZU01l0xWmBS2U8ilRxJUMezCmQxEpZ9txf+I8zLeMueS9mk0pceD0D6wNh9WldwhuFtyCtIk
	J48uf2jGS4VKwCQiChADKUFxKCNNI6NWHzg2uTP52t/4JyzI5fL/fGVuEGkOuQC+pCbAeV3aHUl
	GaEvjfP3ioZx58vyBi2Ro8zI=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr687806825e9.5.1795850172794;
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 28 Nov 2026 07:16:07 +0000
Message-ID: <20261128071610.27855-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231614_983223_0D55D20D 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

The Amlogic T7 has the same MDIO multiplexer as the G12A. Document it
with a compatible of its own and the G12A one as fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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


