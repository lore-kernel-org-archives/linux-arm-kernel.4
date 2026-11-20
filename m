Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD085606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VcxEawxW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xT3/Xdbz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=; b=VcxEawxWoA0LMeS556LImBPBti
	D8+rSM/qn+0Mta4yiU8kJrKvac3xUQF53gUmi4ApQPfBuNjY2qgpCydykNXfl3y6Uaa6cV5ExWt28
	pD5q/DOSCqGPYt3QCKPnegYEv2Bc3WEqWbxMIiBEXKceaFDh/v0/sWl6e0QVtnSUOsEELS+d27ifs
	4oTA7UnvU5HBW+fU1GqmI4Q+3tpHC5pRjKyy8oYs+mRPv4CceBwIaGRD/gdP8j8fepraz8OIF/Bxa
	0guFvt2wE7Lc80MUzCRHavsaWw1qSTwVp5pi9eANrXC0RXUTCZaMZ68jR4g1UrC5ew2mM1OJ5p0fb
	uEWwg1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM0T-0000000EcQ3-1Xbo;
	Fri, 20 Nov 2026 10:38:13 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM0J-0000000EcMK-33MB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:38:06 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-377157fde7bso239739eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171082; x=1795775882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=xT3/XdbzhmP4Z6yTpmaEZi+pkjBRRg8U5P42wN1reV0u0AAI0DEV7yd8biXJmO44Yn
         wmrj1Ybzk6rhAJt6LfAOPPkkxmyCpeX9vUkZFkZAvAw7uh40e+Hds6s1jejURxnJnDB8
         jn7wC6MFiVe18mBG65STVXxcl3Ytl+I6lQYKOAj60BCkduKWCWYYQWgC+0feVRh0WLWT
         QzwW7JkbepJtHy0s6SIk9qIPXBziX2Tanp8Ep2k9Ui2eTD22cKqg6HDU6miGxXdLrEsT
         aA1MGiZKO2CLOl9/HJ9BOGeW+Fn/xcBLVGfe6zPpLym3Yf+cArH0PsaPd+Ndpnsl/kC4
         yU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171082; x=1795775882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=ildN5vZ5kWdy8h9l7kOO3VrXQSEYB8WeKtb0+c2Pkp5QT/k8wFY0DljLbnpHZZD1QZ
         pj5E88ve1MP5PWgZHtT7d/F4jp18SEbmJgjOpYuSqPXVS9xhIHut1Pbge/wCl77NQluc
         twjvkHdWTRDpMbuAg3p6Q552I2+pV88cmda0qQMs0N+B5TNAmn9ycgABPej0mAteNHrp
         SHwiSgMwY0mLFgSoSLyyYFXqBIP13uh2O40tE4e6zLLRFky9Irn7ZEO3X+rzEP7evyP2
         NVZhsQiaPvoTITqrERENwyyXgQiRhnTgLcobcpb9Vylzaj4wRstrJvHFY9bgJdJgxhXm
         zxMw==
X-Forwarded-Encrypted: i=1; AL+hErGn8D00NdmCsSX4dno2stkJ1ilHaP7JnDJ5ZFaAi06UFDxYEoJZd7GTSWZ5KQernAOyHVtHHwRlh66Mh8Bx1QPi@lists.infradead.org
X-Gm-Message-State: APuU4Z+JiGzhfcGIxNEwwhZRZV/X4Ed89mbVKZ2GvDH5dO8briavwlY2
	GYLffDVLNyKbS2jI/rYlkXShqTGq2UxWYHkIDvC8AkU+7kQqNN+wYtim
X-Gm-Gg: AYBFou3q8ynXpZgcT8/o7rLpbngGen6fVSTDGG2wmOjp+EBAEQmgQaCDIba+NIDW1ZZ
	Hf2LPWL7Y6/gWpCJUOybkOjZ2aA5FmKB078/alPQBzt2OOyUUASaGgE3YfIeNn4lkyfyqM2klrI
	7gH+3+mtk6SQFXAkCkUlRlNY7Dg+0+xBr7F9n/HAng6oCqUHkL5m0L7Fgy68X8pMv4nSW+WIshW
	I1dqHoflumPaapMoYp0XSEbSWBpsCf30To4rrbM8bYg842p78O4QcaDOXIKaobKybjxxcrGklqp
	+/KkWlqzmmbZsH0nWJjNUo8VVqVEwhrDfTLBuc68oWY9eMDzqWFnuYWsyODosdA7H/BM8LyPotx
	7t7OUdEogeI/8jN15RAmG7l+5NLILoOGwfsFCdap0SmuMOhwGGd3J+NXO2YShe9bPVSNniU3tHN
	2mGzuCxcM1SxaCqyyirxvLVqlkUZDBOowe0/IvYCOinN8Qf9bF0Szebp3wYAfqq137/xw+c7Evl
	g2V9HYWhRuqLc+ewPwnEJyMh9tyXy0r5OZBmouv0RjeWUWKzDjZVw+J/eKvfbpApL5Ya65+/7Xr
	IFqU9n0zqYp7js/CH5BkPxG10wV/JiNnCKI9SAUBpM7MRnCfXVRFLiqT6IVtINZfxTm6qnstiwl
	KTRhngrF6bEmbCxdS+hNz4hYK5mo0SP8hEuJhug==
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr2284653c88.7.1795171082505;
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm8924731c88.11.2026.11.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Fri, 20 Nov 2026 10:37:53 +0000
Message-ID: <20261120103753.56194-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_023803_842421_516DAD9F 
X-CRM114-Status: GOOD (  13.19  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: stable@vger.kernel.org
---
v2: Collect Reviewed-by tag; no code change.
v1: https://lore.kernel.org/all/20261107221500.96825-1-dennylin0707@gmail.com/

 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0

