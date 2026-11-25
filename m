Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF35606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6WAiGQ5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHuXJL5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=; b=M6WAiGQ5DgZXmBB58+t+tSy0me
	BgyljPLhBA5kJm2ba76WuLxa6m9qRMGOqKuuVo6ouGUnBf1NKGdFGzGjeKvysx4N1IPSOB/NQQg42
	IPZUqqEVo5IRkd1MHEV5ivCX7LJp3xZzLcRVHNhujrC4eTJzVNC64ujdj1qWwvshQrqbLqh2oNRLp
	pxuv231x2zNqUiEsEBZ7YcGiCE07fpT0eh2s4YoVggxLe3RyTAbCNPI3j4wbmoHpSRJW0KlIdwDYK
	NBhGG5BH+0jHlUrpZ3UCokSpZmA4B+VgukBj8pvb/as78fhE8P6zlPyG1uuP591cZezlDNUTRzTVQ
	mJyxon2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4ky-00000008Ogp-0e3y;
	Wed, 25 Nov 2026 04:37:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4kv-00000008Ofz-20Mz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3883312b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581436; x=1796186236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=;
        b=mHuXJL5VLEMgSXZY305U/QOOQJFCukS2MHlxkx0UDDghGE9Zzypwwr6mbnUTUVn4Gb
         Sd0JpxldaLAh1TCWSSJQFeiKuEbUcCCIRyEjfQNWHr2UyihnIBV8jDlvvViMNy+/S1u6
         kGmiOPJtyn+c5qKDAw9az/9EGS5/UGCbpJesFPSs3t2tdGsCIl7O+qE0Gn+KrJXUTPZR
         yyCrVtcFu/y3ANEGISt1oeRbPxSTBPv1uSfcCdvQ6ov1kAFJQwJuTf6OVr7QdCY0mK5A
         i2IUjJurvK4aa5GwJmYLMSQ9TmNTXSl/xXherxnne0eayGsHlWHezL7K02An2jeQP2mc
         SZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581436; x=1796186236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=;
        b=im4ig/gD+nN4UoV5TxcGYOc0Bqj5nrVHNjnLKwEVwG50cwYii6rPO/ctJnbmOIZEph
         T+acaPguysMbuS9MR1GPR1Al0tItnsBRa+go01NcXIROy85E9gKPYRYoCFXeNBG87pnB
         LAayOmjLsmNbyqXOAO9nwbdCxyzAPVXhOwDU2A58aGtgXiD0/Yg4J56ZS7Gzqg2JQiPt
         hdOY9wAztEV+PwloqeISygsTkm3g8TcHfY+3lVhTaN5Ph/x5SAhcamxuiZXrh4ERvshN
         /Qv9G8JQZSq8Ze+DDXh5NwqAJXoqFcH6eZFAHnXd+25TxXgJ6aMy9DJLFf3Ueczznf6Q
         bPHQ==
X-Forwarded-Encrypted: i=1; AL+hErG2mURirrVBZmp418aHpBjWDw/fdAUhqWgKCIPgUO1wvktdlArSgFsPR8wN6v80XACO4s3PO2T6Hm8g/TMiHOC2@lists.infradead.org
X-Gm-Message-State: APuU4Z9iUbTLVjpFY9EQMkh5IgJbrJrmNsUWeRwOWp4nK5GANci3k9w3
	waA/CoFcc+palni8EwQXWnqU/D+hFedLP5hYCfI0H5iu/qVNkKN9nCbN
X-Gm-Gg: AZFdTZesrF6uA0ca8D7TtvqIYLPUnaUiHUePNJVBSIerx4YU3IDVZHSvQOV2gfYkCJI
	LT4jBv0iFcpG9gVPrApQaMNnrtH7FhqNVo8KPyCESIRa0QIFjAg2p4seUoF4ntT1LwEyLIVb6Y/
	hc5qFCoZ6jzNP9gI30037tXFhbglsBBNCI6VXmQI39j3sHp2Ks8igQzn2tnJk+wiSBxuuVj9+1+
	JGJ2Kg9K0Xx1FbRroNC4uHkK1HoRVIloJi5uof3Kp5aQKHa2IcCwoJsaVvsXcJDu4/FfciZDlZh
	1vngTDFA1/Ch1X/Ni5iakTnoD20pbYuBqRajEm4UpDbRSTP/FpJWa6c5vYu70hImSehckvdy2Wb
	n3CTrdZO5o1Wo+/eRvQmDXdiuGsY8q4eBSZrTbysTrBg2aYT2g4UEatp8aHx4/0qZeiGSg3s2by
	iM37nSXtvirjfJLuh0oU9SeKLQslPZazVu2995giMEeOy4K0lRaEVGyI4vvH6ZQb+UwlObSDMYV
	xxLIXJz/+JyRVHE8xGBkBrxVjoRKSPqmiDnU86p0rNAyWmeaS524PTj+A6mfWmbxzrh9D+z7WGP
	ETmulsYyit6EJk8Zb8MNEHiELA9H
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id d2e1a72fcca58-8c87d2289f9mr13508087b3a.47.1795581436417;
        Tue, 24 Nov 2026 20:37:16 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm8178515b3a.39.2026.11.24.20.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:16 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/8] phy: core: Add phy bulk helpers support
