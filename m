Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WswKxOzb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABlxDx16
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=; b=WswKxOzb0enJnN
	6VfQeCt3JCidYxDvnpKNRNoY0UNAhBDwPt+QNU9P8EnxLtz1s8D7lU/oRxoSBJQ5JbWmLXb3Aik4P
	9tOxOZ2oHdzanfsDkIz2o87E7Pr8Ueewk+AA4LaetT6DY3tn3yPIMEZyef2CgP0lxf4PB+ZUM3g2X
	jFXiV2bCObX0Y2jiiBz/1S0jLzSjHa096v8itw3JtpCkk505iF9ysVD1ddFkZj1Drgg1y26GwM1BX
	ww9D1S7XJqSj/DTm3A9NVP6R81hp79TD7H40om2fwf7ohE9rlNZCX+9alfkIha5oEgLa9v6fKCOkn
	1kfnBhzvGGAYzFvo4tGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDP-00000000pMd-3AOc;
	Sat, 28 Nov 2026 14:15:47 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDE-00000000pGO-1evZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:37 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33fb4680717so6874502eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875336; x=1796480136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=ABlxDx16LiL6creFuZXFHWVRFpN9yw1RrYlRgsfOTMVGzRnNzNfyGDCl/Im7KpVdkT
         x/UIdp8espCFsZE9PvALke6EHIHPQ3+Nss4oOZ1dHJ40Y8t2532e/+UejHtmxHYFNsj+
         UPvX117cgChgDvU/5cFN8uE4LMYZ1LSb5F0N15cFF2Kihmhvh5iDUlMXBNCxKx92mgZf
         v4HS/ozlYSiy5Xc1OP2m+tYD0QB3a2dR8O3BRFW2EmT5mFWTm5s/VOgjAAS0byA67i1p
         JpxRCewkHFNyb6D8tm6+Cnc/t2P4BPVggwYOs1dUYpHaiXjg2qiBIi29rnU0jXD9Mzwl
         097A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875336; x=1796480136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=j+o+brBAlbcI5pKNh/H+4minoV+91GtgoaVy1k4nFPpNxWjKR5ea9HZXoadQlIYRA0
         C0i81bY7WLf4EdJ4Jj55vDHkXzul4oQaamI5kiHqXnuBFPfBycEG6x1AjntzfXfITRS0
         4XZxi37nPSK+8Vka2iixz9nzZ+FGQPbXF8lj4kcEoJN5A1naxcaIfCgv0zPUJwwDP8WA
         HQr1D9DM/CO8PnxPNy3RlsgJO1zPZt8JgBMr9J8jYio9kP5IXB3MFOoijj7xTlGBypuk
         1RIyF42vR+qmIcdLXsCYqqH2STLA7U71uzf+pFgiVjSDB73uBERgoV3pUWwTPLryBMq/
         syDg==
X-Forwarded-Encrypted: i=1; AL+hErGjM6YbJF5F7peLtD+rcFfKLCg/7MyoAHIIj6K53eK7cU45dF81c9OxIP3lm2nCrOjMCLp9CJw7CX+DwuAUjnHC@lists.infradead.org
X-Gm-Message-State: APuU4Z9QIue38EXrqfC23xUgDVdCdL0KRB2B81pvfpUxD+qKOfEPSjMJ
	TpTvMPiU1TfZh/MT4HBwe1zW0hHiiCkhLmHX3oWcsi7FMG43J89+eyiu
X-Gm-Gg: AZFdTZeM7orPzfbY6XRLCAnaxcZzQzud0eBYV8IexSWLQIkW4qwEs+Rcd4GwjBGTv/u
	nwuWQGXgNdOhloePwq7plRCjMi32AcXmmQplCYZf3O2LjqDW9dYljw4+koZUmO/eOleW+Noo1UZ
	9kuH8O+n8e9wR3uiUfniytl7cObax6YtAFOmLpXQ8po9c73Pt7Z9lg0sEJnX3zLIYuFBeJGoHS9
	Z916UxwAefa0UwRhAA/FU/635Oc3IVy39QFiXRyAAzQCKyRL1vTj2yNEAfQJ9/O/YlJOGjnAy+/
	9NCTC05tGPVHbPmFauWO8gJncsYfu+Btx71ULsphxY1VYyr5MoImljtS43OAexfGvDITgmH6Ltp
	aZ9QhSyXQCnI2H1OzN/l4LuwzmfdYydCGpSpIFp/gdBE8oikDUPAXtDgAk4dfUre3wlK0fcL6pN
	8hIMKjtYFlWS65KVJLP0ylyKiamRuUU0GkcPs+EpsjLlneK4brRtsyb6yM1R9BXaQotAZGAQR0c
	cGxOAvsVCBosxfonu6lEzShbqGBDNhfqzfbV30BrGqoSOUEH3ijkoFRy4ZU0XlGKqk0H8tn9r1R
	7HNg/4fbE1IJMkZRbR+4KotpmyAkH3SniM4+HGHIakBFD0527VsZXJEoCXVCga46Q38t5Emgt7G
	gCd0yoQkuXtQrW1reHuKIrwNt5Sb0
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr5532315eec.11.1795875335508;
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 4/6] dt-bindings: arm: mediatek: Add Google Tarkin
Date: Sat, 28 Nov 2026 19:44:28 +0530
Message-ID: <20261128141443.13065-5-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061536_441301_A9A76304 
X-CRM114-Status: GOOD (  10.36  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tarkin is a MT8189 based Chromebook from the Skywalker platform, sold by
ASUS as the CM1405 and CM1406.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5a4779d9b..700dc4293 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -390,6 +390,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - description: Google Tarkin (ASUS Chromebook CM1405, CM1406)
+        items:
+          - const: google,tarkin
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.46.0


