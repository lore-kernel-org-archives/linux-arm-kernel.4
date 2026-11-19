Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE74606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZaZ2jPc;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dx3wuhdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NIPo6JsHwPi3PMuDnG/ItHqGkr2IVR0/o1OghE79lDo=; b=gZaZ2jPc/hNF6k
	fzhoGr/GVSBAaG/LKsASGuDjnYeB3B7QBomckAxMTWHIOUP3ALju/5hspLputuH4ssHn+OA8nwsPH
	8oZBjCPfq8LV+9dCRyBSTrQvQZYT0+0TrFF8puOTyPGcDbo0RHIm4yIDOv/QUMbH6JCI2XAO1c0zE
	8CzY/pEMAmvODnvku11/8REa8FHpDqICMilQGks7n3edg7yebmNdNRM9WTgdRt7Cq1pyJvtCxdPSY
	TPkijf1cUvEDIP7v6Dvpbord8QSoeE0Lqn4VtbgQL0YEugZKBACwbt5qNyO95s01QFjI/Lem3SeZM
	Fhqza1f823Bj+N07b72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qj-0000000D00s-1fmC;
	Thu, 19 Nov 2026 18:27:09 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qb-0000000CzvF-0kUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795112821; x=1826648821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xDL2Dk0Ehk9c53PjJYhK7J4/wUrTV1V6DVnMm+9gFOw=;
  b=dx3wuhdlhFhFUzav5NMk59OG82IMW3F5U6AmiIYQuI12BP67exo4C9BV
   SZVgUGp0Lprv/SO1xC714wAPmmJuMW+80wfl52cZnBUZjH5sXAgv6l8C3
   xRQCyoHu35MupOnpZnQ1THjtkFnXvyOckVtdwFsQ/AfQZhwJcen1fDJO2
   vJNfIB6Hw1a96LBcHfvEoEf4zT8BaKxRM8X6fl9txgvWLQzMXnVoHZqAx
   rIke1eCIdNjuPGZlqaazTJZiju3E6GyuVTf0I8W7KEEz/v/u6ek/+RMuA
   XfHFZ8KI4O02JHbTORuBFcdsZz0nTv0+ejTkSHML0uh3RPXb/9mo7qZg8
   A==;
X-CSE-ConnectionGUID: rGBK7IdeTAKdFe5wBtweNA==
X-CSE-MsgGUID: A+eYoJs/RQqd+/MG7XvYzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3861793"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3861793"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:27:01 -0800
X-CSE-ConnectionGUID: k8tXrjp6Tp6R82gItRzlZQ==
X-CSE-MsgGUID: e4O2IkxGSp6RXbLfzI07Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12479484"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:26:58 -0800
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
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Thu, 19 Nov 2026 20:19:38 +0100
Message-ID: <76493a8263cfaee7f700d497f6af475a44e2e85e.1795114204.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795114204.git.dawid.glazik@linux.intel.com>
References: <cover.1795114204.git.dawid.glazik@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_102701_233926_DB9584A2 
X-CRM114-Status: UNSURE (   9.88  )
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
v6:
 - Rebased onto the current aspeed/arm/dt, no other changes
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
index 9ac4a7a8ede0..41a0a4af9e76 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -112,6 +112,8 @@ properties:
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


