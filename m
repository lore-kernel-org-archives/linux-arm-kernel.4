Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB22606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcyHXVR6;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfhOqAgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7XKVf74bZ49xNeFhqK3BBEa0pEr/hyXteIE2thclohg=; b=jcyHXVR6gCIfNWPTQYRPuEXrRl
	DQwa94OGhJzmYPi1Mk8vv4Om2vZqBfAFDcIj70UKGVk/KdBRSns+Rmi1MZQdfLSsj9x2l/cwTnZeT
	KfXMfEGCIhL1i0wtLyOTFWF825snphjrdGdjmjtJqp/mAVpzgHtlybttOG1Q1kU+SLVzgdMCo4q6+
	wYDk/YUF7wBX82EaVEoSSDPKaOXpSJKXFXvevlMfHXL/NOrEuQ51IGvQWioRLaP+f2WtbJFlRBzk5
	87DKwI50KPfUStCR3bCU+VZmxmyRm8tmjmoEyhbFp6/nYg+5OIRw4DExuvm7qf/I9pcGe3hiHrGVk
	QxdXMndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qa-0000000CzwC-1GUy;
	Thu, 19 Nov 2026 18:27:00 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qX-0000000CzvF-1iBI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795112818; x=1826648818;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P/lRIKn7mbqvagK6b21mgg/jRRmvu5vkSsvQSOSueYg=;
  b=VfhOqAgLA4F1aVLvJg4H2RDAV1CNlKDVUYsDV5rSRdNuc4GAgA8aZqmC
   8JcmPuAUImXnbougKl12JzLYSxubYfA0pCkaSWeY5sm/XsBC1gxIRHXu0
   mvsRV9TPoMtqOHn0J/truCTX7O7uTQsZvaewmRN3zp3/JcJhJsu6fOFMK
   MOElbE2HJDqkxk51kf5tAzN+kr/n7bydh+2YMQOubY19oJVIF+LkXCIeq
   vjfRIfqxbizazWU2+mFz+ztHbMQC1Shag8Zr51EUUnL1kq+X2hOindA/v
   rdGMg+avgde42Rxr4F+lhL2al2c4Cwp6/BOamfG6Bt7SRSwq0y7TPs3cv
   g==;
X-CSE-ConnectionGUID: TvgSbFr4SSGO2GRhL4xwAw==
X-CSE-MsgGUID: IpPiglQ5QBGcYWjjJG+dEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3861779"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3861779"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:57 -0800
X-CSE-ConnectionGUID: qZ31+rbWRtC6ZN00VYB0Bg==
X-CSE-MsgGUID: 8nuPVo1CS/uM6HumXT1TQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12479467"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:54 -0800
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	maciej.lawniczak@intel.com,
	Dawid Glazik <dawid.glazik@linux.intel.com>
Subject: [PATCH v6 0/3] ARM: dts: aspeed: Add Intel AVCRP and JNCRP BMC platforms
Date: Thu, 19 Nov 2026 20:19:37 +0100
Message-ID: <cover.1795114204.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_102657_509188_5AF66649 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -4.2 (----)
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

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms. Both are x86 server platforms with Intel host processors,
managed by an ASPEED AST2600 BMC.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Changes in v6:
  - Removed the default pinctrl from &uart3 and &uart4, which are only
    used through &uart_routing, so their pins stay available as GPIOs
  - Added &uart3, &uart4 and &uart_routing to JNCRP
  - Reworded the platform descriptions in the commit messages
  - Rebased onto the current aspeed/arm/dt

v5: https://lore.kernel.org/r/cover.1794242015.git.dawid.glazik@linux.intel.com

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: Add Intel AVCRP BMC
  ARM: dts: aspeed: Add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 326 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 293 ++++++++++++++++
 4 files changed, 623 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: 3251db5e8a31b456ff9b841d73412a22735a7416
-- 
2.43.0


