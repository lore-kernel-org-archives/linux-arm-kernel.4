Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC71606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sOC0LvcC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3TuCmyq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lej6RTvtrpI2hEP/db8Qbcau2rotxEBHFNsfNijRJu8=; b=sOC0LvcC7/MEgcq1PWeM1b6wsp
	9RGxTCjQ27fYlhB+QBk7gDkFzO4WDyFlRsL0hTlSAutiAVpYx5t29l9Sd1K0QV7sU/Bh1DXQTSd0L
	HZULZpOjhmqoHKm9xaNcpq38qtgWhH3kQzMCy1jqcljdXmiMwR3QLkuJpk/w51xFkM4uvKs3PrBnm
	S5MVnefuceH8/EAKCnvFDF0P7wuEnz7seqVRsrYaUIySkgy+BfDO7SiUDC5Ts9XkgaYro/W2wZwqn
	F3Yw0GZEh9oCu9eNd/kGPmjyBbMxvZpzrzH3/7cctxjfwU4/d6ClBo4zdNfXqlvfGG7CdLbSLz7k3
	zBjFr8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVajg-00000004rFs-3NPA;
	Mon, 23 Nov 2026 20:34:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaif-00000004qev-3PKP;
	Mon, 23 Nov 2026 20:33:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0067C624B9;
	Mon, 23 Nov 2026 20:32:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465976;
	b=rZ+uTr+orARP/Vcb2rVjKEsCV4/tylX0sYou8d8WmpJka1WFhlYhOsKA4NTApHuImCX3
	 EmD2qli6Fgx+BqosiciAn/o9APZWP4DCof9c5wZn6ucNvV45yuZsmudpHXvCOSfbh3lSf
	 h0rJzRFxInIJGGO3kWc7hO+KwAZF8l+A2uMtg2PExjJasvt453G/ESvEAoqejLvp7uYyR
	 Kz7zjl6bE/L6FUQj3gkhmvNi00epoQ3LrlFGZ6xOCWEox1U+vrOezitK3MXs2RK7cDTXa
	 vYZ/qyAVz/JUS/QEsL5vPxkz8HsFRzp3KK6XhtGbuDgUM/6jqgNJcR/K9YKNtWtuJVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465976;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Lej6RTvtrpI2hEP/db8Qbcau2rotxEBHFNsfNijRJu8=;
	b=yjtaHckWJk6LRVVoQ4h7gHVDl8ASFaWgZczE1AWjjGxIJlpd6xutZIuRtXc8mHCFAkm9
	 lf2WZhjNksFiCb/GQJAyKxFOStWwKlGC84QBErk8MkqguRzRBHCW8yQnaSvEAZTfGcKvV
	 ZomfCDZ2jYVV0V3yohKZL4ZLqcAyYlQBIE8txeT57lv+j7ng9wAArE+ghr26DCSDKeItA
	 BA/S3enpMmGj7O/gF9Mtq6zJlhWJSqbjG/pilI0J+rsxMy0ewgr+eTZReobOMhCmE0Ltb
	 B5OWk86JjCXV/symfIk9EWBpz786/PgeFf5LiMZls8Ri6tmqR8HvYsiwAVLnqGwu6pg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C5751F0093C;
	Mon, 23 Nov 2026 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465976;
	bh=Lej6RTvtrpI2hEP/db8Qbcau2rotxEBHFNsfNijRJu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j3TuCmyqIDDR8NGD5LuQq5sXRj6fH32sOmv8uCX+++9Fem+v9yg6pXxafl552aMco
	 fdfgPP9C+1FFxsAqzZ7Heuac1Qm+3+2PWTnFhLgBMQvfZXy1n5TMgKdFL6uCrk02j3
	 nPSH4SioRgMHqPsxOBk394Tu+01/OL7DCeP+jXbjWoEdzcPGAl3PN2yIwvL6dy/OS4
	 bMSzNCbWSVREEXjj/UcerYGGoY95hSWPUXLpDx+e8vKaqvbHFoTPtnhA7yBIGWYMpS
	 68dXjwStQsrN6b0B3natzvKxyfwih6/oA1MpsrHgSRx6orNSf1dFh62s+yTHtaHVK/
	 p9YHKOe32HZag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 34DAC4C71A;
	Mon, 23 Nov 2026 20:32:18 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:32:22 +0300
Subject: [PATCH v2 8/8] MAINTAINERS: Add CS7542 PCIe support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v2-8-f589a9cd0bef@gmail.com>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Krzysztof Wilczynski <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465935; l=1356;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=jDKZmt7guwHzNgRKzZtW9q1sZuhebiJ5PQkmWsr+DNk=;
 b=COAIM9n7CTGeI8/L4LkcbqnsEldMGtaqCfIl/GPNmucZysECPadrp5Gs0ZzEUCWCmxfqt0Ccb
 lEinjDjWYRmCm41Fm5Fkw5271BcAEUcjoMXeS16jSw1BCeT47F5tcqn
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Cover the new PCIe control, SerDes and host drivers and their bindings
under the existing CS7542 entry.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..511a6cb34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,15 +2949,20 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
-ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL
+ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL AND PCIE
 M:	Fil Dunsky <filipp.dunsky@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/pci/cortina,cs7542-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/cortina,cs7542-pcie-phy.yaml
 F:	Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
 F:	Documentation/devicetree/bindings/soc/cortina/
 F:	drivers/clk/clk-cs7542.c
+F:	drivers/pci/controller/dwc/pcie-cs7542.c
+F:	drivers/phy/phy-cs7542-pcie.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+F:	include/dt-bindings/reset/cortina,cs7542-reset.h
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>

-- 
2.53.0



