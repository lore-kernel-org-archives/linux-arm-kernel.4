Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB034606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O57AL84e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OzoF8NC6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=; b=O57AL84e++IOc2Ct9vgqJaZmfR
	Tj3jXEIXIP6xwJDpdH88mQIDjKZHbYmWDDvgtQqMr4GGwJC5qizaPmOINv3P7tJNg49kNba6vCDty
	PseK6NGui6RV8nRogVwkOzmhUruCG9V7mDkaoFXO65WbWV+BkoEbWRPlBMQskKgnu1wdhpP3i20UE
	qIRnQvjXSBjEJtoXUEwDYlsf40s+rYr0ArJ7UA5X7/BRnDp+ybN3mOG6VpNP2H9ZWsqvifVc0MSyR
	Erff7PxOXfVShKRJec9KHa6OV4yTgZfM7MiPfoV1TOKD0LSB5sjtSKIWWUrgSG8nTvHqxJveGJwYq
	uylAl/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKT-00000004dgz-34IE;
	Tue, 17 Nov 2026 06:06:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKQ-00000004dga-2VMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:06:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1936604b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895561; x=1795500361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=OzoF8NC6sEyg2f5fPV8QCiXA4JCjYfUVZEtSicNqpdv3AnxP2AwwD/UiylrpodIlYw
         qK84RCx36z/PViJ++0LKhSEVTyLjc8xnBx3DBc/Pn+vMZxCJ5uPD2YFWb4wFupviFNA8
         /NfZTV8D6V7vXd8y471eLvHikpKQa5gJCEpHxNrgtAKRw1tp5aPj8LZUuz7zMEfOMKwP
         RztgsQZqPAjUirzit22EgCv6m+2qvvtIvgDq99Tuy0G0loW3Wto4JPrPdbp7xqJY4WTD
         HZHHVqBrqOMr/ROly5RfKtNZZ80oZ1ZldqDTpST1wUgjS5E6FqT8SQwPntqFxoek3eTv
         IGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895561; x=1795500361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=EINpNeOcfymc2R0pGZlZLewfCo0llyA5IJxdbulaBpUM3FtmT9wYHb+x6IJ2WJSAv4
         HdecLcXvJIQOUTB+2qrKqgTwSU76fTW+UTe7EugSWWwI2Rwg0Um8nBoVl5bCmtSxt2L7
         RhXJhUK1TFDvI0Lu98pGJDa/T/dL8njvzozcZuYV0QnOZhlvAfp9t79j4lQyYRafOZyd
         jfxhfpwhHGGzCpEUePcRnHs3KyTSyBEN5YtULwsMmFmegQQtNBo/p6dKusXRAM22hcQV
         j4UUgMmomDpy9P5T/osZHeZfcUT2SkdGpQoLNHaq3VCpE3bG34OiW+JcOuDwgm2MZk2C
         H4Vw==
X-Forwarded-Encrypted: i=1; AL+hErGT8uUG94Lq5qI52KyIrvOiyGBzqn6jNkHZP6kvj8ru9aIK3JXyHCpZ3B738+G0H/7ZekGuawlJwIpt/dmhz+pg@lists.infradead.org
X-Gm-Message-State: APuU4Z8hwJHlYOQeXfmAGB8S90m4/FzvNqnHU1BGvvjUucnxdq6EsBGY
	Yc9f71Bi1lEOfQe9tIxRHLpFdjapdWATL9ZD9jAvKJ7GZa8YPrf4IY6J
X-Gm-Gg: AYBFou1rZD1UDkqruq2YRmjNV3XVc4G+7kHKbQ0vCktYOmsicn94Q3X3M2urXa6/gbY
	9ouE9ADbVbi0dbf4bMBGhxQJYRpMNVKRJ3IdNzVANLbXJ2A7Jgu13iEyYrF+ePmtm0PSP6/+pa+
	8ia72/3xJ+t2cnDTLlbZSXbc3T0nekU6sCgWWFLv5YITC4Z533bI2WwVVaxMEK620zOb0Zkcumo
	Q0Sc3b9lX5fwOpk/im/Oy3DMStn2mEZKGdqdkbpIDoY+B4HgmZuwUVVfT3IVUxf1b5BX20qQedA
	BYTbXxbARVup14+qZ/QsZRGAhlt+atcDeuTGIiECKePGwjBxR/KC591UkDogSrZPtqN8pztXxPJ
	s45+79PBM6AKbcUZ2XnSwl/KUOi4CuNCr21gm4F6lPjQbfz5oi9o/wwtPJq2yIE6esROqWrp1A7
	Y48Kz4ZvEGzIIDxCjImu3cASfvmf5DD9YPJSN3QAOVR8gyKwqd2LP7IqPhIXyjK/bttfGeShGcf
	u8bAnBLzLDQK+wntTZqucW24rrbyVtnc2ee3hLVcTC2H1jp0Z3vIWPiBYt20S5kpgoVnxKnNUUy
	3cnqBQ7DUPlCzC3uJVfFNTNGtcv++aWPbsxzUF6fM2Zog2FtWc/Jp7GZn7at8WCYu3dmnWcNbfB
	ClDWCgHKQVnAp
X-Received: by 2002:a05:6a00:94dc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8beb2e7e862mr11025811b3a.4.1794895561290;
        Mon, 16 Nov 2026 22:06:01 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:00 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 0/4] Add Nuvoton MA35D1 thermal sensor support
Date: Tue, 17 Nov 2026 14:04:57 +0800
Message-Id: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220602_640220_CB0ED50F 
X-CRM114-Status: GOOD (  12.65  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the on-chip temperature sensor of the
Nuvoton MA35D1 SoC.

The sensor has no register region of its own; it is controlled through
a single register in the system management (SYS) block, which is
already described in DT and bound to the MA35D1 reset driver. Rather
than adding a child node that would only exist to instantiate a driver,
the SYS node is made the thermal sensor provider, and the reset driver
creates an auxiliary device that the thermal driver binds to.

Patch 1 documents #thermal-sensor-cells for the SYS node, patch 2 makes
the reset driver create the auxiliary device, patch 3 adds the thermal
driver and patch 4 adds the thermal zone to the SoC dtsi.

Tested on the MA35D1-SOM board.

Zi-Yu Chen (4):
  dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
  reset: ma35d1: Register auxiliary device for the temperature sensor
  thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal sensor driver
  arm64: dts: nuvoton: ma35d1: Add thermal zone

 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |  13 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  16 ++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-ma35d1.c                  |  11 +-
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/ma35d1_thermal.c              | 149 ++++++++++++++++++
 7 files changed, 198 insertions(+), 4 deletions(-)
 create mode 100644 drivers/thermal/ma35d1_thermal.c

-- 
2.34.1


