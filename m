Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59328606A692
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fb9l21cz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSthU/s1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=; b=fb9l21cz8FH/fkU9ahmisOx5uh
	cgXPNmXUeVzPHVlNxegBRjSt/rl98DB9Zf4U2AkigBQ8tLn2a+g9OnFmMmHM3z1qxg4RmDBVRdzF2
	dBB3r4irhk6U8UQC/vocQO4hrR1VAmroctloMveFbbw0CyK4JVTisGw3DlSJhsztFjcY0Ej5Nk+WE
	2NJeqFxPGiYrmCWhYeLQFnGQEVjSYK3drMJtli/xKJCbyhsR5zIbhApN7eoEbkiX+qja8KFGLnvJp
	Ub6GvogGI6csAE0UWLePBjnVcFg9yjqMoCjhq5XrC/+GV82aGh3hC80bCIkaBzw2aUnMyTuD5V4VC
	0zz2rylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYvz-0000000GUzy-0Kzd;
	Sat, 21 Nov 2026 00:26:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYvw-0000000GUzO-11OV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b439e37813so509811a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220783; x=1795825583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=;
        b=fSthU/s1Meqg2T1Z1LO+efetKgSqURPBCp9fW0rCTcX5XI/3Krsx840E+qa0FuMu9C
         /+oeRjKDb+7+qfpoksH8W/aaqDfSh32oOafLORkbCwj6nfF2bonUcs4YSE0YDTo3Xaid
         9IdXNTTBRw5OV6mZq9yBFldK1g7pmCR9bvTiOGq2jt9r5Qm7QJsdsQEeyjxzxhiIet0l
         5h7AvgyfujEmkhlLHPXDQ3wikIBeZOvClvUi0W69H9wqTFoC11mHKinAFqi3ZknifH3V
         cMhtP28PJwseczKag7CvdL6mgnQ0SS4r6/zeMcFjPN/3C3HjD+wMTalFimSLQpnBpvty
         CLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220783; x=1795825583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=;
        b=XHBd7rGwMj2a0+A4Mg/b6S+0P7in5Fs9CTM2xfTDalFB4JyX3He+DP9qRv7RKlq4Wh
         SamF3RNyCt32um61R4qX0iOiBpPfIYe8m0TI6WnlOyR0h4UnPAhX+m/mPTC85hK/4V8x
         C5+P4mxoZRdxUHJvSOigJt6LtE93El+FSYs2bXSs0Cmt9mLRQghIIpcgHscppv50zOZI
         jMUiXPYbbHqdyCDpMKyaio4eVc2RbrU00E5i028IXw0k93lyBwg93JRW302vTA1l22GI
         PV15yNAgKo1HjJTjzrZc2WNto/Ok8TJ33qPYoCSlskVxUz9BLlRG74RaCnOgBD8+Vr5Y
         t3yQ==
X-Forwarded-Encrypted: i=1; AL+hErEaE0Q6f7yLy4PwSW0umNh2bRzfrTIlhsZRkDXgVJdUvwb65Pc451kO+gidWjJ2tdTUGRQPAA/aUYKacm3tzkuu@lists.infradead.org
X-Gm-Message-State: APuU4Z8i77uT3xwie9RuGO2+AxqJg0ty+1Ia+TnkLlz7d/IJLNHxxY8o
	b6dmzIzkbNlhGLYRHvJql7SRRWm4KY9tWxbPfhGc3KQK7aCq/QL+Lz4eFChVvQ==
