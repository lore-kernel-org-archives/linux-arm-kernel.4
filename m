Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3734606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ThrxqCV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZrXd8UE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=; b=4ThrxqCVsLM2VG
	IMlJVmihT+PD1d6yTtwa3PmpS1Mwt62jCS/8xlqSflKFws2/rRCWrzxVW1fK04oHzKsAg8Hk3Ma0T
	CRPYyJG+LXCvCS/436wgMuceWa7HdKx/fpg9fRf3uw+W8hGKLjWT8uUbGsaVfimCc5kz6oTX8o3Bl
	1AxfD/o6SBnhEHPDw2ILxW/X6W9qP98C1MtWtTR4nNU9fjyMLdAhwXxy9QcuYtYhdFCv8ckLw4wV6
	iuDgdbEiaHCVamlZV1HLe50UZ890+ydHywyBlQiWl5oeUoaolnbfKYXsuOGmTR10PIeIAMc/fKSSS
	do0c4tuV1DahWBc4d1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvX-0000000Dq6n-2v5d;
	Thu, 26 Nov 2026 16:02:27 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvR-0000000Dq55-2Qmy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:02:22 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3282db206d3so3210022eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708941; x=1796313741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=OZrXd8UEfoTDLf4N2/4UPsV8mPnWk0IPiadKribUI+ORRpaGTUE8ZBk2TT+C7pVrWA
         pG2pbt2uTjbI89/S1Y+/W/3VtTS6D8/Jtd5VPnLkpyhS18wTrzdrCgehFaamo51+qNsz
         afN96VzgJjF3YFosXMTEVZ01lz/r+dBsivM64hBJJZjh8fXwtaWKu45MZENDmLS+vWoV
         KBZ5khkCypUgXqRw47KEaGIVBrcRHeIXf63FcIF+sz7Ch6Abwujw67OjKFbRq9yiCzR7
         l9cCcRa3pz0GjgEhCWww/7IRGJ4VA9f7N0/wDPzypNpDlu3Fulgd21zGPGslQYqpTtt3
         wNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708941; x=1796313741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=F4OJPYUx/9dzutSqGKgw27SJ7Ri54cgKTwk4f70aHgcW2hdufuG7J7bG5+vWeYQWSh
         8ADhFQYWqLAemj3r8MwWWdt9dZbv3RR0zuMqRijMR217mF/tPRfk1uGlEhr+WLtDf83Q
         9i3qSl7WflSJc5dXZLOuGxhkmsIdXo5qc91ugP0utAJ+0dxJEtcSn2usipc7W/pv6XfO
         e1iAk0xNd51rNFpU4tqHEJOkJyWlB+pVsN7uD+gYkQDJvRkeEIManlqabECCXtg33+JT
         iMuWe1Q1SKoGCyYgi36CWXbAXret0lpOeg1NYqEfy4tm+HI6qyTljRXhO7Y5EHw4G66K
         nUug==
X-Forwarded-Encrypted: i=1; AL+hErHsHxfmk0Dc2rL4CXkYMbgJrdmgVzT5XvZdFlL+x/b/vwIdauTrttakLEYMQZzbin9e1z20UZu+CKVTICAaC+hp@lists.infradead.org
X-Gm-Message-State: APuU4Z8CTOMmxq0oXoWpmU5leTKiK2aVmOORmrjYrpJmLr7d9rxfM3aH
	SbF05ehqbqZFGCUsGfbfHtB3Wdku4GxfmMDpw7U7U758sJhv9QHeYUW+
X-Gm-Gg: AZFdTZd9njRyBeFc8Mg/Rt6rMSqGdIkwRxxV3c20twf2qT1nSEt4LQjLOyLxo2uBo/G
	kyiZgp8Z3QUwowbAhDZDxm04OyuoxU5aj2h5PlvIhKVanld4tu+8OY2XhFrW04HH2G52i6O0MIG
	TEjwNjCmVTI6AKZTfG8Gl5gwLtFUCo7Iceo3YfqTbhR8f0fIzEZI9gvdsXB1ujykg/qZXG+ixkB
	Z87sgOWZn3mHqpxvvPBdfEZpqUu+JzUjoXL8+VNaetxX9vgEhld5xgPsorftDozeNFxHv6czZ7P
	jFCqtXyd1Q/T5TTKgtA7IJfAR9t42mfdnWHNroWc7bz5nWlzhjujrM/yErlOt62yr0HktEvcwQM
	UuCkyYX1+MRmK3ld2uhaSXAlPsiHjoPU06beSuRPHz2/i5CPc4rqUOInQMhMNe03RVAhQQae10S
	/Vs01yYPJNRaB2BNX8FTrq2xEck9sPJFl+6tZAg3B61G4CnicOvdDR1EGt5Pni0+6A7ZxRnbid7
	NzjkMhgAJCihER/v3lqpO5Vpcpewp2JPRCeZ68FazO6QQQHX+Rd/YwVWsaEiqFcx899L0KHBF66
	KsrUlvpRMeTx6QMwt+vstfg5/g0aRw1cGctSIQxyXY8E
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18510797eec.32.1795708939894;
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Thu, 26 Nov 2026 21:31:00 +0530
Message-Id: <20261126160102.52163-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080221_624435_A030848C 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1


