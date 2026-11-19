Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E32606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GkmMvP4f;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRUhGh6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=; b=GkmMvP4feLb6QZ
	phN1ZplY8NVwcKogItXTMvKAra9inLtLM4MjyH1v7LLvdhbKF/vcWI+PLkl7YiHzuXnlbLR0cyMAW
	f32/2cxa5LNawrRUXUbFr0OkGKeFIn7cG00ginwe5kRFk42u3eWUow4juMBQcO/G06lVm9Pbv9VDM
	M+5urvZBxDx8qopHIneqx1+ir7xagfHJx1v4w33+7JFhdomA1kBiyjTh0xU8hmdi+OQn/dyRzkH8T
	w+FwryuQlHjcfQliSyFz+V520f/e7TQEODy0C8GZUoRxR0iRjc3PIRugNIF1lQshkzsYBdOnfSUcO
	5FJnDfc+X3Pu2cBTsqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZW-0000000Cxf6-3fRL;
	Thu, 19 Nov 2026 18:09:22 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6ZU-0000000CxcZ-1lX4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:09:22 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-4ad587ba293so105164fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111759; x=1795716559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=sRUhGh6n+VY5KGNDNFLayo/wHEN4h70pYULtlF4k1xHS9373nZBqP6ANwpzltCuX9t
         /viPYkE8qJvLOaCZn96omsPuvSYnCZdNYGfx8VgOMntXjY8p7XqdYHxHMDo2yQR2e/jF
         F/bC/Yv3vN3nNLetvzg4myaYFsawxCGwxLocAIVVGkpyg1q6LAg6tqhiXYHyh/SJr6QH
         wjWblTd9zGrtW/2H/B9w/pZZLPNsuCqg+9UNkbO8eUwjBbomnsU19p+l1byIapVAA/pt
         jvomG55hALY9SAjd7FZVhZovb1WLkELWGs/gwD1MLbVvYFG23ht6+eW9zCUxxvUWIT+1
         1LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111759; x=1795716559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=M/zXayLvR6btbpqugPnwE9k7LsL5jU8hf7nk0rtDv72xc/KmfJaJx53vueNdfc3AGp
         UY7dt2BsC1vS11BUCArRU61MmyqVG6JnZhQFicBdshfmiySNidRlbylMYghJQ+lAJIw+
         eu918kPHkA+vQm7BUf+4Fi2lfLvytmif8qdjGW2wAWowkaj1eXF509T/IStzs3zmePb/
         VphyeghdqZDze1w1kqbrQ2Odl9vHwnXWHR8OUV00mkLcm2oKgZDQjZqjKQgucwV85VDq
         GqB7fuLvY6gOm/z2EVhTdFnNMKdSsuL++gGcUH8vbGKC4IicwDmHfotkJlot8Oeh3Cd0
         Bxdg==
X-Forwarded-Encrypted: i=1; AL+hErEhZxFTLQvVrlLltV0RZPdlJcDtWoXvCO+h18wEcRCk9ByQ/Hl9SOywzEaC+aWI7RN7JIGmI6E3fdwUu3jqFQIK@lists.infradead.org
X-Gm-Message-State: APuU4Z//Boe3UHOpGenMThI/gnt5ryHr1dUxgcn1PgVKkJNJpIY84jhk
	gknjF9CFSidRKFSclDZ0pnXPpql4N/0cP+eyoM0z/pyMQWIYVv9U0Y2v
X-Gm-Gg: AYBFou3sOA9xV/DPfjWwpUVP9Yq7ezv1+fHCLByOWnnzB5Zwzx9WGPkxuLEcoPVxh8v
	5uVw8lF0+TkMZsIVvP18wHZd87aXifKNwXHxGEHHfY5oCWyInlCczkgYIdgdALu4l4tKAEh765j
	hywIiPume43dmf0FlmpWUc3zpEJJVowLXVgactMYURVeCKpK4yq6V3HKsY7X5RZjkOntKyAmhaF
	mhZr4eMHYMZzSrACODUYCBboMUz/i7Yvlz1f+s6pNnEj27PnOdQDoiMcNwTO6uDu+jeUNnz3JTz
	HTbVZ/DWT6sYnc/igT8wdz4Ns+qc9LBmV9G5dk2RTIoNyT3rEc/VrVsE7rhqYJ2wTOgIm3tbFox
	ijV8YA7kWY7LfNFnJZtOPXfZ3QVYW/WyU+vKX2n3SazWTWHiCaGwHgWkwGyyjJ8SybIOtNBJ4oz
	upU3Yn8YKztGB5Lg98VY4Q7t6EYpjtrS/lg9DZnZB097pAy+0RrVgS70pllLoAa4XC524x89eXE
	6KOFgap4Isy62w59BPLompk99CRwqmuP9rKKTX0ylpinyNjt5FZoqcSAvTqoHLsittVpvmkV/HK
	+vz/ORA3/JjTzmn/Fy/bdbuvqo39kXBFpmdlixXA0nnslq5hsgN8q07waTaiXOfapiv/34qSWoW
	w
X-Received: by 2002:a05:6808:3193:b0:4dd:18c7:544d with SMTP id 5614622812f47-57a0ae276b6mr796447b6e.31.1795111759288;
        Thu, 19 Nov 2026 10:09:19 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm92701b6e.11.2026.11.19.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:18 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 19 Nov 2026 13:09:17 -0500
Message-ID: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100920_465780_235E7C59 
X-CRM114-Status: UNSURE (   9.12  )
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

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..d32689b7113d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

