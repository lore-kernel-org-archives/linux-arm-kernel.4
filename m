Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D41606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oEElTAIf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgJTf4Vf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OmxDzzpyB6E7CRRo9uqBsBEYLzdun/syuP5owNmqoic=; b=oEElTAIfpzKThHM43cqOObpoab
	GKza+WD1Np/Z6sMrIDWqxBTyPneP2xXgGxyQ+/IfX4hGrb/7HK1ehCyiK9TSZshcmcpHFKUFgem9G
	OTC/amnfGTB8DJWeomO0cArKtkoMVM65hfJjDjLbdz35gzlvRQcXm6rX/eIXgtDHS4R3+m++q83PC
	OmA2oa9gx0dkXrd40o7ijqJHj5rJyJzBt502aPhT94xsLIOStyic1iYaT12oOsrjPagDcyo1DQ23S
	scb6axLTsAeWNOhp8hWEq/6q9Je5BQ9s4tV80ypzHuhSajIynoFie3pmodBavZkZ0KOrX1rxF+y9i
	GqM0j0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwvo-00000002f9E-16No;
	Mon, 16 Nov 2026 13:39:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwvl-00000002f8Q-3JBy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794836372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OmxDzzpyB6E7CRRo9uqBsBEYLzdun/syuP5owNmqoic=;
	b=MgJTf4VfoZ1d/bbTtFNp0qtJPyeqet4rGqp6XIb8pjR+EXwsAagf9k+fARy6HhNC9ve1NT
	hCbxN4d8ZDKW9XnbY5oIHNm1eV+OiQqTBbMbK5GIuDOUcWOLcjtuI6mC9wlweCDepT+m08
	ndRdy/R7HUDLMbm8C5QMfTA/b6kjYaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-0x504bqBOJOe18DJLfL8qQ-1; Mon, 16 Nov 2026 08:39:29 -0500
X-MC-Unique: 0x504bqBOJOe18DJLfL8qQ-1
X-Mimecast-MFC-AGG-ID: 0x504bqBOJOe18DJLfL8qQ_1794836368
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490c1867490so126950f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836368; x=1795441168;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OmxDzzpyB6E7CRRo9uqBsBEYLzdun/syuP5owNmqoic=;
        b=KWZ3cIMyOZ3Lm82tDAfsmSefLblAdG0kQzSrOYMZLIZoeXt3M/yXVHiHlwYrbZjiFR
         xEKkRS4tqi2wEhOBHE0I4zd3KZj2Uwp+roj50laDXvQitbjELIaYlhOqMPlHKybRBRwo
         jilCa7+ET1T0vbE8N1cwKADCskeRHEl+2PJPYi29eGcjiJ016dWy8CzAFbQh/49S9+WW
         iDveXUcFXb8XB6pU/YRq2yXvQ5HD1D4EhyFJ2eJnD4jkG/Yqz/CUjxNdOoqQQdcJvfmh
         ettAeNxtpDcwGyWtWKOXZ2vPG2um0+lzsnoS++MWksBSXdjyCFoTFOOjK4KGpmZks5KU
         No3g==
X-Forwarded-Encrypted: i=1; AL+hErFutMgfIWG6W1PdHyELZsx/I0qT5BSLcavhFY7U/c61+ug4vYC/JjFj22j0+nQojKUdzACX0Abrv6TD0Hbpf39B@lists.infradead.org
X-Gm-Message-State: APuU4Z/F25F5hHgPdkAdhzvSVLzXV8UVLl5AogMNMIUvBvCLZkGntHKR
	wpLeZMY8d5V8HT1W0xbgVuLxvrrkd8/cOMGfRBkdSfegWRwN/XPrOtrIdRsZQ2svJXLjCsqwkbe
	qv3fQSAejL1f3hC3P1I6w92uF+QE1BYCx3m4IdZISnKD2cysIJ0eRqERvBuqgmReHgBqaTC5yje
	JB
