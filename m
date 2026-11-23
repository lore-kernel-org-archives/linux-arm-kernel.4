Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F879606A682
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zh5zA4qg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDPs4Ra4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+o+JlwNGILg9TS+MqHvdFg2BeF8SIkQObMLxudXZheY=; b=zh5zA4qgm35XgPr5YWiw3LiqJA
	5x2GtGD3dnyUr3YIaDb+tKyGYbxqpKqVkuuEHVYHg+ll6X1NAuxUe8t75FndU8GFv3vFOHJJsjolE
	3bnrf41mKftW9SDQiJXk71mtUWMRK9zZ9slebLV9S+o3RfGp+DlQjw71ctcqGOis5wz5Afs9iMz1N
	Aqqlc96f1J4n8YqlmYAJOYYGoXSwgUncVnPuIWfK71JlO48vkqRs/ULJB8JMNWr7bhanVuWNd/+q6
	twRmlSHv3qjh/SXczYB/gqfWfkdiKFCNQ6i10CFnSMCGa9kelBH2ShLFofuaiB981Rs/LZCtHTrPh
	d/4lk+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ1h-00000004YTy-1wIU;
	Mon, 23 Nov 2026 18:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ1P-00000004YDp-0762;
	Mon, 23 Nov 2026 18:44:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC22A42482;
	Mon, 23 Nov 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459450;
	b=qW9DfzQJVE38QvPlqPmBh1Jan1VcHEOitT99doJfNgP/VXSwyrpwWXnM0uA9jHNBdxwE
	 4zwYChTDr1p99ppZUfEDwnnzzVKFVejLfBMJfEGZdeYyZKQWUeq6KzCkgh+CVC1MJVMm8
	 NDB4MME/uy2Wbs8zt2sND36J2fsXAOpsSz/WVz3tOVYBJsjiX/IwmOkyh7E9ZJFnFuFlf
	 IW3fx/P62bjE3/4Gb6H72Xfk5wD0wwOxYsxJgt+rDMRLJH96vmJEKi9XETABLHXaw/Qtk
	 f8exa6Zxuwm6so6CcVgFvk9XQTSllhe0kWNVAfnLQhUaumh59NG/4dG6ZZBqidzF6xg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459450;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+o+JlwNGILg9TS+MqHvdFg2BeF8SIkQObMLxudXZheY=;
	b=mq4TxaXVmVEuNLi76kBR6jRpsM0Luw+1y891XzuBGMDfl865X0CnPFl5mg+vMoGGzprO
	 woYfHSFS9aUJnvgwv/pixZkGTrd/p2QTKS1rRKNB/F3pXasHX+xcnxADdsvSCY34hifGW
	 ouc2RqM58wCmdMUZ0E/x/PG3ZV07nSOTAFHOeGmlv65iXd8J2DCSsSiq00KFg0Xu7JzqX
	 o9hjzhTMIQnCdbSjXGy/igy7MVCSVJyndCIuCrvesPeMNBK9N8NdJ84eIfgoM7S0HTlBK
	 wlHgDb5RlJdbRkayfUxu1D29hm+lKayA4OlnRV3vmpRVkCaJpj2G8ivBUbYGnX7TQjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1CE71F00ADE;
	Mon, 23 Nov 2026 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459450;
	bh=+o+JlwNGILg9TS+MqHvdFg2BeF8SIkQObMLxudXZheY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aDPs4Ra4jTLj535EXb2q0WBdhPvEZBUS2UsIK41YMxbSE1I738ghK9D/hsZ2aG7eB
	 kDPJBqO7mdnSw0AIQHZNocISENrfYOT/DEm0mwK+ZEXsguI7swrg0hPRiyGCmIs6lL
	 Mk7x1TPK9zFvUFeVatuZTjC4liXQekSzXUcEnjCUxmSIDBB002AiPSEoJ6cvnS31yO
	 Pf3V0Hu0IEsZha6krG05xqEIO8KlT20Rq/SccbpIvUc4SBLosq2X/oBJ6xH3FSC+1F
	 icmiprHuVTmwggnYOHwvwPl8UGIziFNXTJftsv6B02sultKqTrBwHIEN95hdt4kwFm
	 raXNPFZeHs1oQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA1284C616;
	Mon, 23 Nov 2026 18:43:34 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:43:36 +0300
Subject: [PATCH 8/8] MAINTAINERS: Add CS7542 PCIe support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v1-8-4cde5201d404@gmail.com>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459409; l=1321;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QHj1rsaxQpilF2S2K/I8XJEDNkzvjAgVnMPKiPzY1VY=;
 b=tPTmBU/Q6JWbN1fb1Rw5jN7N8a2+v3+qHKavCh3GAprkTVytOkoit+bNqhXYVQ7xo4ZZbLL72
 M+Kh19wnycdA7AYEOizhL08pou1T1L4EJ4YbplBb6U1Sd4FFRe2YTrb
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
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..d4cada9f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,13 +2949,19 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
-ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL
+ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL AND PCIE
 M:	Fil Dunsky <filipp.dunsky@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/cortina,cs7542-pcie-control.yaml
+F:	Documentation/devicetree/bindings/pci/cortina,cs7542-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/cortina,cs7542-pcie-phy.yaml
 F:	Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
 F:	Documentation/devicetree/bindings/soc/cortina/
+F:	drivers/clk/clk-cs7542-pcie.c
 F:	drivers/clk/clk-cs7542.c
+F:	drivers/pci/controller/dwc/pcie-cs7542.c
+F:	drivers/phy/phy-cs7542-pcie.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
 

-- 
2.53.0



