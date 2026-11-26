Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B777A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvELwelO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPsOvRi7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/W9cEBWU/T988b+0x4Z/R0bFFK0jxwX4qWW1NiYU7q4=; b=wvELwelOe0QmifSeJZ8oveQ0Es
	rjPwlmNxdhb5HRJN4g5L6v2GippR7Iiyx78djb2VNHdfNiwIQKw+gGhB8ObL0p9jpyOZb+uFMZC48
	dlIZsy65dcAvFHEju8yb2MzyUK1QCTIrY8Qh+1XAy+n6iT6VYtjWy60vIjpipcuYrQpwcgpRh/tj3
	42MYAZ9TFcH4Nyly72d1NL0qKJVkBG56t+9D1WkrRqo0/dF/ItJi247TdmooNs3j1Lw4dZ/9u8nBx
	Z0Zs9CYqlafHL+7aulH4K/BaEMMSqfT1mFaWDzeFMcZJi+oHksh6JyLxBnUuo7ccxsEoO06Eh3oL0
	gXVGZzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgFb-0000000EUqf-2H5j;
	Thu, 26 Nov 2026 20:39:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgFZ-0000000EUqV-2uh9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:39:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3325A40423;
	Thu, 26 Nov 2026 20:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32CF1F00893;
	Thu, 26 Nov 2026 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725565;
	bh=/W9cEBWU/T988b+0x4Z/R0bFFK0jxwX4qWW1NiYU7q4=;
	h=From:To:Cc:Subject:Date;
	b=DPsOvRi7JlUHB6r3QAfIzuV0MqSgjLqJ+RgLGNMLVsCMd0BRKaPwFrV8miul1LUVa
	 toKCp6ENx4D6Zo8CJ1SBUNdFYc1w56pppalY1Oz0PteP99eX3SD9DRApx8e9NoHcNo
	 Xuc+srs6Kyb4UuunMI6Z/mVCDhuWfv1nOb/YJibXzSMuSacWjNOYMLIG3/SXUhDYtr
	 V0zwp0HLsARyrxZXu07+TwYTBRlzX1ZfKzse0YsvNwOtAtIkt5XFJu58iz02cyfLXy
	 TZU/pZURl+M9fgurE0EpgmNX5qfgE3k0J0CFnNPaaAqtTF8wfUC2/yuo1VqFgLfbGB
	 oY+4J7L0lcqkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Waqar Hameed <waqar.hameed@axis.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.5
Date: Thu, 26 Nov 2026 21:39:21 +0100
Message-ID: <20261126203922.14074-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.5

for you to fetch changes up to ae2005cea2e4f84692268e54199bb03f5c6f4558:

  arm: dts: qcom: sdx65: Align multiple property data (2026-11-07 16:00:03 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.5

Add initial DeviceTree support for the Qualcomm Kuno SoC and Kuno IDP,
including the CPU, clocks, power domains, interconnect, pin controller,
shared memory and UART console.

Clean up formatting across Qualcomm Arm32 SoC, board and PMIC DeviceTrees.

----------------------------------------------------------------
Hardeep Sharma (1):
      ARM: dts: qcom: Add initial device tree for Kuno SoC

Waqar Hameed (32):
      arm: dts: qcom: pm8226: Add newline between subnodes
      arm: dts: qcom: pm8841: Remove superfluous empty lines
      arm: dts: qcom: pm8921: Remove superfluous empty lines
      arm: dts: qcom: pm8941: Remove superfluous empty lines
      arm: dts: qcom: pm8084: Remove superfluous empty line
      arm: dts: qcom: apq8026: Add newline between subnodes
      arm: dts: qcom: apq8026: Add space between OR-operator
      arm: dts: qcom: apq8060: Add newline between subnodes
      arm: dts: qcom: apq8060: Align multiple property data
      arm: dts: qcom: apq8064: Add newline between subnodes
      arm: dts: qcom: apq8064: Remove empty line at end of node
      arm: dts: qcom: apq8064: Add space before line comments
      arm: dts: qcom: apq8064: Remove tab after property name
      arm: dts: qcom: ipq4018: Indent closing brace properly
      arm: dts: qcom: ipq4019: Add newline between subnodes
      arm: dts: qcom: ipq4019: Align multiple property data
      arm: dts: qcom: ipq8064: Add newline between subnodes
      arm: dts: qcom: ipq8064: Align multiple property data
      arm: dts: qcom: msm8226: Add space between OR-operator
      arm: dts: qcom: msm8226: Add newline between subnodes
      arm: dts: qcom: msm8660: Remove empty line at end of node
      arm: dts: qcom: msm8660: Remove space inside array property
      arm: dts: qcom: msm8660: Align closing array bracket
      arm: dts: qcom: msm8916: Add newline between subnodes
      arm: dts: qcom: msm8960: Properly indent subnodes
      arm: dts: qcom: msm8660: Align closing array bracket
      arm: dts: qcom: msm8974: Align multiple property data
      arm: dts: qcom: msm8974: Align closing brace properly
      arm: dts: qcom: msm8974: Add newline between subnodes
      arm: dts: qcom: sdx55: Properly indent subnode
      arm: dts: qcom: sdx65: Remove empty line at end of node
      arm: dts: qcom: sdx65: Align multiple property data

 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8226.dtsi                 |   5 +
 arch/arm/boot/dts/qcom/pm8841.dtsi                 |   2 -
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   2 -
 arch/arm/boot/dts/qcom/pm8941.dtsi                 |   3 -
 arch/arm/boot/dts/qcom/pma8084.dtsi                |   1 -
 .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  32 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  27 ++
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   4 +-
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts |  26 +-
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   7 +-
 .../qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts   |   1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |   3 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  11 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |   3 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  11 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi      |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi      |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  24 +-
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts       |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |   3 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  18 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  24 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |  10 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |  14 +-
 32 files changed, 658 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-kuno.dtsi

