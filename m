Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNeZmZy9;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=esKxWh/R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ycEyutGcaWfcePGSp4ZtX4tMaGwRNsUIujtKh0Ebzro=; b=BNeZmZy9JdzrrH
	1K2KNKazoYkxbTnKp7wtgDwgiVx5hp/eopMcTGdQIK9zUJLxkPxSvTI258VO+RSs88HiFQQmVbxO9
	K6si0tz3fyE0eGMlCl3j036Et8atzgRZJw9S3eHRpYQjA96wuhCIYeDtWSNYRI3BRvsZVr5p9vXlH
	wKNyKUt6hgjrvooljlMSqPWWeBegVMkSNYB5CGssSwl13unicc2P7Py/goLAmNZfWtJOoL6YPQb3G
	QbZgE6VSwgukTGJ0vxfIQF8vvUnHIYLEjAy+2TGOA44ERZQQGxLBRXWf0s4se22s2Ca8vOjKg5SY6
	dbIlWsdf52sqoXyEq7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53w-0000000GKF0-1Em6;
	Sun, 08 Nov 2026 15:44:08 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53n-0000000GKB8-0aQr;
	Sun, 08 Nov 2026 15:44:02 +0000
Received: by chaosmail.tech (Postfix) id EB8F21C9627;
	Sun, 08 Nov 2026 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycEyutGcaWfcePGSp4ZtX4tMaGwRNsUIujtKh0Ebzro=;
	b=esKxWh/RjDnLdnybeQnG/Rv/Qm5Xp5goh7EdtUxM2acV6zOmUMB4cP7X6MCij6lRHb2JoF
	3U/v7p7pepWPrDo/0Vh7jDpDqmVDmn7XjEwswBV1mC8ksNYOQSJ25ZmXt2KWjfarKe+Guc
	ajVX2vjBGWRpk6L11ijEXy3RmZV0uwU=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 08 Nov 2026 16:43:40 +0100
Subject: [PATCH 1/4] dt-bindings: phy: atcphy: Add M3 series
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
In-Reply-To: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=914;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=xy+67myrKs8eDZ3F6qs76EUq8jlUQ6nObH44AZwgygU=;
 b=iX7l+i4N3FEm9UwNLLNKh9eSen0Cp8IOOR93mjic1Kw1F46PRlK54oC0q6IWqlcfTFIHnv7DQ
 ffwyi5Yn7+JBq1Wa2fzsyy9YmzFoXAr+sTio9iva+y+gTZQxIWQf+EA
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_074359_646404_6998BCBF 
X-CRM114-Status: UNSURE (   6.12  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

M3 series SoCs have new phys that are different enough to need
a new compatible

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
index 0acac7e3ee67..39461c5dcf20 100644
--- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
@@ -55,6 +55,12 @@ properties:
               - apple,t8112-atcphy
           - const: apple,t8103-atcphy
       - const: apple,t8103-atcphy
+      - const: apple,t8122-atcphy
+      - items:
+          - enum:
+              - apple,t6030-atcphy
+              - apple,t6031-atcphy
+          - const: apple,t8122-atcphy
 
   reg:
     items:

-- 
2.56.0