Date: Wed, 25 Nov 2026 12:36:31 +0800
Message-ID: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_203717_541526_3A344C9F 
X-CRM114-Status: GOOD (  20.21  )
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

As discussed in [1], some drivers may do not care the difference between
phys. Instead, they only need to treat them as a group and operate them
together. This means a bulk operation is needed.

Add some bulk helper functions for phy core by referencing the design of
clock/reset subsystem. This can relieve the driver owners' life who needs
to handle many phys, as well as each phy error reporting.

The example consumer driver is at [2], with the following function used:
- phy_bulk_init
- phy_bulk_exit
- phy_bulk_power_on
- phy_bulk_power_off
- devm_of_phy_bulk_get_all
The devm_phy_bulk_get_all() is also added as a simple wrapper of
devm_of_phy_bulk_get_all().

This patch set also includes another two porting for cadence PCIe driver,
and the the IMX SATA driver, as I have the document of these two device
so I can verify the PHY timing requirement.

Note:
1. The patch still uses -EOPNOTSUPP for dummy blob. Instead, I send
   a new patch [3] for fixing the left function.
2. libahci_platform.c is not ported, as its getter require additional
   check on the DT so it can no be handled by a simple bulk get.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
[2] https://lore.kernel.org/linux-pci/20261125041523.242588-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260929084739.467082-1-inochiama@gmail.com/

Changed from v4:
- https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
1. rebased to v7.4-rc1
2. Apply Andy's tag to patch 1, 2.
patch 3:
1. Add this patch as Andy's request for simpler bulk api handling.
patch 4:
1. Add reversed recovery operation in phy bulk operator APIs like the
   reset subsystem.
2. Use int instead unsigned int to simplifiy the error check.
3. Fix wrong error handling in phy_bulk_get()
4. Fix document of the existed bulk API.
patch 5:
1. Remove unnecessary num_phys and device node check in the bulk getter
   API. Now it expects user will give a valid input.
2. Add devm_phy_bulk_get() and related helper function
3. Add devm_phy_bulk_put_all() for future porting
4. Make all dummy handler follows the same semantics in other subsystem.
patch 6:
1. Add missing doc of the all function
patch 7,8:
1. Add these two patches as an example for phy bulk API.

Changed from v3:
- https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
patch 5:
1. Fix spell error in the document.

Changed from v2:
- https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
patch 1:
1. Add Andy's tag
2. Update comment for phy_add_device_link
patch 2:
1. Add Andy's tag
2. Update comment for changed function
patch 3:
1. Remove all unused function and make the dependency as static things.
2. Update comments for struct phy_bulk_data and left functions
patch 4:
1. Remove all unused function and make the dependency as static things.
patch 5:
1. Add phy document for these newly added apis.

Changed from v1:
- https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
patch 1:
1. Update document.
patch 2:
1. Fix document format.
2. Fix several document description.
patch 3:
1. Split into two patches: one for non devm helpers, one for devm helpers.
2. All the bulk helper now use unsigned int for counts.
3. Fix multiple the while loop statement.
4. Rename of_phy_get_parent_count() to of_phy_get_count().
5. Fix some 80 line function problems.
6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
7. Fix zero value in the document
8. Use two separate release function for devm helpers.

Inochi Amaoto (8):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Make phy_put() ignore NULL and error pointers
  phy: core: Add phy bulk data helper functions
  phy: core: Add managed phy bulk data helper functions
  doc: phy: Document some bulk helper functions
  PCI: cadence: Use phy bulk data api to simplifiy the logic
  ata: ahci_imx: Use bulk PHY APIs for calibration PHYs

 Documentation/driver-api/phy/phy.rst          |  40 ++
 drivers/ata/ahci_imx.c                        |  57 +-
 drivers/pci/controller/cadence/pcie-cadence.c |  62 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   2 +-
 drivers/phy/phy-core.c                        | 546 ++++++++++++++++--
 include/linux/phy/phy.h                       |  69 +++
 6 files changed, 648 insertions(+), 128 deletions(-)

--
2.56.1


