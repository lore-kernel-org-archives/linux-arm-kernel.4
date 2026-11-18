Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEA60A2604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+INqUaH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dTcRlM/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=; b=B+INqUaHc3mIBY
	qowxzA4RJ3hkfWKTz0K0rFvWomSQu3Odq2pKNYVHVB0H/4yxbuiy6qtVCtn4vsCL3fix0BkCmUsa7
	IJYZoZSLi4/vXBLM4gNczHgpkMgyWgAt2nWlfFLiLKi2c1fxZ6R+ZXkTcts4M3smSCKa3O277Ahwz
	HdKE2QwsmFlK3hVAZWh5ijnWt8Jtb6yyIl9zk/z5fzfmnFpGoTIGxBGEkMUi40AaUkTOi75qdLEqn
	8daZE0U8ZYB+22DmgOBo/WfqeJsksLftXDGUwRHTKsNyWQ85Kj/1QOvloy6DPItZo04saZmLFpya/
	bpdYq7vVeOO0lja4n3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp6i-0000000AUG0-3CR4;
	Wed, 18 Nov 2026 23:30:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp6Z-0000000AU9d-0Ebd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:30:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c445c95d553so228627066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044617; x=1795649417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=dTcRlM/rKbNF2ELx2RLOzN397y4TpXqbYxlaKTmwvX8S9tX0f+aZw1y3zzNxTagiQz
         uM2Ec4EK0GJ2PAEIg4WdPneJPtnEjSzs8kOrcTJjlleZYzEuae4FkRXoJ0rXcxvHfqPa
         /vPyw3eVP2+HUt54w+fAE7ypJqW40/XtU8yYL/lauyqYIHUMbgwdBTMpOqDDsXa03k1f
         Bw2XOsWcm2dIlnu/qFjtwiseosEAIMqpbtdVWhj/rOF74OcMS74RSAs72S0j2W0pN7jN
         57mW/aW/7AGi0qqF0z3yYs3brL/24PA5l6c6KM/qFYDtIVDMHFHF1O/esXf9FFAkikZM
         bPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044617; x=1795649417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=x5d0OduMG8UWYgmQnNXMtoTA36N8Ddrahq8Tj3eBja4TqV8PLw5QtYvEmcMwgJOQW+
         mO/H5U1IIxw3UM7SVwJPuVvkmWiqy5MwlQmPLKd7U5AMyoVcJo7fuKvsMcDNeMMBtjhM
         rTj1+F2qdrmOO8+PSGqRV+Hn609vgfEzoVD6zmwUMq/cJcVKq385fD4ED0ThjtwnZFrj
         wx9sMoBj3CQTd8uCczyXKPFpZpE/C1IKAXRpyNjCHIA0GpMhdWwzX6zpWJf/cODC8f3D
         wfsBXk+euthqnzk5Ca+nSrIiovtN2TpHo7JVOF7Km6c2mSLyvuoxYwgvT5d52TehKu7t
         xXRw==
X-Forwarded-Encrypted: i=1; AL+hErHinUhJ3TLC/mn7sn6JZIeKMxE6rRYOZsy6rzFpGET1Kkwdf6Io/DRequxcO7a+jCJq8zW06IEf5WfHKDf9dKbN@lists.infradead.org
X-Gm-Message-State: APuU4Z/jvpd/r3bj1OtceZIXdWaYedCJlAKjWkdhr+tbjSd5IOaJKNF1
	m6pHGMjdgSD47ZaszlyLMUKOV1GgQjitszNO7lFk//RjZInfo5eCi6Pd
X-Gm-Gg: AYBFou0NpHKnRVtQ/pLpNaV6nALFPpr4Q9MFl4SL5MbGN8VjdoDB3mJ4cFzBOg9qU74
	Haoo+fG/e+ExsoU+4ayjHsPaTLhIL7WOLMm3/J6Ro4YGcM+Du8uE4IIiXnAzbyBYXlXGdBUpSuo
	bJtkqrrGz0gnfDp/DKLqOb6T5sFz1RdJCG+2WEnvRdchBjaTU3lcHtyg/vCPhUDhZ9FYCXPSuNu
	cMbLY4UTvLRKM1Ko5RRx2oQzIe3fO6lsmzQ4fJtbxohKOvnUetiTe+00npJ4sSFthuiUu2+kZl3
	cCZ1HB5q6aRz19dLxfZVlMeb9gPQtLiKpxtXqPeuVqbJj9rFHqT8V+vjfxI8r21E8RpeZj/gNX4
	Bg633MbDDzLDIAjUvwOVTM8FoYp4H0Qt1NpI8RoXiwNyCNJV14jwhuaznknh5jlO2Ae/j6hitFc
	hlQDjMfxo7znI+tPBK7+1XbFlKgptPv+a4E1Pf/bovbXst2Z0oG7l2b3a7xfo+7NYX9blD0pQmJ
	ybFrwHhAzUfM+cMTpMeltZAAnvrwgYIDBDgm5M7TYAJKO/SMVLhV/bVAgI/oC9UgFjCgrTMNShB
	0EYrepF/sN+g9j3I3G/8Ud53djNJM5S4/bO6h5inDUc=
X-Received: by 2002:a17:907:1611:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c510e22ac27mr381182866b.10.1795044617416;
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:39 +0500
Subject: [PATCH v3 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ok3568-c-v3-1-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=1181;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pPsEz//R/5mbHWtInqzwe95ndZ3s89rfdZjnVNEV7dE=;
 b=JqRsW3Up71ea4lmgiyptHVdI9zefUyJcZhSPDaVQD9V3n0RhfBpSIm3puK58UPdbQDyE6fu+c
 KGx8zjYmXDWCBUePjda/4weNDbAB1rAwqMACrAI4TImu77tHti9PyKo
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153019_142546_207E4736 
X-CRM114-Status: UNSURE (   9.51  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.56.0


