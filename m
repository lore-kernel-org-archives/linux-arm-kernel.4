Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8241606A691
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTQvwtun;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MANrOSIy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=; b=LTQvwtunue7TrvpuMr5tN9FqKv
	aKZm+Jg54XYZo8v77B5ZPWuPOVsTG3kxhbp2n69rafp2Agycr8LmpSHblUCSamYlsjSdfn6dGLkZ5
	S8IRVDM1V96+5ZDkmlVhR1mlt5SAanX+A+StCpyLAQXpg7fdXgjdyBuIzpNkdMNtd7UdWKsn6YmBs
	l+wDcWZLY9wo0YUtXOkUx7TebdG52jDMeaXmLjUhnxtl9wL+xtEDtpul6s8XYVSAeU2f+dVJJ244f
	QlcowmCUUF+ozJDoHjQMkBWZQsJDc2ZQJalQ9+8IfAqDK8Y2rpLMKvESk3UYgf8v5BDW7KVrDJyzU
	frsaFW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZOn-0000000GYhg-08W7;
	Sat, 21 Nov 2026 00:56:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZOk-0000000GYh5-1or2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:56:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb61185057so10120845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222567; x=1795827367; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=MANrOSIyrKskAoRKrQ39G8nU5+Cq27sWlj10bsd+FHS6SLk8jZK5JZfoYlakmLUgp5
         ExKMeHmGxu+3jvQPBRBpI3iXslSg+AeRlx+p07NDOxpc28Hc9f8CNQoa1FveANwU1cX8
         9H1H8wm2aSmSl0wPQRxXbMEUbTNWfOZvbWb+udh6vO85CS9R9UcINFm3LIElnS8c0LW9
         Ib4O89IZ9IoLNNAKeb7+OZqhmSJXtbokNbH0s2ag9vQUpPNrhup8l5357l4jE2y8FmNv
         MIMi+yOVSfEvVlvKXugCJeTobu5gHdxfAw/+SEYergTmX0xSi/uMc2iPUyit7jt4X7h5
         bx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222567; x=1795827367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i3GTOPnQyWclBIu+6MA2Oe59A19a3zhTv3uiRFaf8C0=;
        b=ipTKOhInpPSNN023mjNw3y+26NnxiMSXvvitIF7OWiMTlZHyil8kYecvp6HaDvo0dK
         txN8QQmaC3xxaoaaKg5cuQgQFpZk/rIMkYkjwy9lTigYTJE59s8F8ETgbKz26dLl4HUi
         n2XTqOuFPArLbwtOK9CJUarbcqLw7veA7SwtM++g/q8HCMO3UCS7gcFxrfJvoNFu4y/L
         ayW10Pz5c2t3M0YNNWNxUye0Kzf1rYSO5IFvdKzwdTgYVgVvYYr93AKAOWy3sWNxghNb
         ILm2UlCX5gbjouL+rBPciflEJleFoM2dqDFwuqQDcIfgwA+1rba1ncPfBd8W6zr8IkI+
         JkJA==
X-Forwarded-Encrypted: i=1; AL+hErFeF9ozEeZneUjhKpqGDPr9ohyM2YFjtgtYjspIIGH8tbYMk6WMuGPWirgpEO7zcPDXDzBf/6wf98xKIBMcwC8D@lists.infradead.org
X-Gm-Message-State: APuU4Z9muN8SEj4AUcpFg2X+HX6+N2KgtmJghQU8xr0X9ZpuCcDcXFy/
	Rb0M3Kg0fcAzwfEhDb70jaLISY7eGrylygn+9ITHHVzvToMTrakgMVTE
