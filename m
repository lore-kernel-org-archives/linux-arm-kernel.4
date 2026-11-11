Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4E606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3m8QDxMi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYbrOqv1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=; b=3m8QDxMi1JL6CK
	+F7VDeNPnQjSXRKsLu6xOroGvcIAOBgDLWH8fRxTQiNdUwZhiqDGAkw2tHBYBmT3s2wfTYvHebou2
	GxQ+T256lMXdOkkPhyLcG7JD09jxzrUVp9riKZ1EpdJp036bHeS6HuFNZmMItcemUtcUeeYehvyW5
	rBRkfOTSjKdwXUeKSFjC1CECV0PSKea/hI1Vt2oB1lcJ6ZpwrIO/QFTrciblVAngNpRa318vQrhY8
	BXIXrBXoM/P9a7RkYCWW5UhzcKs4liqQLx2ECYkTj65VUeNIWG2NpvN6QFZfrEBW6mbR5qj7X1+KB
	pQBnQdcxEF6z6y2xEn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hr-00000006sLE-2gYp;
	Wed, 11 Nov 2026 13:49:43 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hn-00000006sJo-3V9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:49:40 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b30477a320so24830097b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404978; x=1795009778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=xYbrOqv1FsHx+T4938NA6zUfnMIG2hZUk2sKc4ZCbE2C6Diyqyrr9UVw36nQoInk2i
         9ORP01pK35O9V0rAt7QHiVFjl68+fAYow5PFEniepmJbkEOkg3uO+iZb909QRbs/ozqY
         +lhdUBaBq6820briVVJaedLaM13F6jPzpCkDeXiLMMPsHJ0UyE8AmVgQB2x5SLDu7NMO
         eSjYc8CfQh5gK08wlgJLBgs08oV211xI1x0k+Y/VjW7FRhck/nbuxiJxKCjq9cOlDE1T
         FLa2kwWBAorvQ34CJ+B/1cbesACwgt4b9w6duxYMVEYj3EJYMFKelV+FsoofMJdZGych
         /7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404978; x=1795009778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICmPBseWQJoBF6s/9mFq7gFHJnr6Bp/UIRwuOakdc3k=;
        b=DF+uIkW9MqgxXUXurCFJaKmTAYRJHiVWR9hpu0wDgPFpsfq+Awrr71mJA3zlvfhYxq
         b7R+T40zOiutcpT6DWQgGVApx2DiMexhyfoJjqWjw2rFBX6UsyRe5JuqeMdnZUiSXWgf
         Y5tkRMmSqlYoFlT/bpYB/NdfpJqcLJP8u2NNpBtw5MZduiT8adSUY1skWWEgTl8y+3hJ
         lDPI5m/hOZvE1DW2lulx0fHZJkRv0q3I95TeUDMiR0cIPZrJXIKk1+Z2+/Dh07a+6owx
         Robf+SYc3pwC2mgSZai41Sm71YuCp7hL7J+DpWDdTlulAJ2lWeveky9yXJFZZRAYySX7
         blyA==
X-Forwarded-Encrypted: i=1; AL+hErEQCdrNseJL2b9s7QzlarMp+WLGpbeWGWumogWgAs7heuj6cI11aUcRpsMfk/u0yqqpD6eMqH/G1drdVNG54UG4@lists.infradead.org
X-Gm-Message-State: APuU4Z+VqetAFS64PTpoMoY9iR7m5V+aVrIW4M+uzMII7lLP3rwfya5F
	kXAgK3JiGPqfuLH1LGwoesWD6tcVOFZTTM+HQ2ef3Iv1K9+vWmmo6Q9O
X-Gm-Gg: AYBFou26PomhM72IuTiptxeG0vH6fia7HrOMKQnXFFwAo0WLDUt1mP6xQPNRr/japjX
	nyVN03ceMeb0zl40Bk3zrGACaMZjq1qF1zLb8Dwux8/SthaOC7vFUQBa1pFJc7bHhGAsX0m5aql
	jAewuzqZjxGGHDF70iWgD/oWXQdOC5h/g6JMuDj9ltTozzq8ePXJZVKuL8smAOAVhacZcWG1MD/
	HX4y2ECdPyRL/rQZaLAq9+ONvMCevHrouF2IJOrClCIFE4OdaZ4dbrlSYuGpqMAdMqUWGWL3tgK
	VnZCf2xaKOfJiC0PbZ5h1L+ejNRciPL3zp/0ldVGBCUGRi/ZJlEuYnIf3jMmtT7Yz6WzwV4W4bB
	Rt0dkPKR0rNQih40N0TffFJ453FLye96TovoMDnOZGh39eAbnRK2itTmxXrj1vLFPZ8Hsa3a8kT
	QVB01gIU2mI5ds3vG0LU6furVWb96LsP5ttsCLmPrnDHkcYZPtr8lhPzhTy3NMf1vjmrNo2NWtg
	U+mpinpPaPj7Yq7cRodOL1+Vy1f191tRBijv8E4Mp+gdu2KrT33Azjdr44zL6YDcV044pzFKLZx
	iPsBZhFlmgvq59XSKu9387awGblXt/AdBBRTIfgJ5RYPrGnY5Sxu9gQhV3mt2XXUfe8YmrOikVz
	OOt0V+0ARE7m0jGzc2uPz9AF+Dzs//TWFdK+x0ZW8pNMb44R8bXew8aev7Rj73qG9hp3IIVKm8+
	8=
X-Received: by 2002:a05:690c:a081:20b0:8b1:9b4d:b121 with SMTP id 00721157ae682-8b3a7ffd0admr14988867b3.23.1794404978378;
        Wed, 11 Nov 2026 05:49:38 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:37 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Date: Wed, 11 Nov 2026 10:49:15 -0300
Message-ID: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054939_877941_1ADEB926 
X-CRM114-Status: UNSURE (   8.93  )
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

Document the Radxa Cubie A7Z, an Allwinner A733-based board.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 37a7d713ac71..2b9e4d3b2fe7 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,cubie-a7s
           - const: allwinner,sun60i-a733
 
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.43.0


