Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E27606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPuoA4oX;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=RUvIYAeT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xqK7f3+IigicNuFshjKnlC9DMmy7rusRWxVM3uANEYU=; b=QPuoA4oXOhJ3EUasW3AJYLvi8d
	1yf+oCj1uaVeXXtXTs/3NdbSl0wrst72kz4CtDynxt/u+wNrP0in5oTRspnP1tzhqyh8xk28I5R17
	pSLPJTKfC426mNX3PAWG0Bhx001hOqtz7ISgUlZnnkEPZ8I/DzDGZQA8kcl4rgDAQhKZil3DVYx/4
	qOKC3vTz/+RYK16dmTcJPlRNa72VETXf1FlIXD/r6kjmIY9h3XiyXhtZ7AuAAKG86BZLrCDqBu7Jb
	Fyid639jE2sMtBcYpjN4xnhQgyWyfISQCb75N6At0kgT2RSMduMME0wTgVaCMWQpmFLLujnTAPWh7
	K2QoWMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkog-0000000HFHU-0DEp;
	Sat, 21 Nov 2026 13:07:42 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkoV-0000000HFC3-2Iy3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:07:33 +0000
Received: by chaosmail.tech (Postfix) id 1D5F21C8555;
	Sat, 21 Nov 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795266444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xqK7f3+IigicNuFshjKnlC9DMmy7rusRWxVM3uANEYU=;
	b=RUvIYAeT25KYkCrztMpR4VSMmDKPBGTFYDTMuQMIMcWFd1zbLi2PseEFIWEX6j89IXk3c4
	5H5rHm064XKP0qI6FjE5tBvvfmgrbHy0wEz+4VsSfZjaRT33QBPpnDa25Q6ed6RtIXajgt
	vYbmDbWln3RkomneTgqUqcx4BuuVBKY=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v9 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 21 Nov 2026 14:07:19 +0100
Message-Id: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23PzU7DMAwH8FeZciYotvPR7MR7IA5p6rAgWKe2V
 KBp7046JJaJHC3797d9FjNPmWex353FxGue83gshX/YiXgIx1eWeSi1QIVWOTRyyadBhsgklVd
 9Mk5xMl6U+dPEKX9ds55ffuv5s3/juGwB28Qhz8s4fV+XrbDNtXJXkEo6Kp2BLFAXnsol4/wR8
 vvjwvEgtvAVa+5qjoUDaeON6wdLpsnpxjsFNS+PyY4IE3IMOsUm1zW3Ndfb8b4zpgejPOgmNxX
 Hu+2mcEKteaB+iJSa3Nb8brstnD34RD54Ctjk7sY9qJq7wm203DOCp9Tm3R8HUFTzbvvdqaRRI
 zhD//jlcvkBOqDD/nICAAA=
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266444; l=2831;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=LTZ69I9arCbO6avvu9EgzDAj2AgFYbnOZK4kFi9TXMQ=;
 b=kJjAbtLQ5nvVl7yZEO+1ZXKCcQN5URUBWfZNmLaHXedwDE1+wnG3GZR4zQA+d75sv4PGj0uco
 qW7HPA9oPe/Dwjf+DOPD92kolM6gkqLi5RvNZAyBIurXXKX+As/XcHW
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050732_079601_7ED05292 
X-CRM114-Status: GOOD (  11.90  )
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v9:
- Add the new no_mode_control = true
- Improve some error handling
- Link to v8: https://patch.msgid.link/20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech

Changes in v8:
- Rebase on latest
- Link to v7: https://patch.msgid.link/20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech

Changes in v7:
- Rebase on usb-testing
- Link to v6: https://patch.msgid.link/20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech

Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 .../devicetree/bindings/usb/apple,sn201202x.yaml   |  78 ++++++
 MAINTAINERS                                        |   2 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/tipd/Kconfig                     |  21 +-
 drivers/usb/typec/tipd/Makefile                    |  14 +-
 drivers/usb/typec/tipd/core.c                      | 248 ++++-------------
 drivers/usb/typec/tipd/i2c.c                       | 107 ++++++++
 drivers/usb/typec/tipd/spmi.c                      | 303 +++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                  | 132 +++++++++
 9 files changed, 710 insertions(+), 196 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


