Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CD60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zm7JM/Pw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vOdQnly/qrJT0djSoitDrJq3o052nNL1pkh6L3B0ilY=; b=zm7JM/PwstMZVHmKd35U42EoP6
	L3TfHxveZJeC/cuJPd/QJHUHLtyjDQ+VZcebdgJM+r8x69t9dWhQ1Xw9x94UmUVj55FCq9XtZvsls
	4sFXmyksij8o6lFe4YWfFeA28opMC6wKtrXq04O9unZxcNr8t/HKy8Dy7qb3vdKGHyH1r69Sd1bVR
	2U6A0aIwXd4NCyk926oPVneWDB4pyZUnhBiJ1s/cDUf/J2lsj3BHUtWnzSg9Mk5YzwO4aUdr77+RI
	raKKFjLp3QzMR+VC9mETU2js+fpvubM7hQxEuVodFFybuCuaGuPZy1b+nptAtQSl8Tj2lvCbrlTG/
	BuVA9n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJfm-0000000EIP8-20oq;
	Fri, 20 Nov 2026 08:08:42 +0000
Received: from [64.106.246.77] (helo=mailsc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJfj-0000000EIOJ-0fP1;
	Fri, 20 Nov 2026 08:08:40 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 00:08:31 -0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-can@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 0/3] can: amlogic: add support for Amlogic A9 CAN-FD controller
Date: Fri, 20 Nov 2026 16:08:17 +0800
Message-ID: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_000839_220556_0734342C 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zelong Dong <zelong.dong@amlogic.com>

This series adds support for the CAN-FD controller found on the
Amlogic A9 SoC family.

The controller supports classic CAN and CAN-FD. The
driver uses the generic RX offload infrastructure with hardware
timestamps, reports bus errors through the CAN berr counter, and
implements suspend/resume support.

Zelong Dong (3):
  dt-bindings: net: can: add Amlogic A9 CAN controller
  can: amlogic: add driver for Amlogic A9 CAN-FD controller
  arm64: dts: amlogic: a9: add CAN controller node

 .../bindings/net/can/amlogic,a9-can.yaml      |  65 ++
 .../dts/amlogic/amlogic-a9-a311y3-by401.dts   |   7 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi   |  25 +
 drivers/net/can/Kconfig                       |   1 +
 drivers/net/can/Makefile                      |   1 +
 drivers/net/can/amlogic/Kconfig               |   9 +
 drivers/net/can/amlogic/Makefile              |   3 +
 drivers/net/can/amlogic/amlogic_can.c         | 864 ++++++++++++++++++
 drivers/net/can/amlogic/amlogic_can.h         | 367 ++++++++
 9 files changed, 1342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/amlogic,a9-can.yaml
 create mode 100644 drivers/net/can/amlogic/Kconfig
 create mode 100644 drivers/net/can/amlogic/Makefile
 create mode 100644 drivers/net/can/amlogic/amlogic_can.c
 create mode 100644 drivers/net/can/amlogic/amlogic_can.h

-- 
2.47.1


