Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47840606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yGuc/ehz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bph/haiX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=; b=yGuc/ehzkH40b8
	0x6/AOKPYb4+omjA5GYn0JWchN1n+nll/LxsWXqg8swiQO3uBCYHMPxW0j/IJUslpp9xe9KGNdfdu
	XmKFTVaSAch6tXcCqABABZUHYkC4DRSBrT/KcCGrPO5O8pPB86/LsKjRzu6lKkUcPxk8tNv1KF37c
	E0v/hyiNtmrGvzBMYo+Of5RqGCEBpjxepytY8ml/jEotMMydF4ILmMjUQAcPGH4sd8LaFjZIDD90F
	L50JHjOMS8Z3bSiwXVNKN+op14rFu2fOzquGznsJHMefWbf9qgAYHVa/l73s3eQY4yCPZYYSFo+s2
	39qDBiel38PfCb8sMWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfLH-00000005Jud-31lv;
	Tue, 24 Nov 2026 01:29:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKu-00000005Jgz-4B1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 01:28:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2045128b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483724; x=1796088524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=Bph/haiX4OmLiA8/DiCee1DrDl06HlqwJ+khRmKvOC19D0ffTOl9fob56OoORFb8Aw
         4B8fsiy7h+O1cPtxS88/zchzEtxop93XFeFCnLnJ4sUVv8Zgipe6GEgNDcd3IcL3+/jf
         dfy6/D3vMLR4LlLcyiostShZ9JPgseBBWzbccRflkUDHGzXofUuFuAZTMf2TofGrd4uj
         zhb1ZwFuO4+4FQLAsE0Ma5hJOb7iUQfBBzFIQmZ7nricnWBhHhzu6cwtTwlEycepTpws
         L7Z0m8/YLbFUoGvPxqEI+YhbDHmSvjHCyX9QX9sPplhp4MNkU8vo03u4EH90Xjksifny
         6iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483724; x=1796088524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=ZmoLh+lJQCMvjBCR/fC4dldqVMm99uHluJaPVa5hJ/FR1A2eRiQYT3eRHeYi9gdcgs
         zRl0PXPDVbXTCYSdSIWqvixj287FNbbOql8can447i5h2zTVpDF9fC7qy3z02LK8nl/m
         F03UPKioy3Sk+hpoCnA7sUg1oKuL25egn7WORw2ZU3+aRrwdcImrH4+iHX0wcUej4kKD
         X74olmebFOa7Shus1t2mHjq7UT0b2+vXxddFlmf9lkL5PLYFkCNWlou1Y0itad8VILbj
         pcXjBXU1UhfHwoFAMcTLN8US2DRgsaO6JeY2Yx01jrWiemGfM4IKnIgYhQPjNoz2GR7X
         QWbw==
X-Forwarded-Encrypted: i=1; AL+hErETSvv/s0eI4+1ZQmdYU+DZba8f7yzWp6Aosz3fr9T03UnX9n5nX2tHhjmZY5+rSOltB5cwYb7EvPxJyLMDDWs4@lists.infradead.org
X-Gm-Message-State: APuU4Z80It3V+wNhjLUp4Sp84NfBFXYWzGwmFyngYCT8fqavci3KKe+R
	M7h1UvNV6VZ6+33uK3EWi2pRlLbLp8HvJ5CrZqKqwBcjBwIMyMqPS5BI
X-Gm-Gg: AZFdTZdQii00YUR3EHe9c5I6RsgJFi79QjKJok7z0mq/Gp5OOutmMyLWZKGgW/jSzim
	eL0kC8A67jmAFAHPxvsgSOp/j7rMzlTtYhs8a4sSBvZOMSMqeAC8e8MIpJZc+uDpGxWJnLuo7oz
	HrW3KPdp/Tcc2FdkhS76nssS6uDwkHDrvxFC02/1N7oK1paTNuN6/VbQQAqcfOvjENimahMwRch
	MGmLROr95NLI7PunvaqFx7mI+HKEub/uqWW/8RLKHZ6WGBjZLYO59Qe4eM5wx8xt7kXou5Ci56v
	rDiwq3AaYq1xRSSJIOD3DEkPBsGGAtbFChnWpdrcC1gjTAshKTBcSdw0dPvvGs04K0CESuRko0D
	IQiI9e24QDVPull4sUgkaZLtBU3F+0kHI5hDqglX3SytaLNahzlW56U0+UmDM8Mx3eYSEeUOFu9
	soU3KBXSbK/0kAmZmqSe9by8eUHIeeoWdXdmmNePUmM4wNQLLcB0x747m/JDeLk1EDAZgp0cecf
	hIugLxOY28vTOEV4Cjz5jrcmfyxniSZY3HWR0wDx3mH+KzDd+CkdHkLBpiULbP4cwgMa1mH77bx
	35j4e6i09UKHqaoI1aEPsUdszXx2GAqCCHEkhlEg1UmAgG3ARKhNpVg=
X-Received: by 2002:a05:6a00:17a8:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8c87d3223f6mr10929581b3a.54.1795483724096;
        Mon, 23 Nov 2026 17:28:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:43 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Tue, 24 Nov 2026 09:27:38 +0800
Message-ID: <20261124012755.328774-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_172845_037151_BDDD459E 
X-CRM114-Status: GOOD (  11.57  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..117823c25f2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+W:	https://github.com/histb-mainline
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0


