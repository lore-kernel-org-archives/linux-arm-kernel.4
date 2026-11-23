Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Py9V+sE4;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0kOQA7z3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aYbexxs3L7cUJmLfV3CCtINJnN3iJLBB80YI1WvfYg4=; b=Py9V+sE4fWb7mU8watwt+ULR4z
	3FcYvNadXrmJ5S5aBeBzXQY86TkZ6Ub3MRjk/08jAF7c1HYr8/xgJFmAWRv50HRL2qqkWCfM3+LKS
	Y3DUT4ZOKjr2pNbEvOK5b/bvorJM0kkfo0eC/c50Y8l/mx6lU/2s+hoq1AXEICAKCVpw3AhetSAxw
	aUU/0d1El9Ca6fcMHXmid6MM8HdSnHK/gNMSFBFeLPQL1hC2cV+3Vsy/NeGg5CVLOrZvjIgNvvu58
	XLb2hqKWMNbIhYN2YWsS9aw0ACC5+6sJ/GKeZprIy+pm6hcbvTPsQbVvcXNHjDul0gk/C47H0KMFn
	2qSmukNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVY6-00000003t29-17sS;
	Mon, 23 Nov 2026 15:01:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVXz-00000003t05-1ouK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795446096; x=1826982096;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=arYl9MgHPoCQR/AbKhJMReORxqTJLDU/0yr2IC72pok=;
  b=0kOQA7z3emUduCyiCNAK7NUQywZ80MofIFjEXeyFXC4zmB2+tlz/zr8d
   o9sHfCU/t57mCJUILUtdfXHnTte+VCEE4EtCOe/NnQjNcey4WVe09PbhE
   hb1vfRcYhyAZDpjpPWm0OPA57HnBDLUd7pcTPBAemtkxFVfb0C4vWt6lN
   Z/S2ONm3dOLMYg/WG+1OISgoSs8HWkFHAuHV3JJRkvVpjhIhePVzlmvef
   LD46gAPCmEp2cmtcKXO8FCPxVynrs+qZLiuTtJGx3fFWvrlHypoO0saHM
   xRX1vhsjMGZ9CETG9pmmd9bCAVFFnu4wHjuecRFOd9iMSOq3K8GKZ+HhV
   Q==;
X-CSE-ConnectionGUID: tLYK4mYxSBiBCV0B6s4eoA==
X-CSE-MsgGUID: b6YLMV6jQwq/CZswqS5U9g==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="298335726"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 08:01:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 08:01:34 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 08:01:32 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 16:01:29 +0100
Subject: [PATCH net] net: sparx5/lan969x: only check the DSM calendar on
 sparx5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
X-B4-Tracking: v=1; b=H4sIAElVBGsC/x3MQQqDQAwAwK9Izg24K2jtV0oPMYk1qGnZFRHEv
 3fpcS5zQtZkmuFRnZB0t2wfLwi3CngifyuaFEOsYxtCbHAh79v+QMkrMi3qQgl5Up5xuFNsOpG
 aaYASfJOOdvzzJ7hu8LquH+B4eGxxAAAA
X-Change-ID: 20261123-lan969x-dsm-calendar-check-b8a237dd0cab
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070135_881108_3CDA6D6E 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sparx5_config_dsm_calendar() calculates the DSM calendar of each taxi
and checks it with sparx5_dsm_calendar_check(), which compares the slot
distances of each device against data->avg_dist[]. Only
sparx5_dsm_calendar_calc() fills in avg_dist[].

Before this patch, the check also runs on lan969x, where avg_dist[]
stays 0. Any device with two or more slots, e.g. a 10G port sharing a
taxi with four 1G ports, fails the check, and the switch fails to probe.

Run the check only on sparx5, as the lan969x calculation computes no
distance limits to check against.

Reported by a customer, and reproduced by running the lan969x calendar
calculation and the check in a userspace harness.

Fixes: 5d2ba3941016 ("net: lan969x: add function for calculating the DSM calendar")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index 35815fb58080f..b0ac91bffa874 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -595,10 +595,13 @@ static int sparx5_config_dsm_calendar(struct sparx5 *sparx5)
 			dev_err(sparx5->dev, "DSM calendar calculation failed\n");
 			goto cal_out;
 		}
-		err = sparx5_dsm_calendar_check(sparx5, data);
-		if (err) {
-			dev_err(sparx5->dev, "DSM calendar check failed\n");
-			goto cal_out;
+		if (is_sparx5(sparx5)) {
+			err = sparx5_dsm_calendar_check(sparx5, data);
+			if (err) {
+				dev_err(sparx5->dev,
+					"DSM calendar check failed\n");
+				goto cal_out;
+			}
 		}
 		err = sparx5_dsm_calendar_update(sparx5, taxi, data);
 		if (err) {

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-lan969x-dsm-calendar-check-b8a237dd0cab

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


