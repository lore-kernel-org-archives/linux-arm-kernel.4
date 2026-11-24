Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g2dy3uPf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlZC6mrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=; b=g2dy3uPfdjseTDT39IsJ4A8Bks
	xV69SYrbl9LnTwO8X1YCh49dvuHBign1uLeFSC7g+ggB1JNUVFqPHkjnlI0Dlcs66r2bBYDTDM9ZS
	o2cXYKbx889fLnMSmUsWMfXUb8lH6g+Xu/vELG0tfdoMs96f1UBTTYOH8kgXbaiCnrFDVkcxlbxoJ
	7z0C7AzQTHR5beRDJoij62JaEKdMDxSfM7aTCMhHWM0zUNztCWmdPFiyN41zZkx74aboNR2ifKNVL
	OtSe7eHA9ruQMfj43lEjPuVXd4j6bdCskvsqeTSOzpK63JHJ5rD4C2AOd1KHnRqprVOa8U42AG4a3
	/Vpdtk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEd-0000000813E-2icT;
	Tue, 24 Nov 2026 22:43:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEY-0000000810Z-0eeU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:43:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a358881793so2630881f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560208; x=1796165008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=TlZC6mrbqg/tVn4m5wv11Emhf4GCKG6OTwguyqZXK/te2fnsMR7tzwJPS6DE644AG2
         p1GodhiKC8aeY4BXrPG+8vAKxhWNO7YJ3iASWxLibIFEdfMvdTwQsTIunxqACzXaL/nz
         93tPUtmnZAX9i8RsxOiVkqDhYwyEtL4gBX+Ee6UDYLoNZfkXuJBZV1OloQq50ngZa+2r
         8lQw8/BI35FjaWC7zgkjdxTlrfjeopOUb/+5NyIK8DGYJ2J0btnhWG04aV/VQCndOK9L
         P3wJVSDAyPwLgOr8al13HFnQR/HbcWB5cCUY4JYMYPV/9kvCKmss2ySqFRmWNJIfGJCv
         5wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560208; x=1796165008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=yQIcBR9WeEmnZnaxGamjzm8trjNurE6x68cGnxaG2ihekxewjk6yMOZ0VtAwvCD40b
         PmynMNKEpu5NkoKsBpv9sKRH5jy+3SCHGp2S9bBn8lh0OABWR5hqe8NXcbgfMXMyM/zf
         UNul+tQWOkCQYJVUJomwCDW4u+5hn64EYlSbUqQeBR661GC5ry7cda9zAmkfcXYunEmR
         OV9UFGkpIdK/h/fdibDLuZ42ptS64K1nY1CUDv7Vfv8tG7NyxMiDzHdqZYENqRQyGeu7
         iUi2OC5xCFxllL9MXk0sUVpGF6vJwahnl/Gx6i1MzPa4/WlcI89OgxzAOcUEpAJFqKLm
         na5w==
X-Forwarded-Encrypted: i=1; AL+hErEbfSw0tjiKuYHAPjsP2gC5CF0uSTHkBtOlaEeQ92gFZF/3wFrybCPGbS8lwrpLedbGedi/mimF8wf64vaA161i@lists.infradead.org
X-Gm-Message-State: APuU4Z+7kcuUIi/88uL32n3spE0VEG1Q633b68bpgccUi/YrLYT0ERFF
	Hy+bOyWzBqkfEBNbeifd83qIP5WRMeANKPe0CcuXkjW/HQsBLAxDjEtT
X-Gm-Gg: AZFdTZfYJdM5AHqPkvBtbNeUK1SFWSe9j7usWF+Lfh89cHotWUNjluBQI43oQUFY6AJ
	t0YJTFmhAARsGGatvGZ7ehTCCS2v+IhcX3S7d/hCvFSrj0cLvHxoiJjE2a9J4t/9CC/1YKYLmhe
	oGyFNnooWFnx3rKmePQzL/SdjgzA4EA2dw6UjKRX3jj5fL54MFHwxn0gfddrU4xjC9Oc2fOHHF1
	GLX9JFuctKti3KeqJwvoNxrKZ1zPNjRDiYvjdZ4/BL2LcftefjpfhzgUbqJ2u8DzqyV8YfiHtOD
	r+3IYisRbnLHU+WkH6hwlUWCBzN1pvlQK/rck/DNH3M741jclIKhIADwFBnrmJvJvfhxrYO4Ve+
	sQAwRiIe+8xGuZzafTxG+iCE9s3rH6nuNeFjGibD9HkTgHR8kHizl1a6Dudgh8YRbsO5X7AVBSl
	HM0xT6XZIdPLLnycEnXVOEU17BCKKmnxwGtcDI5L0/doFElaUnWIjq2eG2xbSErypNvTkyMv1jS
	TDBssnpjGpg9MeYmIBVp4KrEHhXaDA9yQOVOvP79NogVLziDTfR0Dij+fyV64WJStl5FEvmTp5n
	E5TCG2et9ManIlcGvHthk9Fm6WkD9ijHDMQu/DQfmN8iuFIZYVMXPmHennKdku/5mLzVIOdDROw
	02pQ=
X-Received: by 2002:a05:6000:2906:b0:4a3:777a:a964 with SMTP id ffacd0b85a97d-4aba58de987mr30782702f8f.0.1795560208068;
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue, 24 Nov 2026 23:43:14 +0100
Message-ID: <20261124224318.227478-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_144330_215557_8C869CAE 
X-CRM114-Status: GOOD (  13.26  )
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v6:
- Rebase on top of phy/next
- Address suggestion by sashiko bot

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/airoha/Kconfig                    |  11 +
 drivers/phy/airoha/Makefile                   |   1 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 831 ++++++++++++++++++
 6 files changed, 1293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0


