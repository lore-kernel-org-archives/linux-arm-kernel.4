Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB145606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qp9JT35e;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=gK7AJAf6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gYmNWV1rm3ygUd91UJdw9gR5xquyUcoWzSp9DB3N2c8=; b=qp9JT35eh+NF4SgCjAdRzXt37f
	Fe/HyqvCJYJb8M2IMZ2hZclaHPFK6GuSHtFOtfTlS3bvHQwBcTIM8rxfrWI3m85/fQnXeK7uoaVTV
	2xB5BbovYZdIrK2kio4G4NQIgVV/wcQk3byCORqjS98r3HbCMU0z7EdPFV+z74ZkcneRpeNA36kQt
	DS6wwF3tZo+kL2K4k5uC5Y/I3Kosrks2TbBj9cDGOjvUAqQGfI0vwpQcQENt1TSERruDeCV7TbZx8
	QY4FehyOi7cnnr73ee3npBr9yUU7Sbia/zD8gPRbjrDufsfejZeR7fHSvIx+4wLQsqYmoqiLgrvKO
	Ih8T24Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKl6-000000003bP-1uGY;
	Mon, 09 Nov 2026 08:29:44 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKl3-000000003Zw-2WHV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794212954;
	bh=gYmNWV1rm3ygUd91UJdw9gR5xquyUcoWzSp9DB3N2c8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gK7AJAf6L02ZSqdVZzOn1Oi7QidEAY7F8LZdeLl+zGsR0uk1O79DO3YYLH+g7fACj
	 ObuGY2HTX5FjaEeiIgxZVXwKWBTHgM1GMJoZLdDoDnN2g20n+oHDtVMyYLt5/72PXd
	 oNZAaa0DKceWJ5Jg3php2u4rFd3NLLcB9nnKq/zQ=
X-QQ-mid: zesmtpsz3t1794212937tf574f476
X-QQ-Originating-IP: 1GzHOlaNovGB9WvowQCBhTYzUK8z7c7NFtzph5Ftq74=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 16:28:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5203412662589610849
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: sudeep.holla@kernel.org
Cc: linux@roeck-us.net,
	cristian.marussi@arm.com,
	marek.vasut@mailbox.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] hwmon: (scmi) Enable temperature sensors using their sensor IDs
Date: Mon,  9 Nov 2026 16:28:54 +0800
Message-ID: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MfJtHqZtrd+O0mh5CtnHDBrZln1M1rSMnBJxvN43PbBUF8zTEvEnhB74
	JSdC7+NEzdDqEW6W59d8IA6XrG6f4PltrbyHuz0DcAy4otOpSS1PY3qMGJILLT441bsVRD+
	Jq8fKE9dJuqqzHvbY0zT+vpvmzC0oKo+eHAbYkn/Q1CYABlTij1UCOeZv03KbSRHIXeGqcp
	oklCqm9LuR8AVMSL9Irv807UwG2wIfF4tX9EB/y9wPY7mJguVa7OKvx/jhHER52snijz/DL
	eDFKdkzfYh/B0lc7Zul9zQYiULbJS1HE8LgW9gKZ8TWvDfFVCl124eHWVCBQ0a16BFeZpZR
	qnFiadhmVtLfyKs0f1rl8jK9EbzNkB4ywx1ye4eJcg6Ec7pNUCj0tSkH8Yg0y6i+UPGQHs0
	W+07rJWijtQaIaVf9ZZunzclE3iJAA5YbruVESLJCGZ/P9ISids3o4VCSgaDT8ZAmtRqA+N
	6UziD2/Su2gj6y4ZQT/xqx2Z21kirmP1CKzUjSYk8GmeiR6AJ5vIbar3heUMULrNc0AzOcv
	1IGQFAGYpsGMbY28i47LDFiLNAKN7lJ2eBb16/1F+gItrzgSVgioXyROiXK94PqeMC6s57/
	CNiI0R8KdT1a6xxkBPEEXGPxOVb5qxg3cK9Elrjm4PcZBqV+RxpZ4Qda6iNWxGwfJtxbWvJ
	bCqTl49Arn3kaG8WT+seRzfGAlqAZn2+rKdExrmYH6EWN2IgjKz/8G/qn9/m3ngDFpI8b1r
	Gvdw2d23QTSoy9LtGChPPsEjOccsSGbEaAmgUsavTSvfDVqLYNY35Ki7DKfWpKsk4sJltrJ
	uU07UepS+vj997hpvl9s61zJcXX0d/ToZUgJDVchUkoULDz97o05eF4vQvFz3LzwvMht541
	4Gv+kuEwYfnY5cqAntTwffyHHYgidfVN6XFui3qb9uH5RFbOnUHsL0jzD+g4dK9zrSQKY93
	wWM19Nz0oeslZMilkgs4VFigABUiBLq1Qg0/ityWzu92y2MA33rdyt530Y5/JWInW+CuZbM
	tcRHTW+ShNCU96cmdmHFC2BEiKWmUNx57iT4IzqA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002941_935814_74CCBCEB 
X-CRM114-Status: GOOD (  10.42  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xu Rao <raoxu@uniontech.com>

scmi_hwmon_probe() groups sensors by hwmon type, so the index in
scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
Passing that index to config_set() targets a different sensor if the
platform exposes non-temperature sensors ahead of temperature sensors.
The intended temperature sensor can remain disabled, causing subsequent
readings to fail. If configuring the wrong sensor fails, thermal
registration of the intended sensor is also skipped.

Use the firmware sensor ID, as the read and thermal registration paths
already do, so temperature sensors are enabled correctly.

The patch was reviewed and the commit message expanded with OpenCode
AI assistance.

Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/hwmon/scmi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 9ae8f774297e..6a9895697f3c 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -342,7 +342,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!sensor)
 			continue;
 
-		ret = sensor_ops->config_set(ph, i, sensor_config);
+		ret = sensor_ops->config_set(ph, sensor->id, sensor_config);
 		if (ret) {
 			dev_err(dev, "Error enabling sensor %s. err=%d\n",
 				sensor->name, ret);
-- 
2.50.1