X-Gm-Gg: AYBFou27RgQGRKUAzMD1hhhFNOs6mJGXZA8TxaYis9yKZsSffu2s7G8S2gtNlpkfECy
	9E6UoJeXkAy34DyTISmCmjbD0P2AvorJwu3A61yNwXRZIQfPSANDHHB6ic/RFSqp14bq0EXuWPe
	c24Jy6hVFx+W9II6+zQX/4WKrMIg9NKzaXGwDdqL8j/Hd/9INN2qz87kfeDTCxr4qVwBwz9EJO5
	2g2mnQJJpJW8HBkapE7maN2NturIDlUNAHJ4boGrSJ+qdTsF05gjIWvWa5GEKeH+ki2gjtJzP1V
	Yj81GUx02eUWutJ4Nx/dhdCVjdGHQxbHL9ZLWpgXT9MsQtbhOc2Phh/TajeNDRGDAVTGbMcv6H4
	RbtAr6IIpcJJQce+qxSBEtyM/sWFc4ThHBoB2IHD7X5C/fmeKG9loIzoYD7dxgT6XSCopUzGv+0
	En0wbCbw+ao1iuEa29QLMaqPRw5/QOX7bL7n4an9QW6ML13WkGigSJ/hcVkgLQvIBTu8QcWqRPx
	jrYNkE95DQbty0HItrVUyFfBRFpByl6CRYJ9s4Apuwo4+ex2KlBxooPXjScNsIc1BxVyRAeZW/w
	dMkp0XL11qL3mdZk7CtBl607YB+Dr56/bLLLKQ+761R2UFBePfvOYKc01hrCla4Mr8DChkUdo6R
	v8PYO
X-Received: by 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr101042085e9.28.1795222567564;
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
Received: from [192.168.1.15] ([185.69.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm152290885e9.5.2026.11.20.16.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:56:07 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 21 Nov 2026 00:56:02 +0000
Subject: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxG4asgz0SqDerQqyAGEn5ad0hQDAgJc
 XdSOn7DewcZssLoVR2UsalpigVcVxQ+Q3zD6VhM8pAns7CzmdnFtKzZJ+cRRogENNxSSeaMSfd
 71/V/2+q/CMvvQed5Abh+Od5wAAAA
X-Change-ID: 20261121-sp11-noturbo-becde22ce314
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>
Cc: Haipeng Lin <jimmie.lin@gmail.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795222566; l=2027;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=zMtLMtQ+dyPR6vWexg5Efr75uQzulLUBjfV4ysHWXLI=;
 b=/0FvWqPNrFnVvgEwryZLXaamwpG38yrLu4Qie4Ux5eNj5z8zCxsJo8BFsvWf6INyW31eItzll
 jyRFhEZ4DfrCE7Lnvk3W36ChLSg6Ia9sphAiI9nIjeD6SMTLbxVZlRk
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_165610_520091_B41750A4 
X-CRM114-Status: GOOD (  13.07  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the firmware reports a sustained frequency of 0, every OPP is marked
as turbo. With boost disabled, cpufreq then has no usable frequencies and
fails to create a policy for the domain.

The Surface Pro 11 (X1P64100) CPUCP firmware does this for the two
clusters that have a core fused off.

Treat 0 as "not provided" and don't mark any OPPs as turbo.

Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
Cc: stable@vger.kernel.org
Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
From decompiling the CPUCP firmware: it reports as sustained the first
LUT entry rated for exactly the cluster's fused core count, or 0 if
there is none. On X1P64100, clusters 1 and 2 have 3 cores but only
4-core LUT entries, so they get 0. X1E80100 reports non-zero values and
is unaffected.
---
 drivers/firmware/arm_scmi/perf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 0116ffb2b279..d4394984a0f5 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -879,8 +879,13 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 		else
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
-		/* All OPPs above the sustained frequency are treated as turbo */
-		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
+		/*
+		 * All OPPs above the sustained frequency are treated as turbo.
+		 * A sustained frequency of 0 means the firmware didn't provide
+		 * one, so don't mark anything as turbo in that case.
+		 */
+		data.turbo = dom->sustained_freq_khz &&
+			     freq > dom->sustained_freq_khz * 1000UL;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-sp11-noturbo-becde22ce314

Best regards,
--  
Dale Whinham <daleyo@gmail.com>


