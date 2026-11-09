Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB80606EE95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pLiNucT2;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/KAmxy+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dtCQxHf6DUwyC+J6cCfISGldHvJA6vcL3U1YvK4OhBI=; b=pLiNucT2qB+rKf
	KlO6WQw2S/Xigz3mQDFMRg5SZHp1dAuLnowNDXlAJpWlXCVv3urygsaW8E/utGnEkZ+nVxWK5PkQf
	acxuX1Nt3kvX2vCzwvZcJV94tKLgEFgCZqsYV2qJ7p8liFVk2bJlq5pBeGg+HehheDDoJX/moI21K
	g32+dSYAfX8/wlN74RhLdxvsK3Pf36XtlmYMVh1H4z66c/LnmxEJ8bonuqEReILkxDlzGVoYhXFiG
	c9z+LbTWD2wWplKXwC96zR65vQK6lX1ltHEL2xkL2Br7jhR7K2Aasa3o7zilfd4OrAooa8Fu+ko5a
	2cLHWBphYNO+raPgHRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSXg-00000001EAo-2xHO;
	Mon, 09 Nov 2026 16:48:27 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSXd-00000001E8q-1zyi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794242902; x=1825778902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mG2F3kXHoPkrkgh7TuAzTTLOIw3kPA3YYlH38YhZ6zA=;
  b=I/KAmxy+7kNpBaVCDME0irNgPbfRT81Bs7UGORQz0kuIo/F9qo6gzON7
   JMmksSNV5sfwSk0ssVahPl5C99eIPWBYaXZVyKEE30Dh1F0kMpGbJXeWB
   8P/QHmuS1spU+f8S/3KMvco9H2h3uJE8XsrxRNOvInE89VwrtYqY5bpTW
   En7p1jq3eaBD1GMd55UaD9UhPqEiIcgAR3G7SM+CGUSczqD7PEf4+EYQ0
   J1zgrkVnssLqgWn+1JxIxuRDAZlycd1gXGB/2KZ53KRq0OFD9SV2bZSm0
   p2ZTyg03mCBeSaie9hAE4PnSJ18hfmyLhHNzwHRNKoR9/YP7l+Vx1iR5n
   w==;
X-CSE-ConnectionGUID: wuWVGoEySjKPZUB4oawvHw==
X-CSE-MsgGUID: itLaVpW1S7isX8wy5VPJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3010703"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3010703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:22 -0800
X-CSE-ConnectionGUID: ZL6YsHvVT4ur8NDCENsfVA==
X-CSE-MsgGUID: Fk+TW1seTaGjdtpoXYvheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8481233"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:19 -0800
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
	maciej.lawniczak@intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Mon,  9 Nov 2026 18:41:48 +0100
Message-ID: <0fda64f661da98e069da9e0bdaf947f0f4d5430c.1794242015.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794242015.git.dawid.glazik@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084821_530185_51744D0C 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v5:
 - Rebased onto the current aspeed/arm/dt, no other changes
v4:
 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868ebd8..61616a9754a4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -110,6 +110,8 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.43.0