X-Gm-Gg: AZFdTZd+sLwPwIBga55RuHyUmMwh/N8Z204Rh0MMpVMJ+OYqG3pdPuZC5MmAt5IiEO9
	JW5MDMiLsIwizud6uxoYZ8aDYi1rsBXIeC4ux+6mFNNITP5KN+H2nXaqFA/4v/uIvcqvKHlJnsz
	7DUFepDLWf5iCAsPwCLHYBHQ/owZ8kbzI+FEkUlWOGRyvGzJmRHSZ12tuT5+0dN+cDd/MZZdA+/
	BKXMLbDv+tCS8ywWZyd91Z8Rp10vU8ETGOz6bCeO1dyREe1IVdrWH/zWFeSceZiArL2SZOgLd9I
	GYfB2YrJWUZupogrigse8bPmuYkceUAPKxrz2FEizIP9QXubTJlemAdDQ6/sKplQEwWXb/rRb5g
	vsPEWCu68PqWTwDL2wDN3c+q/4VFOjb+KXrQ3J009dzcKLAFRhDpZ+G5IFGzFchD5wtaexOIWF3
	7aIua7V8tu+7gdoqdlnttEnflbypZIZruF30vmvBKDh6ebn85m88DiCgxhHQT7M78uKTeUaZrxM
	cSObrQ6W1uFER+yGes+Cn87cQQXwGT09NfMsamGP4q/IQ8OR73ldK46dOOueRrmD4o7Wlkycjtr
	spmu49rZ/+aWLk/RfzHx759TYqHNd1pX1qOk0kM7ut40iTZ6NyXJLdizuVn4GjmmoIG+gGhqrA/
	qPYNxWuqlf2Xusm9/Sn70sXnbRlBCac5jJ9HyQb+YLiceCDb2OYAinuTpGN/1uBy8XZkv6oh/3q
	9iC0KyY0KEIVK9HDnfR7JlRXc=
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr4244660a91.14.1795220782623;
        Fri, 20 Nov 2026 16:26:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 00/22] ARM: dts: BCM5301X: describe switches and use gmac2 as the CPU port
Date: Fri, 20 Nov 2026 16:25:40 -0800
Message-ID: <20261121002603.25254-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162624_314372_7EF00665 
X-CRM114-Status: GOOD (  18.96  )
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

This series describes the switch on fourteen more BCM5301X boards, makes
switch port 8 / gmac2 the CPU port on the single-CPU-port boards whose
MAC address can be assigned to gmac2, and disables the GMACs that a
board does not use.

Patches 1-8 describe the switch ports on the RT-AC56U, RT-AC68U, RT-N18U,
R7000, EA6300 and Phicomm K3. They also set the WAN MAC address from
nvram, so userspace doesn't have to. The EA6300 and K3 get an nvram node
for that. The port mappings come from OpenWrt.

Patches 9-19 do the same for the R6300 v2, EA6500 v2, R8500, WZR-900DHP,
WZR-1750DHP, WXR-1900DHP, Archer C5 v2 and Archer C9 v1. The R6300 v2,
EA6500 v2 and R8500 get an nvram node and use port 8 (gmac2) with the
MAC address from et0macaddr (et2macaddr on the R8500). The Buffalo and
TP-Link boards have no MAC address described, so they use port 5
(gmac0), which gets et0macaddr through the SPROM fallback.

Patch 20 is a fix: on the DIR-885L the nvram MAC address has been on
gmac0 since port 8 became its only CPU port. It moves it to gmac2.

Patch 21 moves the CPU port from port 5 (gmac0), or port 7 (gmac1) on
the RT-AC87U, to port 8 (gmac2) on the remaining single-CPU-port boards.
Port 8 is the switch's IMP port, and gmac2 is present on all Northstar
SoCs. The nvram MAC address moves to gmac2 as well, and the R6250 gets
an nvram node for it. Boards whose MAC address only comes from the SPROM
fallback (et0macaddr for gmac0) stay on port 5, since gmac2 would read
et2macaddr instead.

Patch 22 disables all GMACs in bcm-ns.dtsi and enables only the ones each
board uses. Boards with a switch node enable the GMACs behind their CPU
ports. Boards without one keep gmac0-gmac2, because nothing configures
their switch and which GMAC carries traffic depends on the bootloader.
Boards with several CPU ports (RT-AC3100, RT-AC3200, RT-AC5300,
RT-AC88U, WXR-1750DHP) keep them all.

Compile-tested only. Every patch builds, and dtbs_check output for all
BCM5301X boards is unchanged by the series.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, write patches 9-21 and parts of 22, check the board
descriptions against OpenWrt, and draft the commit messages and this
cover letter.

Changes in v3:
- R6250: set status in the existing &gmac2 node instead of adding a
  second one.
- DWL-8610AP: enable gmac2 too, like the other boards without a switch
  node.
- Link to v2: https://lore.kernel.org/linux-devicetree/20261119085452.75708-1-rosenp@gmail.com/

Changes in v2:
- Squash the per-board port 8/gmac2 conversions (AC87U, SR400AC, Luxul,
  R6250, Meraki MR26/MR32) into one patch (Florian). The DIR-885L patch
  stays separate since it carries a Fixes: tag.
