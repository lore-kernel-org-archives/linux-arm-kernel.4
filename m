Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAeeUoO/;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gL19MykO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=; b=bAeeUoO/o2xlYN
	bCbCO7YwWbzBfKOqZtrYCGtW4XAzibX3zRzQVojkGn0t1bBn08yyDu8a5b5n8WtNfUa4NJddgiJgd
	IePGCdvHqOkBVJscRVxgVxpCS6KvHzX/rEf483C5BNxHVRAtvOceztNqUGN623tYACYu3XI0JXzaM
	N2Lkk3t3hcIlwwmoVwFVzFNjjCnz9iZWfOnTJ7oq3dGtjIDuBo+/VAacodG3kmELq5ueaVhJOTC3h
	IAWjaiGahxnFmCIKAXqYhpp0mPZDjShWUgva815QSg6vC+iBb8yU8icqdl8o2u1kRhy7CzFTS0j/4
	6FNd+6kQLfrfJVkyaaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MK-00000000wWC-3bYe;
	Sun, 22 Nov 2026 09:59:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MC-00000000wU5-0yNN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:59:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so18476305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341574; x=1795946374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=;
        b=gL19MykOIpzDp5bhCAIctxY0NXOZr/AM1gqcog7lU9XsmKiWG7S1Xa1JK4UVOSkWHm
         lDtVRC7EGlAtINvXJYufmLIoiT4LRd+AKrjIw7mPMUx7K0hVDHAska6PXzWvKhcr2U6Q
         rSBZ7gt+upYri8BFfK2T1zJKrAGkVjzimaeSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341574; x=1795946374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=;
        b=FYF/tNH+ZyrwWwxL6meZkgJT/vkbN2B3+LzmUqaZg2/0Y3qPlmJFKvAgp9D9UISTKu
         5YphXempx+A1QeBK6tq6jkUxm5AJS2g+5aMjxK3TN8bJ0aKAMW739e0TD4YWlLA0jDWB
         ZK8PQn6yxLX0lQ2+mr0vA3VjmpZYdrvQ4Kk0KGpdjD4wremlF6fgkif/ThlDQtx8u+o5
         TbpEzazQdkfg1mzEO6ZLoEJvmH1GPq+iYSICebNEPK4DUb2mFkes1xB4OlhAN5AsTVpz
         Z7RN+Mu8Je0yx/ZDFBl5VRq3+Hy8ftem1kDaSFITau10MssjosCkCBcVA+2rI3LcLNNi
         zvdg==
X-Forwarded-Encrypted: i=1; AL+hErG/cHHjC1vIqJhsk/WgloWt6xYIk4+53iQTSb9mHn2K7CAZZc+pSNkSQW0ceFiJydY1VCXFUOgrWYAftlIKIGFR@lists.infradead.org
X-Gm-Message-State: APuU4Z9S96qol6w+QgwMH8x6ws9SwbUMXwQMJ5RRZ0LUmly7rIxglU2j
	/2LJUj2xlaaF+xCa3GRjrAEWyS6QZl8hufKFQvNIM4MYZ3Jr1kIQUpOUA8SJEFf7Xgg=
X-Gm-Gg: AZFdTZdYUvvpYWr6i1zJXeG6cDLJydqNODKhx9loyt7sIL/U20GQNa17DZP8RKv2S5x
	dD1e2/bvlR9o0HFqYmPsHncnZ+HR3EyFSXvYysOkNCqLnHTZHzRhRWY2hOdwTEMBz1Ih1qrh5vm
	uCkud9iYX/1VL4TOC2uWb3p9vK85Y4/ydO5rfSHxyT1wiGcFgzU0fsdnRakKcRE5rda6ui5ntAO
	EpM0yuI7i0FRImg3EpLO7kfonh/nOyTv0cSkctd4qTMX3W9SgrFwKR5V6AArMYM0B5bEBLoQdHA
	Y8rdByzXkjdmmWfLQEbjKYqOXQHig5LAl2DQfyo5Dk2hmpN+ABumhtf+tRKDnNK3IbAyAa8KzNv
	MuK4sOcC5wAb0e3AqfNir15/pVCCId7wIyxtnAr/flMccBvNztkXjdZvtMvso/mdT2MDGcpH9O5
	m/JKqIoPV+3A+tfC+5awcgE/UN+gt5OWFeMx+M+loB6aT0ii9AE3GUTXC5dROPJUjVxMNKVEgMM
	NxrpNIXGcs7Cjpbu8dhJZfxTG9xSwLDajvY3CsRMnHe+ToSDQM/XQ5SNy6mjVpD7F7FhnatrgQz
	I+Fja+/0bgZM1TtwYZ2X0UuThh+CLyMddNtMC9NH/YlkKWmg9tjZRrIiG4oCBGKoDeDiI9GpWkz
	Dfzf/0vx0IgRO1gcOicOTCcHKVlucKjiCTrP3yviX0oddisMScQrGylgUnqO5J84OR2fegoKsDm
	AzXDIAAbNJDkFsbyCOaUzMC6YGwTpPg3kPZ+duWylEgSPKqWE=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr181304545e9.28.1795341574239;
        Sun, 22 Nov 2026 01:59:34 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 10:59:16 +0100
Message-ID: <20261122095927.2631909-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015936_291548_1067A50B 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If devm_of_platform_populate() fails, the probe returns leaving the
power notifier registered on the bus power domain, while the memory
holding it is released. Remove it.

Fixes: 9cb6d1b39a8f ("soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- New patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..7d6735728d8c 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -345,10 +345,12 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_provider;
+		goto cleanup_notifier;
 
 	return 0;
 
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
-- 
2.43.0


