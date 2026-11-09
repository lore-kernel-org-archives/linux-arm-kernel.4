Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BE606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IBXuYtiV;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPyajoaG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hHaS+ftN8yPzDFvIun/EZKVknOKh7/K5G40GhrJsRd8=; b=IBXuYtiVo0bNTrPzPdvjEXTpl5
	OGMH5Ceu1zMIPqX9z5Vdnm4Xl3p/uaXY1M24GYJq+s2/ew4RhNIxw3dageOe2zoJeuLo35oRJt/JH
	IQ+rIUKVOABZGsOs98HnHWgiBrnWDp7fEquhCseCMNRyRvKyOWJqdnb+dALUIBm/5lrP7nMhjxq2n
	RQaoUQC0vDv7KNGpB6ac0rTH2ajYsXDPsdYKUsmB2d2uVgdAji2RoTcllBlhZmfJuSA6OdRfSaQlf
	FUPUiILYaTgB5rbxW0dWAXjveDc6B/vPJ7r9QxQVLsCJlvkb7rTLcL7RtBhAWN2hN7UuVe5drn/DT
	QgraQeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSXd-00000001E9v-2Y7r;
	Mon, 09 Nov 2026 16:48:21 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSXa-00000001E8q-0x9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794242899; x=1825778899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tCG0G3JVI4tRqcPbvjLwK+Qe1NPh0Vqhwwedp+CSJiA=;
  b=DPyajoaGxDatZkY/R1s/TrvylZL6kFZ7+0y+KJrwz+KHiQ1QCYizgTgS
   tppTJ3t9O9Tmw4i5jlapMOi0yBvVB9qCLTwV/rrhNX+ilx7u/kh297Ta6
   Y7BZDvEhvSE8NK7ubMrj+KVnTWRZYJENYwO9GbOCBl6hBmuL37r9fmQ50
   5IfiJRO1eYLbVT3ya6LIsL0JxCJWqTfnOJV+ubkc7tvVb1nEB6tV3s3nJ
   SzA2iyxmLLE40dk9BYC7GX4aHxLjextRtsU6AcQkw68nRI63JAuMLnd+m
   Gv8ghPLXmVpf7R17XDnM0LmcjhzQT89atErGr5Rs2wvzCJlnur24W9+hF
   A==;
X-CSE-ConnectionGUID: cQC+wf26TliVICo9kFcktg==
X-CSE-MsgGUID: sqcrEJ5SRHG4EBrsCxaODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3010680"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3010680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:16 -0800
X-CSE-ConnectionGUID: DjDpGG6OShSaS9F04spwkw==
X-CSE-MsgGUID: rO5iguyOTg+BaUmM3h/VgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8481199"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:13 -0800
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
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v5 0/3] arm: dts: aspeed: Add Intel AVCRP and JNCRP BMC platforms
Date: Mon,  9 Nov 2026 18:41:47 +0100
Message-ID: <cover.1794242015.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084818_299828_691FC9C4 
X-CRM114-Status: GOOD (  10.18  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms. Both are x86 server platforms with Intel host processors,
managed by an ASPEED AST2600 BMC.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Changes in v5:
  - Removed bootargs from the chosen node
  - Added a description of each platform to the commit messages
  - Capitalised the first word of the DTS subjects
  - Rebased onto the current aspeed/arm/dt

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: Add Intel AVCRP BMC
  ARM: dts: aspeed: Add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 275 +++++++++++++++
 4 files changed, 600 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: 6767ba3efdda2d27e5eab719db39a7ed98d28b35
-- 
2.43.0


