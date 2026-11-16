Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qlu0Mf/s;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XO9Vmy59
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=POAt59CO+HOObTIBmjiEVtwCoQudsZPbe9vIDZNqOuU=; b=qlu0Mf/s+AG6Hm
	r9VyFytfrPIlv32MAYNG8edM/AhJvoJ+Nr1R1sGVXbLnKyFlz5NEcCXt6PycUoIS7gR0YUXhbXLMj
	6lIFlCInI/Iap6x5Af/vYv+nsXPQv4J5U/wps/IiP0CUUbJRw+291sAeXMoRV2Hz8LS2fCHWLygiE
	H5ODphLlpYVRKCnYRfHJEbrD5Myvsa4JoAP/zhkydZoYs9YkLr77PniiPFu6qEVlihe4tjbfYTqRP
	FDXL8t8pQlmVMw2Mimngb7eF8efJK6NVzW7xSuRGPnj5oUozDJEDROOf/CNVLFV01lAT1Ed/tf5gM
	7oiCJy+XpH+I6+A669Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsr-00000002MgJ-2OKl;
	Mon, 16 Nov 2026 12:32:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsj-00000002Mbq-0ghM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC5A1BA8;
	Mon, 16 Nov 2026 04:32:16 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4C4F3F632;
	Mon, 16 Nov 2026 04:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794832339; bh=b1HIH1QS2hnpdXK+KVzLC89n8/AQUCXzJMbaHXVM6Zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XO9Vmy591ISO6V329xgF4MnvcaJwM7aTesr7PRZrzuzGCifI78qBxaUXvmt1GNcFt
	 YF1ljIK5+VUs/HwNTz3oql2H9+AebItsNvF2T8On1mQngPmlE2mfllABDviR1HZ5/r
	 OLY/a7ucrDK11uQm3z6fQXgsqUXYzkH2bmh4gQno=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
Date: Mon, 16 Nov 2026 12:31:53 +0000
Message-Id: <20261116123153.2672631-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043221_342951_5562E2FA 
X-CRM114-Status: GOOD (  10.64  )
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

Add checks to avoid dereferencing a null pointer in
scmi_protocol_table_register() and scmi_protocol_table_unregister()

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-7330d90b-8d81-478a-a227-4aa6f19393ba
Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..337aa445e42d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -186,6 +186,9 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	const struct scmi_device_id *entry;
 	int ret;
 
+	if (!id_table)
+		return -ENOENT;
+
 	for (entry = id_table; entry->name[0]; entry++) {
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
@@ -206,8 +209,11 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name[0]; entry++)
-		scmi_protocol_device_unrequest(entry);
+	if (id_table) {
+		for (entry = id_table; entry->name[0]; entry++)
+			scmi_protocol_device_unrequest(entry);
+	}
+
 }
 
 static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
-- 
2.34.1