- R6250: add an nvram node and take the gmac2 MAC address from
  et0macaddr, so it doesn't get a random one.
- Keep Buffalo WZR-600DHP2/WZR-1166DHP/WZR-1166DHP2 and BCM953012ER on
  port 5/gmac0: they have no MAC address in DT and would get a random
  one from the empty et2macaddr SPROM fallback.
- Boards without a switch node keep gmac0, gmac1 and gmac2 enabled
  instead of only gmac2, since their switch is left as the bootloader
  configured it.
- Describe the switch on the R6300 v2, EA6500 v2, R8500, WZR-900DHP,
  WZR-1750DHP, WXR-1900DHP, Archer C5 v2 and Archer C9 v1 (new patches
  9-19), taking the port mappings and MAC address sources from OpenWrt.
- Link to v1: https://lore.kernel.org/linux-devicetree/20261118054758.132233-1-rosenp@gmail.com/

Rosen Penev (22):
  ARM: dts: BCM5301X: AC56U: specify switch
  ARM: dts: BCM5301X: AC68U: specify switch
  ARM: dts: BCM5301X: N18U: specify switch
  ARM: dts: BCM5301X: R7000: specify switch
  ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
  ARM: dts: BCM5301X: EA6300: specify switch
  ARM: dts: BCM5301X: phicomm-k3: add nvram node
  ARM: dts: BCM5301X: phicomm-k3: specify switch
  ARM: dts: BCM5301X: R6300 v2: add nvram node
  ARM: dts: BCM5301X: R6300 v2: specify switch
  ARM: dts: BCM5301X: EA6500 v2: add nvram node
  ARM: dts: BCM5301X: EA6500 v2: specify switch
  ARM: dts: BCM5301X: R8500: add nvram node
  ARM: dts: BCM5301X: R8500: specify switch
  ARM: dts: BCM5301X: WZR-900DHP: specify switch
  ARM: dts: BCM5301X: WZR-1750DHP: specify switch
  ARM: dts: BCM5301X: WXR-1900DHP: specify switch
  ARM: dts: BCM5301X: Archer C5 v2: specify switch
  ARM: dts: BCM5301X: Archer C9 v1: specify switch
  ARM: dts: BCM5301X: DIR-885L: use gmac2
  ARM: dts: BCM5301X: use gmac2 as the CPU port
  ARM: dts: BCM5301X: enable GMACs in boards that use them

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi        |  8 +++
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 39 ++++++++++++++
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 39 ++++++++++++++
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++++
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   |  4 ++
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 42 +++++++++++++++
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 48 +++++++++++++++++
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 53 +++++++++++++++++++
 .../dts/broadcom/bcm4708-luxul-xap-1510.dts   |  8 +--
 .../dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  8 +--
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 20 ++++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 53 +++++++++++++++++++
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts  | 10 ++--
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 39 ++++++++++++++
 .../broadcom/bcm47081-buffalo-wzr-600dhp2.dts |  4 ++
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm47081-luxul-xap-1410.dts  |  8 +--
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  8 +--
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 42 +++++++++++++++
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   |  6 +++
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    |  8 ++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   |  2 +
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 39 ++++++++++++++
 .../dts/broadcom/bcm4709-netgear-r8000.dts    |  4 ++
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dts  |  6 +++
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  |  6 +++
 .../dts/broadcom/bcm47094-asus-rt-ac88u.dts   |  8 +--
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  |  4 +-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  |  2 +
 .../broadcom/bcm47094-linksys-panamera.dts    |  4 ++
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  8 +--
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   |  8 +--
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 53 +++++++++++++++++++
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 53 +++++++++++++++++++
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 21 ++------
 .../broadcom/bcm53016-dlink-dwl-8610ap.dts    |  8 +++
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 23 ++------
 arch/arm/boot/dts/broadcom/bcm94708.dts       | 12 +++++
 arch/arm/boot/dts/broadcom/bcm94709.dts       | 12 +++++
 arch/arm/boot/dts/broadcom/bcm953012er.dts    |  4 ++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts    | 12 +++++
 arch/arm/boot/dts/broadcom/bcm953012k.dts     | 12 +++++
 48 files changed, 834 insertions(+), 84 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.1


