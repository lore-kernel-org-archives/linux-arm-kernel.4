Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35006606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cEYO5KD/;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=qkozkvj7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Uh0zn+Pbz7j6JKScOi5Lfgqxhy0yva3BbTuHFRB72g=; b=cEYO5KD/+Zo5IT
	gpa388Ms0qtJS9MZT0ut0bdIAEmemOJaAY9qfU4h2EXWQgUnvG5J1b5SbRKGgQ0H41Bu7UeFHafWS
	bJ71IRE/MaUzTXHgfw5/AhuKHeApIcOhqqN0MQtq4ISaTP0ZJSJvJ0VirkRoxym3cGG/H30wMORAE
	OkjpCTDYqFd+K5L9GDTLrbdaAxWDI8YD0xPZsEm7s4JC3Xjfixo7/onRlRX93sT+5K+Az/PfUWOuy
	FY9QeMp/0o+QBQPuBwyd39CZZAjb7N8X6KHWThFfzmr74PPSgGKRtQVKYe1Fz24OwVCiyUvm64GO2
	T0ZPlr6gOkBwrSVm4u7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOO-0000000CL6V-3qSM;
	Fri, 13 Nov 2026 10:20:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoOE-0000000CL0G-0Xbt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794565214; x=1826101214;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Hv2lGe+rUPFOVDCKN1Cx1wXy4zSUr6oszD5pqm7SajA=;
  b=qkozkvj7hxAwzUCa+Lm5DSKpsVyNl5nnYX1E5QnlFGh7n/28Q4DaLh/B
   PyAYySR8hjqwGYvVBPAKETjYsjWHSNv4H/ssFpXuxVT3ozVwQBO0aNh2e
   whIZYSTFe6iOuYEo1NbqmQA/Altcpj/B2EcgpuSkGDNfY5ya1ZlCdXmHD
   ElqsfhpCr6/47tlW+Lm4RV0YXrYRWJ2PfUjh2APiBy9gTFJJ6h5Gu8Qz3
   Cu/BL+pawozoB8s1ngHVw96r3ZvogCEhL3QO/Q6otN/la+JsrnhmQO4Vw
   OF94EX7wD65axuJY3qqAtC7RfMujiezCrg4iinkW6N6R09JgGljtNNU3C
   g==;
X-CSE-ConnectionGUID: bNar/TdCTrWLJqQXewwtRg==
X-CSE-MsgGUID: P06oSSFoQ4CebaM+UoqnoQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="66461933"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:20:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 13 Nov 2026 03:20:13 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 03:20:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Nov 2026 11:19:43 +0100
Subject: [PATCH net-next 4/4] net: sparx5/lan969x: scale the nominal TOD
 increment in adjfine
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-lan969x-core-skew-v1-4-b9b02b863d38@microchip.com>
References: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
In-Reply-To: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022014_440364_DFA1091F 
X-CRM114-Status: GOOD (  14.07  )
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

sparx5_ptp_adjfine() builds the new TOD increment from two tables: the
nominal increment from sparx5_ptp_get_nominal_value(), and a one ppm
step from sparx5_ptp_get_1ppm(), which it multiplies by the requested
ppm. Nothing ties the two tables together, so they can get out of step.

They already are for the lan969x 328 MHz core clock: the nominal
increment is derived from the skewed rate, the one ppm step from the
328.125 MHz default. A 1 ppm request therefore moves the increment by
1.0002 ppm.

Drop sparx5_ptp_get_1ppm() and scale the nominal increment directly with
adjust_by_scaled_ppm(). The sparx5 core clocks are unchanged, as their
two tables agree.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 49 +---------------------
 1 file changed, 2 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 544e9513a9a53..e37635e8fd730 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -22,37 +22,6 @@ enum {
 	PTP_PIN_ACTION_TOD
 };
 
-static u64 sparx5_ptp_get_1ppm(struct sparx5 *sparx5)
-{
-	/* Represents 1ppm adjustment in 2^59 format with 1.59687500000(625)
-	 * 1.99609375000(500), 3.99218750000(250) as reference
-	 * The value is calculated as following:
-	 * (1/1000000)/((2^-59)/X)
-	 */
-
-	u64 res = 0;
-
-	switch (sparx5->coreclock) {
-	case SPX5_CORE_CLOCK_250MHZ:
-		res = 2301339409586;
-		break;
-	case SPX5_CORE_CLOCK_328MHZ:
-		res = 1756832768924;
-		break;
-	case SPX5_CORE_CLOCK_500MHZ:
-		res = 1150669704793;
-		break;
-	case SPX5_CORE_CLOCK_625MHZ:
-		res =  920535763834;
-		break;
-	default:
-		WARN(1, "Invalid core clock");
-		break;
-	}
-
-	return res;
-}
-
 static u64 sparx5_ptp_get_nominal_value(struct sparx5 *sparx5)
 {
 	u64 res = 0;
@@ -407,27 +376,13 @@ static int sparx5_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	struct sparx5_phc *phc = container_of(ptp, struct sparx5_phc, info);
 	struct sparx5 *sparx5 = phc->sparx5;
 	unsigned long flags;
-	bool neg_adj = 0;
 	u64 tod_inc;
-	u64 ref;
 
 	if (!scaled_ppm)
 		return 0;
 
-	if (scaled_ppm < 0) {
-		neg_adj = 1;
-		scaled_ppm = -scaled_ppm;
-	}
-
-	tod_inc = sparx5_ptp_get_nominal_value(sparx5);
-
-	/* The multiplication is split in 2 separate additions because of
-	 * overflow issues. If scaled_ppm with 16bit fractional part was bigger
-	 * than 20ppm then we got overflow.
-	 */
-	ref = sparx5_ptp_get_1ppm(sparx5) * (scaled_ppm >> 16);
-	ref += (sparx5_ptp_get_1ppm(sparx5) * (0xffff & scaled_ppm)) >> 16;
-	tod_inc = neg_adj ? tod_inc - ref : tod_inc + ref;
+	tod_inc = adjust_by_scaled_ppm(sparx5_ptp_get_nominal_value(sparx5),
+				       scaled_ppm);
 
 	spin_lock_irqsave(&sparx5->ptp_clock_lock, flags);
 

-- 
2.34.1


