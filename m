Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748E606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lBGzm6JD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dylekVI0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=; b=lBGzm6JDj6KfTGdahqKJkZJauW
	C68GKukAMHTzmZXh3YBo5ZrpD285NYCpECqEIqhfvPhf6bknbQK12QzFaPM1QRhxJDcaYtp3m8xlw
	8PL+mjObUrItR0lKUjcsvGfBHjd488ijWo/7zTq6RAv8XiO7aKJ8/ighXp5GLjLtxZaGJnkOijkLZ
	Oo+e7ge7XeDbdip5XyY1UMYgC1R+2KeUbDzCGUOm1YyA+BVaQnNGuX2ZkVTkSiHldA3dyAg8vORwx
	pFOPl9RId2SMLibSJYmmqABT3NMxbhqtHVGku+4lBfqNMadyRwwR3fqgYXPtJ1qy1juHHcArQDF6w
	O+3xRxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPogq-0000000FSU4-3TVl;
	Sat, 07 Nov 2026 22:15:12 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPogp-0000000FSTb-1Vuk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 22:15:12 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35adc681e1aso154356eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 14:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089710; x=1794694510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=dylekVI0EZr3YgDOwMGIan1iRKPcaKQHelZWpeMX8xJ+VDLxM1iZ6mIUb+a/gnDjq+
         p350u18DNFYTyQeeX9a7QK9WgHlNHKp7krhBWYxrYMhQdn1N/wUBgUa5rNVeJMOv5IDJ
         jWlUt6WLjYrhHnXEUCvVWf13dtUf/qq2ArrvSMWEuvkmsMXj0H5ZcaBDsbEuB6W2X8G8
         st1B7hzDNf8uqvHRtKhfMzYL7y5oTAgWtvQyBWKsqtnd4fB9EddV8mI2lRBMNaXuopwD
         TFcgOdL4Epymmp1TpU5qSqBOGBpk+9qMw6jmF6Oi9g0ij5nYVVRi2XZtbGPFgK12i0r3
         SpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089710; x=1794694510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=KuJSWhAYktu9SK4Ga0ZuKzVjHFNtP91Y3yLcXd2sIul5b1HALfRM83EuFok8bZon9W
         TkaN1FzfJ8SjpFQbOujb+obg0rpWTHnMOOspuTnlH9D4LA1P3S4kSc7GS9CRyBuTvn9S
         y3xpvM2dDHDzFMQWRgYQi08YBDaJaa+202Ad2bXu3mdgpUtVtFfXJWLoWr0VXmLZWEhG
         WDay737XzD7hf52Ceusc489PnIA6C+dQnVadZC2M1KGuYNZz5iNQGgzSADxfgEujVsZW
         2OzOwKTalFV/olY/H0poGI/V3et1wGeYTTknZOLTGatNUWkBJHvXGVfvmcaFF2TsSOBU
         071g==
X-Forwarded-Encrypted: i=1; AKwUvByg2f3RNkajq9vw/f9dol17fYt04DDRudwHvmStcpW16uT/FKKar3x3lxCoNDfj++riZ3dOyu2y8cOWIT4l6QKc@lists.infradead.org
X-Gm-Message-State: APuU4Z8LA03JQoxFCV8YWiq0RRtspVMwLmg4ZxMCfenXN30ik0eO4FJf
	fJmXTqw05I/V+1rIkKOTZ7xAP2U6oUDEDHcJUqdxAm5nChArNDY/Jds6
X-Gm-Gg: AYBFou1+dUhA2t6s8nMJRjyv1/JpGBl1qagdX8IgPz04TqH026KK6ZISAAbhEU32lBd
	kjJMIOnia7xt3zJVG0yNMWEXSooL7XXg6gGf35FYZdITCKxH+klq11VLobMsekStLRV0s8IHM3e
	qK8trqSIreqZzTcOC3QJ33PuIj+LskP3yboOIL8AgfLFSA2g8fHSRY9z1oRphUznq/fi5bErJtF
	I8KewEK4VOxi4+KTMzxV0xqD8gAEJRchxZoTbXRzziD4NanyjH9prbPQJC9qX2wy96anOTI41iO
	ARiSr/8Hwa8DCNzzIinz00mZAIblyaL0c0BiTfbDyirlzTx+Q8FgSyT4O9YhgJHg13fC2bnOPm9
	Au5wqxGFvJImQ7ZCRh1DX6X5FBDW7urk6uRk1PepmMcfHocdYXsTbN3UdM5FPJq3mhrh9jjEBr8
	AzvvzcT0G7wuX0Ww9fTy73nUZs/urASF6GEd3M/tQQWW/DS3Sz1Nzwvxg0wQV5R4LK6W3EjpBr5
	VJcTTxSI7bbOORsjuAmBer9w+NTV6fhOXtGAr0CoxJbjymyQUpuoa1WFVmH7xelwXtqn/dlBbX5
	YYxNFGQeDcRBXlh7YN160fhEBUheDyytpZxFwJEeoHGhbwAksCwsgMP583ZPIB2ACic9mVa1PXU
	XQtdM1tlTXtbDK2IqCgKJo1jOstUB0F88q4GmYQ==
X-Received: by 2002:a05:701b:4348:b0:163:bee9:b250 with SMTP id a92af1059eb24-1b25d321963mr8857586c88.22.1794089709615;
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm1465914c88.4.2026.11.07.14.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Sat,  7 Nov 2026 22:15:00 +0000
Message-ID: <20261107221500.96825-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_141511_408102_1D7118E4 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
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