X-Gm-Gg: AYBFou1aD74atDOREZzNRBecNmHph2YX1hmdXjkNqWz+awDF2kXySm+NHcaRtfhbY+u
	8y9bxjvQDc991xZ6llHIuEz7JBBTR0QT7ubhozOj/FppUf32jN8NVGCZozP6BvLZqcQrlo4nmAg
	va4+uxZcyaup4ilffkBNqpIKg+ZzA2vI6DdVr0a4o1EL8xiGnsghLYqEUtRqEcqCaxkOntq78R0
	SGQeWyIRGOApZvjnYhZcYNNwGE2aYGpXaNFUzS98vC/P6uwvROSvS0vluvIruhdxwB2/AUFAmiv
	p0XGpLa6/G/3ooh68ZxvU7CCxNhgaQP4vxjJMAHWwg0IDl30qCxKM+oXlfLtrr5HTvPeoHVUaro
	dOyTHdnKZ+B5O0c/5mWEhiKEn4A2w73bhFA2C2WX/FT4/0mFIWK7PUHd0bQmvMi1QXnAgx+vDpk
	u3OtJDVzGh2Geayw==
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr33746695e9.1.1794836367917;
        Mon, 16 Nov 2026 05:39:27 -0800 (PST)
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr33746245e9.1.1794836367447;
        Mon, 16 Nov 2026 05:39:27 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm207627955e9.14.2026.11.16.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:39:26 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 16 Nov 2026 14:39:24 +0100
Subject: [PATCH] scsi: ufs: core: Use ufshcd_query_attr_retry() for RTC
 update
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-ufs-rtc-query-retry-v1-1-4de69b175e8d@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyG7BV2uKviINooll8pCqK+O8Wl
 4Mb7h6IpEIR6uwBpVOiLHMSk2fQT908EsqQHGxhnTHG4cERde9xO0hvVNoTS7a+CBUHHxhSuSq
 xXP+1ad/3A8mVq9NlAAAA
X-Change-ID: 20261116-ufs-rtc-query-retry-3f27084f878f
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
 Stanley Jhu <stanleyjhu@google.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, Mike Bi <mikebi@micron.com>, 
 Avri Altman <avri.altman@sandisk.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Luca Porzio <lporzio@micron.com>, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794836365; l=1772;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=e4EQGaaTBbd9wtA70t1Vx8NEbGVqrdd2zRrcBNi9mFQ=;
 b=3o+DwdK7dIKBz6QiRt3MIR24WrlJ7wPWsVy0sCk7n5BUey0tWzgVYp0XfhwhC4Xu/UUj5MgWO
 gtYumqrnV9qALJkaY/8FbG0RNWLrN8fNYqVjOI3l2N916/2CHcnF0ud
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qqFtoNmTBcfuDA-QRKITAQzJ58dnZJXtGECHtf4ckvo_1794836368
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_053933_980782_E37F0E79 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.8 (--)
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

ufshcd_update_rtc() uses ufshcd_query_attr() directly to write the
bSecondsPassed attribute, making it the only query attribute caller in
the UFS core that does not use the retry variant. All other callers use
ufshcd_query_attr_retry(), which retries up to three times on transient
failures before escalating to dev_err.

This causes spurious error messages during boot on some platforms when
the write-attribute command hits a transient OCS_INVALID_COMMAND_STATUS
error:

  ufs-s32n7 4ac80000.ufs: ufshcd_query_attr: opcode 0x04 for idn 15 failed, index 0, err = 15
  ufs-s32n7 4ac80000.ufs: ufshcd_update_rtc: Failed to update rtc 15

Switch to ufshcd_query_attr_retry() to handle transient failures
gracefully, consistent with every other attribute query in the driver.

Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3c28bc67c65f..1cd32b7cc967 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8821,8 +8821,8 @@ static void ufshcd_update_rtc(struct ufs_hba *hba)
 	if (ufshcd_rpm_get_if_active(hba) <= 0)
 		return;
 
-	err = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR, QUERY_ATTR_IDN_SECONDS_PASSED,
-				0, 0, &val);
+	err = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+				     QUERY_ATTR_IDN_SECONDS_PASSED, 0, 0, &val);
 	ufshcd_rpm_put(hba);
 
 	if (err)

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-ufs-rtc-query-retry-3f27084f878f

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


