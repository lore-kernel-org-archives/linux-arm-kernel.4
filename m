Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E30606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sGsQg8Mc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwXRoZ2p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=; b=sGsQg8Mcthq36T
	acmBzNU6TZ3U9yCZ6vNFiTI0XH+o4o06+vQtLONRqvd/b+uHhYy6UC9bQqG4FGRmzNRhOYpnCV8nk
	KXCPKND+i0Wx7X2yBsVfgyU0Ot2FXDZ9CNldEg9gfnMiH+Q00XIC4zEzFu6rnR7cFXNxv5BqIAnA4
	vMdmjZfwElRa1wvkB6E2ScoZOpgIPj0IiRD7WihFp02COrmVGEHQ2jEdZVMpniVH/GgF3puHRCjNd
	1QtStvQCicJmLWsb3/UrHIfy5ZRYI/LMniQ5rGfqKJz9tz/9RlnK7KwioZtFmIYFu3if9h4P0/A+c
	5CfgvKwKfZsCmoqITbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGQ-00000008COE-1XCA;
	Wed, 18 Nov 2026 08:43:34 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGG-00000008CGr-4B3q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:43:26 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096151eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991404; x=1795596204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=CwXRoZ2pL9U2mpvgZYaKHCBNBvzeY9XZ6M4KTfdy0AymUmkpjxEV01vSIRUyHJa+O6
         5T/xcpiEw7YJN08zXUpG678MOpP6qBRulmiRMfF1z8M307tM7l5OzNadulMVm2civfky
         c9EXyGj4cj29X1aUmk8QwJx8TTrRZTe3uthpXPiVl3dt7Ep4S8mhPlwq47fvD7CPqsvX
         HrcH3lSHenjYDMZ+35dxeCWlP7spsS+/Vpxk0JYjwrAuK4KWyujThdZ7vRqAdgmt5yDx
         FLToQVS9eTXdoawwsScKD/h/i4gXR4hkmgWjfxzkKsLN/tSXeuw7y5V+pr3cGKBKxMJL
         K/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991404; x=1795596204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=i9PnXAbJbIG6NNKR68AUWpfftaCprb+puVjX+rAgtWMYJpiIGT3KHUJ+fXejrWfnaK
         fyGk0ooRCH1lbN5QBOlNtgVchyAGztHLuh+BnPl70CA0fKkaJHhznljtwHytlQZMufqw
         Fjjn4bLpBMxL6rOI5RSAzYNZ5IqqMxfDC8LyMn8XeqH8C0B2kDzOhcE/b6ndNU3tkJwK
         Bj8sKZkLvKfFso4MySIJ4dZmSDrhMGjDkAgDtkiMjLwG513UflPC7tBBT/4fyRBHq1Hf
         66X31QtS+U4ao/N6kuv3qt2WFxzMZkcP4++5RSCz9xbMXcnxEZYqO9kgvtaECOKzSZgg
         0eDg==
X-Gm-Message-State: APuU4Z/OOXHqvzhKNwKa+V5sfYUjer2z1p6lfT3qbfkMVDJZzSOc4Tz5
	SeLqEwaUrgnhORIf4yp2c0ql+LaD5uSQiz1YkvkFDANrFX8LseOjqier
X-Gm-Gg: AZFdTZe5wQGhrPbEJ5PH6CJ/jUjYiBXmBEl7XJ+g0rutvzOgSr2/17S0AaVBB2Ppspy
	thDpKAXKW50oBzXnBfjxAmRAU/IkYVHZ9fgyFkXR4wVwnPKafx27SAIN3YDIUNXnrOHucllCrHG
	J850ggi1l6z9ra5QWU+XSLv/RFwNEIzAHYI3yd83C6WDR6GyFLphN9H1jBLo9S7J6+msNqc94n5
	0dh36Oj5+fCJNExpX6u099xESbM7voS6oPc2NE23TJVXNQrmCZ8NjiTYJmKu+0X2dN8biZsFeJd
	JilOcyb56Tm4CdPE1ZEo/xPC3MtPtB8IFDaR67nelNP218NRoj1f1Pg3kVRCX0UnTxboUeCiMFC
	Rez4vDhqpypuISEjk55oidx4kCuPwqz5jFyUwjSRQGRiP6hznN92zunzx9psap4YFqP6CYuys28
	nP/G6uZxeeDBVlYXYGvZDUB4pmBe56HsXUOzUhAFnl4uDoyT8Z/CJeVz0H7dPaz6aooZO0SStU4
	v7WFH0ZTJbW6QIJrfG2VrETxjr28pFLW/GBIvfaKbfdDAZJYlV895uvyIL3U5H3zJhtApidEw8A
	8v4zs0zdm1l7F7y8xFd4xurjx+D4UaIc8sj9NnVZYnVWzRl12bHyzc/ctsb5vzQp/f/5ioIXZ9d
	YH/ihQA==
X-Received: by 2002:a05:7301:6f0b:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3828101fb1fmr2002654eec.7.1794991403757;
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:42:59 +0700
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-1-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004325_038253_89A3C47F 
X-CRM114-Status: UNSURE (   9.59  )
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

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0


