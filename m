Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20FC606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAoXZVS1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QivLnBNh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xA1P8zsvk6kqc3xIgg8qAOvV3prxwK2TGoWpI0Dqwlc=; b=gAoXZVS1P3OiqWfrchrA069LA3
	QX/Z7K8wResJwD7XO+i7pQrK+tMXYYCY1EQ2tLvNPkFeQ0j2gQhraM9nIHSmxQBPQatPul9rgqAaA
	NG1FD685y+M2GB4sP958VMe7GnEt+ltdAzLFESCSwssw1jD5liLHO6RiiPhJP1WZsRryePJdFk0j4
	cQAcBfZyPow+kWxIj3uwlCtZ02ZP5h74hLUTBf3EcKGObTq12DjYcn1sU/RJKWcCuaUDS4AjXQx5W
	/RUM1NYsLX0BT1oh8LWjQmaVQ+gbavgyKCRdQ3IF0gcFjrIttFgGzErh3Ut/5c8aLpZsLxhX879tm
	Jm8jx+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsx-0000000Gn2k-1xI2;
	Fri, 27 Nov 2026 15:29:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsQ-0000000Gmbv-13zt;
	Fri, 27 Nov 2026 15:28:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80D5761F33;
	Fri, 27 Nov 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795793320;
	b=x1u+HvkTRV7pQCn30ijeNDVOFwx/s2Ab8mjhU4cgpS/XX3mcdbLeBWY4n0EnRp4sECa7
	 4Xq2vQKSkysgOy4AcRRBldFLv6F+q7ZFKucj4FtI05UpOycjpEirGCQLN22ncjQ5XKjc5
	 dR7CMG0kSo+GILH+KsMsk/htqWbh8RZ/XUw1wFMmCpe9PS1R6qIFR2opv2z8WzfuJa/zd
	 gTkLIlA1bgN78i2lI+xf4XZgpTXX23CisAiITgslkBrQNJDM9a85pzoli2MO+pKgnsePV
	 tOKUSai+PlIki5uyqgdxx8Ymwskl5a+OFiCfcvKh+U1GvMOZ7WcmYt9F2csq+OjHFSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793320;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xA1P8zsvk6kqc3xIgg8qAOvV3prxwK2TGoWpI0Dqwlc=;
	b=Teq/g81JdKHqlRG6dl2lojZZPLoWLayewrt7cmb9f5U14Xyx9uekxcth/FQ7cCIFvGsg
	 +pIgvExQjuX//zNbujQ/EHqCsEbn+RES73Lh9PD/3YyplqSgtSjEBadL/MXQhKom+XXA2
	 Q8vQQF0ZcSF77AlJGzTW97t8ffwMkayAJz2XOw3F+yLpPaJ9IudQzJBtz1ZrvjJhR3svM
	 P+P9jVt8jeuvavbzNszWT1q8hYrnmMh7eqNxoix2IkCeRiJ4RCuyoYvlHUqswiPbweYIZ
	 vlCQEKMMPvYvrGjUt3QisKGV/W5KrsByPMx/h9/VYdBBPZsSuekvYA6ljYkZMzNsHnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82DDE1F00925;
	Fri, 27 Nov 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793320;
	bh=xA1P8zsvk6kqc3xIgg8qAOvV3prxwK2TGoWpI0Dqwlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QivLnBNhiMzxXUOjG6eFswtuFOujFnSgfQkFwxVt9a6PQLKzQmQ9SXceWkuUoLw0w
	 oPyaMwjPHHcUpfgTC+cQJXpbDIeDRwFDZWXAk9X7xP4FLAU0LsRboBSCyhRIX++JCh
	 Ynj7QqHubMlu2YG2E3dCvTGUAt6RTmMdcBngL5uf8DVDVPyengY1k/mkbjPTjaBvBw
	 gbKwnfa3cIv9DJfI4oDAz+Okpt3HvoCa6BpSH25wSdYHXBoWXvFKwMeBvJu32zc0zx
	 XRzScMqzKTk/1VNPQc9sZHEGlaHLIyfFkLwFWzsrra2TOjk1TKUkg08j/r0c8w6vsF
	 58gSQuCH7OYZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B4164DC74;
	Fri, 27 Nov 2026 15:28:29 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 27 Nov 2026 16:27:03 +0100
Subject: [PATCH v5 02/12] dt-bindings: phy: amlogic: document the Amlogic
 Meson HDMI TX PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-meson-drm-create-hdmitx-phy-v5-2-88c43eb95468@aliel.fr>
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=OW3BQ47jww+fAV5FJlCwW3Kume/yYrBTmUUehPnw4ZU=;
 b=kA0DAAoWKo0VA3vnMSIByyZiAGsJoYqgdP4ixlMGt68w/7JHX+T6LwogY1XiH3s65K6JsY/GI
 oh1BAAWCgAdFiEEj505yO7Txcz1vCdkKo0VA3vnMSIFAmsJoYoACgkQKo0VA3vnMSIokQEA4ji/
 hyimu+igPEf+nD7CqtTuNAQP7T9dmBXw+lLANQsBAP7RkKIZXfk9Di//hBJ0iiNTSCITYiAFo4k
 LME2uoQAI
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add a YAML binding for the HDMI TX PHY found on Amlogic Meson SoCs.
It covers the GXBB, GXL and G12A variants, which are described by
their own compatible strings:

  - amlogic,meson-gxbb-hdmi-tx-phy
  - amlogic,meson-gxl-hdmi-tx-phy
  - amlogic,meson-g12a-hdmi-tx-phy

The PHY is a child of the HHI system controller.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-hdmi-tx-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-hdmi-tx-phy.yaml
new file mode 100644
index 000000000000..c5dd1036c375
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-hdmi-tx-phy.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/amlogic,meson-hdmi-tx-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic HDMI TX PHY
+
+maintainers:
+  - Ronald Claveau <linux-kernel-dev@aliel.fr>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-hdmi-tx-phy
+      - amlogic,meson-gxl-hdmi-tx-phy
+      - amlogic,meson-g12a-hdmi-tx-phy
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi-phy {
+        compatible = "amlogic,meson-gxbb-hdmi-tx-phy";
+        #phy-cells = <0>;
+    };

-- 
2.56.1



